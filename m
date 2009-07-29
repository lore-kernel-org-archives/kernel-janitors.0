From: Nicolas Palix <npalix@diku.dk>
Date: Wed, 29 Jul 2009 12:10:28 +0000
Subject: [PATCH 4/4] Staging: hv: Fix warning by casting a (const void *) to (void *)
Message-Id: <200907291410.29355.npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, hjanssen@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Fix compilation warning by casting the const void *Buffer
variable into a void *.

Signed-off-by: Nicolas Palix <npalix@diku.dk>
---
 drivers/staging/hv/Channel.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/hv/Channel.c b/drivers/staging/hv/Channel.c
index 68f3442..854fa30 100644
--- a/drivers/staging/hv/Channel.c
+++ b/drivers/staging/hv/Channel.c
@@ -787,7 +787,7 @@ VmbusChannelSendPacket(
 	bufferList[0].Data = &desc;
 	bufferList[0].Length = sizeof(VMPACKET_DESCRIPTOR);
 
-	bufferList[1].Data = Buffer;
+	bufferList[1].Data = (void *)Buffer;
 	bufferList[1].Length = BufferLen;
 
 	bufferList[2].Data = &alignedData;
-- 
1.6.0.4


-- 
Nicolas Palix
