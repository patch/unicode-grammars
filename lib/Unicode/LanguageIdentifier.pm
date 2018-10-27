grammar Unicode::LanguageIdentifier {
    token TOP {
        | root
        | [
            | <unicode-language-subtag>
               [ <.sep> <unicode-script-subtag> ]?
            | <unicode-script-subtag>
        ]
        [ <.sep> <unicode-region-subtag>  ]?
        [ <.sep> <unicode-variant-subtag> ]*
    }
    token unicode-language-subtag {
        [
            | <.alpha> ** 2..3
            | <.alpha> ** 5..8
        ] <.anchor>
    }
    token unicode-script-subtag {
        <.alpha> ** 4
        <.anchor>
    }
    token unicode-region-subtag {
        [
            | <.alpha> ** 2
            | <.digit> ** 3
        ] <.anchor>
    }
    token unicode-variant-subtag {
        [
            | <.alphanum> ** 5..8
            | <.digit> <.alphanum> ** 3
        ] <.anchor>
    }
    token sep {
        <[ - _ ]>
    }
    token digit {
        <[ 0..9 ]>
    }
    token alpha {
        <[ A..Z a..z ]>
    }
    token alphanum {
        <[ 0..9 A..Z a..z ]>
    }
    token anchor {
        <before <.sep> | $ >
    }
}