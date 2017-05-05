From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 May 2017 05:33:24 +0000
Subject: [PATCH] ipmi_ssif: unlock on allocation failure
Message-Id: <20170505053324.uvufggdlbml2c56e@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We should unlock and re-enable IRQs if this allocation fails.

Fixes: 259307074bfc ("ipmi: Add SMBus interface driver (SSIF) ")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
index 0b22a9be5029..6dd6476ea5d3 100644
--- a/drivers/char/ipmi/ipmi_ssif.c
+++ b/drivers/char/ipmi/ipmi_ssif.c
@@ -408,6 +408,7 @@ static void start_event_fetch(struct ssif_info *ssif_info, unsigned long *flags)
 	msg = ipmi_alloc_smi_msg();
 	if (!msg) {
 		ssif_info->ssif_state = SSIF_NORMAL;
+		ipmi_ssif_unlock_cond(ssif_info, flags);
 		return;
 	}
 
@@ -430,6 +431,7 @@ static void start_recv_msg_fetch(struct ssif_info *ssif_info,
 	msg = ipmi_alloc_smi_msg();
 	if (!msg) {
 		ssif_info->ssif_state = SSIF_NORMAL;
+		ipmi_ssif_unlock_cond(ssif_info, flags);
 		return;
 	}
 
