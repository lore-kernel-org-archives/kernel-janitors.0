Received: from smtp.smtpout.orange.fr (smtp-76.smtpout.orange.fr [80.12.242.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2296036212F;
	Sun,  9 Aug 2026 16:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786292270; cv=none; b=hu9T3fWVELdAeCuAmdzRa4M+yd4RYyY0PL1Uykt84YC0H6t4ulMM7apcjaibTw4bzybDjyYZBIXuw8DsZHfnRspfOTHL/VfXP3YYPN4rLqZoCDOHIAQ+3griELz30IChsa7DB6/a3fruZ3CaAd/nUf/OiAwsTLx778I++O36I7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786292270; c=relaxed/simple;
	bh=4jdiqYcfaQKylGaIPWAasWMl2olZWnlpBAx0uZWrAdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HeAuxPET9j2eKKIOWhgamxD42jNWk3S5AC6bCSGrsxdkhrJiEnhGJ2upuH+/m6U+3KCeXqTr7kTK54nV+znqWGqQV8n6py3LAMmX7lNnpJK6mqrGEEdyBNtqfUalOB3JTjgVXiScnkMXYxXaqBe8U74bFvZAu+OvTwHDiraoa/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=o1TPQ6a8; arc=none smtp.client-ip=80.12.242.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="o1TPQ6a8"
Received: from device-101.home ([IPv6:2a01:cb10:785:b00:6128:9b8c:c203:905])
	by smtp.orange.fr with ESMTPSA
	id t6DYwVSUk9pEKt6DYwIjtx; Sun, 09 Aug 2026 18:17:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1786292265;
	bh=KN9TULj4LFJAhcy9BTobkr11FxLmc4WeUlnGkANIOrU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=o1TPQ6a8vtshQgv8uSVnf0y0f3dvDr9XIszATtE9G4EGSDqtnz8U0eCJHD0SgVV4w
	 B64HUDVeoGRmW2Zz6KKNWAzBH5xvU0bSUH0jiNEcx+iAJRywjXSyXsSXWn6CIaGp7Y
	 gGTi1fhhEs59qD9Lq+ismRlu3CzjMTnGH99t70XCOHYZMPVBSasHamvD6xL4dxYLpK
	 zFVMbvwG90kc7PIMx3VywfDrvucy6LgTV8nh0itoF1ebMgWSpnzbirH/gr8CWVoYus
	 X0JlaiGS5loiy6sPrlxRJww8olVTdzXJIBYtx+xo8MeVJ6JdxXphWiPuW7L277zrr4
	 vf/X/k0BzBQpA==
X-ME-Helo: device-101.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 09 Aug 2026 18:17:45 +0200
X-ME-IP: 2a01:cb10:785:b00:6128:9b8c:c203:905
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/amdxdna: Constify struct xrs_action_ops
Date: Sun,  9 Aug 2026 18:17:39 +0200
Message-ID: <77aa53d77dbd4dccf8b2dc9de3641f22ca46055b.1786291298.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct xrs_action_ops' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  55888	  17696	      0	  73584	  11f70	drivers/accel/amdxdna/aie2_pci.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  55952	  17632	      0	  73584	  11f70	drivers/accel/amdxdna/aie2_pci.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/accel/amdxdna/aie2_pci.c    | 2 +-
 drivers/accel/amdxdna/aie2_solver.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index daec1f6b4907..71045c72df60 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -285,7 +285,7 @@ static int aie2_xrs_set_dft_dpm_level(struct drm_device *ddev, u32 dpm_level)
 	return aie2_pm_set_dpm(ndev, dpm_level);
 }
 
-static struct xrs_action_ops aie2_xrs_actions = {
+static const struct xrs_action_ops aie2_xrs_actions = {
 	.load = aie2_xrs_load,
 	.unload = aie2_xrs_unload,
 	.set_dft_dpm_level = aie2_xrs_set_dft_dpm_level,
diff --git a/drivers/accel/amdxdna/aie2_solver.h b/drivers/accel/amdxdna/aie2_solver.h
index a2e3c52229e9..0b1ca7a4b800 100644
--- a/drivers/accel/amdxdna/aie2_solver.h
+++ b/drivers/accel/amdxdna/aie2_solver.h
@@ -111,7 +111,7 @@ struct init_config {
 	u32			latency_adj;    /* latency adjustment in ms */
 	struct clk_list_info	clk_list;       /* List of frequencies available in system */
 	struct drm_device	*ddev;
-	struct xrs_action_ops	*actions;
+	const struct xrs_action_ops	*actions;
 };
 
 /*
-- 
2.55.0

