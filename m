From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Aug 2017 11:53:55 +0000
Subject: [PATCH] i2c: mux: pinctrl: potential NULL dereference on error
Message-Id: <20170817115355.fsc3z64eih7wjze6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org

If i2c_mux_alloc() fails then we'd have a NULL dereference here.

Fixes: c4aee3e1b0de ("i2c: mux: pinctrl: remove platform_data")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/i2c/muxes/i2c-mux-pinctrl.c b/drivers/i2c/muxes/i2c-mux-pinctrl.c
index 20b90a7a1e61..cc6818aabab5 100644
--- a/drivers/i2c/muxes/i2c-mux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-mux-pinctrl.c
@@ -173,7 +173,7 @@ static int i2c_mux_pinctrl_probe(struct platform_device *pdev)
 err_del_adapter:
 	i2c_mux_del_adapters(muxc);
 err_put_parent:
-	i2c_put_adapter(muxc->parent);
+	i2c_put_adapter(parent);
 
 	return ret;
 }
