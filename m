From: Dan Carpenter <error27@gmail.com>
Date: Fri, 15 Oct 2010 03:42:00 +0000
Subject: [patch 2/2] Staging: ft1000-usb: fix array overflow
Message-Id: <20101015034200.GG6614@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The code here is supposed checking if we exited the loop without hitting
a break.  The problem is that in the error handling "i" is out of bounds
and it corrupts memory when we do an info->app_info[i].nRxMsgMiss++.
From the comments, it looks like someone noticed this corruption and
updated the code, but didn't totally fix the problem.  The correct fix
is just to remove nRxMsgMiss++ from the error path.

I believe this bug can be triggered remotely.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c b/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c
index 076ba75..d33dc06 100644
--- a/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c
+++ b/drivers/staging/ft1000/ft1000-usb/ft1000_hw.c
@@ -2647,8 +2647,7 @@ int ft1000_poll(void* dev_id) {
                                    }
                                }
 
-                               if (i=(MAX_NUM_APP-1)) {		// aelias [+] reason: was out of array boundary
-                                   info->app_info[i].nRxMsgMiss++;
+                               if (i = MAX_NUM_APP) {
                                    DEBUG("FT1000:ft1000_parse_dpram_msg: No application matching id = %d\n", ppseudo_hdr->portdest);
                                    // Put memory back to free pool
                                    ft1000_free_buffer(pdpram_blk, &freercvpool);
