Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6139C262FC1
	for <kernel-janitors@vger.kernel.org>; Sat, 29 Nov 2025 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427847; cv=none; b=OV44T7wDA9qWq/mJ2kyvOAL3+GoedqPHXzWki5lNFXz/gq7CUwWLA2JJ7xNWjtpL4JTr/AE6XpI0rcRFqjzOO0AlWEpXhRInVPymY0E/0kdaaQ/qPlvMNXrCk7DjyKhGXp0fkzn786i+OF8WaTfdEb/snDrU1eLr51Sx0H2Wj+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427847; c=relaxed/simple;
	bh=J5zPGbJTnILt+tpvDM7cBZAP5RPjho+gmkFk+nltQzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DHkYGRR3IPCR4Y1TTv2fohVKMniM5cBIik7Sixp0xumBir9NGIa4aZ19rHFoiBD2+K3L3t+gUX1PvAxyoREfMahl40XuaYd+QpKiJ7Vdub9ovteu8UqJ+JG8TAmnZyjEC7qeCnZPPwtRBRhYtJ92eqK9iIDXTIHJ0sg1ZIlWfKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u/hVpss+; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u/hVpss+"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b566859ecso2592725f8f.2
        for <kernel-janitors@vger.kernel.org>; Sat, 29 Nov 2025 06:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764427844; x=1765032644; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m+0Wdrus7bMlJRqb6V1pME87+u16xr1L8R/gLBLUKRI=;
        b=u/hVpss+JAswZ1ZM/KEAnUOOqJ+mH3ZPwrH1u1VqEXwRLox+YH7hCApQSzXrzaQVO1
         Dx1OKG0r2OazK0hn66splmpcUZNnoydY9t48uH5Ry7RJuor161684g2OocWrb4/KTj6y
         3yJRia1HNe2nqYhKinSPMtRVLJ3LCUCb+g2WyVafV1W2ucblOtS5BzmS5NXRyCmiP+zC
         L6ePNkNcPXBdg3s2x7CWIrKxvDRmWWjDBGuYGDsCld1Ny/ve24cbT0NiMtyEhzIXtEuM
         J68dPyLAzXM5KM/gU6mqPxCVpVUn+HGLHH4zIN1sIIsNsx4R3sMi+2uciVkOzal+MyPR
         0yTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764427844; x=1765032644;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+0Wdrus7bMlJRqb6V1pME87+u16xr1L8R/gLBLUKRI=;
        b=lYB7CyHVtAmN58/5foOk4qEL1m+w1fhkKbT+3+qdlN6gQ6ZK0gAkH1HPvuPJ8Qh0Co
         /ik2QOKz0SpHiw1PlgWkS+nzyX+eQO1vMTqWYEkA3z1ffjv3WnVHPzq/HW4hdprVIKIQ
         rnx1G3HvX3SlLt2tdYuEZpM8qEckEpUQsGY6cXbG7DJQunbGq9bvycRQLTlPa3IU4RwE
         lPvmhXeVOdEDsWmueE4Y7DyDTt38FCPihxWYXGsQ0C9KPqttiTChMdOL34unz1u+QTHJ
         Yz4hWMqnYH2LA2hLE1btuesnN48SgTU0qt9yRAwK36ptNS0x8z2PqvQGqJ4yv/IEKWEu
         YxKg==
X-Forwarded-Encrypted: i=1; AJvYcCUElfVvBjLEjsGU8MhGlV3xen8JayJ+Wo3u2GSmA1iuM8+WQqpD+g0xjICQOx/aRJU0xF6NQzRiIvaYekI4cjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLAMGApOnDMHXXbQhyr82uENw49/xcpOQomG5DPvbLESxHvxPA
	3rIyG+GtA5W6gR0i2LRHQAEsSHvabdKoCNco8s0pnjx/+zLiDzJV7X30eahOvXPhWrA=
X-Gm-Gg: ASbGncuPaoXUs3NEpKdXL8y/KpeUPIs6rICgK5IcNGZ9vmuFXU+82sZS5M3tdxBzuMg
	gyY2YOlqpoQ9tph7d+Ovynt5bRgOYRkgY55XnCGMKcRSY9K4L7Ow2F07KdqI7fhIl6X0fE34q+z
	Gv16gS4orjMrRXKRChKuGCedV9tiQwc6SNyIUTxJZY4SGP/ueaHw1b0U/jvixUxyJj39yq5ogUV
	CVckJH4kD2HSISYDICxJyXHSVxbZMmltniWpW/XYQ946GjdS/HlymxOLjx3ql2gOyTm32l6lPCN
	9wTxqBU2SST9ROthKGmU0/fvqHZmgGZ2laNJ8JBrDhraxojUIBSkC4ejnFkNXjy42TSmm9UMCfV
	L08ul7J9wvGBauUewm7GnAMNfj6Lqed3FZABD6hNW+ouHw28R1oWrFEF190i8nKC+cITcS7Jfk9
	vXSiLGmTtgXcyBNC/Y
X-Google-Smtp-Source: AGHT+IH4TkVKjgwG9GJixr3YdNDKWfYNOqAZur0LDZWb7kXIBUGv/MfkS8v7aEbUV7sbsGFPBt3PuA==
X-Received: by 2002:a05:6000:3106:b0:429:cda2:9ffe with SMTP id ffacd0b85a97d-42e0f1fb97amr21173345f8f.7.1764427843628;
        Sat, 29 Nov 2025 06:50:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1ca9aea3sm15375037f8f.35.2025.11.29.06.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:50:42 -0800 (PST)
Date: Sat, 29 Nov 2025 17:50:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Peter Rosin <peda@axentia.se>, Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Davis <afd@ti.com>, Thorsten Blum <thorsten.blum@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] mux: mmio: Fix IS_ERR() vs NULL check in probe()
Message-ID: <aSsIP7oKrhKfCUv3@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_kmalloc() function never returns error pointers, it returns
NULL on error.  Fix the error checking.

Fixes: 4863cb2b0f50 ("mux: mmio: Add suspend and resume support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mux/mmio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mux/mmio.c b/drivers/mux/mmio.c
index e4ddb1e61923..3409af1ffb80 100644
--- a/drivers/mux/mmio.c
+++ b/drivers/mux/mmio.c
@@ -101,13 +101,13 @@ static int mux_mmio_probe(struct platform_device *pdev)
 	mux_mmio = mux_chip_priv(mux_chip);
 
 	mux_mmio->fields = devm_kmalloc(dev, num_fields * sizeof(*mux_mmio->fields), GFP_KERNEL);
-	if (IS_ERR(mux_mmio->fields))
-		return PTR_ERR(mux_mmio->fields);
+	if (!mux_mmio->fields)
+		return -ENOMEM;
 
 	mux_mmio->hardware_states = devm_kmalloc(dev, num_fields *
 						 sizeof(*mux_mmio->hardware_states), GFP_KERNEL);
-	if (IS_ERR(mux_mmio->hardware_states))
-		return PTR_ERR(mux_mmio->hardware_states);
+	if (!mux_mmio->hardware_states)
+		return -ENOMEM;
 
 	for (i = 0; i < num_fields; i++) {
 		struct mux_control *mux = &mux_chip->mux[i];
-- 
2.51.0

