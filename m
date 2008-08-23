From: Julia Lawall <julia@diku.dk>
Date: Sat, 23 Aug 2008 16:27:38 +0000
Subject: [PATCH] net/mac80211/mesh.c: correct the argument to __mesh_table_free
Message-Id: <Pine.LNX.4.64.0808231826470.3162@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linville@tuxdriver.com, xemul@openvz.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In the function mesh_table_grow, it is the new table not the argument table
that should be freed if the function fails (cf commit
bd9b448f4c0a514559bdae4ca18ca3e8cd999c6d)

The semantic match that detects this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
expression E,f;
position p1,p2,p3;
identifier l;
statement S;
@@

x = mesh_table_alloc@p1(...)
...
if (x = NULL) S
... when != E = x
    when != mesh_table_free(x)
goto@p2 l;
... when != E = x
    when != f(...,x,...)
    when any
(
return \(0\|x\);
|
return@p3 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
p3 << r.p3;
@@

print "%s: call on line %s not freed or saved before return on line %s via line %s" % (p1[0].file,p1[0].line,p3[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 net/mac80211/mesh.c           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index b5933b2..35f2f95 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -383,7 +383,7 @@ errcopy:
 		hlist_for_each_safe(p, q, &newtbl->hash_buckets[i])
 			tbl->free_node(p, 0);
 	}
-	__mesh_table_free(tbl);
+	__mesh_table_free(newtbl);
 endgrow:
 	return NULL;
 }
