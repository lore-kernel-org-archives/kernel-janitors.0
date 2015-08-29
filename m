From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Aug 2015 17:30:11 +0000
Subject: [PATCH 7/8] staging: lustre: osc: put constant on the right of binary operator
Message-Id: <1440869412-4899-8-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/osc/osc_page.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/lustre/lustre/osc/osc_page.c b/drivers/staging/lustre/lustre/osc/osc_page.c
index f9cf5ce..856d859 100644
--- a/drivers/staging/lustre/lustre/osc/osc_page.c
+++ b/drivers/staging/lustre/lustre/osc/osc_page.c
@@ -553,7 +553,7 @@ void osc_page_submit(const struct lu_env *env, struct osc_page *opg,
 	oap->oap_cmd = crt = CRT_WRITE ? OBD_BRW_WRITE : OBD_BRW_READ;
 	oap->oap_page_off = opg->ops_from;
 	oap->oap_count = opg->ops_to - opg->ops_from;
-	oap->oap_brw_flags = OBD_BRW_SYNC | brw_flags;
+	oap->oap_brw_flags = brw_flags | OBD_BRW_SYNC;
 
 	if (!client_is_remote(osc_export(obj)) &&
 			capable(CFS_CAP_SYS_RESOURCE)) {

