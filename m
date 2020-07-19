From: Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Sun, 19 Jul 2020 11:34:48 +0000
Subject: Re: [PATCH] media: atomisp: fix mask and shift operation on ISPSSPM0
Message-Id: <20200719133448.481cffc5@coco.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200716145138.1708693-1-colin.king@canonical.com>
In-Reply-To: <20200716145138.1708693-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org

Em Thu, 16 Jul 2020 15:51:38 +0100
Colin King <colin.king@canonical.com> escreveu:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check on bits 25:24 on ISPSSPM0 is always 0 because
> the mask and shift operations are incorrect. Fix this by shifting
> by MRFLD_ISPSSPM0_ISPSSS_OFFSET (24 bits right) and then masking
> with RFLD_ISPSSPM0_ISPSSC_MASK (0x03) to get the appropriate 2 bits
> to check.
> 
> Addresses-Coverity: ("Operands don't affect result")
> Fixes: 0f441fd70b1e ("media: atomisp: simplify the power down/up code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks!

With this patch, we can revert this one too (patch enclosed):

	d0213061a501 ("media: atomisp: fix mask and shift operation on ISPSSPM0")

I tested it already: the IUNIT power on/off code is working properly
after both patches.

Thanks,
Mauro

-
[PATCH] Revert "media: atomisp: keep the ISP powered on when setting it"

changeset d0213061a501 ("media: atomisp: fix mask and shift operation on ISPSSPM0")
solved the existing issue with the IUNIT power on code.

So, the driver can now use the right code again.

This reverts commit 95d1f398c4dc3f55e9007c89452ccc16301205fc.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index e31195816b2d..a000a1e316f7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -766,17 +766,13 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 /* Workaround for pmu_nc_set_power_state not ready in MRFLD */
 int atomisp_mrfld_power_down(struct atomisp_device *isp)
 {
-	return 0;
-// FIXME: at least with ISP2401, the code below causes the driver to break
-//	return atomisp_mrfld_power(isp, false);
+	return atomisp_mrfld_power(isp, false);
 }
 
 /* Workaround for pmu_nc_set_power_state not ready in MRFLD */
 int atomisp_mrfld_power_up(struct atomisp_device *isp)
 {
-	return 0;
-// FIXME: at least with ISP2401, the code below causes the driver to break
-//	return atomisp_mrfld_power(isp, true);
+	return atomisp_mrfld_power(isp, true);
 }
 
 int atomisp_runtime_suspend(struct device *dev)
