From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, 06 Sep 2012 08:43:45 +0000
Subject: Fwd: [PATCH v2] drivers/media/platform/s5p-tv/sdo_drv.c: fix error return code
Message-Id: <CA+MoWDokNqiSqTf6ZZBa_-pa4eAK+-TQ4yRRmibH9cefUhKPzg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

---------- Forwarded message ----------
From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, Sep 6, 2012 at 10:38 AM
Subject: [PATCH v2] drivers/media/platform/s5p-tv/sdo_drv.c: fix error
return code
To: peter.senna@gmail.com, Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org


From: Peter Senna Tschudin <peter.senna@gmail.com>

Convert a nonnegative error return code to a negative one, as returned
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

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/media/platform/s5p-tv/sdo_drv.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/s5p-tv/sdo_drv.c
b/drivers/media/platform/s5p-tv/sdo_drv.c
index ad68bbe..58cf56d 100644
--- a/drivers/media/platform/s5p-tv/sdo_drv.c
+++ b/drivers/media/platform/s5p-tv/sdo_drv.c
@@ -369,6 +369,7 @@ static int __devinit sdo_probe(struct platform_device *pdev)
        sdev->fout_vpll = clk_get(dev, "fout_vpll");
        if (IS_ERR_OR_NULL(sdev->fout_vpll)) {
                dev_err(dev, "failed to get clock 'fout_vpll'\n");
+               ret = -ENXIO;
                goto fail_dacphy;
        }
        dev_info(dev, "fout_vpll.rate = %lu\n", clk_get_rate(sclk_vpll));
@@ -377,11 +378,13 @@ static int __devinit sdo_probe(struct
platform_device *pdev)
        sdev->vdac = devm_regulator_get(dev, "vdd33a_dac");
        if (IS_ERR_OR_NULL(sdev->vdac)) {
                dev_err(dev, "failed to get regulator 'vdac'\n");
+               ret = -ENXIO;
                goto fail_fout_vpll;
        }
        sdev->vdet = devm_regulator_get(dev, "vdet");
        if (IS_ERR_OR_NULL(sdev->vdet)) {
                dev_err(dev, "failed to get regulator 'vdet'\n");
+               ret = -ENXIO;
                goto fail_fout_vpll;
        }




-- 
Peter Senna Tschudin
peter.senna@gmail.com
gpg id: 48274C36
