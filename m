Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F8144A723
	for <kernel-janitors@vger.kernel.org>; Mon, 18 May 2026 12:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108672; cv=pass; b=QyVb7rHVJTWr63g8g5gY0VaHFL4no4UXAupQxUOjIhNKC2OP+fZ7tdTzo0XJ8HUcobR+Xh35Kw4dcLVMuNiLG/kQGYnh21xzn4kj2+yADrvfwSvfq5EvbF03T17i9cJBt12FDWsOzkAI3R2Ck0N2JY3Um/Kt3aTOPMHD9ljxPZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108672; c=relaxed/simple;
	bh=3xZsA1EQdUTnM3K+9+rZZVCf4GsAj79x+j2RgB2i6Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLpCEQfYNVlHVz6w9BgXRr+zg7yqPehil7sJVvfV1RFqgNyYR+YcWula5Gyu0QM7+8m08mzHT/hLU9/Qu6XqircJpf2GdNxt1vLkI4/JVXlx3K0wAhLE6fCaZ4iG7nwMfk3q+W4oF5+UpRtcmAPPkgU8U9xHd31sPsGqcDLOVBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/ATbkNg; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/ATbkNg"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-453903ee4adso1922673f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 18 May 2026 05:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779108668; cv=none;
        d=google.com; s=arc-20240605;
        b=Zchop4BTh3bouwknXgPf7w+XUmgvJT7a/2Dwbl8uCJigApVPTd6dqT05B/zQkw1TlH
         KFne/2lgedxhPI9VMHZG3j3PWMEiEbRNC9OX1UbgmqnMDW1FwytqYi2P2S18O1yPRPL1
         EG6obQNSGponR7w+/Rtu9XuiLCwfGxQTeuLQXqVYQ9yeaWKd67kp0hBBRzyZX+/pCNrt
         ISBw3+SL4vo7U/5UjD7UIWNPHie4IbOvhqyheRGe/FpmcCgqIylrxfLLxzOuKjnVVZCM
         ZebAgEr/7ni2bipAfyxPUGTm1N7M7KoGDvfWJFd13RmYHtqIZyJx+I6WG1wCGpDsMBIP
         bCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KVSSwreBmj6BUKqCeoSJUvxJRda2KM6i6vtOQyCV7Rs=;
        fh=6fdijZis+ZjKf/vsaA6WnIEgRax95e/Tji3U05yTaH0=;
        b=AA9RJ6jjWsq8z6RMlQpBCtkaqZO88yOj7jN9z6GbILcg2L8zZBEG9rnCsVOQKGpJhm
         OPqA+388DRRo1Dgqq/h6+F93OZybxOvEQyERG6aWMcZv6uGRkQJeGWqFezL6O20dLMnu
         uIlnbjCc2PBI5bGlE6Qb64IzJ78a8nXVygj/XiIlbVMVzSWuCHgWBsE8hWuB2jUJB9nK
         vx1c98DmUXFAUkkTIt4LYIlw7VjAfBTYHZ2EbhDpyIjRtnG0LJ9Q4g+cAx1xOQjga4nF
         6WwG/AuCPdOnoVeObAwGTwDq27s1couhYwu8495wm214iTvCp2AjMIMrMS+vAgrVmpSZ
         qDHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779108668; x=1779713468; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KVSSwreBmj6BUKqCeoSJUvxJRda2KM6i6vtOQyCV7Rs=;
        b=F/ATbkNg6BcemWwjeN89yaGngvwPU9Oerc4VNtrjWlOITQm4gtPARhDaFxxsSsTB0S
         FAxVV9i4JjPGcixN/PgP8ND3gR8Lw6yns2i2CYxDIq0TyjJHtORiLl8r9NiqBtkiuteu
         LZtdCfyTs9+r0HtPF2vpkFxl+S4oVLYbRE3CwOME962O0PRTNwPmE5J3CR1SJQfYssms
         R/Bqc1Avf4dhhCm2RBXHJVudfRrp3oE2tq/vDvNrf0NVP2FTYZEyh0yd4zseAbtbN0VJ
         1Q5NswhDm0gKJpvDyCy9IkAXlZG15Ypd2AJTG5ILx+g9o6daXiZyDYJ/vWLs9zRc4XsC
         cvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108668; x=1779713468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVSSwreBmj6BUKqCeoSJUvxJRda2KM6i6vtOQyCV7Rs=;
        b=Tv3tjgw0k7F+cpcgbgsQHh5mRQqinRD3tpItaq3TGnuuAaF0kqztVVoBTNoJfETNVG
         eaADpENhVv1oHfWlVIxd43nZoRKrpm3q9WMtEcYPfQBTV0BahxoIrWsb0gHChoj7Qot8
         WiD9YsgtPDs2JVl5/aFJPGzOgOxJ2nPaB+XldvojecN1X00CPlcXn2ccKane1z4UtXbQ
         r1vfFf4dVfwN99n48KzITnkUQMekZcvhJjkZ8W7iGMcekPj9u5El/F9yMcFvK5mgKFy+
         GKP2vp51hl5r3m561keZwa6PQcj9tgk4RU6pbVVPpm/8/9wj9qeDXPygKLwRum1Jizcs
         c7xg==
