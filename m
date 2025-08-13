Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A633023D7E8
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Aug 2025 07:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069827; cv=none; b=nmr9vMC1AWFZY4k9gZKrYINyvXdn2/QaJJREWNs2NK2/+Ey+99Gu/57IgAjBLBzzM6qzocTwHJjnJ9ptvKEuxu2ehkDdTmrXuAaD8HvXhO9pq9YSniNOrTW4/Ub3Pe3qe4AlAqFhPv63HHgsg9GTLGYapbuwkZiXKaIC7ujCPio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069827; c=relaxed/simple;
	bh=bv6DYqjwN2D0DlDYGPWLKAAmU2xcLODMCxxOZH6IMlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I8iusFrJO2apU7LpdlM2TB7k6ekdZaI4wJTIcit86lhHXvl/GsUqKK+aEL//mESIe05484fbO4+7figKcx8YJxbe6ru5C+Dk4XKiIq+d5pfNWLlDvepRjL43reRNlvA1gwcfUL9fEr3io1HWjiQXUB1nnwW8Cp6kU9CJtuKrZK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=K3RbWvwU; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="K3RbWvwU"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b7920354f9so5102604f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Aug 2025 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755069824; x=1755674624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WATivFrievb3I0TcPTJrTrvyez6QlhkHAEe8TBXKLU=;
        b=K3RbWvwUUe8d3b1jowxjvceKbI9g+dzxeqo1pC7qbUpHA6qKtbV4FW7akwL18hmOM2
         37jgdCdruRysdghvmPBKViC6uPdiCGzXWEj+msMcodur8LpKGr4oUOjadb0tLzU7Ma/B
         ur8mbLxBsb+mkmmaI00J6xTZrIFXQTEOpDKkP64A+lrsJs3fYwgWeIN5r11LhnASP4vn
         LePMpDryDPHs4XR+hFAJ0gDVlyMxB7NA/yrTzAeJbuS0ZC/jkJ3AgoyNxE9tXg/5vZkN
         z7GkkdQDv8MljgGPAQrv47nVOQly3HSl9oS4+FC1CqE0vDzh/ozDoHRQJIVtw4LhG07f
         ESAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755069824; x=1755674624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WATivFrievb3I0TcPTJrTrvyez6QlhkHAEe8TBXKLU=;
        b=NL0brMTQNEvFbj7d3xG8M+1UUjUe3jXHT+NerspDvTk7xzwB2y496erpvAHuQ7Xnhr
         87Vb+n/IuhMyMrjkQbuJYcN5eCtvTjg7bTgsIsasGFpJEvzqgj7NPhwhVS4jCiJJ+1qq
         b/ErkAPbHIyJseMKCp3HmL7FrSxxV17E3MmSKxXrQlMtfG6Sf/qhhajCkfn3t2OvJji4
         CkLkti6CIXAhe9gbtQwCyTxMBYvM70gnDUAppcmTi/L6u8IivYu1wZWR52skq0ud41XR
         jboBWMvZdWZPlsEngMnzYJCgUsb14RC1w/a186Xanr1sUlaFehAJ3SPL7buK9n54z+9T
         arUA==
X-Forwarded-Encrypted: i=1; AJvYcCXWFDJupvXfxNRlZfmV3lj876mb4Jg4HIEsA1iVO1INIyHoR0XJ6iiiFaHDlrAojDjV6DwFq4ghpqqtUN3AO8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyxjtphtMs1uB/macPEJqAKtpwOnMUiZhTsWHvvXO8T7L86WL/
	hziQsBHHNSwIVKaOIOeWsQuYB6H2iIoXbLgpOo4yXsc6sUdthVvyLIA39nAqXJxyGDY=
X-Gm-Gg: ASbGncvPHrRkEQQbIrWZ/jno2BaaSKEQYFXytmyLyV62Q16QGNh6ES9X9nR63Fcmwje
	la60NEZc0+CyPvYtit6pU17/pr7pePu9KVn+aySQjAgE1IFwdCbJzwmvHGtzmLETXuZ/9y+RZFb
	oiskJKnsDO84WoSMw7gZMde7IlzCYvIqbHy0iAFuvtnR+CgLfkB0F/tmzzVI9cm+H1zicQvtr41
	hjO1msuY4sk6PMz2/uDjfHI6tdcU9Xs/sVeerMvFLK1WyJe2eoyz4Wwa+i+F8VeNKOc+wjsbBUU
	yAafSIAW/yX0qy0gAQejTeKnxU09EyHM//wx1p4CVkMxx15keWg3Eml6j1+S2n0BPyl08Zh7EGs
	LUOa9pTtslbKsTJTow0ENXxDd
X-Google-Smtp-Source: AGHT+IF1MjcUvwgYnjulLvHKgyfmZ4E6I3kIjMN9y8mrIIK3WlP8h9WdbRGmZ0ZNF9dbobExy36HTA==
X-Received: by 2002:a05:6000:238a:b0:3b7:76e8:ba1e with SMTP id ffacd0b85a97d-3b917d29ae3mr1458813f8f.11.1755069824008;
        Wed, 13 Aug 2025 00:23:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:74d7:9082:2b54:5348])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac51asm47740936f8f.1.2025.08.13.00.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 00:23:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Thomas Richard <thomas.richard@bootlin.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] gpio: aggregator: Fix off by one in gpiochip_fwd_desc_add()
Date: Wed, 13 Aug 2025 09:23:42 +0200
Message-ID: <175506979055.8476.10658684000717777329.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aJwk0yBSCccGCjX3@stanley.mountain>
References: <aJwk0yBSCccGCjX3@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 13 Aug 2025 08:38:27 +0300, Dan Carpenter wrote:
> The "> chip->ngpio" comparison here needs to be ">= chip->ngpio",
> otherwise it leads to an out of bounds access.  The fwd->valid_mask
> bitmap only has chip->ngpio bits and the fwd->descs[] array has that
> same number of elements.  These values are set in
> devm_gpiochip_fwd_alloc().
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: aggregator: Fix off by one in gpiochip_fwd_desc_add()
      https://git.kernel.org/brgl/linux/c/148547000cfc1ba8cec02857268333d08724b9cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
