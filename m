Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F891459F6
	for <kernel-janitors@vger.kernel.org>; Tue, 19 Nov 2024 06:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731998135; cv=none; b=Nwa0x49HJR4bDaJMzGUEQirkbLIVX5bVhm7SoZUdp/88jVFAaXHjaB2CzlXa7BqOGauhenD1UKX5gMzS80Zy4YwOYyMdb6cMnApQMGrsB4qrKvr5aCoMY17f4vUAhNiyRmd4Lz1KM2cVi64jhj0pdOfxMumtH3pzFq5Tozp7Lcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731998135; c=relaxed/simple;
	bh=zNZYHo5AjgwQKszUv3ztHfv1oGJtqmjUz1revEZlEUc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jhRdtURoXkW0n1jMc6uit9Jx/iaWrcQNPhf3ZRycGLMYnx9UuKsRKP1F+vqSUZL/3N7zYq67eZhxa3Z9N9Eum2yKcfet/tbNgkF9XHw1lmImYWVHmQ/GYSdAlBdRa92TvG5+QUkQwfHUKvD9k4zGwlPbMmxultvgWjfrKYMiuHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=en+5E0Pi; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="en+5E0Pi"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-382442b7d9aso485740f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Nov 2024 22:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731998132; x=1732602932; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zNZYHo5AjgwQKszUv3ztHfv1oGJtqmjUz1revEZlEUc=;
        b=en+5E0PizarLkz6mDI4OKoyplEYhnIY/n9RJ+Ch4pqnVYeijZEiLJBPoa2nE4rhUY4
         cgf5/tLfNZVqU3GmZNiQXjCOGCq89k5xB28bMGmbLnMtCfhitaMQunBDzV3Yt+5dLJ9K
         z1r6sM/jT2CZiSPokZUYXaPbV4hgvCHfO50LRD7GwOfp6ZyMRXbOWYYwfeNa4x4yc1/u
         /tRWolssFbVDzka5+gb8N50Z4EV2I46B6MUMYUBbX4KZN79uGzmhkIPm9AgcE/7033rH
         5cl6UOGk+xYJ7ILzY23PrmfJNJsv9XG7oby9bq4S7cIAN3FYs/Qn0Q2oNeiHT9/Ro9r5
         Roiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731998132; x=1732602932;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zNZYHo5AjgwQKszUv3ztHfv1oGJtqmjUz1revEZlEUc=;
        b=pFxN7zSqDDr0YI/bakuYuB7QSxd/6WjMVudazFIEynerYv3B396E/Z+LNhUWkdpM5k
         Qc/A6akSTvNdVzz2o8KSvoihqxow4kMfHi4Rt7QLE/AvkFf8Jm2shvqmqRhSWLVLj1y6
         iAnJkdLafrfksxEXObN9wwBdk02aXEf/UQ6nGSwgk372dckVHvQ83COi3P+PQhRGqw46
         DxZWBL4YsMQQHqGXHqNgQoPs1mLx/SHBrS2DT2Zz2AJv700E39i4GfxZcmE5xTLpDhou
         Yv1G3dQVpSTnD+tFOoxHfXkutvOGNDPaJzC9XhjiSifvoJk4u4yP/hzD8k4mPGjXTRJs
         hWlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1S4EKS9vKPsayjl1tCzD7fntK1qkJEHblMTjcAAB22WvtSYwJ7A6SZzHohrWVvKsySZ8soZxhsrf5M/WrZJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvGzQxlnBVehNo0cvLEmvVz7OrWCCbjW2taK8S/jSIV0JaHqOD
	ViIBPkqsPr1rIyFkqqjPT3V6g4pjDN59cqE0uH73CqtxkzNOWvMzNatpPHprvF8=
X-Google-Smtp-Source: AGHT+IHzG2/enHhdlPAuToRJeBEJCmXUH0svKHMarp1l6IkpQ01Im2PyZbGkMtinAJk9lLigLM7j+g==
X-Received: by 2002:a05:6000:1882:b0:382:2cbd:9a4b with SMTP id ffacd0b85a97d-3822cbda266mr10043080f8f.24.1731998131536;
        Mon, 18 Nov 2024 22:35:31 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab78918sm177862585e9.17.2024.11.18.22.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 22:35:31 -0800 (PST)
Message-ID: <0cc57d5746de472129b3fa7ba02e1289fab91069.camel@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix irq handling if an error occurs
 in exynos_irq_demux_eint16_31()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Date: Tue, 19 Nov 2024 06:35:29 +0000
In-Reply-To: <c8358dc9-24e0-40f9-b559-18cf7b93f5c3@wanadoo.fr>
References: 
	<f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
	 <939800a57d356771b405de49bc198d33327b4fe8.camel@linaro.org>
	 <c8358dc9-24e0-40f9-b559-18cf7b93f5c3@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Christophe,

On Mon, 2024-11-18 at 21:40 +0100, Christophe JAILLET wrote:
> Also wondering if it is needed in exynos_irq_release_resources() if=20
> clk_enable() fails and we early return.
>=20
> I don't know how these callbacks are used and if we could dead-lock in=
=20
> such a situation.
>=20
> What do you think?

This was pointed out indeed in
https://lore.kernel.org/all/9a960401-f41f-4902-bcbd-8f30f318ba98@kernel.org=
/
but irq_chip::irq_release_resources() is not expected to fail.

_mask(), _unmask(), and _ack() have a similar issue. In practice, I don't
think the enable has ever failed in our usecase - it's just a simple bit
flip after all.

There are two options, update the callback signatures (and all users...), o=
r
keep the clock on for the whole duration. Given the clock really is needed
for register access only, we didn't do the latter originally:
https://lore.kernel.org/all/0106b6f58ce19752c2c685d128e5a480103ee91c.camel@=
linaro.org/

Not sure what the preference would be, 2nd option is likely easier to do an=
d
it would be surprising if _mask() etc. suddenly could fail.


Cheers,
Andre'

