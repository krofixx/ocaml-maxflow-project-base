open Gfile
open Tools
(*open Graph*)
    
let () =

  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf
        "\n ✻  Usage: %s infile source sink outfile\n\n%s%!" Sys.argv.(0)
        ("    🟄  infile  : input file containing a graph\n" ^
         "    🟄  source  : identifier of the source vertex (used by the ford-fulkerson algorithm)\n" ^
         "    🟄  sink    : identifier of the sink vertex (ditto)\n" ^
         "    🟄  outfile : output file in which the result should be written.\n\n") ;
      exit 0
    end ;


  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *) 
  
  let infile = Sys.argv.(1)
  and _outfile = Sys.argv.(4)
  
  (* These command-line arguments are not used for the moment. *)
  and _source = int_of_string Sys.argv.(2)
  and _sink = int_of_string Sys.argv.(3)
  in

  (* Open file *)
  (* let graph = from_file infile in *)

  let graph = gmap (from_file infile) int_of_string in

  let graph2 = add_arc graph 0 1 11000 in
  let graph3 = add_arc graph2 2 5 1000 in

  let final_graph = gmap (graph3) string_of_int in
  
  (* Rewrite the graph that has been read. *)
  let () = export "test/test1.txt" final_graph in

  ()

