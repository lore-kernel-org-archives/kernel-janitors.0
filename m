From: Julia Lawall <julia@diku.dk>
Date: Sun, 21 Dec 2008 15:42:18 +0000
Subject: [PATCH 13/13] net/appletalk: Remove redundant test
Message-Id: <Pine.LNX.4.64.0812211641590.9555@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: acme@ghostprotocols.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

atif is tested for being NULL twice, with the same effect in each case.  I
have kept the second test, as it seems to fit well with the comment above it.

A simplified version of the semantic patch that makes this change is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
expression E;
position p1,p2;
@@

if (x@p1 = NULL || ...) { ... when forall
   return ...; }
... when != \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\|&x\)
(
x@p2 = NULL
|
x@p2 != NULL
)

// another path to the test that is not through p1?
@s exists@
local idexpression r.x;
position r.p1,r.p2;
@@

... when != x@p1
(
x@p2 = NULL
|
x@p2 != NULL
)

@fix depends on !s@
position r.p1,r.p2;
expression x,E;
statement S1,S2;
@@

(
- if ((x@p2 != NULL) || ...)
  S1
|
- if ((x@p2 = NULL) && ...) S1
|
- BUG_ON(x@p2 = NULL);
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 net/appletalk/ddp.c                 |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/net/appletalk/ddp.c b/net/appletalk/ddp.c
index c3f0027..5abce07 100644
--- a/net/appletalk/ddp.c
+++ b/net/appletalk/ddp.c
@@ -815,9 +815,6 @@ static int atif_ioctl(int cmd, void __user *arg)
 				return -EPERM;
 			if (sa->sat_family != AF_APPLETALK)
 				return -EINVAL;
-			if (!atif)
-				return -EADDRNOTAVAIL;
-
 			/*
 			 * for now, we only support proxy AARP on ELAP;
 			 * we should be able to do it for LocalTalk, too.
