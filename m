From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 28 Jul 2017 20:41:52 +0000
Subject: [PATCH 05/11] usb: host: u132-hcd: constify hc_driver structures
Message-Id: <1501274518-25170-6-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/usb/host/u132-hcd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/u132-hcd.c b/drivers/usb/host/u132-hcd.c
index 43d5293..c38855a 100644
--- a/drivers/usb/host/u132-hcd.c
+++ b/drivers/usb/host/u132-hcd.c
@@ -2941,7 +2941,7 @@ static int u132_bus_resume(struct usb_hcd *hcd)
 #define u132_bus_suspend NULL
 #define u132_bus_resume NULL
 #endif
-static struct hc_driver u132_hc_driver = {
+static const struct hc_driver u132_hc_driver = {
 	.description = hcd_name,
 	.hcd_priv_size = sizeof(struct u132),
 	.irq = NULL,

