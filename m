Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE69418990C
	for <kernel-janitors@vger.kernel.org>; Wed,  9 Oct 2024 21:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728510043; cv=none; b=qP6KOp5NAFIW5+zL6swbIeEsriUAAerkC91zAeWNHjNx9n7KP58Set+Lz36PfLQyjeq/1dxoq8coOPSGmC/CSYzUdb67+TCF1i1lUHoGVrnkbeDXgpKSGjGT8sk+hxbfe5e4xPKH2JnzLXsbXAiNRarzVCvUb2slmJTyvJ/C/i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728510043; c=relaxed/simple;
	bh=xmvB2RyLMa1YACntjup38BYSkXAwWiROYL+k31jpxMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IW1o8BnoNY6MSFXfbXvsRRPvvplAPJdzyvi3ge7YO6Wtd+oVgtlz4rpSpNsW6plEbVT29K8Cqp5wOYhJjA3oprhbmUi93jJFZu8oNxXaE42hIE3ZA8wrR7/XC6MhbnzkL7VT3aCr0BuSE0xaRSNsqzik5UHegbZMCxVYH0lndbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=fail (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b=CYeG1kgd reason="signature verification failed"; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="CYeG1kgd"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-71df67c67fcso210589b3a.2
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2024 14:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc.com.np; s=everest; t=1728510040; x=1729114840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/X1R7jziJAUOGlYud471jpMxA58653P4VmVwYBUwEFw=;
        b=CYeG1kgdf8GRNQR8kYmQfa5/uue5Xr0JKv+hRstFMEX8uBUNLIPwRreRKr+CCoKmo+
         s8D7SJ83zOVn5cBss7/CdCdDhX1GAvbPolhEHEx+pTmZVaOKJJkrz+T3co7ATx+NOlGh
         dEqi9s+DdB40rS5J2VORmBXcgORSvoPr1Bokp6MYBJDY4KdZfUN7VoEAFQwFIIkZYOfP
         ABLu8oqvvFKoEqVG+AJuoPlONiQ4pJGBHVpFpuNfuvJJtfCsrWjFN5BWsrQewNTdzT34
         ssDO76ZASnoHgLur1b4KEWz9lyiouuZrKN7bJSFNPx/UnLyFU46rrNd6xq9wp9zCm+4I
         l66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510040; x=1729114840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/X1R7jziJAUOGlYud471jpMxA58653P4VmVwYBUwEFw=;
        b=e+0SLuix+RribvpxCTN0rNhOES3RZWscxxFTqCiNimnx/Onv8bgbH+iYf+VsQqjggd
         lKbg32DyUsdw9VulObsTpN387yv2F3NU1UjyzI6olAhrwl9E44DPDI1vzpXpEcZ6OT/3
         3yiOWA00TXXZ28C1rcBEhoRUQacI/XAUNtNik2hCY0nI2IxZPtgKDTCfpYdxAgVtvr8t
         gfCUHzhX2RF3ZaCUG46sRnO1HQ3ng+HScalFBWtf5jIyVbW70zr6VBwGSKP/bL0QdnzA
         +HmyiAMiyPOT5YFEGXeADlPvT1mUp5iLyQpWuFmXJvKd0/+fDddcLKlw8+M9ulJoJ6MC
         MIsA==
X-Forwarded-Encrypted: i=1; AJvYcCVCBN8EnfSWUW7Gwy1dq4MHKAwS2k9nkrsdmiQgqodWO9BUVNdQx36g1PmXa+S/Sog0iRhdU7dl3zfasnr7tcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwowYgjrEx66L0zuJBlPnGmkp5yJ6kdluIkPOcd6UK9l81k8EdU
	EL54cjdCkxLL5BGxZHjN9yu7KlqAhICFfPi4E/A/oJZQiRFfSW45Sk6fpAeYmBQ=
X-Google-Smtp-Source: AGHT+IEVjxb8q3sxQHY7BRbeLePk3SvJC2jHMCY+loRxISySa+TSK3hZmXPkiAMN30Y1g+VBgiK0xw==
X-Received: by 2002:a05:6a00:2394:b0:71e:1b6d:5a94 with SMTP id d2e1a72fcca58-71e1db64896mr6487949b3a.5.1728510040550;
        Wed, 09 Oct 2024 14:40:40 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.158])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71e03288a37sm5717000b3a.155.2024.10.09.14.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:40:40 -0700 (PDT)
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
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] drm/xe/guc: Fix dereference before Null check
Date: Wed,  9 Oct 2024 15:39:20 -0600
Message-ID: <20241009213922.37962-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pointer list->list is derefrenced before the Null check.
Fix this by moving the Null check outside the for loop, so that
the check is performed before the derefrencing.

This issue was reported by Coverity Scan.
https://scan7.scan.coverity.com/#/project-view/51525/11354
?selectedIssue=1600335

Fixes: a18c696fa5cb ("drm/xe/guc: Fix dereference before Null check")

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
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

