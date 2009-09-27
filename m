From: Julia Lawall <julia@diku.dk>
Date: Sun, 27 Sep 2009 10:08:32 +0000
Subject: [PATCH] drivers/char/ipmi: Use KCS_IDLE_STATE
Message-Id: <Pine.LNX.4.64.0909271208010.7197@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: minyard@acm.org, openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

KCS_IDLE and KCS_IDLE state have the same value, but in this function the
constants ending in _STATE are compared to the state variable.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/char/ipmi/ipmi_kcs_sm.c     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_kcs_sm.c b/drivers/char/ipmi/ipmi_kcs_sm.c
index 8070487..cf82fed 100644
--- a/drivers/char/ipmi/ipmi_kcs_sm.c
+++ b/drivers/char/ipmi/ipmi_kcs_sm.c
@@ -370,7 +370,7 @@ static enum si_sm_result kcs_event(struct si_sm_data *kcs, long time)
 			return SI_SM_IDLE;
 
 	case KCS_START_OP:
-		if (state != KCS_IDLE) {
+		if (state != KCS_IDLE_STATE) {
 			start_error_recovery(kcs,
 					     "State machine not idle at start");
 			break;
