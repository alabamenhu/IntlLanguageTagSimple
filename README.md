# Intl::LanguageTag::Simple
An extremely simple class implementing the core functions of a language tag.
This is designed to be either extremely lightweight when you don't need the
bulk of other language tag classes (and only need the language and region
functionality).  This simple class uses the first two runs of `<alnum>`,
characters but can also be made directly using `language` and `region`
attributes.  The simple heuristic works sufficiently well for all known
standard language tag standards.

For more powerful introspection, matching, etc, see one of the other classes.

Note that this class may generate invalid BCP-47 tags, and as such the string
returned from the `.bcp47` method is false-y.
