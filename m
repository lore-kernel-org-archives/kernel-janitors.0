Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117118BBB0
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 06:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728542870; cv=none; b=GM8DaUo1QtLBlKi6BCSuj1PDkod9gfhywgf2hbP3FKJPwhg3PDkhe4ECjxj5Rh98WprvF6d0ghWcg9slsMXCu1vWaw9bjLH05CfBg35Naic3K8rbz5E/NA1NvCowfeFBspJ2RY6h7LtRKe2c0VP+jYxWX2WX3ZMZcoemmD8WuyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728542870; c=relaxed/simple;
	bh=tHKOmblPX8wWLhgLOo8CPqJ8M9jXDYJnSLJvl7GpjB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OuhXXdpbj88f7jZIsbA9wLueWzZcr1MyH2+MwQ49nPIF0q9CPoVw7MJeexYlhW9gzPhQSLP7SCgSvdNjWWmVA/cx2UJ8kO7kOh5mDqT/KYTGa+O11i38r624mFPvEgNkrz0pAiF3votH9f1APvb/+kfY0gi4hrj3XdIUYwZa9OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=KX+mdnG/; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="KX+mdnG/"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-7ea12e0dc7aso335011a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2024 23:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1728542868; x=1729147668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=33F/qO1jWhb/z9QZCc7vqOINV1AdFFbOfnQtd2l6oAE=;
        b=KX+mdnG/8CIwLKgktALcD0tDiWXvnXzAKc07336uK5oSDFhHaKIJrTuyR5AP/ZaM8X
         9bUB7C4JBAFdaqTlQj523C0cDOf/9HV/p6zgAdktzQi0WpzRd8GCde5rWOIOBAc9EcwL
         zCx9p2hgLXdNic3yHe1ads1+r7oHfrPmSSXXus+rp8u8gtNG3fPX/qrRcE835R4b45do
         t52ek7LJL/b6DKDv0ngWzzROZq4svWo4owazQnVitlAgmWQzMcT14nnI4QOHKFqwX2Ur
         DdYcGWgJ1cR7rv97mrayxT3cSmD1n0qpwp1eqWj+CxBSpRtnO99wL64/bxH7mA8YOyVR
         TvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728542868; x=1729147668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33F/qO1jWhb/z9QZCc7vqOINV1AdFFbOfnQtd2l6oAE=;
        b=A7owDk/ybTPprYbVI4a6wTCMBq/Zrq95AY9TEPUFAU1ZHLL8r7B5IZeaTNzAUKFHOv
         4MLEiTKp7oYOTIPMI0DTZ6zRViNXcceUkfz7Ws0kHXG9GfNnZcS38TUVTPqgKmI7g/C1
         oFQuN6uQbllgdX24SmZSzEU+/C/17kX/Sa8d1eiFfNicj/WdrgBV64AZCBTxObV3V1lQ
         llvvYO/fuyvIFfVyh+PmFEpwXLJuEbxJNajSMsNfL6HLHlTIvStTC9DS4S30CqDSxdEW
         TnGK5S9ygnow5GPwS5S6hCJhSatWPvbfE+EUlMAFg1caSx78Jox11ZJ7cEKZeXG/1bt8
         WwIw==
X-Forwarded-Encrypted: i=1; AJvYcCWYlItbXHomHh6Cz6AxBeobeDtW6WT5pYWyOsL/9o0A34PSr7iFw2F7v0fTX4EzSetlJKORuU/8jsEDz1l9rs0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3LjCntpEPeG2lOVpNY+ob5b2LEZ1cmSprrI5hUjrLDKLc13wh
	RO3mD4I8c+Zr6o2D2wi27TKZHUHPES821/K1TEvlVg5rVrEZcP6lDVVyY9/senM=
X-Google-Smtp-Source: AGHT+IEgUc4JwOQEFIr4+Uu9TrvsM9ik9NQZ6rVUYqg5KibEvwonxSBx64smuK3WsnJ9Ka0B0r8fYA==
X-Received: by 2002:a05:6a21:1583:b0:1d7:11af:6a with SMTP id adf61e73a8af0-1d8a3c4be3amr7324895637.37.1728542868540;
        Wed, 09 Oct 2024 23:47:48 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.28])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71e2aa93dd2sm424402b3a.119.2024.10.09.23.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 23:47:48 -0700 (PDT)
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
Subject: [PATCH V3] drm/xe/guc: Fix dereference before NULL check
Date: Thu, 10 Oct 2024 00:46:34 -0600
Message-ID: <20241010064636.3970-1-everestkc@everestkc.com.np>
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

Fixes: a18c696fa5cb ("drm/xe/guc: Fix dereference before Null check")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
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

