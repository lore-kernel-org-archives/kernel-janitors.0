From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 08 Aug 2013 19:32:51 +0000
Subject: [PATCH] convert comma to semicolon
Message-Id: <1375990372-19033-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

These patches result from the following semantic patch
(http://coccinelle.lip6.fr/), which checks for expression statements
separated by , rather than by ;.  The rule is quite conservative in that it
only finds cases where this pattern appears after a statement that ends
with ;, to ensure that the expression statements do not form an if branch
or loop body.  Iteration is used to treat arbitrary sequences of commas.

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
expression e1,e2,e;
position p1,p2;
type T;
identifier i;
@@

(
T i = ...;
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
// </smpl>

