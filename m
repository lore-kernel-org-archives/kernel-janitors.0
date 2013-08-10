From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 10 Aug 2013 17:34:35 +0000
Subject: [PATCH 0/2] adjust code alignment
Message-Id: <1376156077-6208-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

These patches result from the following semantic patch
(http://coccinelle.lip6.fr/), which checks for successive statements that
are not aligned.

@bad@
statement S;
expression e;
position p1,p;
@@

S@p1
e@p;

@script:ocaml@
p1 << bad.p1;
p << bad.p;
@@

if not ((List.hd p1).line = (List.hd p).line)
then include_match false

@r@
expression e1,e2;
position p1 != bad.p,p2;
@@

e1@p1;
e2@p2;

@script:ocaml@
p1 << r.p1;
p2 << r.p2;
@@

if not ((List.hd p1).col = (List.hd p2).col) &&
   not ((List.hd p1).line = (List.hd p2).line)
then begin print_main "" p1; print_secs "" p2 end

