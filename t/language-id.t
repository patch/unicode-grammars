use Test;
use Unicode::LanguageID;

sub parse ($s) { Unicode::LanguageID.parse($s) }

plan 36;

given parse('en-US') {
    ok $_;
    is $_, 'en-US';
    given .<language-id> {
        is $_,                 'en-US';
        is .<language-subtag>, 'en';
        is .<region-subtag>,   'US';
        nok .<script-subtag>;
    }
}

given parse('en_GB') {
    ok $_;
    is $_, 'en_GB';
    given .<language-id> {
        is $_,                 'en_GB';
        is .<language-subtag>, 'en';
        is .<region-subtag>,   'GB';
        nok .<script-subtag>;
    }
}

given parse('es-419') {
    ok $_;
    is $_, 'es-419';
    given .<language-id> {
        is $_,                 'es-419';
        is .<language-subtag>, 'es';
        is .<region-subtag>,   '419';
        nok .<script-subtag>;
    }
}

given parse('uz-Cyrl') {
    ok $_;
    is $_, 'uz-Cyrl';
    given .<language-id> {
        is $_,                 'uz-Cyrl';
        is .<language-subtag>, 'uz';
        is .<script-subtag>,   'Cyrl';
        nok .<region-subtag>;
    }
}

given parse('und') {
    ok $_;
    is $_, 'und';
    given .<language-id> {
        is $_,                 'und';
        is .<language-subtag>, 'und';
        nok .<script-subtag>;
        nok .<region-subtag>;
    }
}

given parse('root') {
    ok $_;
    is $_, 'root';
    given .<language-id> {
        is $_, 'root';
        nok .<language-subtag>;
        nok .<script-subtag>;
        nok .<region-subtag>;
    }
}