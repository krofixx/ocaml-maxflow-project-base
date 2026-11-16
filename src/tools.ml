(* Yes, we have to repeat open Graph. *)
open Graph

(* assert false is of type ∀α.α, so the type-checker is happy. *)
let clone_nodes gr = n_fold gr new_node empty_graph

let gmap gr f = 
  let aux g a = new_arc g {a with lbl=f a.lbl} in
  e_fold gr aux (clone_nodes gr) 
(* Replace _gr and _f by gr and f when you start writing the real function. *)

let add_arc _gr _idsrc _iddst _w = assert false