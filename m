From: Dan Carpenter <error27@gmail.com>
Date: Tue, 12 Oct 2010 06:01:11 +0000
Subject: [patch -next] V4L/DVB: IR/streamzap: fix usec to nsec conversion
Message-Id: <20101012060110.GA13176@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Jarod Wilson <jarod@redhat.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

There is an integer overflow here because 0x03000000 * 1000 is too large
for 31 bits.

rawir.duration should be in terms of nsecs.
IR_MAX_DURATION and 0x03000000 are already in terms of nsecs.
STREAMZAP_TIMEOUT and STREAMZAP_RESOLUTION are 255 and 256 respectively
and are in terms of usecs.

The original code had a deadline of 1.005 seconds and the new code has a
deadline of .065 seconds. 

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/IR/streamzap.c b/drivers/media/IR/streamzap.c
index 2cf57e6..d5d3cee 100644
--- a/drivers/media/IR/streamzap.c
+++ b/drivers/media/IR/streamzap.c
@@ -221,7 +221,7 @@ static void streamzap_callback(struct urb *urb)
 	struct streamzap_ir *sz;
 	unsigned int i;
 	int len;
-	static int timeout = (((STREAMZAP_TIMEOUT * STREAMZAP_RESOLUTION) &
+	static int timeout = (((STREAMZAP_TIMEOUT * STREAMZAP_RESOLUTION * 1000) &
 				IR_MAX_DURATION) | 0x03000000);
 
 	if (!urb)
@@ -273,7 +273,7 @@ static void streamzap_callback(struct urb *urb)
 				struct ir_raw_event rawir;
 
 				rawir.pulse = false;
-				rawir.duration = timeout * 1000;
+				rawir.duration = timeout;
 				sz->idle = true;
 				if (sz->timeout_enabled)
 					sz_push(sz, rawir);
