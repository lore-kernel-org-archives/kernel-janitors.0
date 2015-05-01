From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:38:05 +0000
Subject: [PATCH 2/20] staging: lustre: ldlm: ldlm_lock: remove unneeded null test before free
Message-Id: <1430509086-22132-20-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/ldlm/ldlm_lock.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c b/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c
index 2c5fe14..6a22f41 100644
--- a/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c
+++ b/drivers/staging/lustre/lustre/ldlm/ldlm_lock.c
@@ -208,8 +208,7 @@ void ldlm_lock_put(struct ldlm_lock *lock)
 			lock->l_export = NULL;
 		}
 
-		if (lock->l_lvb_data != NULL)
-			kfree(lock->l_lvb_data);
+		kfree(lock->l_lvb_data);
 
 		ldlm_interval_free(ldlm_interval_detach(lock));
 		lu_ref_fini(&lock->l_reference);