X-Forwarded-Encrypted: i=1; AFNElJ8SECA/2ToKtqGiunawt8+odEdIXs6isIwdKBy5qmNq9oQh+4ZMOBT4LlDF7io1RlNod3zvZmwRp0xTWsxPCAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEj5+Y2O1qGHKsvVntJhgBmjwZTsrO8/jPmVHAju0QsdYSX8HX
	/gTvVSg80YZ9O3OcQIgP4jwwtX/as+2DuhASmS6TE0kT3+bIbkDvKma8A3f86zilpTKePft5JTL
	14aTOxHrXcxoDbQ2ySn8lQjndG6BZYzQ=
X-Gm-Gg: Acq92OGgUX/3+QFcGSi80ipuTegLQ3NiIPlEc/AS666TvuYekU0XX/aksVlHjLZc8gI
	D+dl4Inb5CnHNFSGyUm8ZYgc4jTZBbPN+TQqpcR+Nac3raYXv/cH0OPey4dgq8LIqePi9I+vBMu
	06whmu1nIQvOYzE+lZmJejVyrxis2WjneW8Myv8sVIjey0CrCuOxhzZZgow4z8WafNNovEq4ze3
	BJjYB8HlyVoJGNZUi1FjlLayOUo2MIE5lRMJCOYifJls00RM+qOQDM43MgVT0NA2mO29EAUzzS1
	i1v4cBvniyVEMF3I0V0dB7pMf+Jz32wSeAJ2jS79LraFh67uKakM7sETM0eX0cMkrezOkg849pV
	v9aF8GeO7TXzEsNOyeHaFOIOkAKiPpX+Uax/9IIBc9SPplGHJxLG6P7cxvuaEtMctyFF2knnfsy
	lUuEWLFcky+EHNU+0f
X-Received: by 2002:a5d:44d2:0:b0:45e:739b:3e3c with SMTP id
 ffacd0b85a97d-45e739b3f89mr7217630f8f.0.1779108668403; Mon, 18 May 2026
 05:51:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518114502.219375-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20260518114502.219375-1-lukas.bulwahn@redhat.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 18 May 2026 14:50:55 +0200
X-Gm-Features: AVHnY4JxxoQtajvr5dtFHjLH6n8K-ka8WVANAXjkpcTpZ4sRSGQchDL69-ctH1Y
Message-ID: <CALoEA-yikL+PRDys2tXY5GKZhZtWRYdfhsczrgUWrr+rrbZqBQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in ANALOG DEVICES INC
 AD4691 DRIVER
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Radu Sabau <radu.sabau@analog.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 May 2026 at 13:45, Lukas Bulwahn <lbulwahn@redhat.com> wrote:
>
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit 963d07535e77 ("docs: iio: adc: ad4691: add driver documentation")
> adds a file entry in the MAINTAINERS section ANALOG DEVICES INC AD4691
> DRIVER referring to the non-existing file drivers/iio/adc/ad4691.rst. This
> commit however adds Documentation/iio/ad4691.rst; so likely, the file entry
> intends to refer to that newly added file.
>
> Correct the file entry to refer to the intended file.
>
> Fixes: 963d07535e77 ("docs: iio: adc: ad4691: add driver documentation")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD
