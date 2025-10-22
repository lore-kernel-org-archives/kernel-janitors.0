Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D32A2472A8
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131076; cv=none; b=Ech7lBq2qkl428ZL6GslMYDF/cAswjySlenDluE+mACPiZcspzop8HGtX5kp40F6dUCeKmSyd8vTROd7cIXmYb9zSOoIg56HFARViTcrZv8CEocyivvwWEsyChnMT2mHeWDD6zQzo1YHFAicS8UiXBcviK5WQ2hLUGdYdJWIYfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131076; c=relaxed/simple;
	bh=dPOpm5vBn3gdpvLHuFodqR7mnIn1IG6DinUEZR0SOkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lLNxPy3SJ8M0Lepn3Al56pe5XIJj7v/gpFMd47KDL5egUCjHGoMKMXRITumY6Ckl+YQKCMI9lC32W2NGVRz3qRxyo3j9WCV6xekZhLEGPnC6n23mVsa+QxVPdog1fcbG2hs31wIEmdtOpoOKZfmp6Tx/mneyjLitgnusbGJjxfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oHDy824P; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oHDy824P"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4710683a644so7673595e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 04:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761131072; x=1761735872; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qEafg9Klu5zOL06Nglfzdv2mgxyWpLG/yLgQwga+NA8=;
        b=oHDy824P/FMBqmFZwktACi54CazSymctzVxokRz1ie82/Y+bssM8MoqKSRrXrHKtcI
         RWr7RiPYP4Xta3uNcoPLzlGqBrrMa1xCDlreHFXOnyd8/CfiHtNme0Z/7sDDmiBlf6Pq
         lODifHQ7QEgxXQuXcZcJqJEGhV5av3Z2T/ozfSNDBWNizr8Tn8J2J5huBZuBYYnpgPkH
         C83G+CMYcw2dRaDBfBNp41GSFe6dO7B5gwEJf0kMIPLaf/WG6vw8GfYqX3MVIctWUs+p
         M/pDZv9/hX/DNh4BYAAPvmeRwxc9UR4MkRudsB3F9f96AzYGyds7HckK0qEaac7GCCxG
         pADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131072; x=1761735872;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEafg9Klu5zOL06Nglfzdv2mgxyWpLG/yLgQwga+NA8=;
        b=PjsPGOd+x/2MRlwQX6ySRtW8slXxtQgB3s5PkAYux+q/y/DNhVXs3rchUt96Ir03q3
         T1S/POOwAMNciMiB58uD8YAb9t4A7vUeMATUl+MjPqGT2ARvJBDxjcSE4gp4adpW9Ovc
         vnzrdTmKE+F0IKOrK3a9c9JpJ+6s5qVOjCGcJKRgXbC1gqhv8UZ1znCNUkZq67LADuS6
         rxhij3xnjmXe1SqFGXVqTGtQr0h55XL1XfJDBgAT9NTr7fcXz5Rw9K5S4uO9T65crwKY
         +1Tj+z/jREX7Ctc7H2Pv7aFmV1T/esYRxsVbg2quYIsCpJTGBTGgOalXkCp01kYXebuk
         wjWA==
X-Forwarded-Encrypted: i=1; AJvYcCWlAk2FJtoGs+OK89zQaHi9Aetn3Gea524YfuxlvFmwyWmTH0Pkg97yL1DV3oqCg/KouI2ZZ9TotwGLTNn1wu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNPs7KicOS04XR2F3wPyRcxdk6Tu8WD2yVcLCGJHAcwdQBn2mc
	fOGtOxHyYt4JDFdFdENqbbK3lNOoi6B6+elD7uYyuLAWzamcVXpbl1BLbyoObxLMkvs=
X-Gm-Gg: ASbGncsiXjjMt9H11MWnrAUF87A2yH3G0P6yxVAbUMvEeJHlhwN6DR99tmNCvfdyz9S
	L7aqI0irHuKDoMK7foczZ8RrYR+p4sjXFUDPI07VAhy8WT8quD8lWhnI7q3q9ATcFOor+Uih8Yd
	o4fdZoSrDtLHCkZw/8OVYXTOMcV/t+xzXRUxuQZwyvMkTCqJAw3pzQakvpXGFKfTUZK35aHtLk8
	EKUDCtuc16Z+g86GCQdwQhX/eD3SEr/OnHIwlO7vM5nj6mUQY9Wx9zixItqKSiuRZElGI5Nt3dM
	co7tJmRIbkN5BU1982V1I+K1X/WNzUZqawNB/HGVfwHrnWZnytNebtHcdTMc+oiQ5Z4+gbkkuM/
	yfjhbbF4Tmd2p8NUcX8OROc5MX0dd+HGZeYrOZcMcSaA85/qEBfQ2RhR85fpDZJOenl0GFlhq0B
	A3EB/A/w==
X-Google-Smtp-Source: AGHT+IEvzeQmuJZVlQvxOVzt5DBIbtifvWSq41OHqDirBuHQNqktljPPP8+Q3xqBRDvi5bTZGQ8Z5A==
X-Received: by 2002:a05:600d:4265:b0:471:1e:ebe8 with SMTP id 5b1f17b1804b1-475c6f5d0edmr6359645e9.10.1761131072473;
        Wed, 22 Oct 2025 04:04:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c428a534sm44924865e9.6.2025.10.22.04.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:04:32 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:04:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amd/ras: Fix a NULL vs IS_ERR() bug in
 ras_process_init()
Message-ID: <aPi6PTnGfpG02RgK@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The kthread_run() function never returns NULL, it returns error pointers.
Fix the error checking to match.

Fixes: ea61341b9014 ("drm/amd/ras: Add thread to handle ras events")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/ras/rascore/ras_process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_process.c b/drivers/gpu/drm/amd/ras/rascore/ras_process.c
index 02f0657f78a3..1d2f136fbe2b 100644
--- a/drivers/gpu/drm/amd/ras/rascore/ras_process.c
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_process.c
@@ -241,9 +241,9 @@ int ras_process_init(struct ras_core_context *ras_core)
 
 	ras_proc->ras_process_thread = kthread_run(ras_process_thread,
 							(void *)ras_core, "ras_process_thread");
-	if (!ras_proc->ras_process_thread) {
+	if (IS_ERR(ras_proc->ras_process_thread)) {
 		RAS_DEV_ERR(ras_core->dev, "Failed to create ras_process_thread.\n");
-		ret =  -ENOMEM;
+		ret = PTR_ERR(ras_proc->ras_process_thread);
 		goto err;
 	}
 
-- 
2.51.0

