From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Mar 2015 21:07:51 +0000
Subject: [patch] hv: vmbus: missing curly braces in vmbus_process_offer()
Message-Id: <20150305210751.GA24410@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The indenting makes it clear that there were curly braces intended here.

Fixes: 2dd37cb81580 ('Drivers: hv: vmbus: Handle both rescind and offer messages in the same context')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
index 6117891..b25f1ae 100644
--- a/drivers/hv/channel_mgmt.c
+++ b/drivers/hv/channel_mgmt.c
@@ -351,7 +351,7 @@ static void vmbus_process_offer(struct vmbus_channel *newchannel)
 
 			newchannel->state = CHANNEL_OPEN_STATE;
 			channel->num_sc++;
-			if (channel->sc_creation_callback != NULL)
+			if (channel->sc_creation_callback != NULL) {
 				/*
 				 * We need to invoke the sub-channel creation
 				 * callback; invoke this in a seperate work
@@ -363,6 +363,7 @@ static void vmbus_process_offer(struct vmbus_channel *newchannel)
 					  vmbus_sc_creation_cb);
 				queue_work(newchannel->controlwq,
 					   &newchannel->work);
+			}
 
 			return;
 		}
