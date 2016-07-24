From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 24 Jul 2016 08:27:49 +0000
Subject: [PATCH] firmware-gsmi: Delete an unnecessary check before the function call "dma_pool_destroy"
Message-Id: <c2e7a68c-0ee5-01e1-9da0-42602a48cf3d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michel Lespinasse <walken@google.com>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Matt Fleming <matt.fleming@intel.com>, Mike Waychison <mikew@google.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 24 Jul 2016 10:16:56 +0200

The dma_pool_destroy() function tests whether its argument is NULL
and then returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firmware/google/gsmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/google/gsmi.c
index f1ab05e..c463871 100644
--- a/drivers/firmware/google/gsmi.c
+++ b/drivers/firmware/google/gsmi.c
@@ -910,8 +910,7 @@ out_err:
 	gsmi_buf_free(gsmi_dev.param_buf);
 	gsmi_buf_free(gsmi_dev.data_buf);
 	gsmi_buf_free(gsmi_dev.name_buf);
-	if (gsmi_dev.dma_pool)
-		dma_pool_destroy(gsmi_dev.dma_pool);
+	dma_pool_destroy(gsmi_dev.dma_pool);
 	platform_device_unregister(gsmi_dev.pdev);
 	pr_info("gsmi: failed to load: %d\n", ret);
 	return ret;
-- 
2.9.2

