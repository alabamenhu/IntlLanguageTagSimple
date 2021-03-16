=begin pod
An extremely simple class implementing the core functions of a language tag.
This is designed to be either extremely lightweight when you don't need the
bulk of other language tag classes (and only need the language and region
functionality).  This simple class uses the first two runs of C«<alnum>»,
characters but can also be made directly using C<language> and C<region>
attributes.  The simple heuristic works sufficiently well for all known
standard language tag standards.

For more powerful introspection, matching, etc, see one of the other classes.

Note that this class may generate invalid BCP-47 tags, and as such the string
returned from the C<.bcp47> method is false-y.
=end pod


#| A very simple class representing a generic language tag
unit class LanguageTag::Simple;
use Intl::LanguageTaggish;
also does LanguageTaggish;

has Str:D $.language is required; #= The language of the tag
has Str:D $.region = '';          #= The region of the tag

#| Crea una nueva etiqueta
multi method new (Str:D $str) {
    $str ~~ /
    (<alnum>+)      # ← The first alphabetic run will be the language

    [               # ↖︎
        <!alnum>+   # ← The second run which may not be present
        (<alnum>+)  # ← will be interpreted as the region
    ]?              # ↙︎
    /;

    self.bless:
            language => ~ $0,
            region   => ~($1//''),
}

#| Try to convert the tag to the BCP-47 format (may fail)
method bcp47 (::?CLASS:D --> Str) {
    (
        ~ $!language.lc.substr(0,4)
        ~ '-'
        ~ $!region.uc.substr(0,2)
    ) but False
}

#| Convert the tag to a simple string representation
method Str (::?CLASS:D --> Str) {
    $!language.lc ~ '-' ~ $!region.uc
}

#| Creates a simple language tag from a string by using the
#| first (and maybe second) run of alphabetic characters
multi method COERCE (Str:D $str) {
    self.new: $str
}

#| Creates a simple language tag from a string by using the
#| language (and maybe region) from a LanguageTaggish object
multi method COERCE (LanguageTaggish:D $tag --> ::?CLASS) {
    self.bless:
        language => ~$tag.language,
        region   => ~$tag.region,
}
