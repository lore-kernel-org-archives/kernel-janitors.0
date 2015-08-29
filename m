From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Aug 2015 17:30:06 +0000
Subject: [PATCH 2/8] staging: lustre: lnet: lib-ptl.c: put constant on the right of binary operator
Message-Id: <1440869412-4899-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440869412-4899-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440869412-4899-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Move constants to the right of binary operators.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
constant c;
expression e;
binary operator b = {=,!=,&,|};
@@

(
- c
+ e
b
- e
+ c
|
- c < e
+ e > c
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lnet/lnet/lib-ptl.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/lnet/lnet/lib-ptl.c b/drivers/staging/lustre/lnet/lnet/lib-ptl.c
index 84707c5..b4f573a 100644
--- a/drivers/staging/lustre/lnet/lnet/lib-ptl.c
+++ b/drivers/staging/lustre/lnet/lnet/lib-ptl.c
@@ -420,9 +420,9 @@ lnet_mt_match_md(struct lnet_match_table *mtable,
 
 	if (info->mi_opc = LNET_MD_OP_GET ||
 	    !lnet_ptl_is_lazy(the_lnet.ln_portals[info->mi_portal]))
-		return LNET_MATCHMD_DROP | exhausted;
+		return exhausted | LNET_MATCHMD_DROP;
 
-	return LNET_MATCHMD_NONE | exhausted;
+	return exhausted | LNET_MATCHMD_NONE;
 }
 
 static int

