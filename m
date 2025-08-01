Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2AC25C833
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Aug 2025 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754055163; cv=none; b=XDZfP6uBJOQ1NmAAH0m6KHcwIEy1u0dAp6VToB2irDdkLLHB0h2ZKACoJu3guOXAb/wW3ai+NWh8Ea3IPU4AnmS2RqfiC0qL1DuUvbIPSzCtntF9srD5gCILedneb1HSO/aV31JyxIvuX+yDbNXahuopNunKpuf/ygxjnRZVo5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754055163; c=relaxed/simple;
	bh=D+PtGGPfj6WwPCQkvS3KxNql2PwDRVzIf9jNqijot6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fcLPn9GEyks5VX5eoKwPan+4NP3arEG52xuXAAyJ4UQaZl4frVVb2Lx9hhmO1XgEsVkdpp0PG0kw1iMLaspKD9Vw4xD00KBNLJzFmCYUW5v8Ts3DSfwoIzUI0yzzi3zwecUiJvAZ1pzQjuMcd5Clp8hDLcOYchqwRnSKbkHlX64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PR905xE/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PR905xE/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45610582d07so14838695e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Aug 2025 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754055160; x=1754659960; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2idx5QSV7SbSw8eO9muSjti0H6pMvCzwd4EGmVUbV4o=;
        b=PR905xE/9YajnGFgMcpul6TkBibuo7B+Z1ptrMBga4iBqO/Ikp99TRcA5TdaESmLIP
         9ocacALocWeyvW4PwplrCgtN+Nw/Ynz8wnrB0kfutrz9A4bjWqg4VETt66SA5JC8nLXb
         O6KUUHftAmMiX+dSPHPy3BH5Zd92RmA5KlbQYM4eHowJ5E57ws8opBGdydcK6FGTpo9C
         ENZx/ewvE/fK3KEO/ncAIxR4bFPdVrS//SwXJRcytmP6pfuMz7PTDPRal8SZdRJlDuY6
         Plr0k53JsfDKIK1Prkeooz6e4GlTAtSLo5TNIjgptlghESE+VngXeGCxx3TgdB4ps7p+
         BysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754055160; x=1754659960;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2idx5QSV7SbSw8eO9muSjti0H6pMvCzwd4EGmVUbV4o=;
        b=J/U6VuiQQVB3oh5m3+zfeMEgwPup+l7vOHtTn5ShykMxrU0YNf1q7uXfWqW24hPiF/
         /uX8w0wTVQ/lEjeIg66zThiZrN5ZEqqY6/KfeSX3OZKxC+dzvoeU3OOuXs6bicCtwqRH
         TcHc8uGdbsZNWlYZZz+MFp2V4YGn6ig/z4ccypWu1yqxtjs4ZZmj9Cl46intTjVXH28S
         mZ7KDpthlbOGGUMDsFH9WcMwq+qM2Jy/un5RQSlMc5Btc71bqGJ4aDjpqj9AwNjuOgWi
         BiSm69UrDf9PoIFTx35RyaFYOLOZpRVDjgzFVmNoHfDqkworeEAkKPMjOurXt86Y5z1U
         3wQw==
X-Forwarded-Encrypted: i=1; AJvYcCUYeVy2ggkHkFbAzMCrgYW/+olDx8nyG1EI2+VhP/2euDQdwl1//+VtiwxIuTe9ZRUB/JTxpUqf4FXQpW0P+4U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1d2i/JCxU7jXHw12etb85tgPBThqiQK11hvZpLu37/3Yp1jBJ
	daWI/RXv2rO0zpViS3ppj3x5FdyZ/WILuhXLxVDg03J9LRrqW3xP525X9/WN6AzAOHA=
X-Gm-Gg: ASbGncukDOTHntiy8QFomTpCVrTy8SjTdPcyG5UzyyVCTeo9sVH7ipfniagcWWe+5IA
	tfhcAZgV29rpT+GPFL8zKmbH481SaFtNBOogXn/vf43wHhWaAsqLanD4LbH45XTp907AchprGrz
	iARoA2nzQOvzvzdaTxWEUywHEbsX4Da6SDY0OQb/FtjHRIDzXVELA62UAmQYNiEgHR6hMdRIauK
	0C0EDuEoOpCiYcrHoBgfXQhqob6/k0V9+JTkFMxs1FIz3bfTVEb0xJwvH0AnOZTUE2rLWl7JtWj
	K+o0kml5QqifUk7K8W1r7ey/x+YRLoVoMgB0EhZb5rPeMg6N7D/LN9WXC7ypH5GTMJvURln5wnU
	SZeyoKu842tyGeZbkiQX8VaDz824=
X-Google-Smtp-Source: AGHT+IFIP925vY6Yo9eRXJ5b38/MY0xKS/0uwFqRgqNx/TMNMJnubKb87tJwBNeV97YGf7Vh3ES1Gw==
X-Received: by 2002:a05:600c:810c:b0:453:6424:48a2 with SMTP id 5b1f17b1804b1-45892b9e335mr130336025e9.10.1754055159772;
        Fri, 01 Aug 2025 06:32:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458a7dd8cdesm42494865e9.19.2025.08.01.06.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:32:39 -0700 (PDT)
Date: Fri, 1 Aug 2025 16:32:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe/vf: Fix IS_ERR() vs NULL check in
 xe_sriov_vf_ccs_init()
Message-ID: <aIzB8-Y6wtZvfNQT@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The xe_migrate_alloc() function returns NULL on error.  It doesn't return
error pointers.  Update the checking to match.

Fixes: a843b9894705 ("drm/xe/vf: Fix VM crash during VF driver release")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index bf9fa1238462..e363240a3455 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -271,8 +271,8 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 		ctx->ctx_id = ctx_id;
 
 		migrate = xe_migrate_alloc(tile);
-		if (IS_ERR(migrate)) {
-			err = PTR_ERR(migrate);
+		if (!migrate) {
+			err = -ENOMEM;
 			goto err_ret;
 		}
 
-- 
2.47.2

