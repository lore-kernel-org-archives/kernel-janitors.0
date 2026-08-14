Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B66E486B85
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Aug 2026 17:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786727733; cv=none; b=TSiQ4cOjF+VVmhkRRE+dJ69+lHyxmRfiKHhbloBLSulMGHMjsdRhh0zJn2gvdkYsoEYz6jmt7lFmdmHatW64vWVxoKDXeIR8Q9/IZYflRdWmuGVYqnpKPRnfr3kx07AxRLh2X/cmR6I7viCo4orhAz8QzaMQ9VJ/sIxvxQ0nJ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786727733; c=relaxed/simple;
	bh=1COxl66wdr83WboAEBowZwmYAitvQ9no7Nf2i+8ZlcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uosDUwrHSysNpZ9i/Qx6OxxIPKRP8diubViNl0Upu5wOp/3mzYS+RXaaQbMBRSfzvEVpnH3KEQLMnc4OkcXkahd0LEN3Esm+qei9/HP2/aeAaYgh/HQ2ipBXBKxy+vgmGDOLcH1Eu6zQlLHcWJQk0P3DAJTlvYvMlmkt9lPTqzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOj5Hh7p; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOj5Hh7p"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso16839795e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Aug 2026 10:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786727730; x=1787332530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NlJYVJ/8GdD4qg+Ajeu5HEDnsi7CdGS+uFMUtLjS2lM=;
        b=rOj5Hh7p8iM02y1OyF3BwZGuKb/rT7R5K8qR2rpdAW07IaLTjJuRcKKrQC/gTyHXK1
         UKZu/X4NZ3vAoH+P+X2vo8LkDbFRjj3HRCkt1jnxydTm/AOF2uj34BKYq6kIFsrVRjfx
         7DOuyftXYVxdS04HKjPcgtTCyu+472S2Mwdn2MizJZwz14AnwNgZtzlZJTek5jjnoSiT
         1IoFqK6lkm1B3OLWBgwn2bA6KtJ87C8mt8cgahWmQgfLKotPHK5Yf1aBaFm7T9hB6V8C
         LVf/Zicbbvohb9j8S2y8a1RYzvsyjz2EMlnMGO2ziN4R2E8zbEQ6uaCyRaXfEi+4/I4Z
         r8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786727730; x=1787332530;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NlJYVJ/8GdD4qg+Ajeu5HEDnsi7CdGS+uFMUtLjS2lM=;
        b=Utby1GcBnRwiTOwW9v22YOQTSCVKH06rcrPNfLCrbpWp7XoQOrV2H7hBZrKv5I/l8e
         V8W+T2Y8jKEvN+y2NNtd+NcztUwqq6aBQSeyfDZhRnIYpG3mB89HvzUXzfqdFQaDOLbi
         hSLt2QRXJwnQV5RyxZJsn8EP47bwh5vXXdoYCFBK/TJXwyvRI5zzvHBtkmzmf7ttcnaF
         j1UbhRhrpSwTkgHJeB0rPEKb80YGE8hVAtDUep2muPOqdeNqNrAtS65hO90q8umoJMCe
         gTFAVrDhGmdTpbOnJzKNUYXy44R02DorS9/NStoHK3buDiuMSsqbfipWaqFJjecOqPzl
         I9dA==
X-Gm-Message-State: AOJu0YxpxVJDukvmXOw1A4aKwec38lSGUZ9BsKeobwAITH6tnlZT8RKA
	P5guz/I7XeHu1hS1zGbqy+arJHjayU++R2kiqhmwsGfXOG52RrvkZjZc
X-Gm-Gg: AR+sD100hSDblHImj1oEc5UJMgfBePYYkmj0nsLu+uLdL8XviXQGQLhPZjQOfpQwjvC
	xmmOXBkWZs8euNp59m6EIhiAQJ2j67SuJN6XiN/vgPnFooNLL8NqCILcWzSFWEgY47VdyE2PuK1
	E8aUlUneSSIABmY+L/pO8ugl3upJTNP7HqosDuYfSnzkpH9IEQ+T3ZCJ6a7C9rORPCsTl3idupo
	FeFLgqXa17+yfX6ztBIkMnRWUgzblABxvWYmxNuTHd14n9W7QOHncCe0W5cJiUmRWeP2iUSjMHF
	PSwKpoVEijMiyTae+AYLe2WT5wLzcARtYEoZnvGww+ZYYFLintWxLmwpJXjgryB2PLr/WmnYTVw
	XpRFHZrp5IgH+alOc/k6/R+uGNNX3F/X+Zd8ZJkJXUyKNRjJt07QvpQzxKcqtJU17cl7Ct6o6kp
	FsxuE0kJ722O3nWUE3eORdxsuMMVO6Wd5Ga21JdsXO1qAIKRMdJyDyT6PXNiE=
X-Received: by 2002:a05:600c:5643:b0:499:77ba:4b6 with SMTP id 5b1f17b1804b1-49987ad988emr70687995e9.9.1786727730016;
        Fri, 14 Aug 2026 10:15:30 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5ad0sm44859855e9.4.2026.08.14.10.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 10:15:29 -0700 (PDT)
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
Subject: [PATCH][next] drm/amd/display: Fix spelling mistake "optmization" -> "optimization"
Date: Fri, 14 Aug 2026 18:13:35 +0100
Message-ID: <20260814171335.1099999-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a DML_ASSERT_MSG message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
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
+			"worksheet must be valid on exit independent from optimization resul!\n");
 //	DML_ASSERT_MSG(iteration <= MAX_OPTIMIZATION_ITERATIONS,
 //			"exceeds max optimization iterations!\n"
 //			"\t is_permissible_found = %s\n"
-- 
2.55.0

