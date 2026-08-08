Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9601038B7D9
	for <kernel-janitors@vger.kernel.org>; Sat,  8 Aug 2026 19:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786218097; cv=none; b=Ops6AB0+Mv0PL3QzstlLZdTENY+TO/zKxp1EwTd7tJSIwuywh1f1WrKCcUAMoZt3i0UBb3v1YhR/Lybot5LXNjAbluC86NtXs+Y2MUZ3VP4+RVT5FmCH4GwS2ip4XLVpzSSWYlxXYyRqbgXhRi/cW4SewnMedDuOvmegeqqUpq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786218097; c=relaxed/simple;
	bh=eprcVEM+4891h08mymWtfkMwBNdWdFfp+ym1xv8G/wA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CrnEg0COTpEKGxZbw5DeobTSBrgD2aGMTPuvFJbAjltAwizWK3t8I+Ntsn4OnF+/FxiyPKRZF+m7w5AmMZoK+9FOpQNxjTMoKHIItwPi5aj39jMshz/TLkiE0KE/EAN3x+FOoiiGRuLsECrCyN5x1gKKf+8Rg7UHCqUOpdex2vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dajROrv3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dajROrv3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495635a85d2so5605085e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 08 Aug 2026 12:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786218094; x=1786822894; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQVcGNcLq6m/6ixB9nJIXsf/NAsejBiY35GyaVjtWxw=;
        b=dajROrv3/QLFEhC2t1mSUS0S/Gza8Ici9ewsxsw5V1LAN1sESnEQMav1T01Zd1/7i7
         325bkFVHl0fITMVD8QqmBytsEJ0d5YW23pTRa/QyvwbKIFKbV1LjEnwn1L4Pv1vpR9yo
         XeXFvEojjbKkf/OFXDCdxqNoV2Q8851dtWTG3Rq14uB7amJJtpMLtxkRnVmBxtz748ET
         rBy+1pjVG2ocrRpMLYG8WyTZS/V3fis5Rgx5ykS5q/C+Nu1+mOwNJvwjkkLxWJWFi40L
         +3uorXnK+0lImypjrjJHzERohnrF+Gxg5AyrEPeuINrEycCXQNtRjqyzbWjsOO3GHxDv
         dpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786218094; x=1786822894;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQVcGNcLq6m/6ixB9nJIXsf/NAsejBiY35GyaVjtWxw=;
        b=rTmzzyHY82d/uR+Ro40TM5bwmLR1KMfbREJjLHJ9yiRVBM+f3hiM0IvPIrTxES5X3W
         jY/IcLLNkEtJWTlZpaF079jwrA75ZoIMQWoVxTExp+KRfipKQ6qXS00tGTkGB+nuWbx/
         XttzBF0Anmzvwb+PDG9zjHSlPa2+1pyXhU7sYwXR4nhu4q6EP7wgWyjugSV8fwF6OAER
         qz/M3YxJOC/ttcLJ3sAur23ZKOwZW0Md/aikmInWoaMrLV7ZCvAawhE5K7GERW8ystW5
         /P5Bl92SWPZF6dBlNqREUgT6Rw54WLete1J8lDNgF5lw3vic/KCMrKX+jUo/BulruYGL
         fwVw==
X-Forwarded-Encrypted: i=1; AHgh+RrVQQidNuqX67VCdCw3sFh3wtpgNO5yub6YywHdz4MrWaitPMIK3e3DDGjOJdlAQx9YD9rcWPvgZ8lk5gfsPF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdC6fuyk0/dzfur1qn8cKn5NeY+kb2LlXWk9A9Kat4LKQ2CUFL
	pAO40jG0uN2KG6COq9aWrWHtOSF5xM30ss9+7dhW7zPZrR36Y4zBAjyP
X-Gm-Gg: AR+sD12HaJ4ATBOWIcaGbzw/xsFPjcBXTUeaaXIPGw/YtqNj1oi509XWLpXr71GxtcB
	mOiDSaJNfdbe+/qBdsSU5nW2AQlQyWG0EjoA/6YOMU/ADS2yb14KT4T+UePS3Wcefl+gC+8h5xa
	n1QojKnnI7PEqwZu7x1t4poTARZ8VIYEQYazzUnQ56bbERboGkU3WBmy/3R9+czTVTxUx3znsdH
	8AcjeqeAQMjKIS+CQ5yWTJsHy9oehbgI+4FSZaqGctJHhvyQFT9aLueJZ2MZW4lguP/ITQLrpkJ
	XqxlXR9wAdqJ+0MX7A6FJycff+2B2Sjp03QSRIaT+R5SecJCp3buir/1b+9I/1hDNQmUULHtWAD
	cbFwE+MxkPRBzNMxYkTS2dLFvId68UgJjrJl+Qdz1WkM6NhlbbKzyoREDxcYKH5KCnczcXDuLag
	DXRrkIl++eQmlfEzuPBw0b2A9nWeLeZ8Zaz4LBpp5TiCtuf6g3/ShiMVY3dq07qsmeoz0=
X-Received: by 2002:a05:600c:3b20:b0:499:4893:97d3 with SMTP id 5b1f17b1804b1-4994e7cb8ebmr390890085e9.13.1786218093825;
        Sat, 08 Aug 2026 12:41:33 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e7b3fsm18742073f8f.20.2026.08.08.12.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 12:41:33 -0700 (PDT)
Date: Sat, 8 Aug 2026 22:41:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Asad Kamal <asad.kamal@amd.com>
Cc: Kenneth Feng <kenneth.feng@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Lijo Lazar <lijo.lazar@amd.com>, Yang Wang <kevinyang.wang@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/pm: silence uninitialized variable warnings
Message-ID: <aneGaKJUl_Jyu05n@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that:

    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu15/smu_v15_0_8_ppt.c:1964
    smu_v15_0_8_set_performance_level() error: uninitialized symbol 'ret'.

In this line there is an "if (ret)" condition where "ret" is either
zero or uninitialized.  Initialize "ret" at the start of the function to
avoid a potential uninitialized variable bug.  But also delete the
condition since it is never true.

Fixes: 422b399b09c7 ("drm/amd/pm: Add od_edit_dpm_table support")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c
index 59fdd2319b66..c78e611d2a25 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c
@@ -1920,7 +1920,7 @@ static int smu_v15_0_8_set_performance_level(struct smu_context *smu,
 	struct smu_dpm_table *gfx_table = &dpm_context->dpm_tables.gfx_table;
 	struct smu_dpm_table *uclk_table = &dpm_context->dpm_tables.uclk_table;
 	struct smu_umd_pstate_table *pstate_table = &smu->pstate_table;
-	int ret;
+	int ret = 0;
 
 	switch (level) {
 	case AMD_DPM_FORCED_LEVEL_PERF_DETERMINISM:
@@ -1961,9 +1961,6 @@ static int smu_v15_0_8_set_performance_level(struct smu_context *smu,
 				SMU_DPM_TABLE_MAX(uclk_table);
 		}
 
-		if (ret)
-			goto out;
-
 		smu_cmn_reset_custom_level(smu);
 
 		break;
-- 
2.53.0

