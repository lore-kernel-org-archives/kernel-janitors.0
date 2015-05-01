From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:37:55 +0000
Subject: [PATCH 12/20] staging: lustre: obdclass: genops: remove unneeded null test before free
Message-Id: <1430509086-22132-10-git-send-email-Julia.Lawall@lip6.fr>
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

- if (ptr != NULL)
  kfree(ptr);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/obdclass/genops.c |   15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/genops.c b/drivers/staging/lustre/lustre/obdclass/genops.c
index a107aea..37d6aef 100644
--- a/drivers/staging/lustre/lustre/obdclass/genops.c
+++ b/drivers/staging/lustre/lustre/obdclass/genops.c
@@ -213,12 +213,9 @@ int class_register_type(struct obd_ops *dt_ops, struct md_ops *md_ops,
 	return 0;
 
  failed:
-	if (type->typ_name != NULL)
-		kfree(type->typ_name);
-	if (type->typ_md_ops != NULL)
-		kfree(type->typ_md_ops);
-	if (type->typ_dt_ops != NULL)
-		kfree(type->typ_dt_ops);
+	kfree(type->typ_name);
+	kfree(type->typ_md_ops);
+	kfree(type->typ_dt_ops);
 	kfree(type);
 	return rc;
 }
@@ -253,10 +250,8 @@ int class_unregister_type(const char *name)
 	list_del(&type->typ_chain);
 	spin_unlock(&obd_types_lock);
 	kfree(type->typ_name);
-	if (type->typ_dt_ops != NULL)
-		kfree(type->typ_dt_ops);
-	if (type->typ_md_ops != NULL)
-		kfree(type->typ_md_ops);
+	kfree(type->typ_dt_ops);
+	kfree(type->typ_md_ops);
 	kfree(type);
 	return 0;
 } /* class_unregister_type */

