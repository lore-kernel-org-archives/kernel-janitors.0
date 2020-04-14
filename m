From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Apr 2020 15:23:43 +0000
Subject: [PATCH][next] drivers: hv: remove redundant assignment to pointer primary_channel
Message-Id: <20200414152343.243166-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer primary_channel is being assigned with a value that is never,
The assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hv/channel_mgmt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
index ffd7fffa5f83..f7bbb8dc4b0f 100644
--- a/drivers/hv/channel_mgmt.c
+++ b/drivers/hv/channel_mgmt.c
@@ -425,8 +425,6 @@ void hv_process_channel_removal(struct vmbus_channel *channel)
 
 	if (channel->primary_channel = NULL) {
 		list_del(&channel->listentry);
-
-		primary_channel = channel;
 	} else {
 		primary_channel = channel->primary_channel;
 		spin_lock_irqsave(&primary_channel->lock, flags);
-- 
2.25.1
