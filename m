From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 27 Dec 2015 20:50:29 +0000
Subject: [PATCH] usb: renesas_usbhs: constify usbhs_pkt_handle structures
Message-Id: <1451249429-17205-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

The usbhs_pkt_handle structures are never modified, so declare them as
const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/renesas_usbhs/fifo.c |   20 ++++++++++----------
 drivers/usb/renesas_usbhs/fifo.h |   20 ++++++++++----------
 drivers/usb/renesas_usbhs/pipe.h |    2 +-
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs/fifo.c
index c0f5c65..b4de70e 100644
--- a/drivers/usb/renesas_usbhs/fifo.c
+++ b/drivers/usb/renesas_usbhs/fifo.c
@@ -46,7 +46,7 @@ static int usbhsf_null_handle(struct usbhs_pkt *pkt, int *is_done)
 	return -EINVAL;
 }
 
-static struct usbhs_pkt_handle usbhsf_null_handler = {
+static const struct usbhs_pkt_handle usbhsf_null_handler = {
 	.prepare = usbhsf_null_handle,
 	.try_run = usbhsf_null_handle,
 };
@@ -422,12 +422,12 @@ static int usbhs_dcp_dir_switch_done(struct usbhs_pkt *pkt, int *is_done)
 	return 0;
 }
 
