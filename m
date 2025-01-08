Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392D71F0E3B
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Jan 2025 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736328532; cv=none; b=hX1WAapJtCslMnkejngTCE90A9Cm3K7yjgPTrDhCnXlKDmRXLdmMbd+ZOndeNNjcyglKxzkGAnheSEpN5Oyit03b887QPZJKuVnKkccm3vcNUfB4tCFx2SZIBoMMouYTKONXhoY2uOpElG0QYnfLji4zHwBSiK62wE8rIB4Q0Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736328532; c=relaxed/simple;
	bh=yA7y97nb85po90Zmk69+gL//XzthbasJe+UKvQBCBIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AOQJVu2BtwuCd5Bh8FR/pHcGWfPyJeBlzh/AO+t8IvDJJkV161H78QZHj6i8u7dkkDmDt9dp42SFufm7nfdz91wDnc++kdKvfsFdQl77R06W+IdIlfbxQxXVnCmWihOQFuZwdwt2oJQ4261MUIytgZ+An6znNSBXEIWwJRSSBhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vrv62d0K; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vrv62d0K"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so32273505e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jan 2025 01:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736328529; x=1736933329; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ksX/kLob51zQcWxh1cMQc5uB7HVLI56lSlw1NK1rQYU=;
        b=Vrv62d0KBPN9aT7G2fo5sRAsLw8PLpQzbuSWTiOTOcNzO14J8fnCloQgcZWp+vQQ6Z
         ioGAewjcotWKLQjXrH3+PZO/W5zPNyN04BTvD3Gw7P9U4B30GOLOKiUqo+soA7GkXfk+
         7ShBx+KLuCUyIH02GGBh2aJOHp2s++6fprb7RquxyktEpPwf53Oq6siW1Lo4vaZFpn+U
         jpgq0zTz9aI3uiJS1rltkK/WTWIEcYqQh2BYHmts8eQ7KwbTZY01uPXhGhw6Mrk3LYZT
         Jgi+gjpL9DlSfXjsltToLgTa7XrGPaDz7B+v4pB+vnOikr+RRoQAYx1pYt47kwnu8umD
         k7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736328529; x=1736933329;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ksX/kLob51zQcWxh1cMQc5uB7HVLI56lSlw1NK1rQYU=;
        b=CCnlz7aNp9E8PHjATvUp1i7IB49fF+7Z4I1qFHOXUNSIHWVjC1h29yvwlY3D/gbaIV
         miUVyrcM75YuEiDD5v7T/0mQnm0nnKAXhGbyXJfeqA2S1DZ3UDPhOhBxZrs8DK0bkEMm
         rfJBKLpPZPdiGcBz/xRleT5RZJQc6qSSmGzSjKv2wB6h5eo6+4Mv3LPCl7WZK+rgH0ce
         OCdpzMPyDY0I2POBYV63FIyRzHjzgvT3ymrAp6pIOOnRdyLvJiSJZgKm0aS/SDPjfG9/
         g2ngBtDDbgGi+5PRyCnDwrRKslquHxh2Xury78I8dCdIBV63MqOHUbgf66onC4ggfJ+6
         kV4A==
X-Forwarded-Encrypted: i=1; AJvYcCUw6zwabDkwMsX6GDkKYT5FaEXE1wVaztw1CXT6PItpENSeBOGT32L3hCbkYDfn35zbAj+yyG0n6+EXwQVPKEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIt5giC1bTgL45QBR2ItaYBwt2DTEvZC3cN9J4b78z1R5dvuxX
	OxAqTu3MZOKED9BCbFW+xV8ul97NgYxA0mjgiRQG16NXImeyVHtTkoz4BFdikwk=
X-Gm-Gg: ASbGnct+/XYnE8ljkjH1u7ExyhP8iOazCYuaPTgPXxFCODPuts5xw/ONrBv1St8A8IC
	p7i45AAiHYuQcp87lFvX/HSw9brrbAby3DA1/9Y3J2qqGOAqn0vOMmc764/LhMS5ff4eqD8gePM
	ojw27LVKvtXNis7saLB/RF3vGClLQRz0m0oE+JJPncbxiiyUZXlZ3G93zM2osJr2C787njVBQ6D
	LACIM0xaYaqDiZMiKBC2nIllU0XQu+KaJLNWjYDdpbsW+jE4t5E33eMoHiJSw==
X-Google-Smtp-Source: AGHT+IEbOKQpbXnV0Vk4QEqZakle2mY4HuBVWDf4SPOXo+NOnQPd/LEFfiqdZj1V2NZzu8Gu4CgtXQ==
X-Received: by 2002:a05:600c:1d82:b0:434:f953:efb with SMTP id 5b1f17b1804b1-436e26f984amr12953225e9.32.1736328529560;
        Wed, 08 Jan 2025 01:28:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e92f60sm13995695e9.40.2025.01.08.01.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:28:49 -0800 (PST)
Date: Wed, 8 Jan 2025 12:28:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: renesas: rz-ssi: Add a check for negative sample_space
Message-ID: <e07c3dc5-d885-4b04-a742-71f42243f4fd@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

My static checker rule complains about this code.  The concern is that
if "sample_space" is negative then the "sample_space >= runtime->channels"
condition will not work as intended because it will be type promoted to a
high unsigned int value.

strm->fifo_sample_size is SSI_FIFO_DEPTH (32).  The SSIFSR_TDC_MASK is
0x3f.  Without any further context it does seem like a reasonable warning
and it can't hurt to add a check for negatives.

Cc: stable@vger.kernel.org
Fixes: 03e786bd4341 ("ASoC: sh: Add RZ/G2L SSIF-2 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/renesas/rz-ssi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index d48e2e7356b6..3a0af4ca7ab6 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -521,6 +521,8 @@ static int rz_ssi_pio_send(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 	sample_space = strm->fifo_sample_size;
 	ssifsr = rz_ssi_reg_readl(ssi, SSIFSR);
 	sample_space -= (ssifsr >> SSIFSR_TDC_SHIFT) & SSIFSR_TDC_MASK;
+	if (sample_space < 0)
+		return -EINVAL;
 
 	/* Only add full frames at a time */
 	while (frames_left && (sample_space >= runtime->channels)) {
-- 
2.45.2

