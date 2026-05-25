Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127043845AA
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715155; cv=pass; b=c6VQM7hNJBTdT16seTLj7SDkKi2LlJ3vQgNYG9Jzh93UShnhmaVRTjEpvb9kRXeKiwMkcabwuZVf3CDsIxTLpmctF+CZDz4kHW5bXwQ9gm3qlVj97We0KjcuNZbmfTIydCpK/WboX5rVbK+TTQx1dSEs1SRt35y2+ZkEPRNm+q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715155; c=relaxed/simple;
	bh=8bD4hhV9R1rrByl8nODL0zdz+MEjBPj+Kc6NRhnT61E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjJaiGZtUSzMdg2jRac8Mdij7jZ/EAmAOLV0VNaQDE+mmuxGdbgZrmBU5iLmxFHzecKt43F7IiyCVK/5AhpIK+iHZfqxggJgp8meKPn4dhLdrRIt6bMkIekE5pIK4zYgTwB67iuZpqygWG1ByPhZtwdCZZS8TQuFF+JWWTsqjNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iM42wkuo; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iM42wkuo"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-65c305f381eso10214718d50.3
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 06:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779715153; cv=none;
        d=google.com; s=arc-20240605;
        b=kujn3Ouz6f5u2CzvF0SzmeKeTTkCHpKb4tUle383saqAfksEBLiuqF+sTT1YFp9hJ8
         yNu0/Qe5rxNNhAnP3BxCEsv0ub6D9X9cTVp7JJPNnp11QSDW/HJyd8IZ+wNYut5nCepO
         StQ3uUTPKC6l6wwHVjC32QRNZ9f60hVWwIw9LPryhZDIcKrJ6wXlc2UhhU8kYe0IOro7
         MhDcZW+HmObk7Wx61jLHUSGDI/k4Yqfg/ud828nM1KcghsLQOSG4biyqIfhBO1NAEvHy
         mB2aQPuOsa4pER8RSj0ZSWGXTtqe9MfzNArANcJN+XztAXdJ4n4zo0nELzX5Q/5/4bGt
         JTiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZ1l9EjcFdXcWL8orZnpT/5BIMT8jYn9V+RiteMHsoc=;
        fh=/Y4V8u2RGkANiFN9u1ciY0q1eH6xqWg1/6GTDAM+Gwk=;
        b=UMfu2eigT08PS3YKL8/byspOA4mWr5IXpC7910E8//dI9mFLNSENo60n0yPupMd6EJ
         HdWjAnkUMYfqrs7ChlYRt7H+raIB+8bcZhKzOAnHL/NZw7jfvYil8gdu/NWSrnsoHWDB
         zOcoR9LBVN6im2tedHsmKuiH6jlHtNSc9J+fhZwqCXxEoiXlfAefoCGi7XRN2pX/Q64M
         xhRDWHvB1XpltWw2VZP6LfQhUcBaWgtuPQsFKB24HXThJ2UKmcB895woFUAagm1Fqpxz
         uHOJApA2PxMGWVY35KRxBx+E+kj5+MQBNxD9s5RFJf7GSqpM9p7EhmzlnKd5Dx28Ahm5
         lGFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779715153; x=1780319953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZ1l9EjcFdXcWL8orZnpT/5BIMT8jYn9V+RiteMHsoc=;
        b=iM42wkuoQSkFC7jTSCDZGJKrIjqi4OMcSLsn3EFAuiZkxl2iwLJdXh1oH3LwKR/V/3
         bwZ7LjWooVoaX02SKgc70WlQHC4DkOHiYoPv9IQrWYFveMjYjXcxCx3HUp5LB3PvSYUh
         rOBGIjIbo5GIVu7BNa9AI+Nws634FTSgk/BDELqO4QnH7mLDPEn++ceCXA+w/hA9Xqv3
         WRPu2KM4Aeim2mXw1AqhFR9cos5L3sOR+dRw/XIiy3+/Cq66jtZAAUciVUoYWRIGQmGc
         +tRjOb3UWYXbblVAdPhQ33D179TjFjxRHtTIYmwjmCsopzqtxoMv4P5h1KHYoGjdsFm3
         PObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715153; x=1780319953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LZ1l9EjcFdXcWL8orZnpT/5BIMT8jYn9V+RiteMHsoc=;
        b=X9B4MwRa+fPBhn2e34KnA2LVm0oNLjpeH8o9hLqFWSzmA3a85s4h0+pXwugvR7HS/4
         5cK23kSHi2Ms531MrU3vqPiKkR21mHTqeLuSHqT6oM5fEFUu1+gT3o3QHgHIFRptusRB
         27ba1IvbW9ozTxnr0STFr/zRiGckuz/7H3S4swmQJ7HSNxhLOo3QktswIc/9vBPw0BCN
         ql9IScEBxhRtYxRJmgYZrmY9Hgrkysnfjz0wrP0+VhAoZ7VI3d/Xe9+0GYusEmXBqk3/
         LZRw6JsJcp9WBwBcEs5JMQzMra3XES7rLZsZiPJLcXtiUHx7RpLe18SNL0RWVsrS2tmE
         vgtA==
