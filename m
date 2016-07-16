From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 15:08:03 +0000
Subject: [PATCH 7/8] drm/amd/powerplay: Change assignment for a buffer variable in phm_dispatch_table()
Message-Id: <477a5e29-19aa-6eea-fd33-c5e5cb790966@users.sourceforge.net>
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
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 15:36:36 +0200

The variable "temp_storage" was eventually reassigned with a pointer.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c b/drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c
index 024e22e..735aeb0 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/functiontables.c
@@ -60,7 +60,7 @@ int phm_dispatch_table(struct pp_hwmgr *hwmgr,
 		       void *input, void *output)
 {
 	int result = 0;
-	void *temp_storage = NULL;
+	void *temp_storage;
 
 	if (hwmgr = NULL || rt_table = NULL) {
 		printk(KERN_ERR "[ powerplay ] Invalid Parameter!\n");
@@ -73,7 +73,8 @@ int phm_dispatch_table(struct pp_hwmgr *hwmgr,
 			printk(KERN_ERR "[ powerplay ] Could not allocate table temporary storage\n");
 			return -ENOMEM;
 		}
-	}
+	} else
+		temp_storage = NULL;
 
 	result = phm_run_table(hwmgr, rt_table, input, output, temp_storage);
 	kfree(temp_storage);
-- 
2.9.1

