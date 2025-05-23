Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9298E22171B
	for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016496; cv=none; b=bjoHK3uHVrdziXTMmLFGtNiscZllNFF3XGy6YAwI8aeQpk+kht/YLuKeuU3R49tbFkDos45o6v9HoR0NQByjWvZh8YcOdp6FM0zsg32DSiMe22JcqWvJ/UO0YwgrY2P+3lcfh6Esxo9N27DE/hJnwYL9XESJ5BmssIcmf+l8smw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016496; c=relaxed/simple;
	bh=sOSd52a5sFsFjNwgnP65YA7nbCno1YCXhcKexikeCZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=feJHB+bLT7lZv1wQfo3KLH2X14sSj/2ZZnnGCKImHV0zBX6Y5tqW8x7qalEDu5xbrWAMDbcUPF6IRijUVseILOpyDtcVolHzm1kIhra3zJLBpUXbTD8MVPp0CJbxzhJqjQXucBSc+odzx3W4FoM0pn4zr2wSrKFESQv+BbP5LqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bzPNEBgV; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bzPNEBgV"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-550e2b9084dso50128e87.1
        for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016493; x=1748621293; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGF7HsXVnOrqTUKvr0Dj/ZLjMe7xNdGfL36SW0iFLZk=;
        b=bzPNEBgVxyGsYJJ7eQHtLerihWTYCCEkDyX9cuKt6YisD0fR0xk5rhH4jBPfJz4Yeq
         7D1qaq3ekppC0wUGiz5vUdTM3U/DK6ZEJSD/CdPu82WFFoic4Se6SzyHhtftRwxdJRHS
         Qyk8WhHMjxUOLs8e7iq7sGzgVdE5S93I4Wtqqh4Ycuqi9x3s9ZsUV3dF9Jniqc78e6z3
         +nIzV+bzmraVqMJymNgxAWQ7nMU1E32dWgs55v0pA+JFdjzXs297pffPnOZn04a9ka/k
         +dpiJUuyzlgNowCeng52k8FD78fyigYaOzmMAPhTGVi0wffKG1y8vr7MfdSWZ9WByNon
         WK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016493; x=1748621293;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hGF7HsXVnOrqTUKvr0Dj/ZLjMe7xNdGfL36SW0iFLZk=;
        b=vKdcL7RW0rJKDhDYVvIA3WU/4M96+XnN5IIf/zdxs6IdM+Qv0ycdG5GJ7XqF9MRP+q
         jGYCTsWW/BcKnZ53961Lh8O/w73l0c+AdqytC5jPF2WpWj3Oh883ev4RvMdYeb9FFnL5
         3K/qmnonAQaPyS+jYUazoSsWptqGQ4JBw1S8KfU22/o2HMmQ9C5PepfLrQlQnsFbcsFQ
         il/FefjlkMDm6ua/gOTE9OdGBPOegCj0aTu7iSeR+CDWo9GVsZ2Qg5RJ0EtDpexFT/jx
         xAe9XSQ8B5ge47wu5I+KUNH7P5AUn5RvNJQKz9rEXpRWOw7OLOx8ye3P8WkGdTGdPbBJ
         I96w==
X-Forwarded-Encrypted: i=1; AJvYcCUNsfHJd+2cTN2OjLAigGZhr/W7umVL0YS0jGABNA5UVIDW5+tc7cZOSy/GwZi0taHLTdqLJncRlmFdWi5Ddw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDSq6nnYqVNAfhUq7gDjcfvMKUfiKUqVlIRZofvsb4FwieajjR
	oCo+tDhZ1t4edtmJ7/bhuxLlPICrOBm6eKMTv1A9UegQWzLWZ4S8NTXSY9miB7kBu1QitD5Vd1s
	UBCX0
X-Gm-Gg: ASbGncsWMNfk7RiXJr2E4FtWTNVIaMaQlfRbLyYfj8j9IknyawHleQYl66NUtvM5Rhr
	pgec7ML+zPV0wmXbzmK1f60GZV+HF4v0N1sY6Efo3ea/wWDSDBiNOvO+QZMMwB7vgaabgbnYIDO
	VoOQU9KdP2isBWk8gRD7xaiSKlN2OHAX3H0OIaDnVQkZC4tGfJR1PTORfNBtlD/YHEeIOzO1ZuU
	jJYn4JFZDUNH1+Ri2vBZrKbZ7HpLmolyJAZmrT0mr1sMzUImiYkEQh2U+q5GqfK+OyuoPkzKCuf
	L1rDPmkEv/fI/OkdD+m9u1Dax8EJYAMd+wTW/+bgkef7djLFAnaIpu4P
X-Google-Smtp-Source: AGHT+IEgnqQ89pTDpIiXTK+5YoVr8iR1h5pIE/WFcVljNceH6shNrv9ACEId9Fo5qIq8B9APct4R0g==
X-Received: by 2002:a05:600c:3b21:b0:441:b3eb:5720 with SMTP id 5b1f17b1804b1-442ff0396b5mr274072555e9.29.1748016482352;
        Fri, 23 May 2025 09:08:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a368136014sm22978069f8f.92.2025.05.23.09.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:08:01 -0700 (PDT)
Date: Fri, 23 May 2025 19:07:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dave Airlie <airlied@redhat.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Timur Tabi <ttabi@nvidia.com>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/nouveau/tegra: Fix error pointer vs NULL return in
 nvkm_device_tegra_resource_addr()
Message-ID: <aDCdXk98AhLBcWvK@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The nvkm_device_tegra_resource() function returns a mix of error pointers
and NULL.  The callers only expect it to return NULL on error.  Change it
to only return NULL.

Fixes: 76b8f81a5b92 ("drm/nouveau: improve handling of 64-bit BARs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 0ca2dfe99676..114e50ca1827 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -196,7 +196,7 @@ nvkm_device_tegra_resource(struct nvkm_device *device, enum nvkm_bar_id bar)
 	case NVKM_BAR1_FB : idx = 1; break;
 	default:
 		WARN_ON(1);
-		return ERR_PTR(-EINVAL);
+		return NULL;
 	}
 
 	return platform_get_resource(tdev->pdev, IORESOURCE_MEM, idx);
-- 
2.47.2

