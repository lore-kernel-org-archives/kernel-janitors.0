From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 14:54:33 +0000
Subject: [PATCH 4/8] drm/amdgpu: Delete a variable in amdgpu_cgs_acpi_eval_object()
Message-Id: <165123f9-e2ba-04c1-e91e-557c2d81ed21@users.sourceforge.net>
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
 <5317A59D.4@users.sourceforge.net> <558FB427.80103@users.sourceforge.net>
 <d46343aa-7641-2e77-a4dc-634c527c182b@users.sourceforge.net>
In-Reply-To: <d46343aa-7641-2e77-a4dc-634c527c182b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 14:00:28 +0200

The local variable "func_no" was assigned a value at two places.
But it was not read within this function. Thus delete it.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
index 705bfa2..f5de510 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
@@ -909,7 +909,6 @@ static int amdgpu_cgs_acpi_eval_object(struct cgs_device *cgs_device,
 	uint32_t i, count;
 	acpi_status status;
 	int result = 0;
-	uint32_t func_no = 0xFFFFFFFF;
 
 	handle = ACPI_HANDLE(&adev->pdev->dev);
 	if (!handle)
@@ -926,7 +925,6 @@ static int amdgpu_cgs_acpi_eval_object(struct cgs_device *cgs_device,
 		if (info->pinput_argument = NULL)
 			return -EINVAL;
 		argument = info->pinput_argument;
-		func_no = argument->value;
 		for (i = 0; i < info->input_count; i++) {
 			if (((argument->type = ACPI_TYPE_STRING) ||
 			     (argument->type = ACPI_TYPE_BUFFER)) &&
-- 
2.9.1

