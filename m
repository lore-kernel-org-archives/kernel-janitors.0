From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 16 Jul 2010 16:13:51 +0000
Subject: [PATCH 05/15] staging: hv: check kzalloc() result
Message-Id: <1279296831-24943-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Hank Janssen <hjanssen@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

If kzalloc() fails free allocated resources and exit.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/hv/channel.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/hv/channel.c b/drivers/staging/hv/channel.c
index f047c5a..78d1aa5 100644
--- a/drivers/staging/hv/channel.c
+++ b/drivers/staging/hv/channel.c
@@ -465,6 +465,8 @@ static int VmbusChannelCreateGpadlHeader(void *Kbuffer, u32 Size,
 			  sizeof(struct vmbus_channel_gpadl_header) +
 			  sizeof(struct gpa_range) + pageCount * sizeof(u64);
 		msgHeader = kzalloc(msgSize, GFP_KERNEL);
+		if (msgHeader = NULL)
+			goto nomem;
 		msgHeader->MessageSize = msgSize;
 
 		gpaHeader = (struct vmbus_channel_gpadl_header *)msgHeader->Msg;
-- 
1.7.0.4

