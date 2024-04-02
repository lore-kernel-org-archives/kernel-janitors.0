Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0895A0E0
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Apr 2024 09:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051810; cv=none; b=ooey+4/3+sImT76VI281P02tvRoTdLyce8A3BxRUfxq3dGnmcgqYUn0IG34bp9QDnKvhyeVyj9qvga6YMpFJCxE+Kx6Ii8a3uI+MWquFkLuy3T7GwYV93ROhiVAzORJti/GuSgN/rU3n0Usqqb4o3WqndgaHDI5Nri9T1Zl56h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051810; c=relaxed/simple;
	bh=teQDxib2Uf+FgdvYVSISC39IdNk+9G89gKg6gn5dyJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zvzw+ZDHWAEkhWVZR77DEHnpYs8tF/Tt6hHkCWZX0UhfSago//6Q4EaRmijKTUlcxg1wfIehMOavmdwBDy+0tjGt8gCNgbAWUYt0GEv8a3onw99lfhvD0v7kP4TigcYAiAkJvCQU7thyK6T2B+XJVHX7bQk/4uo4OE0ckI4RqgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JTdE5dde; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JTdE5dde"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56df1dbb15dso377572a12.3
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Apr 2024 02:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712051806; x=1712656606; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=718ZM86+71A8BdEVL2GnpD+8wX4z74S1znydXwGnzcw=;
        b=JTdE5ddenp7q9/Jb6uWFwA2H5igPP/90C85jklRW0uNyDTQzKAfIrLyLJZfnPDtbz4
         eoCsyUD1TX8LRymL0pYsQELMdMQ0vWEvOjx6UnhU9PoCoWj2a+qlwQ9hc0CY5LoZ+hhH
         NU6Zmx8RvIbZSI4EXwoTFpppvLnI2reR9MFxTIWTAUI9HkTWMric0e5ca9af00zV7SIt
         uGwsN1kRZGQriBZ5k61j+msryZoAdmFx/MKYI8gz69pu1nusOJ1OIzdjdvsWK7F5psjN
         nSjs3KWTYw1qqIZCuHtfv65ECLyCQ7H+9McbWxhyJqXoUuxSuIYiWcLyGV9hiDizEz2Q
         H2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051806; x=1712656606;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=718ZM86+71A8BdEVL2GnpD+8wX4z74S1znydXwGnzcw=;
        b=Zq5zqjTla9sbHOXCNuiFSxgy2p35EA3GT7/QUFuyfLgfOH9vswm1Aj6njhXrxEfNWS
         InCQsAaViYVLSDTWlvJtGU0oi3z7qAk5gGVKJT7A1ODMzhLxAZQAgnwULNu97oF3sBdy
         CQF9zhV5UOTR/JiouMVlYH+W1j1UiHVZjCqiOgk88djKlOt4uZBqbmDPFrQtF5EnmcT/
         iMMKVtsEn6b4rTF+6f4w4hXUGgRCIcMc17rdHJNG1o3hkGvsHdRoQBp+nIZrHFzQbcdB
         q83wsaExier2GDNpVGgjifHKOkiW6dSjFkbwQMivj64MYN9poI+EpzrP2VLcwpehWBlk
         OPow==
X-Forwarded-Encrypted: i=1; AJvYcCUUgyMA8EEppFCeedt4ozUls5ZUIZO/mAV+06jogqhL+UXi6XgiZfbYdEEksfuA0JOiw2SrhWRkA30LMUIlJgL3tITrY+yVKp9HWhTAkYSh
X-Gm-Message-State: AOJu0YzWSmw06MubC8Z5sIwpZL+ZgL4WT/4QLqPuyX4zx7ecBTNqyQ59
	zbthj5AGYtUC7lW9mkxts447vbRCtMpD09Xqw80r8QjLFw8QAgq/Xacnyw/lmNQ=
X-Google-Smtp-Source: AGHT+IEJjgwUkgIFH8v8m5U7taah5woPEVoICpVprECTBBshSjtqYr7X1fMj5MRpzZPnXQqCG7ctQg==
X-Received: by 2002:a05:6402:4311:b0:56c:197a:76e2 with SMTP id m17-20020a056402431100b0056c197a76e2mr9137367edc.0.1712051806315;
        Tue, 02 Apr 2024 02:56:46 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id dh25-20020a0564021d3900b0056c09fda4e6sm6726525edb.54.2024.04.02.02.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 02:56:46 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:56:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/panthor: Fix off by one in panthor_fw_get_cs_iface()
Message-ID: <62835c16-c85c-483d-a8fe-63be78d49d15@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ->iface.streams[csg_slot][] array has MAX_CS_PER_CSG elements so
this > comparison needs to be >= to prevent an out of bounds access.

Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 33c87a59834e..181395e2859a 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -308,7 +308,7 @@ panthor_fw_get_csg_iface(struct panthor_device *ptdev, u32 csg_slot)
 struct panthor_fw_cs_iface *
 panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot)
 {
-	if (drm_WARN_ON(&ptdev->base, csg_slot >= MAX_CSGS || cs_slot > MAX_CS_PER_CSG))
+	if (drm_WARN_ON(&ptdev->base, csg_slot >= MAX_CSGS || cs_slot >= MAX_CS_PER_CSG))
 		return NULL;
 
 	return &ptdev->fw->iface.streams[csg_slot][cs_slot];
-- 
2.43.0

