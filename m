Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F2530D0B
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Nov 2023 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ePct7L5f"
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700A139AFE
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Nov 2023 07:18:36 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9dbb3e0ff65so820795366b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Nov 2023 07:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699370315; x=1699975115; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BUSa9JJh+Y2Tsk/ZlJbgPDREcy0mvtW6TANBnqjh1wQ=;
        b=ePct7L5f9CIStUt4cDrBemjuf0OBUK1z0ok4/wJ7z2grny+bWIwkF0v9NwRSygngQF
         ngYmbdwiPhjBMA4uiBCoj16ArABUuGHZaYRASMXYSRwT46LXmq7gSpONSGgcz6NzpJde
         XrGewJPJjMn8pcUJl9AKw6jB/chk4h8viDAFern0zViKZZGPBuswU8L4x9k/AFCUY7Mx
         YW1n+Pa/SdrEbecdLUHKFxukBXaEBUK0fN+dCwfive61Ls7zc6QO1H4dC2jYHuPJf7Uy
         kQvn94HBabT5SQwHlvVXl3pymCr5m6u1Ts0pjwSA/EmJ5CFcBdqQ2t5QwB64+eMmCd5a
         2fNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370315; x=1699975115;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUSa9JJh+Y2Tsk/ZlJbgPDREcy0mvtW6TANBnqjh1wQ=;
        b=JFQLIhF00RZcVBoRBrOUnqHoZaUlcZJOef4/cqyns0Ts1PPFR/9cKZd2GrW/jq3Aya
         Ja8fsK1azyNsf4/vxH+cjPrENXpfgNBY7mJoFGcyppsFiT2k7hC+SLe3dnSmqZ7kZ+o+
         nJxdt4v5m+ZUCxrM8+TeXBUYi2urSinqJ1zplBoTGKAANz8Wn6cyFgHH7x9qXSRrC9tG
         XD5H8YH1kL2EP071wFXsN37+rlAEubUJH5atq4SxpB/ayOujtS/9aaSbaoKW60Q2v4Qh
         bqWknKsTSEOyZsuoZfSm1WQKUk7gzL19HROSX/LKE4sHfnHfGlolVzWt1Rawz5OYTcBS
         DagA==
X-Gm-Message-State: AOJu0YwgVcvfYlnXLx0JtcyrKgtFjBwMSU+1hzykZYm/g40dK0DQBWGC
	bSOq0kUkDjjJc+qWF9WY8rWHzw==
X-Google-Smtp-Source: AGHT+IFg6GPZSi72q4OKki21JP9gaI3a9ZForMI5DrtJhxl7g78VZhTmgTSiHs8/MHjFffQFk6b3jw==
X-Received: by 2002:a17:907:7fac:b0:9c1:9b3a:4cd1 with SMTP id qk44-20020a1709077fac00b009c19b3a4cd1mr20872644ejc.3.1699370314775;
        Tue, 07 Nov 2023 07:18:34 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id lg20-20020a170906f89400b0099290e2c163sm1131200ejb.204.2023.11.07.07.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:18:34 -0800 (PST)
Date: Tue, 7 Nov 2023 18:18:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] nouveau/gsp/r535: uninitialized variable in
 r535_gsp_acpi_mux_id()
Message-ID: <1d864f6e-43e9-43d8-9d90-30e76c9c843b@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The if we hit the "continue" statement on the first iteration through
the loop then "handle_mux" needs to be set to NULL so we continue
looping.

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index e31f9641114b..afa8e7377a76 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1159,7 +1159,7 @@ static void
 r535_gsp_acpi_mux_id(acpi_handle handle, u32 id, MUX_METHOD_DATA_ELEMENT *mode,
 						 MUX_METHOD_DATA_ELEMENT *part)
 {
-	acpi_handle iter = NULL, handle_mux;
+	acpi_handle iter = NULL, handle_mux = NULL;
 	acpi_status status;
 	unsigned long long value;
 
-- 
2.42.0

