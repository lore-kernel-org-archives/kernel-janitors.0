Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF5418784C
	for <kernel-janitors@vger.kernel.org>; Thu, 24 Oct 2024 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729759102; cv=none; b=gjghrEmTx5bKdCEc64+aO3PpCHVpO8X6hJuhouhU5kTvI7F5ldQfL+aW6CtaCLI84euR0TxFk41oOltiBvOZnz96sLEHtf9MBJ9g7t8WnFWUQ6XZcTQQEh8pgI2K36QUAaPVSFp1aJmpBGkRbE1h2iZ4+5VxnKyXPlrzUe98Tpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729759102; c=relaxed/simple;
	bh=a1vFp0j5SSJamM8OhuteRSQJkTWrElcY5xS6rgIOcjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L1D94VHPTb6aFP9DoQT1ws+tuoj+MaqxiX1DNySb/UPdUFRvzfh6NzwyqVMXLAMDLxsX9Z+AH75/IgtRJRUkmdZ0te+Frt8P4bVkIZP/SgL7kKedpKvVYrYG0RapGFIeNCodD7NmxQk7OAwE4dld+LjCkfCgwTLi8VA8/k3kgn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=j072weQ/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="j072weQ/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315baec681so6617725e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Oct 2024 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729759099; x=1730363899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRCfpLlVmBA/GhwBZGPGVhYfkecAk0ZjJSjMaPm2f3k=;
        b=j072weQ/vwQvytYsbXs9t3qNiEvdhq3cz4QFK6lmj5KqoN4eT4n7OAPNaPPiRSd3jt
         qdxLGhMzsa+hnlwb407HtvnZErynl0Mka/84KIKMmc/sdMZiBS6ZtU/Ln7vFos4Q1C0Y
         E4n84GNem2Zf1Q9mKvmiHy1D8VvJLoBFltfNYR/aVo92OLSrj8dGVGWNph9f4wY7zcOX
         VZn1++iILrf3gC7r/Zg48VXccvJ5Rd7RMdFyDXMG9YI6KbV/CAEEL5pnKtSsmNtLY09J
         Gn0cMAryBYW0RaXSVdh1f6AHBwVSix8l63DDIS8q7iQv419MIhJrJZ3NFmkmmR+aXiK1
         C3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729759099; x=1730363899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRCfpLlVmBA/GhwBZGPGVhYfkecAk0ZjJSjMaPm2f3k=;
        b=MoS546er/fmWzrt4RB2lSjz0jZjo7mksOUYJa6/Xjmul1UepQcyQ9UV1A+JiTHYGkY
         QDQfUi4+RSh8i4IAAq82zQDhk3itBdi5p9ct6SWjgE1yWjETUluN1i/tpa6WzBkg9QWY
         KerTx5E2razK1zn2zsKYRTexVUi3H2pZ1sZpXK2He2kaawS99H/RHL89E/DJ53g0ZxQD
         ylRkapKsCKJ8E0NiREhkuhtxemZmHe8zZ6TFl6gbbv9vVqZEht2cQIrVYdsBTLlGRHnn
         VWwntOMmAcqabnBkHwHKGJrGctS8mWIjwjx7OOsRynPhJ6x4DRA23YkJEfKCGAoLNtU/
         vBgg==
X-Forwarded-Encrypted: i=1; AJvYcCUtWeVVzHa8H36rLPzKbyH8jed1psuhvj1t3sCXMcZvJCK78noSp6dO1g+UXOBGi/sppePJEkSD8KBd6YqM/AU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSFE/pigMjgVrctViepkDu5p/+wt7ipiHuzh84+6NRWHU3F3db
	E4ph8MYKFXmmoZCcy7IlwAZUdNXdRTIMUOooDMxkzajI0sg3JrWxWFQ6Uwf4RaU=
X-Google-Smtp-Source: AGHT+IH59D6trEtlIGfhSaQUFfOISh1j6XVS0wklp7e0TLgrmSzRjpGtPxH4z69HNeeyStMMxfld7g==
X-Received: by 2002:a05:600c:4f88:b0:426:5269:1a50 with SMTP id 5b1f17b1804b1-4318c6e8f6dmr8250915e9.11.1729759099048;
        Thu, 24 Oct 2024 01:38:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:17a2:e679:56a4:a25a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a4864csm10789687f8f.35.2024.10.24.01.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:38:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] gpio: mb86s7x: remove some dead code in mb86s70_gpio_to_irq()
Date: Thu, 24 Oct 2024 10:38:15 +0200
Message-ID: <172975909020.16227.8464107518075486069.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <b7f3a78b-7163-42a0-bd09-8b3184f29661@stanley.mountain>
References: <b7f3a78b-7163-42a0-bd09-8b3184f29661@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 23 Oct 2024 11:35:53 +0300, Dan Carpenter wrote:
> The platform_get_irq() function never returns zero so delete this check.
> 
> 

Applied, thanks!

[1/1] gpio: mb86s7x: remove some dead code in mb86s70_gpio_to_irq()
      commit: 4295f4ccfe8c6e6ac5b631919ba7a4fe89d22acf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
