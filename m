Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0987E8
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 02:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 27F2DA4;
	Tue, 31 Oct 2023 19:58:35 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id A887A605164A1;
	Wed,  1 Nov 2023 10:58:04 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: Su Hui <suhui@nfschina.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/radeon/ni_dpm: add an error code check in ni_dpm_init
Date: Wed,  1 Nov 2023 10:57:53 +0800
Message-Id: <20231101025752.988228-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ni_patch_single_dependency_table_based_on_leakage() return zero or
negative error code. But ni_patch_dependency_tables_based_on_leakage()
doesn't check the return value of the first function call. It's same for
ni_dpm_init(). It's better to add this error code check.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/radeon/ni_dpm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/ni_dpm.c b/drivers/gpu/drm/radeon/ni_dpm.c
index 3e1c1a392fb7..f521dc929a06 100644
--- a/drivers/gpu/drm/radeon/ni_dpm.c
+++ b/drivers/gpu/drm/radeon/ni_dpm.c
@@ -1010,6 +1010,8 @@ static int ni_patch_dependency_tables_based_on_leakage(struct radeon_device *rde
 
 	ret = ni_patch_single_dependency_table_based_on_leakage(rdev,
 								&rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk);
+	if (ret)
+		return ret;
 
 	ret = ni_patch_single_dependency_table_based_on_leakage(rdev,
 								&rdev->pm.dpm.dyn_state.vddc_dependency_on_mclk);
@@ -4098,7 +4100,12 @@ int ni_dpm_init(struct radeon_device *rdev)
 	rdev->pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries[3].clk = 72000;
 	rdev->pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries[3].v = 900;
 
-	ni_patch_dependency_tables_based_on_leakage(rdev);
+	ret = ni_patch_dependency_tables_based_on_leakage(rdev);
+	if (ret) {
+		kfree(rdev->pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries);
+		r600_free_extended_power_table(rdev);
+		return ret;
+	}
 
 	if (rdev->pm.dpm.voltage_response_time == 0)
 		rdev->pm.dpm.voltage_response_time = R600_VOLTAGERESPONSETIME_DFLT;
-- 
2.30.2

