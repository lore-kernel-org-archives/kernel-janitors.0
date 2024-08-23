Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179DF2CCAA
	for <kernel-janitors@vger.kernel.org>; Fri, 23 Aug 2024 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417438; cv=none; b=Qaam4qXlEQ9vZh9wo5r2OKmL8EbTl5dIePLPY9kfmPJ4l10t8c2/4HWNS3MvPuRzERyBYCVSEKACuVHK1w6ZjEf0y132i8/rivHJlFjip8XGw6ZtimxCQDq7lSh43/0cHJ+jbpzidhVahlCXCh5Gm+SOMgaAjMriEJNVfwOd51M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417438; c=relaxed/simple;
	bh=o5CSy4ssFOPlXASeHazGSN0fuyN9zwpFZZ8CBbjENRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qfx7kkCNqGQJPAv5dwZVP48a4/fXCo7usvWXiP/5NYfPF80dfIQbpE8LSb5MPVSGzVJ/rMZDopWG+atNIgF7TKqZHGwtrWYDbqp1xEXzhxGTzKFiJuprRbjvFWZmqvIqfFvllXkqEd0/p70Y05jLhPv2r3/tvdf2FF/oRxFQT7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dg4BtN6p; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dg4BtN6p"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so15774215e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Aug 2024 05:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417435; x=1725022235; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wglUMOfSKj/CJM1zOfzFbHWNacB0avO+XJafuxMQMWw=;
        b=Dg4BtN6pKxugcWlvVywuF7FVoC3wMf80hGJloibj7F8UD/oL+7OJqYwsP1oRgw/WMo
         MVDfsvNCzC25iC6ShVr16MAOi/AY27aae5QBxz0ZD6YbJlfF6Q6YZbAISsfVzQ/BvDW3
         GzAG58Vfg/L8uDCRUv0Bv8PAsBuLoqew5vramZVvDilVRmWfgAX05fJ950koPSWaEHUb
         QwVVmMfogKYEMKePsOZ4NJBAnPVXSqhNq4VnXxkXcVG+b83c/msZvN/px8tbqc539KIF
         SWmFh+ZRJCL6Dmef2QiYw5vhdELD/Enok0FBWjZL1q9IdRk6i35aQ29q1aNZVfuBUWnw
         csjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417435; x=1725022235;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wglUMOfSKj/CJM1zOfzFbHWNacB0avO+XJafuxMQMWw=;
        b=ChaqYOTpS2ZCxfZ8rQx9NIftPGiwApCeuFxqg7IayWWQb6T82D9IefdD97ayZ45WOV
         CQalZ9WnawO6fauyZTmX3815Wo65zNjvjNKdGhC05dLSc0y9GsDAHtMjgWk7XIGWLOxZ
         HB4gAid7/F2d9H3203V0kTNWTOQx3WwthpsbfBUiNs8MNC+cWxF8WFn1YCD8yUo4TOcw
         QziqxAR0rRb5HNzpSa6LNEXmUx80enTG4d9WYnlMyfMwAodABGxR6QSvhpaftasOae1b
         +5wo8uScA0XMuERMpX5Q2qWed/gSgg+yCwpFgigf62847opeqylLu/FAV6cV1D1x+g7k
         AjKA==
X-Forwarded-Encrypted: i=1; AJvYcCXdpkhmJ7n/VDl8AvBhUqTP+0XvW6WwSuIdpaeHXEijfl931DRGezBWXH+KKBLsRyNQ6q9SXDbu1Kq62KRHCvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH4B8AQv+h1s6mcYn7Uungb3Zul39q1/prW27xfusdrlryiKBv
	BqnUYFyys0bHo9+G5xgjN2e31bu8r+SVMYCIURuiB7obTcP8DOiGwD9aKvQsru0=
X-Google-Smtp-Source: AGHT+IFLiLazjFQT+RbARqd6XebDKnhmp2PsLFcYq7T4M8t9bB2PBe0YloLgYQ2LGsntaXnC81G06g==
X-Received: by 2002:a05:600c:4f14:b0:426:6f81:d235 with SMTP id 5b1f17b1804b1-42acc8dcb19mr17146615e9.15.1724417435283;
        Fri, 23 Aug 2024 05:50:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308265ae6sm4074861f8f.109.2024.08.23.05.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:50:34 -0700 (PDT)
Date: Fri, 23 Aug 2024 15:50:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chaitanya Dhere <chaitanya.dhere@amd.com>,
	Austin Zheng <Austin.Zheng@amd.com>
Cc: Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Dillon Varone <dillon.varone@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: fix some indenting in
 CalculatePrefetchSchedule()
Message-ID: <f57c247f-ba47-4318-b2ee-75aef1726503@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These tabs were deleted accidentally in commit d07722e1fc74 ("drm/amd/display:
DML2.1 Reintegration for Various Fixes").  Add them back.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index e2c45e498664..7d287b07108f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -5612,8 +5612,8 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			s->TimeForFetchingVM = s->Tvm_equ;
 			s->TimeForFetchingRowInVBlank = s->Tr0_equ;
 
-		*p->dst_y_per_vm_vblank = math_ceil2(4.0 * s->TimeForFetchingVM / s->LineTime, 1.0) / 4.0;
-		*p->dst_y_per_row_vblank = math_ceil2(4.0 * s->TimeForFetchingRowInVBlank / s->LineTime, 1.0) / 4.0;
+			*p->dst_y_per_vm_vblank = math_ceil2(4.0 * s->TimeForFetchingVM / s->LineTime, 1.0) / 4.0;
+			*p->dst_y_per_row_vblank = math_ceil2(4.0 * s->TimeForFetchingRowInVBlank / s->LineTime, 1.0) / 4.0;
 
 #ifdef __DML_VBA_DEBUG__
 			dml2_printf("DML::%s: Using equ bw scheduling for prefetch\n", __func__);
-- 
2.43.0

