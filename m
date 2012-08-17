From: Mauro Carvalho Chehab <mchehab@redhat.com>
Date: Fri, 17 Aug 2012 14:12:55 +0000
Subject: Re: [samsung:v4l_samsung_for_v3.7 90/99] ERROR: "flexcop_dma_config_timer" [drivers/media/pci/b2c2/b
Message-Id: <502E5167.8080700@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <502BBCA1.1020603@redhat.com>
In-Reply-To: <502BBCA1.1020603@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Em 17-08-2012 00:57, Fengguang Wu escreveu:
>> The enclosed patch should fix it.
> It reduced the errors to one:
> 
> ERROR: "b2c2_flexcop_debug" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!

Thanks!

Fix enclosed.

Regards,
Mauro

---

[media] b2c2: export b2c2_flexcop_debug symbol

From: Mauro Carvalho Chehab <mchehab@redhat.com>

ERROR: "b2c2_flexcop_debug" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>

diff --git a/drivers/media/common/b2c2/flexcop.c b/drivers/media/common/b2c2/flexcop.c
index b1e8c99..412c5da 100644
--- a/drivers/media/common/b2c2/flexcop.c
+++ b/drivers/media/common/b2c2/flexcop.c
@@ -43,6 +43,7 @@
 #endif
 
 int b2c2_flexcop_debug;
+EXPORT_SYMBOL_GPL(b2c2_flexcop_debug);
 module_param_named(debug, b2c2_flexcop_debug,  int, 0644);
 MODULE_PARM_DESC(debug,
 		"set debug level (1=info,2=tuner,4=i2c,8=ts,"

