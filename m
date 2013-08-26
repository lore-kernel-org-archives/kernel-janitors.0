From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Aug 2013 16:18:17 +0000
Subject: [patch -next] xen/evtchn: double free on error
Message-Id: <20130826161817.GF12428@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The call to del_evtchn() frees "evtchn".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
index f328f12..8b3a69a 100644
--- a/drivers/xen/evtchn.c
+++ b/drivers/xen/evtchn.c
@@ -319,7 +319,6 @@ err:
 	if (HYPERVISOR_event_channel_op(EVTCHNOP_close, &close) != 0)
 		BUG();
 	del_evtchn(u, evtchn);
-	kfree(evtchn);
 	return rc;
 }
 
