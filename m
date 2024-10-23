Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9919E1A08DF
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 23:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729726576; cv=none; b=tFEtFcTSR4cz2yme2UNXknuZiUmMXTPvv92JEL2Y29Xhwr6C/FvqGJ0DAILz8U+9VVB594/Gmgmrw50YGpOPP7HsNqvVJV6+3WdNvCC/y4QUCEy1RbReqxbHBsh6l3OL4aEyZi5ebr0qZCoR6Jkmmxry4Y16cd5caU1KhBxz3U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729726576; c=relaxed/simple;
	bh=KWHcT982DYDGFB/gQdzNCBlUMvMAGFMVeTv80N7sStc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dt2Nr1Da6oOdQny0F3CvKM1kW8IrUdvp2W7CDXxv5ZOQYvCcUiNZhzCkE8n6YoZzr1bMDashviopvl4dFIOITXg1i/tQbnFWRiweANtsF9W8NgGME5uPb/ASYOzW1AvCRAVWEL1WkzGxYqXtRsJ9IFRQfScTb7CjZ0wqW05gnhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=WapHcoDt; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="WapHcoDt"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-20c8c50fdd9so9322915ad.0
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 16:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729726573; x=1730331373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2O3NkkjIemIsAieDahgo6WCW7UZHnrJROVrMuNKxroU=;
        b=WapHcoDtRQB+CBC1NYmZjoVHWlX31y+ERb2nIk/xcDMZeVfSQSSdYzyEiUNuPffnWU
         Oqp/qx1ZPKUMDc/FGbpDHd4anR3Ytn8Dx67hRLtmJC4MXTPY5Z2xr91SNCMmtGf1zIR+
         Dq6Scct7Ws/ff1Sw8OQgqtE2+uc0HWIMShxmisRdFygHkIPX2u4xkDszn2NNTfTmQwBn
         ZFoLjoWHbSRHctxM/Fb2YexTUwC1PQsr8/pMSa0gEYwfSoTMlOUDiqhZsqPVGXPiQuFD
         Fr5DAQL3mRPkz0I574ZxcLX3roxU/W70q/P6YZZpYNcqzLUGsbbt7p+Mj0IOjjhEGu/5
         iOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729726573; x=1730331373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2O3NkkjIemIsAieDahgo6WCW7UZHnrJROVrMuNKxroU=;
        b=piLV3fcY0A6SP9I0JZwFMD3+fZAAa0MgBskpi2YZgg+dlSsGQhC6fBDovVJPA1Xclq
         AK3WqJOnUkXF6hATELJxyfIJWgUUZvZkCx+O9dTzVoTxMOXHCrIXmnN23/QzfvVKjRbX
         0aDWpi5D4eMPzhAwzf3B4gK9NHpFnmq+z8MRE0ZyXurD0rki2LmKnhm2/oIkJgIQfxyz
         QL5sKNIdIc88lMJflYobISq4zblzOFfNi9KdKOMCiwEZ7qChq90s3UR/lepSz3HiEQsD
         kxQtCX/UDi2aEXYLQnZzdDJR48lVBsvHpbxBoTfvawLRGgqDIBBRZfJIuUjRO7iko/sd
         k+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2JlSXOZTCRLl3kOOfHmPnQ8gNyLH6GoHEFiojFwQBFnO8sGFsfqbhScX/APtMrwikcgALY6bnbUdtGDANtzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEOfFajlB958A2HiVQaj20bHNFjpSOIczjUoyHHElF+GxMeKk1
	N6bfF/S+PvJJpoQkgK+g5YaFL1cxyLCdZ8CIks6zmEowBSAiw85e1FawBsof/HI=
X-Google-Smtp-Source: AGHT+IHwaFUU21df+imHVfe6pTP9I9aELH11EYkAeXYd/RsFrtAI3BUr3gcBnM47ZiLm1gigdv3+Ug==
X-Received: by 2002:a17:902:ce8d:b0:20c:ea22:3317 with SMTP id d9443c01a7336-20fb89ffc5bmr2049015ad.29.1729726572793;
        Wed, 23 Oct 2024 16:36:12 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.70])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7eee89bfsm62534695ad.29.2024.10.23.16.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 16:36:12 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: lucas.demarchi@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	michal.wajdeczko@intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 RESEND] [next] drm/xe/guc: Fix dereference before NULL check
Date: Wed, 23 Oct 2024 17:33:55 -0600
Message-ID: <20241023233356.5479-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pointer list->list is dereferenced before the NULL check.
Fix this by moving the NULL check outside the for loop, so that
the check is performed before the dereferencing.
The list->list pointer cannot be NULL so this has no effect on runtime.
It's just a correctness issue.

This issue was reported by Coverity Scan.
https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600335

Fixes: 0f1fdf559225 ("drm/xe/guc: Save manual engine capture into capture list")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
V3 -> V4: - Corrected the Fixes tag
          - Added Reviewed-by tag
V2 -> V3: - Changed Null to NULL in the changelog
          - Corrected typo in the changelong
          - Added more description to the changelong
	  - Fixed the link for Coverity Report
	  - Removed the space after the Fixes tag
V1 -> V2: - Combined the `!list->list` check in preexisting if statement
	  - Added Fixes tag 
	  - Added the link to the Coverity Scan report 

 drivers/gpu/drm/xe/xe_guc_capture.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 41262bda20ed..947c3a6d0e5a 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1531,7 +1531,7 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
 {
 	int i;
 
-	if (!list || list->num_regs == 0)
+	if (!list || !list->list || list->num_regs == 0)
 		return;
 
 	if (!regs)
@@ -1541,9 +1541,6 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
 		struct __guc_mmio_reg_descr desc = list->list[i];
 		u32 value;
 
-		if (!list->list)
-			return;
-
 		if (list->type == GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE) {
 			value = xe_hw_engine_mmio_read32(hwe, desc.reg);
 		} else {
-- 
2.43.0
