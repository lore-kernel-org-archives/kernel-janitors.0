From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 14 Nov 2018 06:10:47 +0000
Subject: [PATCH -next] i3c: master: Remove set but not used variable 'old_i3c_scl_lim'
Message-Id: <1542175847-49517-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/i3c/master/i3c-master-cdns.c: In function 'cdns_i3c_master_do_daa':
drivers/i3c/master/i3c-master-cdns.c:1137:16: warning:
 variable 'old_i3c_scl_lim' set but not used [-Wunused-but-set-variable]

It never used since introdution in commit
  acfab7d324b2 ("i3c: master: Add driver for Cadence IP")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index ad40162..e828921 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1133,7 +1133,6 @@ static void cdns_i3c_master_upd_i3c_scl_lim(struct cdns_i3c_master *master)
 static int cdns_i3c_master_do_daa(struct i3c_master_controller *m)
 {
 	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
-	unsigned long old_i3c_scl_lim;
 	u32 olddevs, newdevs;
 	int ret, slot;
 	u8 addrs[MAX_DEVS] = { };
@@ -1165,9 +1164,6 @@ static int cdns_i3c_master_do_daa(struct i3c_master_controller *m)
 	newdevs = readl(master->regs + DEVS_CTRL) & DEVS_CTRL_DEVS_ACTIVE_MASK;
 	newdevs &= ~olddevs;
 
-	/* Save the old limitation before add devices. */
-	old_i3c_scl_lim = master->i3c_scl_lim;
-
 	/*
 	 * Clear all retaining registers filled during DAA. We already
 	 * have the addressed assigned to them in the addrs array.
