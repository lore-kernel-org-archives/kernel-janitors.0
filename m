Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1585717B425
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739777488; cv=none; b=ks5v8ahOAdiKm7o/3jgSf95FrAm4gACh9df+KACs1B7HR4pcr2q932NGBkrd2kpPQIeA0C3JsjEBmOJyFL4q2uHDQ0gGB5nxHQlGTXRuSyeYWO7dHYVW2foNeBzmKO4fAvnSkvMncOV+8JPvkgiRDeqTaw9T0fphBWEyOiDzde0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739777488; c=relaxed/simple;
	bh=5LfAzuERriSmpQuSJeDzYhRoc6w7MgsIIf2LhY1/C1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oi8bzjrhDLXpYbmfMLoJ6gDjjaSWtOVA/eQFneeN274dlS/3R8phSDsfg4rhtgwkazq1x/m2TU/qJQTMcbbP2iqMPQ1NTWi4V7oaGh74H+quD/o0wfZmJ3RqqrtSkPPYqqr3MC8tqaMs9jGfdZHwNxFQstGyjuHw2JXFWtaaDa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YCjhtPLJ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YCjhtPLJ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaedd529ba1so475364266b.1
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Feb 2025 23:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739777485; x=1740382285; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3N1F9lKBugdIVSZf0JnXa3f5AJ+PHptBaxL337Q39w=;
        b=YCjhtPLJ8c3VCtW0f/7lU7w575uDXecEJoK9/RYmdF9yX3i7UWH43dJFHLCYjDRqt3
         XfKJq9o59ldaSNBogGV4zRa+c7ZnzzOwdD1DwZvTfeGdwPvUNK8xbbZCwDGU9lrJzJio
         +hokEWi5YihR8Y7VH4n/lHv3zvX45DYFDK1KiDjm59lHjkDkApXJKLA970PiNCSm3LY9
         2y/g/9bbstz4yWgRhZgIz49fodywQ4T5nxuPDmH+0jP1r6NMyOEz3WAEMb0B7HRVu3wG
         gZ51Z9Us9SguU82050e99U/iT2CCKC/B28VBiQ4BXcn8nW9jyIMfQScVXnuUHeryHmFs
         p63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777485; x=1740382285;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3N1F9lKBugdIVSZf0JnXa3f5AJ+PHptBaxL337Q39w=;
        b=QPqytYUzX1mDuHvT6dd42eJq4/7JMw87H1fAS3+I53AlINBX+XmRPsJ7H+4zmTYygD
         3k90stqWPaeznWgMsh3u7lybb2vW7QQCiOeO2sBUW+KTQFJ3/0bsHVuwdQzotu+9VUzN
         P+TPgrxHydMw8ReM42jcRgWSWj/GqQDR0HGzDeRkahwLUTIipgBAPJDWHCL3COoKmYQ2
         QbstqpyF0CPr6/KVwQdXFH/Pk7d4k2eE7gRnlH3By+iusFtaoH7qxEQFF4BCCVhZHUMl
         RoO7p4+RzQX8pdmrc+TzfPRr6AmELVEEkX9xABZbUkzR6ejXawirKtnTgTQevJXunHlc
         q9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWQcZOXhY/UWL2c1p6doPC/rL1N2aqizGWUVci9PAg9P7bS/rG8QeEQTlEo3SK+8ZF2nLgCIDKPQ70VW/kyYdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YywGBY7g45+Xzi21huWf02mrKAtK9Q7YPvlz/VUDprtbm7wOS1F
	ohYrXmm8O+YvdpeYtb5uuZShfORGVPPiSOkFsO2a8AJ+aUGafyXuAeRYFaTSLN4=
X-Gm-Gg: ASbGncvWQ2qwqxFKmGxGmvjTnAez7s70PmHOrWMsQ7w8IppQyAm4982PcrmajSxgdt4
	KFmxtgnHE2yFioXpqluSAR8XmrOQAi13kBMUfJaZ2qlXL6o7CW4n4KWlA3komQQHKJd+KYNRXi7
	ny20aIkkwK1S27GbFN/AB0cD1yJJKSW0H8vpPrkDhhOhsfYfM/iUA0H+7Py+LjOS16ytHnyFkh3
	KsEOhD9VlnMMe/wWH6DxmJ1XR4JZHB/3qTvtu6jN2B4wRd6sC4ukOFI7K9KabLHwhlE0GacsklD
	sKmL9RCh80YcJbnBLzwF
X-Google-Smtp-Source: AGHT+IHnHjxlo58ZzOxdeP7u7lyqoH4uJ6/5PcUK9k1FokcbI7i8gKzpjfAHODR2Y8cP+hgufV5HRA==
X-Received: by 2002:a05:6402:3589:b0:5dc:9589:9f64 with SMTP id 4fb4d7f45d1cf-5e03602f759mr19286982a12.13.1739777485351;
        Sun, 16 Feb 2025 23:31:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aba532322c4sm830991766b.34.2025.02.16.23.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:31:24 -0800 (PST)
Date: Mon, 17 Feb 2025 10:31:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Timur Tabi <ttabi@nvidia.com>, Dave Airlie <airlied@redhat.com>,
	Ben Skeggs <bskeggs@nvidia.com>, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/nouveau: Fix error pointer dereference in
 r535_gsp_msgq_recv()
Message-ID: <b7052ac0-98e4-433b-ad58-f563bf51858c@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If "rpc" is an error pointer then return directly.  Otherwise it leads
to an error pointer dereference.

Fixes: 50f290053d79 ("drm/nouveau: support handling the return of large GSP message")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 2075cad63805..db2602e88006 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -348,6 +348,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 	if (IS_ERR(buf)) {
 		kvfree(info.gsp_rpc_buf);
 		info.gsp_rpc_buf = NULL;
+		return buf;
 	}
 
 	if (expected <= max_rpc_size)
-- 
2.47.2

