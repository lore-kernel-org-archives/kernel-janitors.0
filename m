From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 10 Aug 2013 15:40:20 +0000
Subject: [PATCH 0/5] convert comma to semicolon
Message-Id: <1376149225-3997-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org

These patches result from the following semantic patches
(http://coccinelle.lip6.fr/), which check for expression statements
separated by , rather than by ;.  The first semantic patch is quite
conservative in that it only finds cases where this pattern appears after
another complete statement or at the beginning of a block, to ensure that
the expression statements do not form eg an if branch or loop body.
Iteration is used to treat arbitrary sequences of commas.  The second
semantic patch treats any kind of comma, and is intended to be used on code
to which the first one has already been applied.  This one adjusts commas
in if branches, following preprocessor directves, etc.  The results of the
second semantic patch often need some hand cleaning, to insert tabs, put
braces on the right lines, etc.

The first semantic patch (very safe):

// <smpl>
@initialize:ocaml@

let tbl = Hashtbl.create(100)

let add_if_not_present file try let _ = Hashtbl.find tbl file in ()
with Not_found ->
   Hashtbl.add tbl file ();
   let it = new iteration() in
   it#set_files [file];
   it#register()

@script:ocaml@
@@
Hashtbl.clear tbl

@r@
statement S1,S2;
expression e1,e2,e;
position p1,p2;
type T;
identifier i;
iterator I;
@@

(
if (...) S1 else S2
|
while (...) S1
|
for (...;...;...) S1
|
I (...) S1
|
T i;
|
 e;
)
 e1,@p1 e2@p2;

@script:ocaml@
p1 << r.p1;
p2 << r.p2;
@@

if (List.hd p1).line = (List.hd p2).line
then include_match false
else add_if_not_present ((List.hd p1).file)

@@
expression e1,e2;
position r.p1;
@@

 e1
- ,@p1
+ ;
  e2;

@s disable braces3@
identifier f;
expression e1,e2;
position p1,p2;
@@

{
 e1,@p1 e2@p2;
 ... when any
}

@script:ocaml@
p1 << s.p1;
p2 << s.p2;
@@

if (List.hd p1).line = (List.hd p2).line
then include_match false
else add_if_not_present ((List.hd p1).file)

@@
expression e1,e2;
position s.p1;
@@

 e1
- ,@p1
+ ;
  e2;
// </smpl>

The second semantic patch (less safe, results require some cleanup):

// <smpl>
@initialize:ocaml@

let tbl = Hashtbl.create(100)

let add_if_not_present file try let _ = Hashtbl.find tbl file in ()
with Not_found ->
   Hashtbl.add tbl file ();
   let it = new iteration() in
   it#set_files [file];
   it#register()

@script:ocaml@
@@
Hashtbl.clear tbl

@r@
expression e1,e2;
position p1,p2;
@@

 e1,@p1 e2@p2;

@script:ocaml@
p1 << r.p1;
p2 << r.p2;
@@

if (List.hd p1).line = (List.hd p2).line
then include_match false
else add_if_not_present ((List.hd p1).file)

@@
expression e1,e2;
position r.p1;
@@

 e1
- ,@p1
+ ;
  e2;

// </smpl>

