From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:38:04 +0000
Subject: [PATCH 3/20] staging: lustre: ldlm: ldlm_resource: remove unneeded null test before free
Message-Id: <1430509086-22132-19-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Kfree can cope with a null argument, so drop null tests.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression ptr; @@

- if (ptr != NULL) {
  kfree(ptr);
  ptr = NULL;
- }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/ldlm/ldlm_resource.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/lustre/lustre/ldlm/ldlm_resource.c b/drivers/staging/lustre/lustre/ldlm/ldlm_resource.c
index 5922069..7149eda 100644
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_resource.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_resource.c
@@ -1137,10 +1137,8 @@ ldlm_resource_get(struct ldlm_namespace *ns, struct ldlm_resource *parent,
 			CERROR("%s: lvbo_init failed for resource %#llx:%#llx: rc = %d\n",
 			       ns->ns_obd->obd_name, name->name[0],
 			       name->name[1], rc);
-			if (res->lr_lvb_data) {
-				kfree(res->lr_lvb_data);
-				res->lr_lvb_data = NULL;
-			}
+			kfree(res->lr_lvb_data);
+			res->lr_lvb_data = NULL;
 			res->lr_lvb_len = rc;
 			mutex_unlock(&res->lr_lvb_mutex);
 			ldlm_resource_putref(res);

