grammar Unicode::LanguageID {
    token TOP {
        <language-id>
    }
    token language-id {
        | root
        | [
            | <language-subtag> [ <.sep> <script-subtag> ]?
            | <script-subtag>
        ]
        [ <.sep> <region-subtag>  ]?
        [ <.sep> <variant-subtag> ]*
    }
    token language-subtag {
        [
            | <.alpha> ** 2..3
            | <.alpha> ** 5..8
        ] <.anchor>
    }
    token script-subtag {
        <.alpha> ** 4
        <.anchor>
    }
    token region-subtag {
        [
            | <.alpha> ** 2
            | <.digit> ** 3
        ] <.anchor>
    }
    token variant-subtag {
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
        :i <[ a..z ]>
    }
    token alphanum {
        <.digit> | <.alpha>
    }
    token anchor {
        <before <.sep> | $ >
    }
}