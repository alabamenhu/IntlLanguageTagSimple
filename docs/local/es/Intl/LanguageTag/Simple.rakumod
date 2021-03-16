=begin pod
Una clase muy sencilla que implementa las funciones esenciales de una etiqueta
lingüística.  Se diseñó con el fin de ser muy ligero cuando no necesitas el peso
de las otras clases de etiquetas lingüísticas (y solo necesitas el idioma y región).
Esta clase sencilla usa las primeras dos secuencias de caracteres C«<alnum>» pero
también se puede hacer directamente usando los atributos C<language> (I<idioma>) y
C<region> (I<región>).  Esta heurística funciona bastante bien para todos los
conocidos estándares de etiquetas lingüísticas.

Para introspección más poderosa, encajamiento, etcétera, véase otras clases de etiquetas.

Nota que esta clase puede generar etiquetas BCP-47 inválidas.  Por lo tanto, la
cadena devuelta por el método C<.bcp47> se valora como falsa.
=end pod

#| Una clase muy sencilla que representa una etiqueta lingüística genérica
unit class LanguageTag::Simple;
    use Intl::LanguageTaggish;
    also does LanguageTaggish;

has Str:D $.language is required; #= El idioma de la etiqueta
has Str:D $.region = '';          #= La región de la etiqueta

#| Crea una nueva etiqueta lingüística sencilla de una cadena
multi method new (Str:D $str) { ... }

#| Intenta convertir la etiqueta al formato BCP-47 (puede fallar)
method bcp47 (::?CLASS:D --> Str) { ... }

#| Convierte la etiqueta a una representación como cadena
method Str (::?CLASS:D --> Str) { ... }

#| Crea una etiqueta lingüística sencilla de una cadena usando
#| la primera (y tal vez segunda) secuencia de letras
multi method COERCE (Str:D $str) { ... }

#| Crea una etiqueta lingüística sencilla de una cadena usando
#| el idioma (y tal vez región) de un objeto LanguageTaggish
multi method COERCE (LanguageTaggish:D $tag --> ::?CLASS) { ... }
