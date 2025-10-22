Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6640B2777FC
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131089; cv=none; b=uL+vdGrPVhkhzKLasM70W8sUKm3LYobhoYF1rWt4aEWt9GryMbqT8fvrlfGeuVQnIQxiWyKWe6fchn+6X0OPZaU7+Sozdd2isVDqdUinN1+F0Bt1Em6vX7Kg8seHvyD8vf6yiUm3Jdk+qj1dLQiLf9hMBLnuAfsWRgxaQnwz44k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131089; c=relaxed/simple;
	bh=fbnf82wilN+OInKBeOAmH7SupbMbH8ConaawoIHXamk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZT73+cJs6/4Kgr8aXKgDIs3JUayiaLaaM7TPC7zvnJdm+upa18aONGoCMZM8qXbh9yKzYB2hapMHp3uqZI5dU/sIjOdfdNEzPgLrLwyp782C+cKdMwamRBXGIeTQIObHrRQM52ZRv4jyflPKMSTjCehKeJHyyj6O94Kt4lS/eoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZJx1bT2T; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZJx1bT2T"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4711b95226dso56024305e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 04:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761131086; x=1761735886; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ec4fethFoS2+SPeTVw+Fwof3KrdKYWIF/kwJYkEKmFY=;
        b=ZJx1bT2Ta+/gas6V6KLQ0yqH2DsgFbKU6MUOk1SLPCzuZYdVw0pPkfvvwhZFWsYiUN
         Tv79scr8JZBRRkKSrRvjoZ1tL3fiCMYWvAEsfPc4/DWy2HvsSVKtt2llfIyUtSfosfp7
         GuGicd6mVL/f7yuBlWVdXPyptpSDn2ZGHT0qh+MCOiO31u5qdm7SiN65HslDeOwgyzcl
         XtmY94gjJVN7fh7mNMWRaa70JXXj9iO3B609h8g4Exs6z6KJxmoTOYrL6+HI06DQ6yLL
         tq227ffNak8KQwyhbp34lxfKqXEGYyhGPHjcWmaEIqbYyLonMFRGnpNS7oSeXHNzd6jP
         Ydew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131086; x=1761735886;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ec4fethFoS2+SPeTVw+Fwof3KrdKYWIF/kwJYkEKmFY=;
        b=vAOVpHdLrqyIVRt09Zd0OdZ7Zj/SZdo7L4zsO1AeLWRAwtKFtxV4f22eqlOIxJuUiA
         5C1c57HkbXUoxJC8rzNdcpKO/fku7SHMC74nWotZsE2bwKAEM5lNI+vF0morw8C20LlW
         DGt1bQyNRypZFIVzHBSMYKMM7nTnpSH+Ut56xVE9YgyW8Qu42H3CIKYn9D2FW09wikRG
         y5rpHvy1ST5oHrTTyudBUgruomyDF9t9ut5EBmVq6HJLEAP9JGcmFT9V86EIU7TrnvUu
         j72fMMvwLbF6UVF+hzZtDWho5ETo9Gr1WdGp8MvDrMT56vxBWxS1kenY6+LfjmHSau63
         q3XA==
X-Forwarded-Encrypted: i=1; AJvYcCULoeg0aPsFfJjQ2gzFE42fetDn/2luavduOvBG7KWLnggIPoEHaygVpmQzDy/LkXgxJKjnr56q+XVdeii+lbg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7QqQvKAI5gmVfJX+ulRyRXLtDQ07xzBCeoJskXntiUyNvJrFn
	t53X/2soWNKVEVNmMDaqRkz/hooTdl8PTnW3tQIkceF4QU20+ew2CbdU/PqF6zn8cZE=
X-Gm-Gg: ASbGnct8r/MhvptHvmo7tDoNlU2/j2CbZZT1DcnRqmIKrqQfpPiJXcHwSv/9CBEmRH1
	exHRG4Gf7O32t9l/MrEoJOAJ1iIuusTu7CbHDmI8MLv2XbrKe95elheY2ew+ZGWAwnXm2fGNntC
	It8xDLp7hFJ4OMtUSPcNG4VQUW04eECSm37E14HQ0632wLBCWOpeFQ4mWFVUDqWIQ7N8QFJ05fE
	qQxOJJ+OH2Z+oow5icuXFnk2xzqBHq1ru+cT+cDZA1PqOT5cSTl6nOLcm7bLC4y88zLjCVV8qXU
	hOkDcnQOIVcvCIaLlveZOf3E9hqYFpitnibe/z4YWvGkkjh16XECAXgLYYZQKzQb2506sxkgt4c
	o2i3g/LeoGPNEOvfZ/AlWl+VTAcmlSU5ORmrHXru7vCX3Ddz5AqUSfiDMWnhA3y/CDQYhbYkTcp
	dkA38J09cEDiNTJgN5
X-Google-Smtp-Source: AGHT+IGMYkocvaBnPACpDrQqTQlINhZBUKIMjE+J1fPKEeBjdhwvP+lt5c1FWsAPVXg7BnBQuKDcjw==
X-Received: by 2002:a05:600c:621b:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-4711791fbbbmr156254735e9.33.1761131085678;
        Wed, 22 Oct 2025 04:04:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47496d4b923sm33430975e9.14.2025.10.22.04.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:04:45 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:04:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
	YiPeng Chai <YiPeng.Chai@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/ras: delete an unnecessary NULL check
Message-ID: <aPi6SqcrGtBvK24S@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The list iterator in a list_for_each_entry() loop can never be NULL.
Delete the unnecessary NULL check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/ras/rascore/ras_umc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_umc.c b/drivers/gpu/drm/amd/ras/rascore/ras_umc.c
index 4067359bb299..03c4cddfbfd9 100644
--- a/drivers/gpu/drm/amd/ras/rascore/ras_umc.c
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_umc.c
@@ -207,7 +207,7 @@ int ras_umc_log_pending_bad_bank(struct ras_core_context *ras_core)
 	mutex_lock(&ras_umc->pending_ecc_lock);
 	list_for_each_entry_safe(ecc_node,
 		tmp, &ras_umc->pending_ecc_list, node){
-		if (ecc_node && !ras_umc_log_bad_bank(ras_core, &ecc_node->ecc)) {
+		if (!ras_umc_log_bad_bank(ras_core, &ecc_node->ecc)) {
 			list_del(&ecc_node->node);
 			kfree(ecc_node);
 		}
-- 
2.51.0

