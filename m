From: Andreas Theodosiou <andreasabu@gmail.com>
Date: Sat, 04 Apr 2015 23:09:30 +0000
Subject: [PATCH] staging : unisys: Fix brace coding style issue
Message-Id: <1428188970-30871-1-git-send-email-andreasabu@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benjamin.romer@unisys.com, david.kershner@unisys.com, gregkh@linuxfoundation.org, bryan.thompson@unisys.com, conflatulence@gmail.com
Cc: sparmaintainer@unisys.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andreas Theodosiou <andreasabu@gmail.com>

This is a patch to visorchannel/visorchannel_funcs.c that fixes a couple
of brace warnings found by checkpatch.pl.

Signed-off-by: Andreas Theodosiou <andreasabu@gmail.com>
---
 drivers/staging/unisys/visorchannel/visorchannel_funcs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/unisys/visorchannel/visorchannel_funcs.c b/drivers/staging/unisys/visorchannel/visorchannel_funcs.c
index 7a9a724..9ae5f75 100644
--- a/drivers/staging/unisys/visorchannel/visorchannel_funcs.c
+++ b/drivers/staging/unisys/visorchannel/visorchannel_funcs.c
@@ -405,9 +405,8 @@ signalremove_inner(struct visorchannel *channel, u32 queue, void *msg)
 		return FALSE;	/* no signals to remove */
 
 	sig_hdr.tail = (sig_hdr.tail + 1) % sig_hdr.max_slots;
-	if (!sig_read_data(channel, queue, &sig_hdr, sig_hdr.tail, msg)) {
+	if (!sig_read_data(channel, queue, &sig_hdr, sig_hdr.tail, msg))
 		return FALSE;
-	}
 	sig_hdr.num_received++;
 
 	/* For each data field in SIGNAL_QUEUE_HEADER that was modified,
@@ -470,9 +469,8 @@ signalinsert_inner(struct visorchannel *channel, u32 queue, void *msg)
 	mb(); /* required for channel synch */
 	if (!SIG_WRITE_FIELD(channel, queue, &sig_hdr, head))
 		return FALSE;
-	if (!SIG_WRITE_FIELD(channel, queue, &sig_hdr, num_sent)) {
+	if (!SIG_WRITE_FIELD(channel, queue, &sig_hdr, num_sent))
 		return FALSE;
-	}
 
 	return TRUE;
 }
-- 
2.3.5

