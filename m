From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Sep 2008 11:58:26 +0000
Subject: [PATCH 4/4] net/9p/trans_fd.c: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0809101358070.15308@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ericvh@gmail.com, rminnich@sandia.gov, lucho@ionkov.net, v9fs-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error handling code following a kmalloc should free the allocated data.

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,l;
position p1,p2;
expression *ptr != NULL;
@@

(
if ((x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)) = NULL) S
|
x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
)
<... when != x
     when != if (...) { <+...x...+> }
x->f = E
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 net/9p/trans_fd.c             |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/net/9p/trans_fd.c b/net/9p/trans_fd.c
index cdf137a..8c92425 100644
--- a/net/9p/trans_fd.c
+++ b/net/9p/trans_fd.c
@@ -908,8 +908,10 @@ static struct p9_req *p9_send_request(struct p9_conn *m,
 	else
 		n = p9_mux_get_tag(m);
 
-	if (n < 0)
+	if (n < 0) {
+		kfree(req);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	p9_set_tag(tc, n);
 
