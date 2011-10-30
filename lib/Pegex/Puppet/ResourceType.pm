package Pegex::Puppet::ResourceType;
use Moose::Role;
use MooseX::Types::Moose qw/ HashRef Str /;

requires 'name';

sub build_resource {
    my ($self, $data) = @_;
    my ($name, $params) = @$data;
    my %p = (%$params, name => $name);
    use Data::Dumper; warn Dumper(\%p);
    $self->implementation_class->new(%$params, name => $name);
}

1;

