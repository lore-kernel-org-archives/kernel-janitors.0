From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Nov 2014 21:55:34 +0000
Subject: [PATCH v2] net: Hyper-V: Deletion of an unnecessary check before the function call "vfree"
Message-Id: <5474FAD6.4060704@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>	<5317A59D.4@users.sourceforge.net>	<546DF9D7.6080801@users.sourceforge.net> <20141121.151503.1986113223309494197.davem@davemloft.net>
In-Reply-To: <20141121.151503.1986113223309494197.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>, devel@linuxdriverproject.org, netdev@vger.kernel.org
Cc: Haiyang Zhang <haiyangz@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Nov 2014 22:33:45 +0100

The vfree() function performs also input parameter validation.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Signed-off-by: Haiyang Zhang <haiyangz@microsoft.com>
---
 drivers/net/hyperv/netvsc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/hyperv/netvsc.c b/drivers/net/hyperv/netvsc.c
index 6b46311..6fc834e 100644
--- a/drivers/net/hyperv/netvsc.c
+++ b/drivers/net/hyperv/netvsc.c
@@ -561,9 +561,7 @@ int netvsc_device_remove(struct hv_device *device)
 	vmbus_close(device->channel);
 
 	/* Release all resources */
-	if (net_device->sub_cb_buf)
-		vfree(net_device->sub_cb_buf);
-
+	vfree(net_device->sub_cb_buf);
 	free_netvsc_device(net_device);
 	return 0;
 }
-- 
2.1.3

