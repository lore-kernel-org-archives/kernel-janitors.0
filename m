From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 07 Aug 2014 12:49:05 +0000
Subject: [PATCH 1/5] avr32: fix error return code
Message-Id: <1407415749-19978-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407415749-19978-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407415749-19978-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Hans-Christian Egtvedt <egtvedt@samfundet.no>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Convert a zero return value on error to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret; expression e1,e2;
@@
(
if (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/avr32/boards/hammerhead/flash.c |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/avr32/boards/hammerhead/flash.c b/arch/avr32/boards/hammerhead/flash.c
index 776c3cb..e86280c 100644
--- a/arch/avr32/boards/hammerhead/flash.c
+++ b/arch/avr32/boards/hammerhead/flash.c
@@ -190,14 +190,19 @@ static int __init hammerhead_usbh_init(void)
 
 	/* setup gclk0 to run from osc1 */
 	gclk = clk_get(NULL, "gclk0");
-	if (IS_ERR(gclk))
+	if (IS_ERR(gclk)) {
+		ret = PTR_ERR(gclk);
 		goto err_gclk;
+	}
 
 	osc = clk_get(NULL, "osc1");
-	if (IS_ERR(osc))
+	if (IS_ERR(osc)) {
+		ret = PTR_ERR(osc);
 		goto err_osc;
+	}
 
-	if (clk_set_parent(gclk, osc)) {
+	ret = clk_set_parent(gclk, osc);
+	if (ret < 0) {
 		pr_debug("hammerhead: failed to set osc1 for USBH clock\n");
 		goto err_set_clk;
 	}

