Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B592F1FFE
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Sep 2025 09:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757927678; cv=none; b=jH4J5+TJ7fYgK4t1VnxGpxdNI2AX3LWkzitqvD+uRKny2aQ7VBFjXgOAqCcMG06CQ+q+D8WbgI3ghqqswPYOU0ik98sK8SWz8wchvllYN6tEl8SxmPGoVoIj5QD5L88mZW4BnYjpNWi5mcpXpPpW25I8EVYez/PBQDhBUZhCEPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757927678; c=relaxed/simple;
	bh=KmJnxss+MoY7NrV8YJ1jLGKE3+2RMVeAE6TDsl1qkWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caQqzbQCLFL+q3P61ve+sMxHiW0349upcKYy4EN+rFRR26tww6l1tJdsJ7MWJxNZv80kwyk90GNn1zEVFC6NUxKaiU9JkWC9uKdyajScK/sAboPY3dDgZ825HhVsGWdaEPGHy4n0cjeacNiKt1eXJbapKDLZMoKgCHkGOwSvwQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S3Bjprbw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S3Bjprbw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45dec1ae562so34916635e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Sep 2025 02:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757927674; x=1758532474; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aku+CpnvWW9zhF6+nPeIxknoBC5KeYin4IOVLZZ/1pw=;
        b=S3BjprbwnbQU6XcqP5P+Zvo7Aas9yso/B+OpSv9rTj/9QzlJC0VSumIHd1Y8DIczhp
         KtC53YgreatyzbudzsVo2WlawgN7P2goKo89P2d04wnqPeD4z8nlxXejUHTA3PT4mhzi
         iggN2G6vJ1jhxzyRhPYQlJDCdQplE8Jx+qGU+IHiuvV7NZ6E4mfsM70m3goEOvZsqLJJ
         7erq4shgI54JCBitvnsAeIhkY/Ak30UyaMSVLpf38mniM1lz4bxucmozDehFtegbesZ2
         vFS0LOEC3FrhWsKx1wiLgatz40s+jbZEJjl8ja8PUloldRbTx4UIrhBCm5lAtAG8sOxu
         ob4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757927674; x=1758532474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aku+CpnvWW9zhF6+nPeIxknoBC5KeYin4IOVLZZ/1pw=;
        b=Ia+OmXBzLF21c24wC/izNiX549IdaAxu73dw/zZmnk/aldUDpihE37KOmCfE+kggPB
         v1dCGQtQHARjtadhloLFqiSflTkRe4pOMosZfjr6Mluqb/a8lv6nBAIyp4tZrB4Ancf+
         ISXSunILJbmcQoFa/Im4dXU7NaUSBWZIav++8mzMkOhPrVv3oeJ1QkZ9obGkSHJxTv+u
         90pJP0zPjsO1+ETMA3FDcDUhx0wkEYHwZpM9xeY23KXY7vLINLQV11NkGcYR5pu1hTKs
         MAxJKvVTqP0QA8S77MfsjF1nC0O8CrMIIvfgnC4bii9Y0kfIsVQam5YhMrulSnosNQyB
         1iEw==
X-Forwarded-Encrypted: i=1; AJvYcCW8eA0aFqTPHWP3jBHru/tXpECF5ttXBmunM4h3cFDM7CkX9x89MkAHFs8jWD53LXVATlqerefFF2bpW3Y98bs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz1Vto8zdLN2jjvazs4n/61C4zfBqz7MnMQ0C5UrWUMiGT7Bkr
	AQ/xfXa/CdJsEaxBrRN3R8XVNObvs8x6U3i02Ni4WsDZaCt72DTxvXztyuGBTJwq87Y=
X-Gm-Gg: ASbGncsRSlpXPl7ELx/T4DRhhulgdzbJ5vt/ezjE680i3I22yWqrbIx1C/i/iERLSIu
	dihBIInggBvLaN6namJKA9e6FoHaF6SF8LGIcwYLNMf8ggRUhWHczy7C2wMzG91Urjk2VEoiGQh
	KuxE/ZHEi2N/paJCPmrbLY2YMBfbbxNRwYalmmKNlhZ+y6Xx7sDqEjiY9tOUgwSa6EkOWeMGDip
	0sqg+GhUmxVOU5dLIr9sDLFzDyT3c9bc456xs/1sEHLnA97eqo2SW6kATFSx2HcPfJ0KgZHfVgL
	Zu6HIGbQyLdY1LgtMmIL0mn4zm6cNxTtZvNs0a95NkJOugnFE2GhO20Gn5ZGXqJHHFyPRhFpxA4
	Lu0G+oztMSnXqyVC89hwbSVUBqW4=
X-Google-Smtp-Source: AGHT+IGfbN1nly0tHEF/LPKTpBacJhCDeNphPgRpeP/LXLn8yUoq10STJSdN75g2RpiF61gi81auIw==
X-Received: by 2002:a05:600c:3b1f:b0:45c:b6fa:352e with SMTP id 5b1f17b1804b1-45f2130999emr113157655e9.18.1757927674493;
        Mon, 15 Sep 2025 02:14:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e017bfd14sm170533075e9.21.2025.09.15.02.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:14:34 -0700 (PDT)
Date: Mon, 15 Sep 2025 12:14:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Feng Chen <feng.chen@amlogic.com>
Cc: Liang Yang <liang.yang@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] spi: amlogic: Fix some error checking in
 aml_sfc_dma_buffer_setup()
Message-ID: <aMfY9P3L0yWdWe6-@stanley.mountain>
References: <aMepB7E95kwYvx0o@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMepB7E95kwYvx0o@stanley.mountain>

On Mon, Sep 15, 2025 at 08:49:59AM +0300, Dan Carpenter wrote:
> There was supposed to be a "ret = " assignment here but it was
> accidentally left off so the error checking doesn't work.
> 
> Fixes: 4670db6f32e9 ("spi: amlogic: add driver for Amlogic SPI Flash Controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Sorry, I should have checked lore before I sent this.  It's already been
patched.

regards,
dan carpenter

