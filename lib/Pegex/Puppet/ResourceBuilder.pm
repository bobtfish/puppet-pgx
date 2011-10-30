package Pegex::Puppet::ResourceBuilder;
use Moose;
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

sub got_resource {
    my ($self, $data) = @_;
    foreach my $datum (@$data) {
        my ($type_name, $params) = @{ $datum };
        die("No resource type or define named $type_name")
            unless $self->has_resourcetype_named($type_name);
        my $type = $self->get_resourcetype_named($type_name);
        use Data::Dumper;
        warn Dumper($params);
        return $type->build_resource($params);
    }
};

__PACKAGE__->meta->make_immutable(replace_constructor => 1);
1;


