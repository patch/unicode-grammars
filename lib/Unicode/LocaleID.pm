use Unicode::LanguageID;

grammar Unicode::LocaleID is Unicode::LanguageID {
    token TOP {
        <locale-id>
    }
    token locale-id {
        <language-id>
        <extensions>*
        <pu-extensions>?
    }
    token extensions {
        | <locale-extensions>
        | <transformed-extensions>
        | <other-extensions>
    }
    token locale-extensions {
        <.sep> [ :i u ]
        [
            | [ <.sep> <keyword>   ]+ 
            | [ <.sep> <attribute> ]+ [ <.sep> <keyword> ]*
        ]
    }
    token transformed-extensions {
        <.sep> [ :i t ]
        [
            | [ <.sep> <tlang> [ <.sep> <tfield> ]* ]
            | [ <.sep> <tfield> ]+
        ]
    }
    token pu-extensions {
        <.sep> [ :i x ]
        [ <.sep> <.alphanum> ** 1..8 ]*
    }
    token other-extensions {
        <!before :i <[ t u x ]> > <.alphanum>
        [ <.sep> <.alphanum> ** 2..8 ]*
    }
    token keyword {
        <key> [ <.sep> <type> ]?
    }
    token key {
        <.alphanum> <.alpha>
    }
    token type {
        <.alphanum> ** 3..8
        [ <.sep> <.alphanum> ** 3..8 ]*
    }
    token attribute {
        <.alphanum> ** 3..8
    }
    token subdivision-id {
        <region-subtag> <subdivision-suffix>
    }
    token subdivision-suffix {
        <.alphanum> ** 1..4
    }
    token measure-unit {
        <.alphanum> ** 3..8
        [ <.sep> <.alphanum> ** 3..8 ]*
    }
    token tlang {
        <language-subtag>
        [ <.sep> <script-subtag>  ]?
        [ <.sep> <region-subtag>  ]?
        [ <.sep> <variant-subtag> ]*
    }
    token tfield {
        <tkey> <tvalue>
    }
    token tkey {
        <.alpha> <.digit>
    }
    token tvalue {
        [ <.sep> <.alphanum> ** 3..8 ]+
    }
}