From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:37:57 +0000
Subject: [PATCH 10/20] staging: lustre: lov: lov_dev: remove unneeded null test before free
Message-Id: <1430509086-22132-12-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/lov/lov_dev.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/lustre/lov/lov_dev.c b/drivers/staging/lustre/lustre/lov/lov_dev.c
index 63db87a..504b24a 100644
--- a/drivers/staging/lustre/lustre/lov/lov_dev.c
+++ b/drivers/staging/lustre/lustre/lov/lov_dev.c
@@ -298,8 +298,7 @@ static struct lu_device *lov_device_free(const struct lu_env *env,
 	const int	  nr = ld->ld_target_nr;
 
 	cl_device_fini(lu2cl_dev(d));
-	if (ld->ld_target != NULL)
-		kfree(ld->ld_target);
+	kfree(ld->ld_target);
 	if (ld->ld_emrg != NULL)
 		lov_emerg_free(ld->ld_emrg, nr);
 	kfree(ld);

