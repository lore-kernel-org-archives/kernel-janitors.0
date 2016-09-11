From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Sep 2016 13:05:58 +0000
Subject: [PATCH 16/26] ezusb: constify local structures
Message-Id: <1473599168-30561-17-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

For structure types defined in the same file or local header files, find
top-level static structure declarations that have the following
properties:
1. Never reassigned.
2. Address never taken
3. Not passed to a top-level macro call
4. No pointer or array-typed field passed to a function or stored in a
variable.
Declare structures having all of these properties as const.

Done using Coccinelle.
Based on a suggestion by Joe Perches <joe@perches.com>.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The semantic patch seems too long for a commit log, but is in the cover
letter.

 drivers/usb/misc/ezusb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/ezusb.c b/drivers/usb/misc/ezusb.c
index 947811b..837208f 100644
--- a/drivers/usb/misc/ezusb.c
+++ b/drivers/usb/misc/ezusb.c
@@ -22,7 +22,7 @@ struct ezusb_fx_type {
 	unsigned short max_internal_adress;
 };
 
-static struct ezusb_fx_type ezusb_fx1 = {
+static const struct ezusb_fx_type ezusb_fx1 = {
 	.cpucs_reg = 0x7F92,
 	.max_internal_adress = 0x1B3F,
 };

