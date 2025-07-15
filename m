Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810F32C08AB
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 23:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620504; cv=none; b=oB/1fnUeFAN34DnA5UaKOOyXnlHsd5p3TImucXIsDPXbecygO6Y1Tyf25+grDuWuoLvW9mYPr1Q7Aa/JSI42VEMsns8E0vQj/QBd9Ffyy/Sp8YooDFPrEPua/X/w5O1ZF6IpCbn6qMDdEsEdA9FUeLw+xezJQu52guM8bARyaO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620504; c=relaxed/simple;
	bh=hQBUKhXoZhnrg3aw/tvNsOjzOzq2grhpIyy5kdu/2c0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L2GdjBpRjylK0tNRsozyQ/EUZA+TDoQHfGfvDpPX9TyC7BfdKUpPIpDYNJO/FlerbYGObAe0f5hA5Oh34O1sGuqVTI50Wax3a5AnJNou+mvqq9iGAhMipfXOuFr9MofrhyORAgfKlBjspFTh2wEJ6cHsZtLJ9RqcD4VurkuKEfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZlgdwIIJ; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZlgdwIIJ"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73e62d692fbso405465a34.2
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 16:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620501; x=1753225301; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46gEt3Bx0FBkn/nnSaRTnSsikfa6dw7cUtJIKu/AHuc=;
        b=ZlgdwIIJ011E895kg2zptBdrs9U43kLvRAKy6PQKD1kWhY/iaGFFzEVUfrgwhUuApL
         trsdjGVCzlThPDvGOid/rCR9SjvfM98yZLoBqsp8xmyYDh5BqRg2vJVM9rM1eTih6Fw5
         PTNh7K9Z3L+Ir4n/cVXUXudf9KGJ4OtuBkB3suVO9/yoVbmVq0Qpp8za1ocHAYNtNs15
         PPY7ZR9e9k6Fs0jIAcfnA1UZjCsUSGGpH2nnY2qb/TgGlo6ezjLF/WtprGJ2p0Y5KuqM
         tB4c3O6XSHww39/wRLV0pskukIycGfh4kqQnhIWVqKwabYuXU23xw4bM3Skr57uu1pEi
         MXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620501; x=1753225301;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46gEt3Bx0FBkn/nnSaRTnSsikfa6dw7cUtJIKu/AHuc=;
        b=LaPIKWFmgsdFmO6UT7T/eGcKhQoDEtzesVzop/4rVu2QuqnqyJ+RI/bZK1FZCd6CXk
         RUCCfa5Je3HX69h5sdOI4UUXUKp/0zH0yNtjvtQK+dvtwG1P1U33LocsyKUinX92f9YO
         SH7vtmLCDccnkKKpK+nwwBIvUq5VNon64VgsbxyCZOX6UMy5g3oyXF2Q7DpmLuoOryp5
         IjYjXlrqivvGkWyq4R5HgxU5CtbfTUCJ1oe4Mgf08SAg1AqX4t59jgBMQfc5zJuV+lbY
         Kyr25+GOh8VfnB/zZR+8yLRX9TTBHVo2gl7APRX7hg8K+07nlF2hY8fbhWUA/dde86mp
         dbjA==
X-Forwarded-Encrypted: i=1; AJvYcCV0e69COo8mBXbvWzmQ/NZTGHLvUrJwYz2h5yGTjgAL8bsPQPQkr/hi7HCe/MDDzip27DyFtNYDcj7tOEbGCAU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5X818QZ08yNrSwVgHCfn7yRnYCxFhjetSM7MAgtYQ9o1JLXql
	euj1SFcQSW6CSgOb7qKRRCdAPhjfiHN4UjbvQxxB0hEYdNjF/iKhxAO6o9Zzj44oemI=
X-Gm-Gg: ASbGncsxkqKEEWLipY9Qn2sVUr5jwc0sbyOwcMqoDLEjlmGNXfvb47bQSKNGWsfrWn/
	FzjRNWN65HHuSlP3xeTDB8m12dvEa+mAH5BJSziu1a5UN3Oo1LHGYNzEYnUTBkNOfAPtzTl4pHb
	xMJ84FF+e/YXTaZpKxrngdnJt15GZQGQ4HFoXXfBmpez1NgCVBs7562pwJOidgY3mPojVQU234n
	UITwr+RVV+AzmEbGVUTv61cZ+Nmmr3BZ4mNTI5g/j7JWfMhGViDTyjhdnwa/r5MGl/wJeO7ITml
	5sq22xE9tOy+c8C1FLeHN3MFICObtSovqmGGg/gfYhup56HyIbyBlQx5clfNyQf32ZVCks7akAq
	xd5wEre8MedLhxjAWl+q8xGYHc2HYYb0anQXlapk=
X-Google-Smtp-Source: AGHT+IFrIo3qo3Xq7DrVRugRg16jg4aCYHopevdB0f55AiC+g1RwMciM6Lgy4L9vDkABRNtjnbIHXQ==
X-Received: by 2002:a05:6808:30a2:b0:409:f8e:7272 with SMTP id 5614622812f47-41cf0cb0f3cmr543563b6e.38.1752620501381;
        Tue, 15 Jul 2025 16:01:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41c73a25f04sm457282b6e.0.2025.07.15.16.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:01:40 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:01:39 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: stm32-ospi: Fix NULL vs IS_ERR() bug in
 stm32_ospi_get_resources()
Message-ID: <fb2a26a2-119b-4b5a-8d44-b29e2c736081@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code was changed from using devm_ioremap() which returns NULL to
using devm_ioremap_resource() which returns error pointers.  Update
the error checking to match.

Fixes: defe01abfb7f ("spi: stm32-ospi: Use of_reserved_mem_region_to_resource() for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-stm32-ospi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 72baa402a2c3..f36fd36da269 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -823,9 +823,9 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 	if (!ret) {
 		ospi->mm_size = resource_size(res);
 		ospi->mm_base = devm_ioremap_resource(dev, res);
-		if (!ospi->mm_base) {
+		if (IS_ERR(ospi->mm_base)) {
 			dev_err(dev, "unable to map memory region: %pR\n", res);
-			ret = -ENOMEM;
+			ret = PTR_ERR(ospi->mm_base);
 			goto err_dma;
 		}
 
-- 
2.47.2

