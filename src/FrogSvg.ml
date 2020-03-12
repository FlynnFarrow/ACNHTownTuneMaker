open Tea.Html
open Tea.Svg
open Tea.Svg.Attributes
open Note

let frog_svg note is_playing =
  let note_href, note_class, note_text =
    match note with
    | Hold -> "#frog-hold", "frog__text", {js|—|js}
    | Rest -> "#frog-rest", "frog__text", ""
    | Random -> "#frog-random", "frog__text frog__text--large", string_of_note Random
    | other -> "#frog-normal", "frog__text", String.uppercase_ascii (string_of_note other)
  in
  let meta = Note.meta note in
  let playing_offset = if is_playing then -50 else 0 in
  let y_offset = string_of_int ((meta.index * -15) + 225 + playing_offset) in
  svg
    [ class' "ac-frog"; viewBox "0 0 300 500" ]
    [ use [ href note_href; fill meta.color; y y_offset ] []
    ; text' [ class' note_class; y y_offset ] [ text note_text ]
    ]
;;
