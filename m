Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF97149C7A
	for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 07:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891820; cv=none; b=nsof1DGm4aGBm5bMpNomhfXLtF1UzD4WkYRHddeEbYnxiol5LRW972B+Z4vtgW/Rqr0OqyR3payEhZdbPM/DotKbOZZcvpvIyN91fhGEoLicYlY3iiebiduR0if/lZM7QPo2Iv56fj+jUp9ipDo0e6R9oDZVtp0yb4qMkDBKRj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891820; c=relaxed/simple;
	bh=+g4VLx1y4rTCco0Bfo9tUTjB1bWOGr7+O8v5/Po4yFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hi6XWxtY+x3xnTCBeYq+cwa1TQO1aPusYmNsC4ZPmTUemQIDVzWIm8IoZO3QbrPfvE9XiXp/xZwgzEOSNMvsTLgNsIOd5ry38TialkTxZ8p1V4U8u/fVK90KAg2h+ZzPbHGBuZcsXxHugErEkbPCOqVMtYrAIKZi/+wO/I0YAXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LVeG1lyX; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LVeG1lyX"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a0084f703so179682766b.3
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 00:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728891817; x=1729496617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+g4VLx1y4rTCco0Bfo9tUTjB1bWOGr7+O8v5/Po4yFI=;
        b=LVeG1lyXx7hnoLsKQMacLX15ir9sUiYTaPcupelSSfelKngBDLEmH2SQJBpOxHOKPw
         7AbFdBGhZhLzS5NZBKoMMAMjg9SF+2lVAd+oihKGW/dxuFAibJBYoVlvB5KtN2xxQRdM
         YTsUpbZ0YL6sLrTDOp2NdzLjLr+ddA0TlsGig2Ct1QFFJuylM/fWVVlMcgaKMsqGnhsE
         k6OAijEUPshfCXimhnGjxDYbBSICqkYGxsmIScqB0rhlOfrKKFJ1A++zxRkPPWst10R7
         heqzcV6DCxk2c7+kx9AjAtlXEr+JoUjRj78xP25OWtnjUvwKO7t4zLRMZjIpqU/ydEUk
         atxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728891817; x=1729496617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+g4VLx1y4rTCco0Bfo9tUTjB1bWOGr7+O8v5/Po4yFI=;
        b=fc2BODTR6J0AaQZyQkOhT/1Jtwm0fnSILCFcs4HAoC7ZUQ/zwXbqvUZ8+dl9la3dth
         utCO4JvGVpY57yJsTJtdb6HqKmlJsf+L+OoEd7Wf5z3RL6DEvvIMp3j0I+jU0Ucvv4pL
         Lpn+6wsCHDmjgKK0LXhFTRNg7kjcQFZ8rhzJIdGiY6OdeGhluo4sUJQbPq2ZAaQUr315
         TfSeI/cmMdcJEuU4hD4GHdoQnu6r1h1UBS/lAdcqAhL6Ht9/2Zx/gCvpPegXaT7Tfy+2
         UXPENdcjG3HjeJm7o+NAR/h1ni91vBzb15ZLAU8y/keUelzMC5ab1A+a/mnQk6EFWtBf
         Wv7w==
X-Forwarded-Encrypted: i=1; AJvYcCUnJNnRV4JBkrDA4bIHPADUCZfIzWpWkb+TT9QbVamZjyfS/1tCnuWO9KcM4I4soayrHjp0D8tFZs1pFn5BZI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgtnrOKePQu50Rq2SR4I4x3pvzEZGf86TwnWaj/QrAiFHlo8vU
	uOQSgfOzSG6Z12djiqEXAj1WI6EFOYipo9ryKNlz2X92CK2Rf//cAm0lO1jvWAeHRTI5V37cRvA
	MLtmSyF0K7iLgC1cJFQc/EY2InyFe8XmccuqG
X-Google-Smtp-Source: AGHT+IHnZkjVP2r7pHiHbF6hr7YjrWQOYu5wNEGh0c/yJ2G4DoqhzAtXz/FASCdsr2WwE42Fq2111yQTmdPNnfSAldE=
X-Received: by 2002:a17:906:f581:b0:a99:f3ab:c58d with SMTP id
 a640c23a62f3a-a99f3abe8b7mr526573766b.16.1728891816887; Mon, 14 Oct 2024
 00:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241013201704.49576-1-Julia.Lawall@inria.fr> <20241013201704.49576-5-Julia.Lawall@inria.fr>
In-Reply-To: <20241013201704.49576-5-Julia.Lawall@inria.fr>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 14 Oct 2024 09:43:25 +0200
Message-ID: <CANn89i+EwGme3GEq9j8hPUqZ3+vCy3+73tTNM=1p=51eKPpPGA@mail.gmail.com>
Subject: Re: [PATCH 04/17] ipv6: replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org, vbabka@suse.cz, 
	paulmck@kernel.org, David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2024 at 10:18=E2=80=AFPM Julia Lawall <Julia.Lawall@inria.f=
r> wrote:
>
> Since SLOB was removed and since
> commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache=
_destroy()"),
> it is not necessary to use call_rcu when the callback only performs
> kmem_cache_free. Use kfree_rcu() directly.
>
> The changes were made using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Eric Dumazet <edumazet@google.com>
