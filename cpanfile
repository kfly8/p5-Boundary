requires 'perl', '5.010001';

requires 'B::Hooks::EndOfScope', '0.12';
requires 'Carp';
requires 'Class::Load';
requires 'namespace::allclean';
requires 'Type::Tiny', '1.000000';

on 'configure' => sub {
    requires 'Module::Build::Tiny', 0.035;
};

on 'test' => sub {
    requires 'Test::More', '0.98';
};

