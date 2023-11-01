Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F44E1374
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 04:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3jHizBOY"
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDF1102
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 21:51:18 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54357417e81so7759a12.0
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 21:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698814276; x=1699419076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtCv4uG/OXM/B1BEBS+Fmutn+hm813UycnKuzQVP7jE=;
        b=3jHizBOYcML+9JVIgjk33Bvx200q9GecNc9xu3/5kB9w0rgjUWP2319hRbkd4QSpl8
         BIbE6eyq/HbcSBRZR+1433YqzntSkyp/WG53LdouhwnBWcthvM0ULoanZHuDmdp2vQzd
         LTHa8xWo/Y48cE8O3bz+qNsr6Ab742t1nYCgnjuOTjULJK2t1nY8cC5xVM2BkL+wEpRq
         bPiSKm6doGmDixaRdhqK7r1nqyIsOHO9Xic9r/3iNN7F/IdkF80kJF6wKrmxVQOgw0PE
         /zzbvSkRtUMKk73MquXSFgfME91ShNRvN6wHAzOTbOxhUrTVNjJEJ8qbRVc3/gaoSUTk
         1VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698814276; x=1699419076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtCv4uG/OXM/B1BEBS+Fmutn+hm813UycnKuzQVP7jE=;
        b=H6yd4cAoTeB9wFYur9sEhtxEmMCAwMStWST1euehctwDlWr1FNDEtQauorvhyvwuXC
         f4jSH129aOOymV1RqO8Neq7OVi2dQiHPhFy7CwJaUYeCrVJv5fMg18qOMvekWiqIYgaf
         AS+8ZRMgGqfspfs1bq40rai8k+DubtwOHC4D6H9XHJPk9x1cEnks8DGGXkIWdy271aH6
         3npwGDCdSSlMF0COiHCEjqq4j0N0HcZtZUEirRNT61HmEjMQFEOgbAQkMsb6uF90uN5C
         tYyNIloZBy+BP3LvlbLGQ4/cttR4mhqCCrnziVLOIWHyATIsiOuNIkp5aTBOUsxm/Epi
         4PbA==
X-Gm-Message-State: AOJu0YygquUL7Pk4aPVOIfgJWwaf1Zf42vgZxxIf5G75snDQN0FypSke
	0qvtkGwzcIMTSwohV19mi5Z/2hxVt7JLAnLijWUg/w==
X-Google-Smtp-Source: AGHT+IG1a4+d2onDesPfbMcPoMuS3zsQ3O9VgdzWLfs5Oes0xMUVSoJdoFVmwMemPip99YH29m6tfyjIwu1s5dNiEs8=
X-Received: by 2002:a50:99cf:0:b0:543:6397:b46d with SMTP id
 n15-20020a5099cf000000b005436397b46dmr202885edb.2.1698814276242; Tue, 31 Oct
 2023 21:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ce915d61-04bc-44fb-b450-35fcc9fc8831@moroto.mountain>
In-Reply-To: <ce915d61-04bc-44fb-b450-35fcc9fc8831@moroto.mountain>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 1 Nov 2023 05:51:05 +0100
Message-ID: <CANn89i+_xggUyAc4F3vBuH=5PtkCfrLcF77poKJU2N1BMc_1MA@mail.gmail.com>
Subject: Re: [PATCH net] net/tcp_sigpool: Fix some off by one bugs
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dmitry Safonov <0x7f454c46@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, netdev@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 10:51=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> The "cpool_populated" variable is the number of elements in the cpool[]
> array that have been populated.  It is incremented in
> tcp_sigpool_alloc_ahash() every time we populate a new element.
> Unpopulated elements are NULL but if we have populated every element then
> this code will read one element beyond the end of the array.
>
> Fixes: 8c73b26315aa ("net/tcp: Prepare tcp_md5sig_pool for TCP-AO")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> From static analysis and review.
>

Reviewed-by: Eric Dumazet <edumazet@google.com>
