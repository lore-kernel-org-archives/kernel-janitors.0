From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 30 Dec 2015 10:28:02 +0000
Subject: [PATCH] xen/hvc: constify hv_ops structures
Message-Id: <1451471282-5548-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

These hv_ops structures are never modified, so declare them as const.  Most
were const already.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/tty/hvc/hvc_xen.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index fa816b7..1505056 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -162,7 +162,7 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
 	return recv;
 }
 
-static struct hv_ops domU_hvc_ops = {
+static const struct hv_ops domU_hvc_ops = {
 	.get_chars = domU_read_console,
 	.put_chars = domU_write_console,
 	.notifier_add = notifier_add_irq,
@@ -188,7 +188,7 @@ static int dom0_write_console(uint32_t vtermno, const char *str, int len)
 	return len;
 }
 
-static struct hv_ops dom0_hvc_ops = {
+static const struct hv_ops dom0_hvc_ops = {
 	.get_chars = dom0_read_console,
 	.put_chars = dom0_write_console,
 	.notifier_add = notifier_add_irq,

