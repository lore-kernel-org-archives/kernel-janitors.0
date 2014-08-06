From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 06 Aug 2014 20:12:16 +0000
Subject: [PATCH 1/4] mfd: menelaus: fix error return code
Message-Id: <1407355938-10932-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Convert a zero return value on error to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
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
 drivers/mfd/menelaus.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
index 5e2667a..16070d8 100644
--- a/drivers/mfd/menelaus.c
+++ b/drivers/mfd/menelaus.c
@@ -1240,8 +1240,10 @@ static int menelaus_probe(struct i2c_client *client,
 	pr_info("Menelaus rev %d.%d\n", rev >> 4, rev & 0x0f);
 
 	val = menelaus_read_reg(MENELAUS_VCORE_CTRL1);
-	if (val < 0)
+	if (val < 0) {
+		err = val;
 		goto fail;
+	}
 	if (val & (1 << 7))
 		menelaus->vcore_hw_mode = 1;
 	else

