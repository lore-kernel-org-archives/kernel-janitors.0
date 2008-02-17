From: Julia Lawall <julia@diku.dk>
Date: Sun, 17 Feb 2008 17:57:58 +0000
Subject: [PATCH 7/7] net/9p/trans_virtio.c: Use BUG_ON
Message-Id: <Pine.LNX.4.64.0802171857310.28055@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ericvh@gmail.com, rminnich@sandia.gov, lucho@ionkov.net, v9fs-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

if (...) BUG(); should be replaced with BUG_ON(...) when the test has no
side-effects to allow a definition of BUG_ON that drops the code completely.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@ disable unlikely @ expression E,f; @@

(
  if (<... f(...) ...>) { BUG(); }
|
- if (unlikely(E)) { BUG(); }
+ BUG_ON(E);
)

@@ expression E,f; @@

(
  if (<... f(...) ...>) { BUG(); }
|
- if (E) { BUG(); }
+ BUG_ON(E);
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/net/9p/trans_virtio.c b/net/9p/trans_virtio.c
--- a/net/9p/trans_virtio.c 2008-02-10 22:34:18.000000000 +0100
+++ b/net/9p/trans_virtio.c 2008-02-17 16:43:18.000000000 +0100
@@ -183,8 +183,7 @@ pack_sg_list(struct scatterlist *sg, int
 		sg_set_buf(&sg[index++], data, s);
 		count -= s;
 		data += s;
-		if (index > limit)
-			BUG();
+		BUG_ON(index > limit);
 	}
 
 	return index-start;
