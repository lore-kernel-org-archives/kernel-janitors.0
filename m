From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 15:10:28 +0000
Subject: [PATCH 8/8] drm/amd/powerplay: Delete an unnecessary variable initialisation in phm_dispatch_table()
Message-Id: <c322089f-f42d-e34c-2863-87084ab1f2ef@users.sourceforge.net>
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

From 0bf6f3c40786e12d3d42672f1d56296b30e17ac9 Mon Sep 17 00:00:00 2001
From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 15:50:18 +0200
Subject: [PATCH 8/8] drm/amd/powerplay: Delete an unnecessary variable
 initialisation in phm_dispatch_table()

The variable "result" will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c b/drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c
index 735aeb0..fdfed63 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c
@@ -59,7 +59,7 @@ int phm_dispatch_table(struct pp_hwmgr *hwmgr,
 		       struct phm_runtime_table_header *rt_table,
 		       void *input, void *output)
 {
-	int result = 0;
+	int result;
 	void *temp_storage;
 
 	if (hwmgr = NULL || rt_table = NULL) {
-- 
2.9.1

