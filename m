From: Joe Perches <joe@perches.com>
Date: Wed, 29 Jul 2009 13:03:28 +0000
Subject: Re: [PATCH 4/4] Staging: hv: Fix warning by casting a (const void
Message-Id: <1248872608.3493.26.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907291410.29355.npalix@diku.dk>
In-Reply-To: <200907291410.29355.npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: gregkh@suse.de, hjanssen@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2009-07-29 at 14:10 +0200, Nicolas Palix wrote: 
> Fix compilation warning by casting the const void *Buffer
> variable into a void *.
> diff --git a/drivers/staging/hv/Channel.c b/drivers/staging/hv/Channel.c
> index 68f3442..854fa30 100644
> --- a/drivers/staging/hv/Channel.c
> +++ b/drivers/staging/hv/Channel.c
> @@ -787,7 +787,7 @@ VmbusChannelSendPacket(
>  	bufferList[0].Data = &desc;
>  	bufferList[0].Length = sizeof(VMPACKET_DESCRIPTOR);
>  
> -	bufferList[1].Data = Buffer;
> +	bufferList[1].Data = (void *)Buffer;
>  	bufferList[1].Length = BufferLen;

Perhaps this is better?

diff --git a/drivers/staging/hv/RingBuffer.c b/drivers/staging/hv/RingBuffer.c
index 6a9f568..fa40f46 100644
--- a/drivers/staging/hv/RingBuffer.c
+++ b/drivers/staging/hv/RingBuffer.c
@@ -228,7 +228,7 @@ static u32
 CopyToRingBuffer(
 	RING_BUFFER_INFO	*RingInfo,
 	u32				StartWriteOffset,
-	void *				Src,
+	const void *			Src,
 	u32				SrcLen);
 
 static u32
@@ -559,7 +559,7 @@ u32
 CopyToRingBuffer(
 	RING_BUFFER_INFO	*RingInfo,
 	u32				StartWriteOffset,
-	void *				Src,
+	const void *			Src,
 	u32				SrcLen)
 {
 	void * ringBuffer=GetRingBuffer(RingInfo);
diff --git a/drivers/staging/hv/RingBuffer.h b/drivers/staging/hv/RingBuffer.h
index a0b6e0e..4cea2af 100644
--- a/drivers/staging/hv/RingBuffer.h
+++ b/drivers/staging/hv/RingBuffer.h
@@ -28,7 +28,7 @@
 #include "include/osd.h"
 
 typedef struct _SG_BUFFER_LIST {
-	void *	Data;
+	const void *Data;
 	u32	Length;
 } SG_BUFFER_LIST;
 


