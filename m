From: Nicholas Mc Guire <der.herr@hofr.at>
Date: Mon, 16 Dec 2013 17:22:58 +0000
Subject: [PATCH 4/6] consolidate spin_lock/unlock waiting with spin_unlock_wait
Message-Id: <20131216172258.GE15665@opentech.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


llog_obd.c:
consolidate spin_lock/unlock waiting with spin_unlock_wait()

config: x86_64_defconfig with the following addition
        Device Drivers  --->
          [*] Staging drivers  --->
            <M>   Lustre file system client support
toolchain: debian wheezy default x86_64-linux-gnu 4.4.5

Builds llog_obd.o without warnings.
no runtime tests done

CC: Peng Tao <bergwolf@gmail.com>
CC: Alex Zhuravlev <alexey.zhuravlev@intel.com>
Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
---
 drivers/staging/lustre/lustre/obdclass/llog_obd.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/llog_obd.c b/drivers/staging/lustre/lustre/obdclass/llog_obd.c
index 71817af..e6c0b90 100644
--- a/drivers/staging/lustre/lustre/obdclass/llog_obd.c
+++ b/drivers/staging/lustre/lustre/obdclass/llog_obd.c
@@ -84,9 +84,8 @@ int __llog_ctxt_put(const struct lu_env *env, struct llog_ctxt *ctxt)
 	spin_unlock(&olg->olg_lock);
 
 	obd = ctxt->loc_obd;
-	spin_lock(&obd->obd_dev_lock);
 	/* sync with llog ctxt user thread */
-	spin_unlock(&obd->obd_dev_lock);
+	spin_unlock_wait(&obd->obd_dev_lock);
 
 	/* obd->obd_starting is needed for the case of cleanup
 	 * in error case while obd is starting up. */
-- 
1.7.2.5

