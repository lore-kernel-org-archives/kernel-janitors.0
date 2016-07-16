From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 14:48:11 +0000
Subject: [PATCH 2/8] drm/amdgpu/powerplay: Delete unnecessary checks before the function call "kfree"
Message-Id: <a7112f50-5758-aec1-fa39-10d2246096ba@users.sourceforge.net>
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
Date: Sat, 16 Jul 2016 12:38:12 +0200

The kfree() function tests whether its argument is NULL and then
returns immediately. Thus the test around the calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c              | 3 +--
 drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c | 5 +----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
index cf6f49f..6f11bc1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
@@ -1053,8 +1053,7 @@ static int amdgpu_cgs_acpi_eval_object(struct cgs_device *cgs_device,
 	}
 
 error:
-	if (obj != NULL)
-		kfree(obj);
+	kfree(obj);
 	kfree((void *)input.pointer);
 	return result;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c b/drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c
index 7a705ce..024e22e 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c
@@ -76,10 +76,7 @@ int phm_dispatch_table(struct pp_hwmgr *hwmgr,
 	}
 
 	result = phm_run_table(hwmgr, rt_table, input, output, temp_storage);
-
-	if (NULL != temp_storage)
-		kfree(temp_storage);
-
+	kfree(temp_storage);
 	return result;
 }
 
-- 
2.9.1

