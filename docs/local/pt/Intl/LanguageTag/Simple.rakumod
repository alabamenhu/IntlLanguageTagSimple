=begin pod
Uma classe muito simples que implementa as funções esenciais de uma etiqueta
linguística.  Estruturou-se com o fim de ser muito ligeiro quando não precisas
o peso das outras classes de etiquetas linguísticas (e só precisas da língua e região).
Esta classe simples usa as primeiras duas sequências de caracteres C«<alnum>» mas
também pode fazer-se direitamente a usar os atributos <language> (I<língua>) y
C<region> (I<região>).  Esta heurística funciona bastante bem para todas as
conhecidas normas de etiquetas linguísticas.

Para introspecção mais poderosa, casamento, etcétera, veja-se outras classes de etiquetas.

Nota que esta classe pode gerar etiquetas BCP-47 inválidas.  Por isso, a cadeia
devolvida pelo método C<.bcp47> valora-se como falsa.
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
