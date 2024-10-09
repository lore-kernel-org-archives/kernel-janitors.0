Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2114A13AD11
	for <kernel-janitors@vger.kernel.org>; Wed,  9 Oct 2024 18:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728499873; cv=none; b=lEDcsPGaXVpizfNMDHzzinQhEEEPJwvlOIquNkPwpY9E/R3lvJK9a0Ls1qsQExaF0E/BaRO/kgGpCCCbq9sQobAHo0r0KC2vQ78ZNshQhrTA3RxYGw32Zy/3i3hncdv1QgYUVng2qJuLY6vuwiU7N2aJndZywBhDCZUqraXK16E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728499873; c=relaxed/simple;
	bh=H0NK511ZSy+oxYmuR4npC5W03062kkZv/buSQXuBOTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZwnKLslvGvRxg2Ukhi98XsDnloLYMCFVZkbdyp4l1tOeFW0ZXxRFr5HsdZtsSU5VU4JyplAP7Ai4UQGdvYpaijgwGE8ocLuaz+U0EfgZcr/HQr18QQKA4l7DZppiYXeLd1U4JwGJudcymZho5Oz47mBIoNcj8ggpU2joL/J1qwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np; spf=none smtp.mailfrom=everestkc.com.np; dkim=fail (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b=G6/QPwBv reason="signature verification failed"; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="G6/QPwBv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20b93887decso542575ad.3
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2024 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc.com.np; s=everest; t=1728499871; x=1729104671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+0QE2yWoVqIEzNKM/3F/Lnwv5evjqB7rUXVgq/OQiuw=;
        b=G6/QPwBvr9Grz8TUrh41+nKa2yoDH+Iz4y1lQ6IX/MdjYbf1sn+cepgnYrfOfh+yWB
         wtU8inxP1x64BbEKomEOuOWErSYEzniki1VFX3RgigGK8OSYGhjOXns2Rg1toorYV8E/
         Uz0kz/Puk0UY9XJptL6nHDqwIN68sAUcldZhy8m23aVo7+pUutArzjAGdBSGGC+4sxdf
         vAgFHNoFNqOVbyG/Bjvb//MbcUXg/D90998ZVHXdUYxIQ5URks/69CKT9redu82kyaod
         WNY4h3mq4RHmBufgR8lTREDbm9k2JPxvZfCWocSKE8TVxUk6msLkdj5dpammtErMtL7n
         5TcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728499871; x=1729104671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0QE2yWoVqIEzNKM/3F/Lnwv5evjqB7rUXVgq/OQiuw=;
        b=Ysod9ykmq/OT0Vy8SjK3hzvxBsBLpRbTaJyq1CypE5Jsr6/lbEcHPFFKEiH+q46Sb4
         YrxXE0XToXiGdsLY1HJ2GNVaUaiKHHRYb1PB4UnN3mQtJ6Dz7F5uSZz4e6op2Qiqq1SL
         E5yuBImVo84rIA0noZeoAWsel0ySnLwIeSgUGioHHv9VF0dk2VSOp4B9yvHIrwKa851H
         Z/kb+0orpxVfoRd6VVZgvPBpOV7H/aDHtZYnMJTGuGtHexzB154e+1PapROKrLyVvPb2
         VJKm4qKcRFdvDw4nM6a08aqXYYEMQxbMcXW52nztV0nP8DOngb8gSUIfaHcrJf6mXwVE
         /lHw==
X-Forwarded-Encrypted: i=1; AJvYcCVgKRgsqx/lLFVIocdFlE2JE29Bf0bLm9+GJ3Ro+E/tOCrHZuWhNfA6iMTHQTC4UJreeGa0T0+GOeO9V/jOPsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YypJVnkEBdCiJRUrrpMs5zC8hmpAo2Rg+ndzZOICdiojwdKmg4K
	ILfpqzkfWU1G4FDW/4ZJrbuOMBqqd/kea5moHyXw3jc1PDmgQs3CxGlc6Mp7C6I=
X-Google-Smtp-Source: AGHT+IHpQGViTVc+tm/tkjno8glkT35adg2V8Ycv4zbgyv863j7Td5NNgYxT1CIZMuESuswQ3Zwc8g==
X-Received: by 2002:a17:902:dacc:b0:20b:7ece:322c with SMTP id d9443c01a7336-20c63742f31mr54388955ad.29.1728499871390;
        Wed, 09 Oct 2024 11:51:11 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.158])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20c54056b07sm29864905ad.64.2024.10.09.11.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 11:51:10 -0700 (PDT)
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
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/xe/guc: Fix dereference before Null check
Date: Wed,  9 Oct 2024 12:49:49 -0600
Message-ID: <20241009184951.4991-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pointer list->list was derefrenced before the Null check
resulting in possibility of Null pointer derefrencing.
This patch moves the Null check outside the for loop, so that
the check is performed before the derefrencing.

This issue was reported by Coverity Scan.

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 41262bda20ed..de63c622747d 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1537,13 +1537,13 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
 	if (!regs)
 		return;
 
+	if (!list->list)
+		return;
+
 	for (i = 0; i < list->num_regs; i++) {
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

