Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA1D45C710
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Aug 2026 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786728857; cv=none; b=bgnpSQZYLb9X4xIv1z13pOEsBFrihSYT8rEHLRuBrIWiDLu04MXMWhx9FecxfVJ0G3uRUQjIO4LpPy+wSssqVpfXSnMyeKX7DdQbmOi+KtHEX3gHjz8ehGLG9Iqne5Vp9sqp8AeAnNmlcZ2+HWOcB4Y5A3e+m5TQs6ueEnKh5k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786728857; c=relaxed/simple;
	bh=3p/dOAvmV42CXk/hU10aLdCeLehAowos+B/Z93geYso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ig/LWFyPPKibO7E8K/2U+Is6p0+qNDxd4ZcH14WAk9C8xFkhp5U/CaHXW59QnkJS3PK+DhRjWnCDBExPTZPWX4qIWWjzQQ5oLYJkZBXDW3rqu8OIHyxbjhawUvHmCfRHBssX29bi5vK/1h0TpCyzKFdAth/tMi+jyLBkIKcWMkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxnj6SJo; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxnj6SJo"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fd66a094eso517581f8f.3
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Aug 2026 10:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786728854; x=1787333654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gtJy9LLDFt0NmzJILJgVKeBO+MrtI49rw/kXkyURaBQ=;
        b=dxnj6SJoyqjKrgeOmHh7wI8/PxvaodpEjyrbRxf2NeOVPtaHNZbLgjbTn0iR8WGVmy
         QoWSfxCuoVrf0LEogV7EUVoxJh7sR2YzgflKFfQIPveDjanpA6YnV9EGqDRvL5W7TS6D
         cSR1oWh79jdXdWmT2jvWxs+lKYs+IlZF8wJuHUOUdwDIuCzrpgiuqRYahPZ6285ueoBN
         YL8Qz7xrD17gJuB0LYh+IU9SDTHaoUG/rP3nSXRKD+CJyFJ3+BP7wIGuZz6EG+QLrJVj
         dlgGFFhRHXGi5SXVza+u4Et3MT80LuThiQaqCFLzI9D+hSSdU8WsR0CTsVWqOkecH33Z
         SA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786728854; x=1787333654;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gtJy9LLDFt0NmzJILJgVKeBO+MrtI49rw/kXkyURaBQ=;
        b=O5bnb7C7k7cttMjBxlCLJ1toUWEr6wkoO8Au3ViYRYtfBBl/VBffsGkfTsVdp/TUlx
         mdoWdJHBBzyY2tT4JwpHuWqFvKELd87i0dhTeW3J3fHOgemp9DhS/EN6Zv4Ag25dUSXL
         eh7Hp2uYg4b8iv1wq4IJJx5c+tybiw/MO73w0d8yTCqDwu1ZfISAH50dTA6sjL7SpkA4
         q5wX4mzTSs/f6WmXL2uM2c0iexm3DYTEag/KDfrER5dbYHTQrsY4stsQ/eEO0JMdf4R9
         Bc9bHJlJnJVHHfTAf4DmtneigNl5SklN9cQoEQgbvsyqyeRkovi1HLo6edd5kF6HMIXn
         7u+g==
X-Gm-Message-State: AOJu0YzKZzELLIQj2igPokgac/xu6Llr5z3/IXCSeDJ2Ol5wUz0/WmOH
	+wIMndhOLZ/EDLhhXrl3inZb6y11l5P/3Fp81mUf20ocWUqgUdE+TV1d
X-Gm-Gg: AR+sD12rW4Y4mC95lwtgLGbOvXcja4lRj4tPjmDMz0W9sN+KU+Zfk9fMTEvfEWiXDic
	KciHcs4sQu4zf0bIdSDlUMo+horoIrBsj4GYCiaQM7+nvVNxmkCQJ4aGQEdeb1mNjFEyLkpi0Ow
	E6xDc3vKZteFRbGEn82c/maKC9wY37dMgxPhocWE7N3BBv/gli14anu5QcUnabToe9DKoIfx97K
	pIj9AWF0J4k8y6a8gdpkW2zsqXjFq3tH+b8fy3BXBN9j1sueUvcisVcjbt9WRG/heoMCQ+rC7G+
	vgJrgpYSexviO148F+fS8+0QutOamxBkVhIhVEQnRfZQ5EDF/auoW9PIayiqh+4mrh9CwHndQCG
	sgc/ErQbCE93lntmAbgMqQvcpjjPqkwbCPVRU3ndCC+OuJJAy27Fq0ajbSjrVnfQMAV5Vgv37Hu
	vybGTtx1vt+gII9lr10bt6n1vwWj4nW2/51MWY3XdWfW5ml8B2Z641zwGpxNFy
X-Received: by 2002:a05:6000:1212:b0:47d:fc23:abe8 with SMTP id ffacd0b85a97d-4816079b5camr8667132f8f.28.1786728854523;
        Fri, 14 Aug 2026 10:34:14 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f219d3dsm10046899f8f.14.2026.08.14.10.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 10:34:14 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Austin Zheng <austin.zheng@amd.com>,
	Jun Lei <jun.lei@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Roman Li <Roman.Li@amd.com>,
	Ivan Lipski <ivan.lipski@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next][V2] drm/amd/display: Fix spelling mistakes "optmization and "resul"
Date: Fri, 14 Aug 2026 18:32:19 +0100
Message-ID: <20260814173219.1102435-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are spelling mistakes in a DML_ASSERT_MSG message. Fix them

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

---
V2: Fix resul too, Kudos to Rolf Reintjes for spotting that
---
 .../drm/amd/display/dc/dml2_0/dml21/src/dml2_top/dml2_top_utm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_top/dml2_top_utm.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_top/dml2_top_utm.c
index ab9cadaf5a60..79ec5838c26f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_top/dml2_top_utm.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_top/dml2_top_utm.c
@@ -123,7 +123,7 @@ static enum dml2_status dml2_top_perform_stage_optimization(struct dml2_instance
 	DML_ASSERT_MSG(worksheet->validation_result.is_mode_support_valid
 			&& worksheet->validation_result.is_mcache_allocation_valid
 			&& worksheet->validation_result.is_prefetch_valid,
-			"worksheet must be valid on exit independent from optmization resul!\n");
+			"worksheet must be valid on exit independent from optimization result!\n");
 //	DML_ASSERT_MSG(iteration <= MAX_OPTIMIZATION_ITERATIONS,
 //			"exceeds max optimization iterations!\n"
 //			"\t is_permissible_found = %s\n"
-- 
2.55.0

