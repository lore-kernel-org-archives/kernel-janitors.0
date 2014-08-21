From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 21 Aug 2014 12:06:06 +0000
Subject: Re: [PATCH 1/4] mfd: menelaus: fix error return code
Message-Id: <alpine.DEB.2.10.1408210705250.2534@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407355938-10932-2-git-send-email-Julia.Lawall@lip6.fr> <20140821082605.GS4266@lee--X1>
In-Reply-To: <20140821082605.GS4266@lee--X1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Convert a zero return value on error to a negative one, as returned
elsewhere in the function.

Additionally, converted 1 << 7 to BIT(7) at the suggestion of Lee Jones.

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
v2: Drop the name "val" and use BIT(7).

 drivers/mfd/menelaus.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
index 5e2667a..dd3e28d 100644
--- a/drivers/mfd/menelaus.c
+++ b/drivers/mfd/menelaus.c
@@ -1186,7 +1186,7 @@ static int menelaus_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
 	struct menelaus_chip	*menelaus;
-	int			rev = 0, val;
+	int			rev = 0;
 	int			err = 0;
 	struct menelaus_platform_data *menelaus_pdata  					dev_get_platdata(&client->dev);
@@ -1239,10 +1239,10 @@ static int menelaus_probe(struct i2c_client *client,

 	pr_info("Menelaus rev %d.%d\n", rev >> 4, rev & 0x0f);

-	val = menelaus_read_reg(MENELAUS_VCORE_CTRL1);
-	if (val < 0)
+	err = menelaus_read_reg(MENELAUS_VCORE_CTRL1);
+	if (err < 0)
 		goto fail;
-	if (val & (1 << 7))
+	if (err & BIT(7))
 		menelaus->vcore_hw_mode = 1;
 	else
 		menelaus->vcore_hw_mode = 0;