-struct usbhs_pkt_handle usbhs_dcp_status_stage_in_handler = {
+const struct usbhs_pkt_handle usbhs_dcp_status_stage_in_handler = {
 	.prepare = usbhs_dcp_dir_switch_to_write,
 	.try_run = usbhs_dcp_dir_switch_done,
 };
 
-struct usbhs_pkt_handle usbhs_dcp_status_stage_out_handler = {
+const struct usbhs_pkt_handle usbhs_dcp_status_stage_out_handler = {
 	.prepare = usbhs_dcp_dir_switch_to_read,
 	.try_run = usbhs_dcp_dir_switch_done,
 };
@@ -449,7 +449,7 @@ static int usbhsf_dcp_data_stage_try_push(struct usbhs_pkt *pkt, int *is_done)
 	return pkt->handler->prepare(pkt, is_done);
 }
 
-struct usbhs_pkt_handle usbhs_dcp_data_stage_out_handler = {
+const struct usbhs_pkt_handle usbhs_dcp_data_stage_out_handler = {
 	.prepare = usbhsf_dcp_data_stage_try_push,
 };
 
@@ -488,7 +488,7 @@ static int usbhsf_dcp_data_stage_prepare_pop(struct usbhs_pkt *pkt,
 	return pkt->handler->prepare(pkt, is_done);
 }
 
-struct usbhs_pkt_handle usbhs_dcp_data_stage_in_handler = {
+const struct usbhs_pkt_handle usbhs_dcp_data_stage_in_handler = {
 	.prepare = usbhsf_dcp_data_stage_prepare_pop,
 };
 
@@ -600,7 +600,7 @@ static int usbhsf_pio_prepare_push(struct usbhs_pkt *pkt, int *is_done)
 	return usbhsf_pio_try_push(pkt, is_done);
 }
 
-struct usbhs_pkt_handle usbhs_fifo_pio_push_handler = {
+const struct usbhs_pkt_handle usbhs_fifo_pio_push_handler = {
 	.prepare = usbhsf_pio_prepare_push,
 	.try_run = usbhsf_pio_try_push,
 };
@@ -730,7 +730,7 @@ usbhs_fifo_read_busy:
 	return ret;
 }
 
-struct usbhs_pkt_handle usbhs_fifo_pio_pop_handler = {
+const struct usbhs_pkt_handle usbhs_fifo_pio_pop_handler = {
 	.prepare = usbhsf_prepare_pop,
 	.try_run = usbhsf_pio_try_pop,
 };
@@ -747,7 +747,7 @@ static int usbhsf_ctrl_stage_end(struct usbhs_pkt *pkt, int *is_done)
 	return 0;
 }
 
-struct usbhs_pkt_handle usbhs_ctrl_stage_end_handler = {
+const struct usbhs_pkt_handle usbhs_ctrl_stage_end_handler = {
 	.prepare = usbhsf_ctrl_stage_end,
 	.try_run = usbhsf_ctrl_stage_end,
 };
@@ -934,7 +934,7 @@ static int usbhsf_dma_push_done(struct usbhs_pkt *pkt, int *is_done)
 	return 0;
 }
 
-struct usbhs_pkt_handle usbhs_fifo_dma_push_handler = {
+const struct usbhs_pkt_handle usbhs_fifo_dma_push_handler = {
 	.prepare	= usbhsf_dma_prepare_push,
 	.dma_done	= usbhsf_dma_push_done,
 };
@@ -1182,7 +1182,7 @@ static int usbhsf_dma_pop_done(struct usbhs_pkt *pkt, int *is_done)
 		return usbhsf_dma_pop_done_with_rx_irq(pkt, is_done);
 }
 
-struct usbhs_pkt_handle usbhs_fifo_dma_pop_handler = {
+const struct usbhs_pkt_handle usbhs_fifo_dma_pop_handler = {
 	.prepare	= usbhsf_dma_prepare_pop,
 	.try_run	= usbhsf_dma_try_pop,
 	.dma_done	= usbhsf_dma_pop_done
diff --git a/drivers/usb/renesas_usbhs/fifo.h b/drivers/usb/renesas_usbhs/fifo.h
index c7d9b86..8b98507 100644
--- a/drivers/usb/renesas_usbhs/fifo.h
+++ b/drivers/usb/renesas_usbhs/fifo.h
@@ -54,7 +54,7 @@ struct usbhs_pkt_handle;
 struct usbhs_pkt {
 	struct list_head node;
 	struct usbhs_pipe *pipe;
-	struct usbhs_pkt_handle *handler;
+	const struct usbhs_pkt_handle *handler;
 	void (*done)(struct usbhs_priv *priv,
 		     struct usbhs_pkt *pkt);
 	struct work_struct work;
@@ -86,18 +86,18 @@ void usbhs_fifo_clear_dcp(struct usbhs_pipe *pipe);
 /*
  * packet info
  */
-extern struct usbhs_pkt_handle usbhs_fifo_pio_push_handler;
-extern struct usbhs_pkt_handle usbhs_fifo_pio_pop_handler;
-extern struct usbhs_pkt_handle usbhs_ctrl_stage_end_handler;
+extern const struct usbhs_pkt_handle usbhs_fifo_pio_push_handler;
+extern const struct usbhs_pkt_handle usbhs_fifo_pio_pop_handler;
+extern const struct usbhs_pkt_handle usbhs_ctrl_stage_end_handler;
 
-extern struct usbhs_pkt_handle usbhs_fifo_dma_push_handler;
-extern struct usbhs_pkt_handle usbhs_fifo_dma_pop_handler;
+extern const struct usbhs_pkt_handle usbhs_fifo_dma_push_handler;
+extern const struct usbhs_pkt_handle usbhs_fifo_dma_pop_handler;
 
-extern struct usbhs_pkt_handle usbhs_dcp_status_stage_in_handler;
-extern struct usbhs_pkt_handle usbhs_dcp_status_stage_out_handler;
+extern const struct usbhs_pkt_handle usbhs_dcp_status_stage_in_handler;
+extern const struct usbhs_pkt_handle usbhs_dcp_status_stage_out_handler;
 
-extern struct usbhs_pkt_handle usbhs_dcp_data_stage_in_handler;
-extern struct usbhs_pkt_handle usbhs_dcp_data_stage_out_handler;
+extern const struct usbhs_pkt_handle usbhs_dcp_data_stage_in_handler;
+extern const struct usbhs_pkt_handle usbhs_dcp_data_stage_out_handler;
 
 void usbhs_pkt_init(struct usbhs_pkt *pkt);
 void usbhs_pkt_push(struct usbhs_pipe *pipe, struct usbhs_pkt *pkt,
diff --git a/drivers/usb/renesas_usbhs/pipe.h b/drivers/usb/renesas_usbhs/pipe.h
index 3212ab5..7835747 100644
--- a/drivers/usb/renesas_usbhs/pipe.h
+++ b/drivers/usb/renesas_usbhs/pipe.h
@@ -38,7 +38,7 @@ struct usbhs_pipe {
 #define USBHS_PIPE_FLAGS_IS_DIR_HOST		(1 << 2)
 #define USBHS_PIPE_FLAGS_IS_RUNNING		(1 << 3)
 
-	struct usbhs_pkt_handle *handler;
+	const struct usbhs_pkt_handle *handler;
 
 	void *mod_private;
 };

