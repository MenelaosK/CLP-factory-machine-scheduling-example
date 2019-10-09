:-lib(ic).
:-lib(ic_global).
:-lib(branch_and_bound).
:-lib(ic_edge_finder).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
machine(a,20,40,3).
machine(b,40,20,2).
machine(c,35,10,1).
machine(d,15,45,2).
machine(e,15,5,2).
machine(f,20,7,4).

factory_schedule(Starts,MakeSpan):-
	findall(M,machine(M,_,_,_),Machines),
	findall(H,machine(_,H,_,_),Hours),
	findall(P,machine(_,_,P,_),Power),
	findall(W,machine(_,_,_,W),Workers),
	length(Machines,N),
	length(Starts,N),
	Starts#:: 0..inf,
	machine_working(Starts,Hours,Ends),
	ic:maxlist(Ends,MakeSpan),
	cumulative(Starts,Hours,Power,60),
	cumulative(Starts,Hours,Workers,5),
	bb_min(labeling(Starts),MakeSpan,bb_options{strategy:restart}).

machine_working([],[],[]).
machine_working([S|Starts],[H|Hours],[E|Ends]):-
	S+H#=E,
	machine_working(Starts,Hours,Ends).