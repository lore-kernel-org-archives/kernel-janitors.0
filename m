Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0F230E0D1
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Sep 2025 08:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757492117; cv=none; b=FLln7ApYIvESTRD7yjKKZzOHWwV0naAv0YUyBXgFKS3CYqGOCX/vybK95pACC34YM1ok7OQFnHWhK+90rg2MVIf4ousAMrTGeZNvHhaY70bJyAVef0IVTjBYU9n8ipNVMNnOxr4jKzwCJnz/ENT7KTZN+kt3UIuP0p7E43aHk/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757492117; c=relaxed/simple;
	bh=tF8LpkJ22cQEsJ0sRitfP7ZwvVBY3997D3wsT7ETdpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gUMZueLhy9ukmNzePeKTM3XMNA89usCkcu4Pxk6pBkF3J1eUtBiKIWmV8GpUDkQ62qkF9aUdzWK6c24DeStZR1JD//2GSpPoF2qDDFwg9iqs9OopdIT3r5uDbHfoIL8ZVbwUvm+aPa7w3pckfqJGja2RAkDH759jcSRfeknZI4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LSoikkUo; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LSoikkUo"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45cb5492350so42420115e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Sep 2025 01:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757492114; x=1758096914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwU6AzP+BVSq2Of14qRAymDuhCNu7ThySnEb4q+EocE=;
        b=LSoikkUo2zJPYm3aF5ylSLw476IhHqpGkVeXF8+kTpUMJ0qnMdMvLOMBpn7Cm7xN5z
         hvedXQ4LZcgoxB+KDE7SP5GZC5S+f7JPM8q+C39f6ZXTkOsEiHzwtiFPHjjKtV9DtSv4
         KgnVlRSsVJ8wlU9jQzfwVd3rge9COxKBYlAJPOCRM1lPRPsRewNkhfD3Z8Jdyjf82dRQ
         jxqmzE1/ulttsMkKi7APfbEngCTo/aPNpQqvUn9LUXe4At4nBlUyvol/6eFBKdnYdMwt
         SV25XaRwIf7PmqfiZSaqPWPUjKyHtWQEmjmbSZZ9Xht2CFvrFTDj5djC+QD2kWuyew/X
         oxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757492114; x=1758096914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwU6AzP+BVSq2Of14qRAymDuhCNu7ThySnEb4q+EocE=;
        b=vfVcOoO0uBJrc6UY7CS+uyyTaKKl7iVtaHkcp6zwU6IHZzK6GqG8jyd1IW89eNcwz5
         J9MmsywQLDC8y+V47rtws90eXye5sM7/mVdxlAch0k40SwYtAasw/DaIAVgqG+rssrxg
         Pd8rwzKiOjqm6N//TFeBRyC6GqY/0xcQ6SqPbdTIUg0m2FhHQ3D7QJoLcUHOR7oGlHht
         ryDILNDnBkA1uxa7BuH2O7eDZQHQ1IAaL4RESpn3dRFjrqJawae27+LuR8zwOmZqxtKA
         WgSr3YtfMovBzg6wcS/Cnx0T1tJkLjL0xcNnCbWzmsuX7GSOCkIqB+VNHxL+8oHCw0PJ
         w+lA==
X-Forwarded-Encrypted: i=1; AJvYcCXSWn/wvU9vHlDA2XDjVaJcr7/ZjMKHpJULa9XASjjidssiXKA5H5VFKlpQ4YArO9QvcoA8VOnlgb0q0/JYdK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN/iBsQxx4YwqONl9S9keHYZb7AZjwFdPA6RtcxuNAqUBYISlm
	MD2qFM8xY3E/1ZtWgSulBZwRNYZWkLP3NI8QcvoMIjLwmhcUtv3vNGtULt/6k517blu4dL06SC4
	suASXtvU=
X-Gm-Gg: ASbGnctZPveCcfXpeqVLYL2E7O/s3oxf5WLURKCNx/aTE06XzFXMS53wyGQsZTPAuRM
	HQbnPYeuHJ3IKnoQLfVnxCrlRfRKlBBvEzIN9LymzZeJ5Mx35VRdMcUwPqD/obgsCxWsp//twsV
	fRMVXMPumG7Q0fXku1p7pYbboaVrEd5F9Sg3hsOCrYFOXDHi7QcIz8TVVtYA81VQETzayRdLpE0
	pAc6xn/COGC260+s9/kIL6dTVaEEUyOBBL5KRknCeoDglKkDOpQvMAZMiFv4C0ThYOv1w5Mlv30
	MwaFGoRiNrF5r8xIN321iQBKZJu7txaaJD1wZgibA6gIk6oGVxUfZ3Mu/5IrpjWfgLH6Knw5xqk
	fDHJHR7aRyKQNlauAOWktBGRh4hKq6wMNQA==
X-Google-Smtp-Source: AGHT+IFe2wPN6Nmyi5ZfNourrl7iXoPp381GTFJ0zjgYb794H8ra2ZWQb1U1PKqnmRoNzo5YN4u0mQ==
X-Received: by 2002:a05:600c:1e21:b0:45c:a955:4578 with SMTP id 5b1f17b1804b1-45dde02878emr113926945e9.21.1757492113623;
        Wed, 10 Sep 2025 01:15:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df804bce3sm18650015e9.0.2025.09.10.01.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:15:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Yao Zi <ziyao@disroot.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-gpio@vger.kernel.org,
	Colin Ian King <colin.i.king@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] gpio: loongson-64bit: Fix a less than zero check on an unsigned int struct field
Date: Wed, 10 Sep 2025 10:15:11 +0200
Message-ID: <175749210857.28519.13259779376506560732.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909190356.870000-1-colin.i.king@gmail.com>
References: <20250909190356.870000-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 09 Sep 2025 20:03:56 +0100, Colin Ian King wrote:
> Currently the error check from the call to platform_get_irq is always
> false because an unsigned int chip->irq.parents[i] is being used to
> to perform the less than zero error check. Fix this by using the int
> variable ret to perform the check.
> 
> 

Applied, thanks!

[1/1] gpio: loongson-64bit: Fix a less than zero check on an unsigned int struct field
      https://git.kernel.org/brgl/linux/c/4c91b0ee35db07ae017dce067c64364c7e95faae

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
