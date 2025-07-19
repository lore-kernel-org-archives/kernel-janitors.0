Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63D21F0995
	for <kernel-janitors@vger.kernel.org>; Sat, 19 Jul 2025 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752941298; cv=none; b=PXBH/pj0p22ISXZDBP8BI35ZPhcWefvsyPNYivqXuR/9ywV8K25udMGQ3dFm9/d/v19stZNIEFFP3gmlsHZsFfobV99j5Njr1ZjRcra4c7iTUU84BwI86diyvSaP2Hau8bq44NzpQyjAtfjXjwCoWdSq4hXqBL4KHXTsnd2srmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752941298; c=relaxed/simple;
	bh=5SiHkdSfMvJG/38SvtyuLJIKJ0dECiYN4f8f1myRAcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RbEYcNSXx8NcQsIs2xdq/LQQnBcrABhl6c7D3TJueYH7wMG3ERcd+rzYwQtYvGLICCNOAjr5NLHSJe/+PXnOsqrklzQ7NI/i+4nuKvAItO5hUzBn92d515LqZp1r/GLKNk4kdiHi0LNwmeNp9jpj8cSDTYJlUHLGlcavJRcTTQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FvguZnfM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FvguZnfM"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45629703011so21326725e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 19 Jul 2025 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752941294; x=1753546094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTlKTKLRAHSXeKTWI+ECpHm9HjExYSOWdZ9iUWEg/Lw=;
        b=FvguZnfM13nj2QfDtXK+0eshzwlkEOutWDDNgHGr8SzYta47xZK+5K+mXviNYe28Bl
         RC4wpHZgSUYzOyPI743rCUhYrDj6p7EbP0IV1Ksoqz/+UVMuMr9WoJImMKtKOT7Nv72M
         dkLvQnM46VMQb6Ef/fSyEFPR7fY5hcyv5kuXviZHhv9Gp8DMq+XQsBdlyxW38KWQuMA/
         IqwQ3OmzJCMQhuMKvuJDU44yVMjrxY44PSwYCZCZY4dqvBl3ALhouS1DwURRNF6GaiA6
         KH7sprE90Wk2Vn4IRBHVenWGErYiR9Yb4FJKokApUD6tnm/o13cuLcciocTrlZJn6Kx8
         j7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752941294; x=1753546094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTlKTKLRAHSXeKTWI+ECpHm9HjExYSOWdZ9iUWEg/Lw=;
        b=VlmfXe+0TERlefI5esFQsCIFp1ng3Vy+alTbJdwE0dpWtCfrJGkGt+bNE/M0XiHOI+
         WY5k1Hf7SNIRa3kYFojMcxX4MQ7exWQL4cHBNhbp/QXmfD085Jnae27peYc3u8EPGvbN
         +e1IaIfZiHZRJoG8U2YJ+z42klt/W58FTc9WGe8Wu5VGh2ipP91FxyWZcmUJmbin4BeZ
         mhFSuUUtPD19mDw3Q/pikq1cLmYQm96gW9zoqrLPOItuTlvYKSDsGm9cipShkh5IxHIR
         S2SohjzK5LCFjFdZib0A5zV2lut0MtRI2/FcZ4LXkjFjiL5QR9T/9Ob7xZy4vtJnRUor
         w2dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkPJ+kE2NIMllZzlZl4uB724wHjxNY0LE5WZBkdXi/O1NygW0MXBt26VFBXWzi9uuY3v9hHcJ31ZbYRUmuS78=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyTjhmOXtWkxzCqx4Bz7OBREimMC0yFBPpVxA/oGQLprwKOoWD
	uv6HBwcJujFYiTreFncydOMjCLWIh9ulnqlv7pHjxN9KKoJ24TjgbZWBEZSLlK2Wv7s=
X-Gm-Gg: ASbGncuwbEZ5xZRQCHdgEs3bmlwGXYTY/+CVR//t5ig3Dqf0Qm+dnuEcjW8VDlpap8j
	2r60HDleDsuOLFWWNVy82qYqJfO7K4lCTC3vU0Yd9JLKkNgslfyTxjKfwSJ0eScTITcOcQiV1mt
	V4l6YfkE9lTWo+4UJo+PnEE7xY/dsaEUO1VS3g59FuulxOvbLnpBy6Wk0PgKjJ91WATktg1GLBC
	9VtHC8afFhGGbCramHWy79oMD+u0PDHznzOyN0BxoKXoJQJURfpF1J5lsoFk2jzyKc1qsJflcqs
	2xC/WslsaoyMon2c+wfymEJw+AEdYITL1LDFgy8aSzXzrMi9oEGHp6D4s+HREdYeaNznSmIdS8G
	cU7cO5rT6DmlKCpwa7CS3TA==
X-Google-Smtp-Source: AGHT+IGnOBvW0E6NXV1F/jlGY1sueqHdOmWBvkE0ycL/8cWGRkeUGSG3bu+eguNmgts+kPclqi1RAw==
X-Received: by 2002:a05:600c:64ca:b0:456:1d61:b0f2 with SMTP id 5b1f17b1804b1-45630b6d6dcmr139212165e9.30.1752941294010;
        Sat, 19 Jul 2025 09:08:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:caa7:1023:8441:61fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b74f8a9sm51500725e9.26.2025.07.19.09.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 09:08:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] gpio: sysfs: Fix an end of loop test in gpiod_unexport()
Date: Sat, 19 Jul 2025 18:08:12 +0200
Message-ID: <175294121708.8606.9732156006120686279.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <747545bf-05f0-4f89-ba77-cb96bf9041f1@sabinyo.mountain>
References: <747545bf-05f0-4f89-ba77-cb96bf9041f1@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 18 Jul 2025 16:22:15 -0500, Dan Carpenter wrote:
> The test for "if (!desc_data)" does not work correctly because the list
> iterator in a list_for_each_entry() loop is always non-NULL. If we don't
> exit via a break, then it points to invalid memory.  Instead, use a tmp
> variable for the list iterator and only set the "desc_data" when we have
> found a match.
> 
> 
> [...]

Thanks for catching it. This is not obvious because in normal circumstances
we'll always find a matching descriptor and exit the loop via break so it's
hard to trigger a bug this way. Anyway, the patch is correct so applied.

[1/1] gpio: sysfs: Fix an end of loop test in gpiod_unexport()
      https://git.kernel.org/brgl/linux/c/5607f5ed3c5f30f41e72ce09c8e616af0fc0d474

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
