Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA83E248BB5;
	Wed, 15 Jan 2025 11:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736940960; cv=none; b=W2Znf9eGfJleVJAZEX+Ck5FVpjn7TwHbAJD4pORRV7wem7gd8uPKgXCRGoMo0j2edJHWcd0eoxD3K/CYCKZvLpZCI6GOBaOqMaa+XyGPBaH9ZqbLQFOb8o9sRe7hOuuPKUFtAOg3Cs6xkXERNcviZ6YaOSp37rwJe4PZZLUdkoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736940960; c=relaxed/simple;
	bh=bVJrvQSAQ2x5SfTiS+mXrxVNveoO7kyWDhsKX95PObM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M1e7qdS3I8I3Wy9IRk6uPlSPluwwA5vpz+g6VosteDVvxWILbQcTbyZtGPS5ipRE9QwFbBjx+uh/RzU2z+uyvnFVhruz3DxVYUa3z36WuCKwG9stApBpGr2RJsyGo2XJxs2s8W5lotPHezPuHuf4rrC//99i1zKhp6qFOsMHG5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/2w+05u; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/2w+05u"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so440159f8f.0;
        Wed, 15 Jan 2025 03:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736940957; x=1737545757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zRvh6fMAdyPOi5lt24tLnCWVAigh759btngcaiFvNUw=;
        b=a/2w+05u2jBG8q73hNfRyqHmCIGeW3TIZ0VIb17bqVCd2tUo26rB8zwSL/P7MipNrM
         eyFms8vZjppYwpnB5bpC0oEkITZQ4C12RkJ0486cynyx3ZHuYsPhQSj46P5xI2EBVqnO
         0k+4dDDuOzahaHtX6CDFouWCa02gYvzJjlEqecNDcDkRege/ByWizPLEw6VE7KitJLlH
         JOXgWf0b+abv5s1qev8c3L7nJMpnna/xG+C8UKleOiMeq/a3d89gv/CoHLOsG4HhAFiF
         UWYHXqMVPLp7vniM6H1ofPBd3EjAbuaQksRlfQ8eAblwgbHyMe3RLhYFoRXwJ7UXcJQn
         bOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940957; x=1737545757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRvh6fMAdyPOi5lt24tLnCWVAigh759btngcaiFvNUw=;
        b=M/lJAhnFnIXleoNgjwed4VCHBn1nORXviHkBXfHxKgVR+1qw2R6U+M8iiIWCWBSanI
         lbbHlFZYXCAl18RFU/Q/rE6dpsQO4ypCEaj47u4iewhplT5FBEPSBcRJm60yQhCAXhjw
         pqaC7geYbSQLQ7K5Hfzb9VWPJ2RuKZyjgE57AA4zhgsqu8LOD6+6N/qtwy097TBuUF42
         9W25KDjtn8WkRwt0gyxVyFyDySZi86n+Zq8o7PyKIjaJhWFTldPDBlNvc0kRLFsIRcLh
         OhO7ECO5bIUr/URFTssIMeIHKazgPg6RuLCHiUU/uYK/nRcFkqHr3QO/g2JoETqYYT2l
         uCfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2hqZsaemrl3b+5R3CNw913RfiXTDcgsFSiku7F7cl3/nBit63YEijTfTTzdn5Uh2+n4ANmpe+3X8ONsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkEJEgZW+0lh9ocE1o1g/yMHpytlGnr0t3hdVDunyql3FsICL3
	MCx8Enme6aZfVkhUVCrTgwHS07NYreEtVaxjne7/ahGLE7XqFPUw
X-Gm-Gg: ASbGncu4lTfFd6X48w6eoKOwodfQo6i05+0kWz8fQKChj/W2yMtXTlHcxfgYNi3d8T/
	k0n+iUB8WyThtOsvg8myBTiHd2vVcwXURhNwgchZ3Ng/OEhG5SmPZcxJ/TUGGYzcYhtgC4rNjZt
	qdp2t0y1va/3ubknKyC3MHSTjKTRNwhD4p/iA7VGWpQpws/YDR9pzff1meA7ntxEobuL0huawRM
	hg2JNYRf/LcLb6xf8evhRm/7Y+EVOZmW95znFHM+watYHH0K5mS4kv+IQ==
X-Google-Smtp-Source: AGHT+IFYFB9Ou4f27iNI8oZssCfOJqnX6hcFH/loMJvx+kQqlMotWMHRayuUpQMW8k1E+3lZnGIW2g==
X-Received: by 2002:a5d:5f91:0:b0:386:3afc:14a7 with SMTP id ffacd0b85a97d-38a8b0c7177mr20606160f8f.7.1736940956666;
        Wed, 15 Jan 2025 03:35:56 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74e6511sm20188625e9.38.2025.01.15.03.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:35:56 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Chaitanya Dhere <chaitanya.dhere@amd.com>,
	Jun Lei <jun.lei@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: remove extraneous ; after statements
Date: Wed, 15 Jan 2025 11:35:52 +0000
Message-ID: <20250115113552.297307-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are a couple of statements with two following semicolons, replace
these with just one semicolon.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index c4dbf27abaf8..1a0a08823ed9 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -3894,8 +3894,8 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 			p->SwathHeightC[k] = MaximumSwathHeightC[k] / 2;
 			RoundedUpSwathSizeBytesY[k] = p->full_swath_bytes_l[k] / 2;
 			RoundedUpSwathSizeBytesC[k] = p->full_swath_bytes_c[k] / 2;
-			p->request_size_bytes_luma[k] = ((p->BytePerPixY[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;;
-			p->request_size_bytes_chroma[k] = ((p->BytePerPixC[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;;
+			p->request_size_bytes_luma[k] = ((p->BytePerPixY[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;
+			p->request_size_bytes_chroma[k] = ((p->BytePerPixC[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;
 		}
 
 		if (p->SwathHeightC[k] == 0)
-- 
2.47.1

