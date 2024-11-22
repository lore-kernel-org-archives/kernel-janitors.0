Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC7A171CD
	for <kernel-janitors@vger.kernel.org>; Fri, 22 Nov 2024 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732285468; cv=none; b=OoAkWl1zOXOeIQEEyZ3E81Zu5XfzMWiuQwQVZgu/DpSXlQmJKxEOAP9A0t2AOwiWR2pJPU3hSQa8oWTUxcwP5D6NzCKk6QMwk/8H4xOT5HxR4S5lmaLsWJVCE+kNMhxjWNWG3tOnYVStjuCq5E0sNW7AxPQctJy7QH01QKeIPWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732285468; c=relaxed/simple;
	bh=SZrIbYqNJooRI/8mP+lYzjg7Ex28ZYxTZhOjMiHUNPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F3WWwNH7R9OXownGoqknHIODGs1R8+V3Y3R5ync/8Y4F9bZcoJ0bQpkm3YSUSHkMiD00zMxZFffKm29AMfBIHI6b7S0gBYPNZtV8lBPKxvevHwb6ot+P3uu+rJIol2E01H3m1ynAEibaglOqpo1worYNAE17/8lVbewolDOWy/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EC4A2+uh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EC4A2+uh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so18700105e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Nov 2024 06:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732285465; x=1732890265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Nh6Qm3+g7FvP2C/uBSg+5gQrB4CqmwHy+4OBt6kFZI=;
        b=EC4A2+uh64dTIGUT+8QIUvLnOQWEkhXvOFfncLcyFP+Gd8TNZkXX3GKaGy44KJEBEb
         EQvZb0hcASClrxmreGjVvNY9OYqiImQu0c8yxOsQhpQt2tozOYDuYXVj/VEulmmNT9jJ
         BKy4TLc7ane+8sOvuBQol/LDirhw/yE+L7mFnUPolcOSSWda1KZXb8QmbSki9CHETcVx
         kWl8ialId8mXqDhj5zbYDg1f27p/B3uMLWzF/nAjKQLHIG6wpquOY+qfuDvkL6y3ZKWH
         GnAjABsLfWlgQtcKcHIq8DAvfTtcxPlZFkdnXN7WfwFJXOxpvHSPDS5oXRbn5uQeVtyV
         syGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732285465; x=1732890265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Nh6Qm3+g7FvP2C/uBSg+5gQrB4CqmwHy+4OBt6kFZI=;
        b=qFRTQMeW+FExWL1VG1bRb7AgS/EqTmh/7kixtA7ct4UdQVgNcKq9oePYtaxuWxy7Kq
         RlNGJSW9OhZc0/CBfxlwTz4goO1rtNTCvdvmnTq0nt1v0DfyKWHxpmvRj1AHtANiAtPh
         A2wt838P9Bk+OjZ1Ee/zESQ87yM2Vr9bHt/+4y0gvgH3EG7AvpgGyn0YZXzB98ib0Wla
         hjtzIuS1h9O9eEFqYLeoMbtmMSicttEqRbCk/mp+8WztNyg9UnWH35BNUwjD8urCEtaf
         8LksNIPVqqV4P9OvqmxObPGgYnEnNToIdGzxCRzSUfFH0xt1y5whqqb9kYxDMQlNhZKV
         MVyw==
X-Forwarded-Encrypted: i=1; AJvYcCVWK/Jl6oLbui++ZK8yG8QSrufmHVSMK9B+KlFWpIAbmqAK/Wyp39u7d6jETygU5rJcAm24kqXdn4I1RhMQg4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YylQWmeiwPahGaUajgsLNTBTJVTDZeDRN5EOfqLG9KMAaAQwXl6
	whT0bykEet2Lr+2Lez0Id5c/DAbXCi3ZcTiCm8WxmuHxHScB1HfMdiwtmDDJw7s=
X-Gm-Gg: ASbGnctO0weN4vZ/Gk8/GlMEhTSP/TDQX7hGsmsqdtIkMc7ilYXM046qKJiUBzw9vTJ
	Y8NibhkwzjVNvx+Eo2DH3ZEXHJ7AzSHlpVCgAFLfACIAK0yxDMCwf/xgBEu6Axrm4JzcGjWQEkE
	C0p1IwZQCP6R73YbN+3SABAT8Z7WST0SH4OYMHmeuVqAG9oqUiITtyMkj1JG/XRqHGBsKXE4Z2J
	+BHsMDt10QqgTf7WGuyqFOZw5B4ObXlVlwHaPy8aY230XK5NA==
X-Google-Smtp-Source: AGHT+IFIZ2iG2mcVpwd2xQ6e2MRIo00PE7xJ1mgrdA8y0aNVfwo7kWxoPIgftfJ9yBIuyCxe0iV2Mg==
X-Received: by 2002:a05:600c:1f96:b0:430:57f2:bae2 with SMTP id 5b1f17b1804b1-433ce4ab949mr23121145e9.23.1732285465348;
        Fri, 22 Nov 2024 06:24:25 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1651:6ba4:e8f3:d05f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d4ce6sm91642195e9.25.2024.11.22.06.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 06:24:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: mpsse: Remove usage of the deprecated ida_simple_xx() API
Date: Fri, 22 Nov 2024 15:24:23 +0100
Message-ID: <173228543205.96444.5329013618408854886.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <2ce706d3242b9d3e4b9c20c0a7d9a8afcf8897ec.1729423829.git.christophe.jaillet@wanadoo.fr>
References: <2ce706d3242b9d3e4b9c20c0a7d9a8afcf8897ec.1729423829.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 22 Nov 2024 13:45:45 +0100, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> This is less verbose.
> 
> 

Good point, applied, thanks!

I will send it next week with other fixes I have queued for v6.13-rc1.

[1/1] gpio: mpsse: Remove usage of the deprecated ida_simple_xx() API
      commit: f57c084928661969a337c731cd05e1da97320829

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
