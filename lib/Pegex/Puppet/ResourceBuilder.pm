package Pegex::Puppet::ResourceBuilder;
use Moose;
use Moose::Autobox;
use Pegex::Puppet::ResourceRegistery;

extends 'Pegex::Puppet::Data';

has resource_registry => (
    is => 'ro',
    isa => 'Pegex::Puppet::ResourceRegistery',
    default => sub { Pegex::Puppet::ResourceRegistery->new },
    handles => [qw/
        has_resourcetype_named
        get_resourcetype_named
    /],
);

sub got_list_of_resources {
    my ($self, $data) = @_;
    use Data::Dumper;
    warn "List of resources " . Dumper $data;
    my @resources;
    foreach my $resource_block ($data->flatten) {
        my ($type_name, $resources) = @{ $resource_block };
        die("No resource type or define named $type_name")
            unless $self->has_resourcetype_named($type_name);
        my $type = $self->get_resourcetype_named($type_name);
        use Data::Dumper;
        warn "List of resources " . Dumper($resources);
        foreach my $resource_def ($resources->flatten) {
            push @resources, $type->build_resource($resource_def);
        }
    }
    return \@resources;
};

sub got_define {
    my ($self, $data) = @_;
    use Data::Dumper;
    warn "Define containts" . Dumper($data);
    $data;
}

__PACKAGE__->meta->make_immutable(replace_constructor => 1);
1;


