From: Dan Carpenter <error27@gmail.com>
Date: Fri, 10 Sep 2010 11:54:23 +0000
Subject: [patch] vxge: potential NULL dereference
Message-Id: <20100910115423.GC5959@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ramkrishna Vepa <ramkrishna.vepa@exar.com>
Cc: Sivakumar Subramani <sivakumar.subramani@exar.com>, Sreenivasa Honnur <sreenivasa.honnur@exar.com>, Jon Mason <jon.mason@exar.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

At the start of the function we test whether the "vpath" is NULL but we
need another test here as well.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This is a static checker bug, I'm not sure if we ever pass a NULL
pointer for "vpath".

diff --git a/drivers/net/vxge/vxge-traffic.c b/drivers/net/vxge/vxge-traffic.c
index cedf08f..1790748 100644
--- a/drivers/net/vxge/vxge-traffic.c
+++ b/drivers/net/vxge/vxge-traffic.c
@@ -2157,7 +2157,8 @@ out2:
 		(alarm_event = VXGE_HW_EVENT_UNKNOWN))
 		return VXGE_HW_OK;
 
-	__vxge_hw_device_handle_error(hldev, vpath->vp_id, alarm_event);
+	if (vpath)
+		__vxge_hw_device_handle_error(hldev, vpath->vp_id, alarm_event);
 
 	if (alarm_event = VXGE_HW_EVENT_SERR)
 		return VXGE_HW_ERR_CRITICAL;
