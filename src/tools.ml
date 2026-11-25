(* Yes, we have to repeat open Graph. *)
open Graph

(* assert false is of type ∀α.α, so the type-checker is happy. *)
let clone_nodes gr = n_fold gr new_node empty_graph

let gmap gr f = 
  let aux g a = new_arc g {a with lbl=f a.lbl} in
  e_fold gr aux (clone_nodes gr) 
(* Replace _gr and _f by gr and f when you start writing the real function. *)

let add_arc gr idsrc iddst w = 
  match find_arc gr idsrc iddst with
  | None -> new_arc gr {src=idsrc; tgt=iddst; lbl=w}
  | Some a -> new_arc gr {a with lbl=a.lbl+w}