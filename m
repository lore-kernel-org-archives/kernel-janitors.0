Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48246F072
	for <kernel-janitors@vger.kernel.org>; Sun, 28 Apr 2024 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714335616; cv=none; b=UXomzGkfVXD5ZEeVtYbKvKepjaFX5CV9tQpG3l4VKhEob0J31LLkSIDSjRZGabU7KeZDgZDgYD75SmXDmybSIS0TwM+Q11ZXJtlRel9ULRHVqO5PFbedIvTdElbbc9INqGfZzmyL//Yw8n+KzBKWuiiYjPvdqABC/qRyrnMl87Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714335616; c=relaxed/simple;
	bh=naiSODMjEFZTAWJMatalJfCiiGdYd7LxVoEg+do0Da4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Fo5uU2QJgfxdg/8AwUQacVEhJ51J10Q6MF9upBddY9mG0zJi8bMQ11nlj2lJwnZYhvC1KPYtAJZhOsp8bc83IdqYJy1no29HD6OOu/GZ4yx0L77ZG+Dz+Tl9m0E2exNbMYf+pk3OzDK6GJIuvpXZluYdUfKlSgN5vkr01MeFJvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TpsNd0y4; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TpsNd0y4"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-36b3738f01cso208795ab.0
        for <kernel-janitors@vger.kernel.org>; Sun, 28 Apr 2024 13:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714335614; x=1714940414; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DVGfYkDeFehcb+pRimbLtXuka+P6h44CH3Z8Q2TQV4o=;
        b=TpsNd0y4h6fhssQwV7v+31lkWKrcIYhEgm466uGkPXQXuVD18VvqdEOfsBbD+Ps7qM
         8bdEHqgJM3HwyWqYbDrmUuSIIM2Z6YdRLYUS+AeVZMBcUx7ruOXGhCdo4VJh7cEC1ZVF
         Kp43GqF3vmQulsyHi/s5YQ1CHaDkVxbt6SfXVXyDRgFdd0vqx1Ut8H0F+QkjbzkT042E
         XlRWir7kTURDS/vSuCT0x4jVoPdpC5R4gXQrJKqIWKMD8Z4/83KVoVnH3b1tzZY/1mDD
         J/JsSLuUsiXGsmikQJVVPDHzYdJ717cE0uE/2BUG5HCC76pJNY1MYpGHJDnkirlK5z2u
         DmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714335614; x=1714940414;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DVGfYkDeFehcb+pRimbLtXuka+P6h44CH3Z8Q2TQV4o=;
        b=TpkKC4/t/2P/VOvo/Ym650iIzXNFgwvZ9Vr32GHo4NyuFnNqxEYQb0maDR5am5yeMC
         CcVzIzjacwrRzQm6nI51InJIMUQKi2cY3/Fc773z4TIhMUInD+6uK8wzvz5xIdPRStGk
         7gaS0/nPuwaUMdUFnrlElo0SXl+ob1XRezqErBDF9TbdnqkOLnpERgCkrsxhzZihoJqe
         IuQxqD9kJ5CCBfyrcZMo5PAFkn6fxu0P+9qNiLaDWnFyR82RnTY769KCIci2kx69fTD4
         FtTvFUhQkEVY9rznS7cg4lz5nTbsO1eXyLLSPiWH4D81TCFAtd3jPraVlZ6uLJ0F2xnI
         7iRg==
X-Forwarded-Encrypted: i=1; AJvYcCXuRR7Lnvq2RbPP1VfU0qkPbyutss9h8PCI4tnGy9jVXrgvYSOQQop9LOJgXes1R5nD+r9r/GnXdFQ4SkuNGxiojyB4tUga2g9iYNAPF5dd
X-Gm-Message-State: AOJu0YxNDmLLnhUk3CeFBZyccJRYJ5xjBi7rNPzW6lS3RV9eHTxgIgUD
	Fqm2MpjyZQMRTKU322WsWrKX6ovH7GoCzXvomkb0iM3ep0k/QjylZ/bfyz+R1w==
X-Google-Smtp-Source: AGHT+IH81P61EWXQeIEgG/0AuvESJvMSetYf9rC+8jw7W1/KdFqbiAVe7ttTUS14mTn3Rgcg2EAvOg==
X-Received: by 2002:a92:c5ab:0:b0:36b:2c6f:ac1f with SMTP id r11-20020a92c5ab000000b0036b2c6fac1fmr293061ilt.24.1714335613530;
        Sun, 28 Apr 2024 13:20:13 -0700 (PDT)
Received: from [2620:0:1008:15:46db:4823:ceac:2ea3] ([2620:0:1008:15:46db:4823:ceac:2ea3])
        by smtp.gmail.com with ESMTPSA id w23-20020a634757000000b00600d20da76esm11291235pgk.60.2024.04.28.13.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 13:20:12 -0700 (PDT)
Date: Sun, 28 Apr 2024 13:20:12 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: Christoph Lameter <cl@linux.com>, Peter Zijlstra <peterz@infradead.org>, 
    Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Vlastimil Babka <vbabka@suse.cz>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
    Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] mm/slab: make __free(kfree) accept error pointers
In-Reply-To: <285fee25-b447-47a1-9e00-3deb8f9af53e@moroto.mountain>
Message-ID: <07209fd5-f6c3-293a-4968-63a11c273ed6@google.com>
References: <285fee25-b447-47a1-9e00-3deb8f9af53e@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 28 Apr 2024, Dan Carpenter wrote:

> Currently, if an automatically freed allocation is an error pointer that
> will lead to a crash.  An example of this is in wm831x_gpio_dbg_show().
> 
>    171	char *label __free(kfree) = gpiochip_dup_line_label(chip, i);
>    172	if (IS_ERR(label)) {
>    173		dev_err(wm831x->dev, "Failed to duplicate label\n");
>    174		continue;
>    175  }
> 
> The auto clean up function should check for error pointers as well,
> otherwise we're going to keep hitting issues like this.
> 
> Fixes: 54da6a092431 ("locking: Introduce __cleanup() based infrastructure")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: David Rientjes <rientjes@google.com>
