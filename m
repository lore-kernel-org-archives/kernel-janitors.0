Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6816A12C53F
	for <kernel-janitors@vger.kernel.org>; Fri, 10 May 2024 15:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715353845; cv=none; b=FvUhDhIMm7ewxPdzFVH3Ys3MVmx+hkXVm/VOe+BV9D4mE1jvObkGpA9Bf3ENqUjTcjwlX23l7i/kL4TD3ZYn0zJ5paG9ju4+9c6ewZfon7KuLuGvD4ShwwQ8rrK6VLZddPYqgz6b//sd1n1r075MBDtV07IZqbC60ynMP8ctiM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715353845; c=relaxed/simple;
	bh=+6E1QWCdVlRF2Y2CqF81C3CJFrg1T9UMcvxSi9JgmAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dKKq3vg3Ie0+BQiBp9pRcqZSqdZXQU+G/r8q/NU/I2coUKroD6+hfyE5Zj8rv6M/HIse6uRVhK0z0GoH19b+lyxJAipn9D8NcGBLJ4Ia9yeSsAU6cqPReshRzVPOwoxNnL7yqtTFPUtd96WcdUeHPpI6F7YcW8Aw9iqEkApT+2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OcWpxyUZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OcWpxyUZ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59c448b44aso567395566b.2
        for <kernel-janitors@vger.kernel.org>; Fri, 10 May 2024 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715353842; x=1715958642; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S0b7Me9PZDwaqOlHu5lGpvnIETDgfY8E0wv6t+cYznU=;
        b=OcWpxyUZfXPfg0uKeVjmrIhMlYImkiA2cJ1kanM10vMrZY0LTU4VDGUAWVkHrqr29U
         MMZ2s7W+8/Q2tTz4XrZqlmCNEPLiVM/j3Mb0sP3Sc7Stbq+zw4eD+ILv8yugNAyoOocQ
         DUHXOCtl1QMd0tHyANLLDWCTBLNKfrMWAGl6nNAke2EGt7V6IOwl5IL4kDMVmJMJAnu5
         +0wOmRmjc0OJ5O7Zodxv7NtV1hvJvKiGJBOn5kmQ4tcZUF5QcI63CWUXc6uQrLYAbj4A
         XAElsmFwdwTQHlw4SdG278Ccc+uzkTDxub9BMy1V5jGSBl+6VffJWSxoUwIuwOXF0vvb
         ACvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715353842; x=1715958642;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0b7Me9PZDwaqOlHu5lGpvnIETDgfY8E0wv6t+cYznU=;
        b=Qvm9/8ER/EVwREu0C60rkdnswylRhsgGQ/hvH2JWO329ZJvL/BJ80DQ94Btolfl57Z
         DjXFWOf3D4m49O4p7gZv9Dt4bhbjICdTQnRiVNecyu5Pq8OAmjEqew/a9Do32E3BxCQs
         bddUvgSL4NR6oG2PQsTjJaI8hHgf4JkbBfOX7jByjZsRaJpW1EXAX3Teh7/9ZDZLaAGR
         JOHY+XocYSyagoSTVBLtFTQtCo6jze+UkKpLlwWSpwMh5e1/vXkAh28ygimM94OQ9VbX
         4TLSmAxb4UrQr0fj2eYaOxyDL1mMaD8F4+L2+tcOospCWFecBBf2yA/KEbqJXrtOam7f
         3Y0A==
X-Forwarded-Encrypted: i=1; AJvYcCVc3WLGj0sRMBRzhAFVfAxQwTHEFv+3MvqY48cmPhzhBMsP1vALmu3tg/xE4yMGr85yB02Wc16paJzzOPNlNMiN2jlO5386QeGos/CIBEN0
X-Gm-Message-State: AOJu0YzBf9/CxflordYCJsAPOzFOwEpr+uaSFlWYcBc+XUfv/wGvFb1I
	eGvadFAfpSqe+ouStfyj9smMYSsY+F4iqiHoIhexIFdHpdPW5HISyewlVRrrTK8=
X-Google-Smtp-Source: AGHT+IE278hcS/Jr47z3kbE/00DWI4mUA+YI1L1n39yqUw2ZRvvYK93xTf7orCqbrqmfdjKjhusspQ==
X-Received: by 2002:a17:906:aad1:b0:a59:c23d:85d2 with SMTP id a640c23a62f3a-a5a2d66b4b8mr183158966b.55.1715353841538;
        Fri, 10 May 2024 08:10:41 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01932sm189826266b.168.2024.05.10.08.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 08:10:41 -0700 (PDT)
Date: Fri, 10 May 2024 18:10:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bingbu Cao <bingbu.cao@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: ipu-bridge: fix error code in ipu_bridge_init()
Message-ID: <71dad56e-0e2f-48ba-90bc-75096112a1ba@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -EINVAL if "bridge->n_sensors == 0".  Don't return success.

Fixes: 881ca25978c6 ("media: ipu3-cio2: rename cio2 bridge to ipu bridge and move out of ipu3")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 61750cc98d70..a009ee73e26f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -839,8 +839,10 @@ int ipu_bridge_init(struct device *dev,
 		bridge->data_lanes[i] = i + 1;
 
 	ret = ipu_bridge_connect_sensors(bridge);
-	if (ret || bridge->n_sensors == 0)
+	if (ret || bridge->n_sensors == 0) {
+		ret = ret ?: -EINVAL;
 		goto err_unregister_ipu;
+	}
 
 	dev_info(dev, "Connected %d cameras\n", bridge->n_sensors);
 
-- 
2.43.0

