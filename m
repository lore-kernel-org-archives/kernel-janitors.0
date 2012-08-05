From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 05 Aug 2012 09:52:35 +0000
Subject: [PATCH 5/6] drivers/char/tlclk.c: fix error return code
Message-Id: <1344160356-387-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344160356-387-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344160356-387-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Gross <mark.gross@intel.com>
Cc: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>

From: Julia Lawall <julia@diku.dk>

Convert a 0 error return code to a negative one, as returned elsewhere in the
function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret;
expression e,e1,e2,e3,e4,x;
@@

(
if (\(ret != 0\|ret < 0\) || ...) { ... return ...; }
|
ret = 0
)
... when != ret = e1
*x = \(kmalloc\|kzalloc\|kcalloc\|devm_kzalloc\|ioremap\|ioremap_nocache\|devm_ioremap\|devm_ioremap_nocache\)(...);
... when != x = e2
    when != ret = e3
*if (x = NULL || ...)
{
  ... when != ret = e4
*  return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/char/tlclk.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/char/tlclk.c b/drivers/char/tlclk.c
index ce29e7c..e95e0ab 100644
--- a/drivers/char/tlclk.c
+++ b/drivers/char/tlclk.c
@@ -784,8 +784,10 @@ static int __init tlclk_init(void)
 	}
 	tlclk_major = ret;
 	alarm_events = kzalloc( sizeof(struct tlclk_alarms), GFP_KERNEL);
-	if (!alarm_events)
+	if (!alarm_events) {
+		ret = -ENOMEM;
 		goto out1;
+	}
 
 	/* Read telecom clock IRQ number (Set by BIOS) */
 	if (!request_region(TLCLK_BASE, 8, "telco_clock")) {

