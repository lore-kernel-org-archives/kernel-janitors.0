From: Julia Lawall <julia@diku.dk>
Date: Thu, 30 Jul 2009 14:10:54 +0000
Subject: [PATCH 4/5] net/netlabel: Add kmalloc NULL tests
Message-Id: <Pine.LNX.4.64.0907301610230.8734@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paul.moore@hp.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The test on map4 should be a test on map6.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression *x;
identifier f;
constant char *C;
@@

x = \(kmalloc\|kcalloc\|kzalloc\)(...);
... when != x = NULL
    when != x != NULL
    when != (x || ...)
(
kfree(x)
|
f(...,C,...,x,...)
|
*f(...,x,...)
|
*x->f
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 net/netlabel/netlabel_kapi.c        |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/netlabel/netlabel_kapi.c b/net/netlabel/netlabel_kapi.c
index 3ff6f32..6ce0020 100644
--- a/net/netlabel/netlabel_kapi.c
+++ b/net/netlabel/netlabel_kapi.c
@@ -151,7 +151,7 @@ int netlbl_cfg_unlbl_map_add(const char *domain,
 			addr6 = addr;
 			mask6 = mask;
 			map6 = kzalloc(sizeof(*map6), GFP_ATOMIC);
-			if (map4 = NULL)
+			if (!map6)
 				goto cfg_unlbl_map_add_failure;
 			map6->type = NETLBL_NLTYPE_UNLABELED;
 			ipv6_addr_copy(&map6->list.addr, addr6);
