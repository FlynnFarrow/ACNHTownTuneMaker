open Tea

type key =
  | Up
  | Down
  | Left
  | Right

let key_of_int = function
  | 37 -> Some Left
  | 38 -> Some Up
  | 39 -> Some Right
  | 40 -> Some Down
  | _ -> None
;;

let decode_event =
  let open Tea.Json in
  Decoder.field "keyCode" Decoder.int |> Decoder.map key_of_int
;;

let pressed toMsg =
  let open Vdom in
  let subscriptionId = "keyboard" in
  let eventId = "keydown" in
  let enableCall cb =
    let fn e =
      match Json.Decoder.decodeEvent decode_event e with
      | Result.Error _ -> None
      | Result.Ok maybe_key -> Some (toMsg maybe_key)
    in
    let handler = EventHandlerCallback (subscriptionId, fn) in
    let doc = Web_node.document_node in
    let cache = eventHandler_Register (ref cb) doc eventId handler in
    fun () ->
      let _ = eventHandler_Unregister doc eventId cache in
      ()
  in
  Tea.Sub.registration "keyboard" enableCall
;;
