From: Julia Lawall <julia@diku.dk>
Date: Fri, 16 Sep 2011 06:57:33 +0000
Subject: [PATCH 2/4] drivers/staging/mei/interface.c: take size of pointed value, not pointer
Message-Id: <1316156255-19509-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>, Oren Weil <oren.jer.weil@intel.com>, Itzhak Tzeel-Krupp <itzhak.tzeel-krupp@intel.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Sizeof a pointer-typed expression returns the size of the pointer, not that
of the pointed data.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression *e;
type T;
identifier f;
@@

f(...,(T)e,...,
-sizeof(e)
+sizeof(*e)
,...)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/mei/interface.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/staging/mei/interface.c b/drivers/staging/mei/interface.c
--- a/drivers/staging/mei/interface.c
+++ b/drivers/staging/mei/interface.c
@@ -332,7 +332,7 @@ int mei_send_flow_control(struct mei_dev
 	mei_hdr->reserved = 0;
 
 	mei_flow_control = (struct hbm_flow_control *) &dev->wr_msg_buf[1];
-	memset(mei_flow_control, 0, sizeof(mei_flow_control));
+	memset(mei_flow_control, 0, sizeof(*mei_flow_control));
 	mei_flow_control->host_addr = cl->host_client_id;
 	mei_flow_control->me_addr = cl->me_client_id;
 	mei_flow_control->cmd.cmd = MEI_FLOW_CONTROL_CMD;
@@ -396,7 +396,7 @@ int mei_disconnect(struct mei_device *de
 
 	mei_cli_disconnect  	    (struct hbm_client_disconnect_request *) &dev->wr_msg_buf[1];
-	memset(mei_cli_disconnect, 0, sizeof(mei_cli_disconnect));
+	memset(mei_cli_disconnect, 0, sizeof(*mei_cli_disconnect));
 	mei_cli_disconnect->host_addr = cl->host_client_id;
 	mei_cli_disconnect->me_addr = cl->me_client_id;
 	mei_cli_disconnect->cmd.cmd = CLIENT_DISCONNECT_REQ_CMD;

