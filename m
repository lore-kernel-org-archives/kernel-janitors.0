Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5BF43B6CA
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jul 2026 10:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110035; cv=none; b=YZc6amJeV+ST1WRZ0SMM3HliUv+nDSRPFandwOfVHke85pU3rQcSjAEGtLkKxPTc8Izk/GZNsDizMF01cMQUYOunhV12xMmYcVHiVfqVsNlCVx+t1rUoagSk7RnDds9g7uI4p4eXGwE3Q8K877rBrgSLYqBJFIWVOpYUtWDRJjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110035; c=relaxed/simple;
	bh=y0GciO2PptY+uLJh2hE0gUz/QaDDOUqegX2K+jVz2EE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CQBR2t8AoDtUFF6VLHmXa7Af6hrMTHLSiWNyeZfixxMVHYdudV5TpXQJ0dWEckvGlyphAZbRgeEcZbVgJqrK+9QFXmAP5zedeO7GAgwo14z+mZjtNg8evNokeEJGvcG1J5wpJpSqTGbvZP7nZMm3qmMvahikMYhacEMmEGxxNNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvQWJz0U; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvQWJz0U"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1474858f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Jul 2026 03:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784110032; x=1784714832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i3m9zsFrAgWzgJX2cCHjiYa0wXHpJDDJln72RbZhmYs=;
        b=AvQWJz0ULKUc7OWuHhozvdU6KFap2rr0WGWVWhFfuOtUS5OwnLKm1r55IJX1Bdel+H
         Ym0xZyfofDkWsjUDblEucfGXSRw9WXMzly5HCTUFsmbGINiQoc6y70SrtwjPyAmbIKv8
         jqQ+p63/i1Y0RHwRIzlB0pemEJC4zYZiV7BwpbrDZZhPIi90LVw7DgJ3pTqBJBgRkeRJ
         r8ySQWtMGd8OqJ/eObI2uyNMtDo1IcmxJgYgLq7AT2mvmgT76hpnGuQFD3qGy1b4FHGw
         C6lLYXxBLej1qh30LrlpzC4KAYcUDv2J/OmMIAF4kaFV5t6kLPZfzdcDweR8KlbQVhfJ
         Dk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110032; x=1784714832;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i3m9zsFrAgWzgJX2cCHjiYa0wXHpJDDJln72RbZhmYs=;
        b=lJ1URYNgMwNCrPMPtsR0K2IWPihqJnU18Xu59nfFn0F1/uRf5Qe4OtfHG6zjHKH9ri
         yMPv6SuCvO3oUSZOZFTvUJb3oOo04EfINvw0F2zBOsnAzikRIqCeDrHAG31xrW7OlqC4
         YRO7gnfpGfDfAN8zot3/0kFqwa3Rbym90aOmHtmDLz2qigNKByk6Av7MTqMYF4cvF0pT
         BTjvI5FmG6duMw6qg8DIc5V0PpGfOcrdhZNpatPOCEZDJf++FlX2sJAFXfNTtJAe116m
         OG2i/hqHIoiPJwaCibydwXk6MVT05wTVn9562h6dHLWyuuSCkj9aTpkFZeFkJaRFFOdf
         smLA==
X-Forwarded-Encrypted: i=1; AHgh+RpxeV2PsyoEM3CW7rbL3lp/QLFq5PIrspExWBPCJPGatgbASkpbRe5t8Jw2EZ9J4Vu+u00Rl6C6RNPz+IZkalo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE0POKeMCA/7JMO9pB1HpFY4mIddkXhIDnkx45MjCuKL7VqWyS
	6oSOKhXZH0q3JpbOie26PSnEz0Wk3AbCYMM7vrCH1ZQWvBbGbVF4xSgj
X-Gm-Gg: AfdE7cnszQOs5MPeVnELp6/ao0VsoDdQBWHGbcS1DUoE3+wuNrDWnrbdcbPwIPbTN+j
	kY9s5KG5pkPuekAbMfkDfPAN6tDI7b4HmPgCLZ48mX6Rk672N5jWaUj/canqwUizRb8Knu106vO
	ODCGfISoHvUUmmix2jIKCIks/4fUHUG+xYu9xQlEfE2vV47Oa7sSQ5wbTloKP/7ld24Tyr63DwH
	Wkh+pn7cOMu+2QWKHQUUJKumzS5sRBzPync+8RlWp6VHQGZ+XeVQnmctBWRLBZd6oSJS7CVYxYb
	gKzuAo3ZBg6lLD3mpim7Ue+iF7F8yidgRg8f4+9YYvMptWrDK57wDocnHuog0mtQVQCkFa/rnYS
	d++Z7v0gcIvKJkBIDWnp33mkKEYlQYrsBOffIqi7OsoZVlUVWgFQR25riM+4EqgfXQDe3l19vsO
	sCng7C0jA5SAmEgYZbB6/5VCU0HPOtsdOHkY/nENR9T8IO+MdUzQ==
X-Received: by 2002:a05:6000:2305:b0:475:f0c2:75b0 with SMTP id ffacd0b85a97d-47f2dcd7854mr20150852f8f.27.1784110031605;
        Wed, 15 Jul 2026 03:07:11 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a935sm14962845f8f.11.2026.07.15.03.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 03:07:11 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:07:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Colin Ian King <colin.i.king@gmail.com>, Duje =?UTF-8?B?TWloYW5vdmk=?=
 =?UTF-8?B?xIc=?= <duje@dujemihanovic.xyz>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] iio: adc: make read-only const array config
 static
Message-ID: <20260715110709.74f556f4@pumpkin>
In-Reply-To: <alZs-uLJug_rnRnq@ashevche-desk.local>
References: <20260714165012.184651-1-colin.i.king@gmail.com>
	<alZs-uLJug_rnRnq@ashevche-desk.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Jul 2026 20:08:10 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, Jul 14, 2026 at 05:50:12PM +0100, Colin Ian King wrote:
> > Don't populate the read-only const array config on the stack at run
> > time, instead make it static.  
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> ...
> 
> In all patches like this it's always a bikeshedding possible of moving static
> data outside of a function. I have no strong opinion in these cases (when the
> data solely used by a single function), but in general it might give different
> readability experience (it's harder to notice static data in the local function
> definition block). So I leave this exercise to the maintainers of the respective
> pieces of the code.
> 

If global you start wondering where it is used....

There is also the fact that run-time initialisation of a 3 byte array
on stack is very likely to generate faster code than using static data.
Mostly because the access to the static data is likely to be a cache miss.

Then there are the architectures where just generating the address of
the static data takes multiple instructions.
In that case the on-stack version may even be smaller.

	David
