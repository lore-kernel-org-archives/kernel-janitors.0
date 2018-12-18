From: "Pawnikar, Sumeet R" <sumeet.r.pawnikar@intel.com>
Date: Tue, 18 Dec 2018 15:16:22 +0000
Subject: RE: [PATCH] thermal: int340x_thermal: Fix a NULL vs IS_ERR() check
Message-Id: <3C3E65E75D9910479323816378A812E741445EFC@BGSMSX104.gar.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181217070106.GB12159@kadam>
In-Reply-To: <20181217070106.GB12159@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



>-----Original Message-----
>From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
>Sent: Monday, December 17, 2018 12:33 PM
>To: Zhang, Rui <rui.zhang@intel.com>
>Cc: Eduardo Valentin <edubezval@gmail.com>; Srinivas Pandruvada
><srinivas.pandruvada@linux.intel.com>; Daniel Lezcano
><daniel.lezcano@linaro.org>; Pawnikar, Sumeet R
><sumeet.r.pawnikar@intel.com>; Amit Kucheria <amit.kucheria@linaro.org>;
>linux-pm@vger.kernel.org; kernel-janitors@vger.kernel.org
>Subject: [PATCH] thermal: int340x_thermal: Fix a NULL vs IS_ERR() check
>
>The intel_soc_dts_iosf_init() function doesn't return NULL, it returns error
>pointers.
>
>Fixes: 4d0dd6c1576b ("Thermal/int340x/processor_thermal: Enable auxiliary
>DTS for Braswell")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>---
> .../thermal/intel/int340x_thermal/processor_thermal_device.c    | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c
>b/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c
>index 284cf2c5a8fd..8e0f665cf06f 100644
>--- a/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c
>+++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c
>@@ -423,7 +423,7 @@ static int  proc_thermal_pci_probe(struct pci_dev
>*pdev,
> 		proc_priv->soc_dts = intel_soc_dts_iosf_init(
> 					INTEL_SOC_DTS_INTERRUPT_MSI, 2,
>0);
>
>-		if (proc_priv->soc_dts && pdev->irq) {
>+		if (!IS_ERR(proc_priv->soc_dts) && pdev->irq) {

Thanks for finding this. Just curious to know the background of this bug. Is there any Bugzilla number ? 

> 			ret = pci_enable_msi(pdev);
> 			if (!ret) {
> 				ret = request_threaded_irq(pdev->irq, NULL,
>--
>2.17.1
