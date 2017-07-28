From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 28 Jul 2017 20:41:51 +0000
Subject: [PATCH 04/11] usb: host/sl811-hcd: constify hc_driver structures
Message-Id: <1501274518-25170-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501274518-25170-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501274518-25170-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

The hc_driver structure is only passed as the first argument to
usb_create_hcd, which is declared as const.  Thus the hc_driver structure
itself can be const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/host/sl811-hcd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index fd2a114..24ad1d6 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1554,7 +1554,7 @@ static void remove_debug_file(struct sl811 *sl811)
 
 /*-------------------------------------------------------------------------*/
 
-static struct hc_driver sl811h_hc_driver = {
+static const struct hc_driver sl811h_hc_driver = {
 	.description =		hcd_name,
 	.hcd_priv_size =	sizeof(struct sl811),
 

