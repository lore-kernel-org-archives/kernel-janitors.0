Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B181317BB24
	for <kernel-janitors@vger.kernel.org>; Tue, 11 Jun 2024 13:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718111311; cv=none; b=bzA/FQWJ0V2UK/a7fGQm4UFMJfECTTuLDKlB4raW/V+GL0wMs0XNkATYyqCf2fCIefJHPL+IXcDDuUJdtBNTwXsbJBV0RxbChxpGQVnFGwMf+MAFJ2B7K1Wu3k/H4A3ZNLTcilaHHV9SwWbnD1QeBQX2NEJteDNgypu+iIEjJT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718111311; c=relaxed/simple;
	bh=qLXHl7HneB0ZAz2f7/+nFTx5F6LdpJLFJfWWnfw3aco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOBKSQu6zVmfWUjM19L3B8EWSUm4CySDM+SfBTton+3GKAOBbNxHCkvMhR35bxQsQVyal77ccaQQuk4yXDFuNqW4piAO1c1LWCxwio62XWXNekgvEC1FP5kRkOpWwTamKmAMPpzMp+kd0HxVm08DzmmltDsnO/uVRbxxprwdahM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jufcDoo6; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jufcDoo6"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52bc0a9cea4so3514367e87.0
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jun 2024 06:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718111308; x=1718716108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pf6/gT+Ewdw8uG06lDxtm/kv6Pnh+Q7yaLg/g7n32Y8=;
        b=jufcDoo6WoFT2VX5NFQliniXHwypKEiuXTIsnRVicbCNqKCVTCoSMy6TEyqfDisRof
         Ch4FviWx7WPSB94YSRLTsFJa/yoGvXWMZ4mJasdeXBtARmXQl4nwgHTUNUUIp926fP9l
         byWmqqzJHSwrAxmhteLsviGXRONCNt5KhcOOJ6+ygsdZpRpOmyKH9l8RKFNVHHgXHmWx
         9uOkRj+3uB9VUj/EkXO6UObtmrstbyQNRcbYZGQmew4r0XsYSgZBDo8Xy7f1y4u1BNMi
         i8ENgl+N9E6S6DRSVVFdjI1MGLgxhabxSP7r1fcBpwFmuyMq0r+agQMH2ajHdBae9vi7
         3oOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718111308; x=1718716108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pf6/gT+Ewdw8uG06lDxtm/kv6Pnh+Q7yaLg/g7n32Y8=;
        b=Jx6l4M/WwXhGXXOyzsw5A9oJ8/YI29KxV8XCfYgxtfiSJXD46A7vRidcuF2xENzVsl
         5ztdylZbB4htGsYrJf3bc/rOkDqptK53BhntPsdXVwI2hjIV6bh8BOHw/msKLgwW0Wbg
         izIoH+AmU3mPNnc65zqyL/mp0bZph2G1CMBfxX3Dpzo7S3ZSs98JGw4EEokHfLQwcAbW
         l7y9nkc6uBPRpbaT+fycsdd+SP9Qfhz0N4mbB+4k/FudJT2PoJJL8RYosrbizJsz3d3o
         Dg9dNvuwcUJ1Z1kYdRwSTURZYCDkM3f7855NuLlL/R63i5PmOTvaWhPocTc195PgjX6z
         VaIw==
X-Forwarded-Encrypted: i=1; AJvYcCVsFF07N1gL4jqMVcOmEPfv3m3KH+N6sg1IaeZr03NX216GfKCet4Ih7WEZ8Sz/xqWiFHtAq7/LblBkgjPduA1AMIXXX4zFe6vabU7oztMe
X-Gm-Message-State: AOJu0Ywln2qh3OxVbND6Fxu8AOOXJOy94ULR6IGubb7MYQkHJKYzW06O
	Yd49HTVhZWupD3V7tM4n6Dw5Qb0TIelQ28PFv2P+GCnlNn9Hbxr/+SAle9zfIphTGhWk0v0TTuT
	cp6HKFkCjZQOVQhh5jh6lvCrQ7kgoxzRCUhHIfA==
X-Google-Smtp-Source: AGHT+IHOqXye9KCZZG448CXko9HSkqfPVrmO82845VTO+F6jU8L2MsQWSJpeN3/1oP3ZGjeUR2ViNiHEQQoCCvJpXrY=
X-Received: by 2002:ac2:5041:0:b0:52c:94ad:9b26 with SMTP id
 2adb3069b0e04-52c94ad9cd1mr564889e87.30.1718111307827; Tue, 11 Jun 2024
 06:08:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5a970f32-25c0-4955-b480-a4738bf86153@kili.mountain>
In-Reply-To: <5a970f32-25c0-4955-b480-a4738bf86153@kili.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Jun 2024 15:08:15 +0200
Message-ID: <CACRpkdbSiSpRXGa=eHRgt-8sCgk9ByostgynRYoC1tZY9fUh8A@mail.gmail.com>
Subject: Re: [PATCH] bitops: Add a comment explaining the double underscore macros
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 2:38=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> Linus Walleij pointed out that a new comer might be confused about the
> difference between set_bit() and __set_bit().  Add a comment explaining
> the difference.
>
> Link: https://lore.kernel.org/all/CACRpkdZFPG_YLici-BmYfk9HZ36f4WavCN3JNo=
tkk8cPgCODCg@mail.gmail.com/
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: re-word the comment, put it right next to the macros and add a blank
>     line in front of the test_bit() macros so it's not mixed in with the
>     non-atomic macros

Thanks Dan! This makes the kernel a better place.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
