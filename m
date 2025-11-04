Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0D033F8A4
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Nov 2025 18:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762282698; cv=none; b=SSLfDmIl0q0ain/gQXaM+4w7GRA33/3kSfogDJR5vcW8LPRpZmQuMQkJkbuuC3P1pTIynNxh75xp6d3DEK+4arp2xaJIUFXncWJhNywuMKIQUq6JrJujOxB1KRFyQHMoGON7HO+xz3FusM4Is6iFtTVGfzYCyQfmE+eqoDzKJxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762282698; c=relaxed/simple;
	bh=sXJ6oo046UdvVw+WZY0s1bpUrcjoT8rdWb7NkoJ1tDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoC5WpzFu9Vl4KhJn6jC4OIFYCjNviEc0KAw/x7slHpTAy6ZPStIffsl1r8lwrdY4BvTmlH6A/uORjqMaxC114WdcHzzVRGorj8qh+4KzorZH7ihuuhxNbR4uZAxl2f/JFyLN2JXOahCGK7wq9BAHPfkDvlR/N5FliPg331Eu7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFO5WWTk; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFO5WWTk"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29555415c5fso45893385ad.1
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Nov 2025 10:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762282695; x=1762887495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6B+aPmBbpdYFEZ5jj5U7gq6e1DRXMQ9PT8K+t5rVros=;
        b=PFO5WWTkj4Wr49uMspyv2IJ6/mfwA8B0MrW1oowem9/90Lftns+R4fAJ0n/sccbfF/
         iesuUKI2oiUOIMq7D8wJyX87ZP6cGXNg8E048BpBcT3/K6G/zA8/4/EomHdkzbDS89kl
         SD8+PfwLZ/fY9XnKmnjzihts7/1Es4UU48tnRNu9oMKmwRJAiHD0uWkLqgpnX2Az1S/u
         VN69udvM5nLwKm9vYNcmnHG7PYbY2vWbDkH2s/2eiuPjrJ2su3/In29DinL3JAEp99yZ
         qbe6sasOwTY+9kQBaPpUNZ6zMpXnn6TcXLrW8eMwT2M4MFhJf9nRQwMaKD/fiXz8swbp
         yYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762282695; x=1762887495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6B+aPmBbpdYFEZ5jj5U7gq6e1DRXMQ9PT8K+t5rVros=;
        b=UXLjA/b15KE8FtMkf0sbgtycirKoLGrU7us23cAGVqEKgMAlfvyGSPgGPPVoMlSred
         wDJ122IWgMjhBLgdJLu04SS1UryFYkYsK72bhOed5fm9yg0vCNTIHBYSzd2AFr2X4W4R
         NCEOMZczCnvDQ+BJYMPputwu+J8IWhHs1vdCoZLtD4ufzprVMAxjetJdyb2j3KLYHblH
         t1PJTVqHvsPUWvO+K0lxnbb4GPiA1s8qx8gwOHiuO0TwEFdbCWwKGBR8AX03TiRDS/7u
         YYD0WawF5h3DP8kyfIu/azPBNcNU4KPTVLFOURdQi/k+tCziOGNd6EvGlBgKi09onwsw
         Gp4g==
X-Forwarded-Encrypted: i=1; AJvYcCWzO7bVhzCdTTrdUGkCN4aaFlDZj9T++Pc9gNselDY89H5bjyAK/sNAu0Lr+BMPoA/ct9G8x7qCuu/7SDjxpss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0wNJ5+L1RGz2OE6bFfWP3Pc2eUzO7oxmAoOQ6i5+DG2VJmJ9G
	gnGz57fFzC7a/1e1cNW6wtO4HZ2UjphTUIWR35LCcP8pYoBriEQIXbmF
X-Gm-Gg: ASbGnctA8C2KWLw33I/VNmzma7blt2Jw3CM91/TbXHXgKekPHMGm9Zu5E08DnSVZmw+
	oBGOUUtWKBTNx2vpl2y3asqGQoV4Asfv3P0yxN9gftZB6Nuzz4PxY4qrMpEYQ0eANOus8fsbCDu
	QNQSTatkaJgI1nCXVwx3YIxq2y9ArE4zXfd0Xb+eqIh6lxTmu2eha2a8aXV49iJmx2oG66MStgd
	3jS0BbY7xwQ5oMNos7Oi7YREmgSVbsfd2wHP3bU1XR444E1/Hlt+UdLnIXaTMUfLLZ2pN9BZlzf
	mFAsJcS+onh2Zca8BMZD2zOyuGmOg62aOeLcDz4niB46jXDUSNEe03qGFuZq1KcEDMf49JBVuei
	gmH0e/c8h19hDgDujLRteXteQJmoUt7owfJaN99KWuYoJR3ZQ9cw8wzg3R4XWlhafbcKeitg35Z
	gX61ruYVjLHaT9KVrzkk3lRd0Bx0vxJLaIqXkFAb39YQ==
X-Google-Smtp-Source: AGHT+IFHo1RV7muJZAmmalRPgMc0IPBuau1lfoRTnOMDYdIJrPmtkFZaswgqqRuY7j3qYZj5YpoDdg==
X-Received: by 2002:a17:902:d482:b0:295:425a:350e with SMTP id d9443c01a7336-2962ad0c176mr6981645ad.8.1762282694755;
        Tue, 04 Nov 2025 10:58:14 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1f2a:f7de:951a:621a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998d4fsm35273745ad.43.2025.11.04.10.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:58:14 -0800 (PST)
Date: Tue, 4 Nov 2025 10:58:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Anson Huang <Anson.Huang@nxp.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: imx_sc_key - Fix memory corruption on unload
Message-ID: <uimkyxzdrcrcm6jmprcsnbl7pw6w3impm5dqam5q4gln3lrcwi@ngqtd5pbuywo>
References: <aQYKR75r2VMFJutT@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQYKR75r2VMFJutT@stanley.mountain>

On Sat, Nov 01, 2025 at 04:25:27PM +0300, Dan Carpenter wrote:
> This is supposed to be "priv" but we accidentally pass "&priv" which is
> an address in the stack and so it will lead to memory corruption when
> the imx_sc_key_action() function is called.  Remove the &.
> 
> Fixes: 768062fd1284 ("Input: imx_sc_key - use devm_add_action_or_reset() to handle all cleanups")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied, thank you.

-- 
Dmitry
