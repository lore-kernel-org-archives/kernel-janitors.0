From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 Jan 2018 20:10:24 +0000
Subject: [PATCH] hyperv/netvsc: Delete two error messages for a failed memory allocation in netvsc_init_buf()
Message-Id: <bb8fac96-9ba6-e54f-2321-72a8fba90085@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@linuxdriverproject.org, netdev@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 Jan 2018 21:03:26 +0100

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/hyperv/netvsc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/hyperv/netvsc.c b/drivers/net/hyperv/netvsc.c
index 17e529af79dc..c1ec02f801f6 100644
--- a/drivers/net/hyperv/netvsc.c
+++ b/drivers/net/hyperv/netvsc.c
@@ -275,9 +275,6 @@ static int netvsc_init_buf(struct hv_device *device,
 
 	net_device->recv_buf = vzalloc(buf_size);
 	if (!net_device->recv_buf) {
-		netdev_err(ndev,
-			   "unable to allocate receive buffer of size %u\n",
-			   buf_size);
 		ret = -ENOMEM;
 		goto cleanup;
 	}
@@ -357,8 +354,6 @@ static int netvsc_init_buf(struct hv_device *device,
 
 	net_device->send_buf = vzalloc(buf_size);
 	if (!net_device->send_buf) {
-		netdev_err(ndev, "unable to allocate send buffer of size %u\n",
-			   buf_size);
 		ret = -ENOMEM;
 		goto cleanup;
 	}
-- 
2.15.1

