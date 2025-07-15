Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0792E54BE
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585851; cv=none; b=YyBZ6GmNPJbdo0PiKcazg6FW+iqxkG+8D7qTKgg9/MnOkkD663Y+SWoaZqSIik5WWefP1PAtzHncg5rA5rDyp5DB0ZaXn04kNg6W4StbUGzjEbaafm87D/3B1jHmlpHhokJkEMYVXN+W9gsrKXjG11KjJwkNlghKKHDTK+j18i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585851; c=relaxed/simple;
	bh=xu71qnr1VwTZ4+bd4q94HN3+XBjexaGP2P8tok7p9Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7MUodLex09bF4bWHqEQt86XX8vXiqxah9RgCK3YYrU5P5/Jt5UBDVHF0n/7QYtetk4oE/3RaZdBdI6Q6Ashe1DPsUUY93sQigC1hkhLhD8UMEONa+6/686+xpc9q4g/J5LjEqhECAeVCVI+Vzf3D8oAmSJ2oS5QkbWeAjzbCXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BCLxxMxj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BCLxxMxj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4561607166aso18096515e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 06:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752585847; x=1753190647; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GOiczrZQ07TlImzuWhdRA1uRrJzdt3bEMH2PMY2Z0lI=;
        b=BCLxxMxjX+BsYdczI2PSq8IW0/VxPm9g3jC5+pqWRmgUjdRP+BLP6LYDgp0E78Nljp
         byjdEKxUXnvWU8+P6DWfEUdHqodCUGL8Gu3qMzNzB53m4TmuqkIEE3wqcS6qmpxGL4Wr
         Ytek1ahFCpIGgOVKyDkLDhrh+LeY97hT61qBZiWWDmY20RKZlzHrg86+BkrusHkEWZVe
         7qlhLwd21OlluYotwk2v3tN8+8P1Xlhfc+V3ItXJ0XqI0maX+RWxZeRaXUbDm3rGf1PF
         fl+L/4a7dxO9VVGv5GJ1tz90QAs9n9IIstZjI0YwofAki6KVeAaSR+FWQq5HUdpnFU2T
         +eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585847; x=1753190647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GOiczrZQ07TlImzuWhdRA1uRrJzdt3bEMH2PMY2Z0lI=;
        b=eBw4bq0t40w3/el4VUYTeZ7tYyNloj8E1TU44RV/3g/s9s+FfVdWrAnU9HLlVHFMlq
         U1qhJVCH3aNG+m6OUkpZbnoLa98cijoBRhb9kSF6RII0FWuZT9bdgKIr/jirzvFe1v0N
         xikFyKqfzpYBgO7DkRoDqfZZjxV0dxCGRrlvNCXvO0lFw0os/4ScJ+kwI0ZEk8Wi63Gd
         BdZS//sL3NRjYhj5LWdVwDmp4XiQTQm2TWTvN5T6IEUkCvErMJAhgoZT6BV9HMnlXgL4
         VsdZARdoMEjSkcVL2MvNnKkXQjcBPvpP/IxAao9NtBW5g/qmKStEHqU4GeCnuRH/HWpW
         gFKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmElGWf+Fer5zmeyj34VGHwKzS3Ia01uDSfwQdZQOj79quGMOFM8RVJC61C2oip8szWFGDDCwqV1Tyle7hvFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRemGNfOofExZ5rVaiMAitV5aqCpihnjH6z00NrWocXOsd09IA
	JbahK0DJrhxlIqF6u8LsAZshsvfwjHggunbHn41TBk4O9vwj+LhpBmJeOcUta6SX2fE=
X-Gm-Gg: ASbGncsHx+nn66IbeAWASa3Kmd4g2p4xQTboTVu0wwuwbb/TNndT+9NaykqdDUJWct9
	PM9dR10EMdWqBitVSRLyQYNKtoEZb7piut9zXyZ3qGxClcsiAKUzxl0jtVlM5WhkATLDunWYuY0
	DAxMx+QXhYV5Qhfsn9UW5X4xnU4+Wm25aVa50YPoV5k34/E8flNipspIP1v1bBCqeOBQLY6Tw0u
	f2Ko83XcNHL5k9IwwQ0FjAQuLO9bcoMNLwig/ZDyHoyEwhpzmAB1Iny6nAW4rONPI1ltlHdvKeF
	5297bkSqe2wofgLXhaxf5pYt1UbHntJjmwmhvIWjW1tD40uJlYU9sRqNVi6GuNzUTzruPaWrlZ1
	qsFcSJxZE+dP5ttOioqLsDhWMdMmTIvEGPw75QncUKEiqZUmtwvzLZbFX8jAB
X-Google-Smtp-Source: AGHT+IEs+ScYaBoPod0KS92i4ye+McpE9jOei8lbZ41OgzZYALXJoP1+s9eQ2gbL76aM01wUZbMIAw==
X-Received: by 2002:a05:600c:1ca2:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-4561a699783mr71744425e9.13.1752585847534;
        Tue, 15 Jul 2025 06:24:07 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561dd91072sm49780995e9.14.2025.07.15.06.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:24:06 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:24:04 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: zhanghongchen <zhanghongchen@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/loongson2: Constify struct
 thermal_zone_device_ops
Message-ID: <aHZWdMSYDsjebRh-@mai.linaro.org>
References: <5f5f815f85a9450bca7848c6d47a1fee840f47e5.1748176328.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f5f815f85a9450bca7848c6d47a1fee840f47e5.1748176328.git.christophe.jaillet@wanadoo.fr>

On Sun, May 25, 2025 at 02:32:30PM +0200, Christophe JAILLET wrote:
> 'struct thermal_zone_device_ops' could be left unmodified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> This partly reverts commit 734b5def91b5 ("thermal/drivers/loongson2: Add
> Loongson-2K2000 support") which removed the const qualifier. Instead,
> define two different structures.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    5089	   1160	      0	   6249	   1869	drivers/thermal/loongson2_thermal.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    5464	   1128	      0	   6592	   19c0	drivers/thermal/loongson2_thermal.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
