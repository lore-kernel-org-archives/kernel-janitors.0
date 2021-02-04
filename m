From: Pawel Laszczak <pawell@cadence.com>
Date: Thu, 04 Feb 2021 09:20:35 +0000
Subject: [PATCH] usb: cdnsp: Removes some useless trace events
Message-Id: <20210204092035.32424-1-pawell@cadence.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peter.chen@nxp.com
Cc: dan.carpenter@oracle.com, colin.king@canonical.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, kurahul@cadence.com, Pawel Laszczak <pawell@cadence.com>

Patch removes some useless trace events that can
be replaced by ftrace.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/cdns3/cdnsp-ep0.c    |  5 -----
 drivers/usb/cdns3/cdnsp-gadget.c |  2 --
 drivers/usb/cdns3/cdnsp-ring.c   |  1 -
 drivers/usb/cdns3/cdnsp-trace.h  | 10 ----------
 4 files changed, 18 deletions(-)

diff --git a/drivers/usb/cdns3/cdnsp-ep0.c b/drivers/usb/cdns3/cdnsp-ep0.c
index e2b1bcb3f80e..9b8325f82499 100644
--- a/drivers/usb/cdns3/cdnsp-ep0.c
+++ b/drivers/usb/cdns3/cdnsp-ep0.c
@@ -24,13 +24,11 @@ static void cdnsp_ep0_stall(struct cdnsp_device *pdev)
 	preq = next_request(&pep->pending_list);
 
 	if (pdev->three_stage_setup) {
-		trace_cdnsp_ep0_data_stage("send stall");
 		cdnsp_halt_endpoint(pdev, pep, true);
 
 		if (preq)
 			cdnsp_gadget_giveback(pep, preq, -ECONNRESET);
 	} else {
-		trace_cdnsp_ep0_status_stage("send stall");
 		pep->ep_state |= EP0_HALTED_STATUS;
 
 		if (preq)
@@ -45,8 +43,6 @@ static int cdnsp_ep0_delegate_req(struct cdnsp_device *pdev,
 {
 	int ret;
 
-	trace_cdnsp_ep0_request("delagete");
-
 	spin_unlock(&pdev->lock);
 	ret = pdev->gadget_driver->setup(&pdev->gadget, ctrl);
 	spin_lock(&pdev->lock);
@@ -130,7 +126,6 @@ static int cdnsp_ep0_set_address(struct cdnsp_device *pdev,
 
 int cdnsp_status_stage(struct cdnsp_device *pdev)
 {
-	trace_cdnsp_ep0_status_stage("preparing");
 	pdev->ep0_stage = CDNSP_STATUS_STAGE;
 	pdev->ep0_preq.request.length = 0;
 
diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index f28f1508f049..f2ebbacd932e 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -237,8 +237,6 @@ static int cdnsp_start(struct cdnsp_device *pdev)
 	temp |= (CMD_R_S | CMD_DEVEN);
 	writel(temp, &pdev->op_regs->command);
 
-	trace_cdnsp_init("Turn on controller");
-
 	pdev->cdnsp_state = 0;
 
 	/*
diff --git a/drivers/usb/cdns3/cdnsp-ring.c b/drivers/usb/cdns3/cdnsp-ring.c
index e15e13ba27dc..f9170d177a89 100644
--- a/drivers/usb/cdns3/cdnsp-ring.c
+++ b/drivers/usb/cdns3/cdnsp-ring.c
@@ -266,7 +266,6 @@ static void cdnsp_force_l0_go(struct cdnsp_device *pdev)
 /* Ring the doorbell after placing a command on the ring. */
 void cdnsp_ring_cmd_db(struct cdnsp_device *pdev)
 {
-	trace_cdnsp_cmd_drbl("Ding Dong");
 	writel(DB_VALUE_CMD, &pdev->dba->cmd_db);
 }
 
diff --git a/drivers/usb/cdns3/cdnsp-trace.h b/drivers/usb/cdns3/cdnsp-trace.h
index a9de1daadf07..5aa88ca012de 100644
--- a/drivers/usb/cdns3/cdnsp-trace.h
+++ b/drivers/usb/cdns3/cdnsp-trace.h
@@ -158,11 +158,6 @@ DEFINE_EVENT(cdnsp_log_simple, cdnsp_slot_id,
 	TP_ARGS(msg)
 );
 
-DEFINE_EVENT(cdnsp_log_simple, cdnsp_cmd_drbl,
-	TP_PROTO(char *msg),
-	TP_ARGS(msg)
-);
-
 DEFINE_EVENT(cdnsp_log_simple, cdnsp_no_room_on_ring,
 	TP_PROTO(char *msg),
 	TP_ARGS(msg)
@@ -173,11 +168,6 @@ DEFINE_EVENT(cdnsp_log_simple, cdnsp_ep0_status_stage,
 	TP_ARGS(msg)
 );
 
-DEFINE_EVENT(cdnsp_log_simple, cdnsp_ep0_data_stage,
-	TP_PROTO(char *msg),
-	TP_ARGS(msg)
-);
-
 DEFINE_EVENT(cdnsp_log_simple, cdnsp_ep0_request,
 	TP_PROTO(char *msg),
 	TP_ARGS(msg)
-- 
2.25.1