X-Forwarded-Encrypted: i=1; AFNElJ/DtTTSFZxvGWRT6+ASJFgNfskkuydLUJIo0jH9miwzy7unluR23P2s0hvmqySg/7uOv6qfOPrUZN9JUxXq7fo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWWvCbw7bmH3MKNpgOYHumOYAPCUEMrmBsJ7x58uGnk1qetaIO
	jMSRVL+7pDnqiapQZcy9qa4bDxQEP6BDYar9sfgMS+UNEBWniOa9bg1iJqvafNM8MQ5B0E3P0wr
	Ni8I//w2xeq7vICud0jvUwT4lOwL9SlY=
X-Gm-Gg: Acq92OHlcPARkhFNZrW0Z++NdS9sZCVu05Bs1izcYazcM8v5uthgBJWZNBwIlXpjSJb
	Zkc1mVRIlOVR6eaHc6WOj/26eOzXgERtcSLHacMXvmoznnx6nBvpIv7qWCSelntPHoskCSWz2FF
	+F42GsI689kkQLqqmLeVdKXzhO0v/HaGWWI1JCP2dJM8BOkJO14JHF9OeOQ4IOqZH7Zd2ExgW9G
	6077BsGp8L9gaBo5g9xohlsNrnZPYl5G7WzXM99GybvtQHCJ3aaVBq5rM7mplgYThxHchE1GGBT
	aXhTd60=
X-Received: by 2002:a05:690e:1516:b0:65c:5e34:7343 with SMTP id
 956f58d0204a3-65ec99a13c4mr14300051d50.44.1779715153028; Mon, 25 May 2026
 06:19:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ahP3S9nOYN3pG-Fp@stanley.mountain>
In-Reply-To: <ahP3S9nOYN3pG-Fp@stanley.mountain>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 25 May 2026 08:17:28 -0500
X-Gm-Features: AVHnY4KK9hzC8IuiiFBdKBDnjJOGGMh1HJ9ZcdNrpkpYcGQcS0iFGTJqnGUlKx4
Message-ID: <CAKqfh0H0Z0xr4bAjctr9h95QTuEUTF1eCgBsRZVHn_KrkZZX3g@mail.gmail.com>
Subject: Re: [PATCH] iio: core: fix uninitialized data in debugfs
To: Dan Carpenter <error27@gmail.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Mon, May 25, 2026 at 2:19=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> If *ppos is non-zero then simple_write_to_buffer() will not initialize
> the start of buf[].  Non zero values for *ppos aren't going to work
> anyway.  Test for them at the start of the function and return -EINVAL.
>
> Fixes: 6d5dd486c715 ("iio: core: make use of simple_write_to_buffer()")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> The original copy_from_user() code was better:
> https://staticthinking.wordpress.com/2026/05/23/simple_write_to_buffer-is=
-complicated/
> ---
>  drivers/iio/industrialio-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Codewise looks good but often times people will prefer

if (*ppos || count >=3D sizeof(buf))

over

if (*ppos !=3D 0 || count >=3D sizeof(buf))

Regardless,

Reviewed-by: Maxwell Doose <m32285159@gmail.com>

best regards,
max
