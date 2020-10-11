From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 11 Oct 2020 10:34:53 +0000
Subject: [PATCH 0/5] net: use semicolons rather than commas to separate statements
Message-Id: <1602412498-32025-1-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-afs@lists.infradead.org

These patches replace commas by semicolons.  Commas introduce
unnecessary variability in the code structure and are hard to see.
This was done using the Coccinelle semantic patch
(http://coccinelle.lip6.fr/) shown below.

This semantic patch ensures that commas inside for loop headers will
not be transformed.  It also doesn't touch macro definitions.

Coccinelle ensures that braces are added as needed when a
single-statement branch turns into a multi-statement one.

This semantic patch has a few false positives, for variable
delcarations such as:

LIST_HEAD(x), *y;

The semantic patch could be improved to avoid these, but for the
moment they have been removed manually (2 occurrences).

// <smpl>
@initialize:ocaml@
@@

let infunction p   (* avoid macros *)
  (List.hd p).current_element <> "something_else"

let combined p1 p2   (List.hd p1).line_end = (List.hd p2).line ||
  (((List.hd p1).line_end < (List.hd p2).line) &&
   ((List.hd p1).col < (List.hd p2).col))

@bad@
statement S;
declaration d;
position p;
@@

S@p
d

// special cases where newlines are needed (hope for no more than 5)
@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@@
expression e1,e2;
statement S;
position p != bad.p;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && combined p1 p2 };
@@

- e1@p1,@S@p e2@p2;
+ e1; e2;

@r@
expression e1,e2;
statement S;
position p != bad.p;
@@

e1 ,@S@p e2;

@@
expression e1,e2;
position p1;
position p2 :
    script:ocaml(p1) { infunction p1 && not(combined p1 p2) };
statement S;
position r.p;
@@

e1@p1
-,@S@p
+;
e2@p2
... when any
// </smpl>

---

 net/ipv4/tcp_input.c       |    3 ++-
 net/ipv4/tcp_vegas.c       |    8 ++++----
 net/ipv6/calipso.c         |    2 +-
 net/mac80211/debugfs_sta.c |    2 +-
 net/rxrpc/recvmsg.c        |    2 +-
 net/tls/tls_main.c         |    2 +-
 6 files changed, 10 insertions(+), 9 deletions(-)
