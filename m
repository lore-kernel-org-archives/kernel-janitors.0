Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6D92E5B08
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Oct 2025 09:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761556776; cv=none; b=fcnFkFZsircc9oZcmmOeKg+YYHf/GD6NJGVOaQRNCZlO5Jmhb0xCqpTIZ+cHlaa1NLe0GhTpV0frTjroCUcab6vNSHCo06f0kMVltSA1F/BDeza6RaKv5XwdzOkFLguXJN5Ab49R5cWG2NjX/kqpsVxsSTySBJCxUZ1lQFgogkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761556776; c=relaxed/simple;
	bh=bolzSwxyoeuw3xzSsGGpFrysawU+4VMK9wZj0OQ4h3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VJM144VZUz+pCfwsNej5BTGy/x2DSw2gXuBp9wc2GhO6xTszEIDg3uwWqQwEL/l41pWy38ipVU1ETrzrWkMih0+1J1vQtQUcsRWyjcKJXWwMJ9vuegDy26+/aBBprDS0SB6+4KnVzT5f8nBjYpCaT2seu4RdvWo3x4OSeBxZo4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2fzTP3Bf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2fzTP3Bf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47114a40161so49464515e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Oct 2025 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761556773; x=1762161573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLwTNRC+QXM2wltZXmt1/Ig8frLjkwglkfeHmY2zBeU=;
        b=2fzTP3BfHTUZg4J7uwcGpZMk6fmiwuBCkG53GLOgKLFcZ3ncT3daOKrVbc/5Yuiym9
         GfBmmLoGHwvf0PogrPA34zHx7A7XVNqDC7b5ZEBv0q/f4hT2OA9Fn1IjqfO5llhnr5UB
         +2fspOVdj62SvLdq0ZPrhrRl6pqZAV2uD9Kv8D+Psn97p9XLm0cxxiHlOMIyZZMVOPgW
         yE800CHYcUaeDZ31oYepOqd26LIITOzDlp1L6LwuG1WHkeTClOzNRU19G9YvPi4UlDhb
         FsN9z1XxXAxhc6VF4pbrS1dWHF1gNgdRrMaeHSHJlO0iUE8Jnr9trivlrFAvAx3XHXVD
         +orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761556773; x=1762161573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLwTNRC+QXM2wltZXmt1/Ig8frLjkwglkfeHmY2zBeU=;
        b=wyFs8urxBStYYZgCngqDpCzspP0Z3Ax0e+lkLZpLbnHp3IJ4rGTf9o51UT3deL0OwP
         //+Bn/neCr1noGeRyTIHEbU+80hSun4fy7ENKu6RYkQT6/5b9sucyNUvkTGZ6FcaRlw1
         mHXQ1vZ1eh1rTLXDo+SqUm6WIYYjfIblmebfqzWMscjbNgOWk2Q/4+gcS/zxDM1PIu1v
         YwtC2sKz2gA+/VrKDCt/zw9VNuG9Ah+6Z0Uj8sC4fYWXChOPGFrDvtyTGvETXDEBajs2
         cbQbewK/WIzGY/2FoeKKqMtxr0Ksxn5ceVfpzZt6MjZCco9Zl7gew4SzTKjKBUMpKF8F
         7MRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0Gi0qgEp/3prhQwdEVXjdGxcGedab1UKXNem+FyK5A8cty0k/KYeVb8AoLKe7uCGYYyjYPv4WSZjzxwBSQSI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh831srHrNfQPVwu3vEQnSn22KhDSgckaRXCegOWhc2LAMr9E4
	6JJDbqeF4EUmcBUXzUeysPoTYtfYp+LE28/EAZrrV3+pPZPcadaYgaQLwS9ADdCU1sw=
X-Gm-Gg: ASbGncuPV7HlXuRbW/NJrqpUL8Xacj7uI9nx57rrZyN/FVqOYX1DUv5rpa4i7cDNBqi
	GJXK7z5xpAW5v6c/B3RkEYQnTw30eMWoowwdlNFqlIpdEtbhS/QD2zSFNOuITNVgPsF/IJOSddY
	vSigdQ0Dmt1h/qWGpfOFSlDTQWuMHKRwSTXkSO6S7jpOT+HLM6jg5WwxOtACDMMv3ejVKX7fH7I
	YWbGJHLLH/b8y89HAyLhuHNTzY14cO83UNAESky0QONN0C8X2xBjg3AxkeQI9iOHWk0JMpMfRwY
	AIJqhRcYqr6zoUGuXZToB2BckLEQXPbSycFq0yXdjnG8nnSicy5f6KqhPwuogQ9nN8gygPePxJQ
	qtTROqJs8XRXaBM2ek/gjrQBNF+g+OT1mm5aqMmnCVlt4IwDDgnzgQ5LRtkH0I1otekJCioSHbf
	Jj+VDEbX2kuCU=
X-Google-Smtp-Source: AGHT+IFydLgSefUUU+8rU+5qeCjpWGOKuNGnYaoOgJsG9vuHDfisTUDla/4LWqckkid34Fks2szOHA==
X-Received: by 2002:a05:600c:190e:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-475dc5c3b70mr71837635e9.34.1761556773351;
        Mon, 27 Oct 2025 02:19:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd494d5csm126341835e9.9.2025.10.27.02.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:19:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Walle <mwalle@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] gpio: qixis-fpga: Fix a NULL vs IS_ERR() bug in probe()
Date: Mon, 27 Oct 2025 10:19:31 +0100
Message-ID: <176155676924.14205.13738702984732824686.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aPsaaf0h343Ba7c1@stanley.mountain>
References: <aPsaaf0h343Ba7c1@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 24 Oct 2025 09:19:21 +0300, Dan Carpenter wrote:
> The devm_platform_ioremap_resource() function doesn't return NULL, it
> returns error pointers.  Fix the checking to match.
> 
> 

Applied, thanks!

[1/1] gpio: qixis-fpga: Fix a NULL vs IS_ERR() bug in probe()
      https://git.kernel.org/brgl/linux/c/9452252dff94ff2cbcd33d3418c2b95ff74bdba5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
