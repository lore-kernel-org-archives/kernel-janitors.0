Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E623D20ADD1
	for <kernel-janitors@vger.kernel.org>; Thu,  6 Mar 2025 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254521; cv=none; b=TOdvE9h1kUSDQ2SxEUGokM0k9/EKUZlAtc9BNmiAJ5u1gL2+Zv5onwDzSY9+gC0tHYrZsHuDboEYGvigKf0k3PWBncCFVttBXEy/jQNakL93SaiP/KVkJML0KjrVQntcL/Emj5jUvNoxN6uLvhEgaYHhQQiVgYhpA41QcGNTamo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254521; c=relaxed/simple;
	bh=RJEAUzoNnPjXojDrx1lfGnTyV5utsglqX5RvWoQNM3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lZfcVUjRzkvpdomObbYi5LyrdgdIx508H3fOLieK+FibrY3aP/59Pb6uhF3R6Nc8aBgrRHhz2fG6FTByUTQtkWPJeqaAEyFoM/Gfdu8wgSOiF3kRHmE4OXLtzEs6IkkTqT+XonYtvozaa7nzdGjcAPdlx1nmmOkLzyNeMBstMJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xeP4T/se; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xeP4T/se"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-391211ea598so296742f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Mar 2025 01:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741254518; x=1741859318; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dYb6T/3vLosF9o5q+Y5UiX2/6xC2fpf9CrlM4eItM9w=;
        b=xeP4T/se9LH8ndz4Z61G3FKvdCQlcnEL7DSi6csfa3TbdnIlLsFbivnOiwI1Du52kx
         cwfkJNoXXCMgUIMq933n/oyyXy4rgdFz1TGw+s2SsEbe0aUc8QhlUl2kTOF8V5N6lqfd
         96TSlKT3SbAGge8aINCkOHiekbL4M+Q1BJcoqclUmJEUya1DnT8wrPp8R36aurMHnWkT
         zgtps8ModMJYBrO4Qzabx8Z39Z7KocHwtDoikxTZH2lV+4pwCWRP5k5wqyqHyzuQEdj1
         8zdZeThdz4AdE+0qfmgpqpSFdofGm9EZTZ1DcNyAHe4H46CPrFMa06AWTZQndp8ndWM6
         bPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741254518; x=1741859318;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dYb6T/3vLosF9o5q+Y5UiX2/6xC2fpf9CrlM4eItM9w=;
        b=MiD79pSTEHdzGabm7U4LsLOQKMHd5rS992EsRPSdNhfPuB1fWPpzqRHTDMJzkyRbGQ
         KpnsxLpROq1sPY5JwZXvYEeZlOmWBDwot4w7AILEpcEpz7ZuAMEziIhqbZzgHWzmdqIo
         LGYsg0KF01SLMuZugeZlx/cw3Q+YxjuNfn2c5BZy8aGUZPmi7bK6d/S+hd+8VdJW1GTc
         D81uAeqi3XAxlAjxqq6gMBLmjgq5gzmxkNUmipSAwHqaBbOj0O/ZxW3djBjEJERPkiwO
         GJpUhh7Ta046b9VIExqjsOia8E9gBpr1pgpugH04cAhk+D47wVjskbmadDzAa62H8IGJ
         wbLA==
X-Forwarded-Encrypted: i=1; AJvYcCU+OUltkx/z5Bc/HdnTT6wguqVndYu3aF1UJWTlxwezjeRLGFAie9fpkNszkYy8ee0bQC7XFsValnnLaOx2FVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3qN4flRTf44EWCJBPjQTfif72r6dyM6vdrOtp/5jodThg73LP
	K0yReMxcAeHc8TA94ZwiNdRuFYjBIk53awCGJXeJzfAUETl9WM2oYE2HWfn3lUE=
X-Gm-Gg: ASbGnctrF1cr/8OVFeFc7ZBSgHftUBSG0hUrKUGJ9Mls+cj7qbnuqCGK2Nl1TUCZRKr
	3u9ed00XHPMiUkbA5Mrcx1bf0N/YxHIdC5N/Gfj/9p0SIOUgHe8RmZeIRHj7dOmMUNlKXKhGjw3
	ioO2VnLDWin6gZ225Xh+/mXWl/dRScBC9XLTiE9dfr5mOIlJwod82bL2pYDes8pNp5I8jVlEuYr
	sKDDbaF/S77WLMfMgw9lxzP/L0NjiRc9uk0hrwiT2A5BqsbzrRRl+bQIKr+DVC31idoc31LVr1E
	RSyauLpsqeIJauPtgumf56Arak/mZdoMSExed0VS1qIZeGbEnA==
X-Google-Smtp-Source: AGHT+IFBd/ryvsqo4SuH5AoV+P7wyT4wM81i1izptWSUavGGlpTSK4T7eUmgeLPy3GMlZioDo8QvWA==
X-Received: by 2002:a05:6000:10d:b0:391:225:9521 with SMTP id ffacd0b85a97d-3911f7bd8b2mr4846113f8f.38.1741254518181;
        Thu, 06 Mar 2025 01:48:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfba66esm1527318f8f.18.2025.03.06.01.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:48:37 -0800 (PST)
Date: Thu, 6 Mar 2025 12:48:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: stm32-ospi: Fix an IS_ERR() vs NULL bug in
 stm32_ospi_get_resources()
Message-ID: <bc4c9123-df43-4616-962f-765801d30b4c@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_ioremap() function returns NULL on error, it doesn't return
error pointers.  Fix the check to match.

Fixes: 79b8a705e26c ("spi: stm32: Add OSPI driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-stm32-ospi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 8eadcb64f34a..a544d7897edf 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -835,10 +835,10 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 	if (rmem) {
 		ospi->mm_size = rmem->size;
 		ospi->mm_base = devm_ioremap(dev, rmem->base, rmem->size);
-		if (IS_ERR(ospi->mm_base)) {
+		if (!ospi->mm_base) {
 			dev_err(dev, "unable to map memory region: %pa+%pa\n",
 				&rmem->base, &rmem->size);
-			ret = PTR_ERR(ospi->mm_base);
+			ret = -ENOMEM;
 			goto err_dma;
 		}
 
-- 
2.47.2

