From: Colin King <colin.king@canonical.com>
Date: Wed, 29 Aug 2018 09:35:30 +0000
Subject: [PATCH] staging: fsl-dpaa2/ethsw: remove redundant pointer 'port_priv'
Message-Id: <20180829093530.31200-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ioana Radulescu <ruxandra.radulescu@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer 'port_priv' is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
variable 'port_priv' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/fsl-dpaa2/ethsw/ethsw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/fsl-dpaa2/ethsw/ethsw.c b/drivers/staging/fsl-dpaa2/ethsw/ethsw.c
index ecdd3d84f956..0066ca3072c1 100644
--- a/drivers/staging/fsl-dpaa2/ethsw/ethsw.c
+++ b/drivers/staging/fsl-dpaa2/ethsw/ethsw.c
@@ -1014,10 +1014,8 @@ static void ethsw_switchdev_event_work(struct work_struct *work)
 		container_of(work, struct ethsw_switchdev_event_work, work);
 	struct net_device *dev = switchdev_work->dev;
 	struct switchdev_notifier_fdb_info *fdb_info;
-	struct ethsw_port_priv *port_priv;
 
 	rtnl_lock();
-	port_priv = netdev_priv(dev);
 	fdb_info = &switchdev_work->fdb_info;
 
 	switch (switchdev_work->event) {
-- 
2.17.1
