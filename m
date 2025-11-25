Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C9621256C
	for <kernel-janitors@vger.kernel.org>; Tue, 25 Nov 2025 14:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764080248; cv=none; b=WQ4GOM3ikUXhad0LHWlE2iAe6mvig1MZ6DGRkL2briLNj39Y4kJNl0jpnZ/ToWgecs8VHxx08jtxprraCzpN565CBAfgCS4D8EEvY3zPV+5LyrXJTsSnt413mATiFRlGLT58uFRRCd0lYJMqEno9Rqgbmg6wcS8JlGw3KIDvcFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764080248; c=relaxed/simple;
	bh=SQejutvb/0Z7u6wdlajxxGDJCd1wNZEchCc+S6CQDEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sT41rArmSwa9Q88J557X840TIdWpm21O50YDPXiId3l73zqGIv8lp8F/tnLmKgNtHOqy+zwq51BYUF5xyKFX4xShQYSxHBnOjY3YWXKZKw+Dg/NPHMACIzbx28x45JM5QZyHV1dZyhzsAReLkhniQVSsvhHiXnGYiZBnWwUO+wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QcZ/RuYh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TC0wQlab; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QcZ/RuYh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TC0wQlab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764080245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MH1rWdmJ5gnbvlrXMm8REudJ3jtrPYluVH8P6iO0nJI=;
	b=QcZ/RuYh2ZWxtkGZlLAYU16JIdADgfx1B4WgHCzjZP5FsjZC6Wha+elitBb18qs70QcAli
	C156rBFK2TdQ2x5LxtQx1ZfrEtW19V4RbS0tdx7f/CWBzGuGMRvPSl07G8HlFZm/2ffW8m
	AQgZhqysHNCKdHmTD8VHaojo26JkpiA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-N57Hs4TLMqGQSB1YcTt6Fw-1; Tue, 25 Nov 2025 09:17:24 -0500
X-MC-Unique: N57Hs4TLMqGQSB1YcTt6Fw-1
X-Mimecast-MFC-AGG-ID: N57Hs4TLMqGQSB1YcTt6Fw_1764080243
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b736eca894fso449456566b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Nov 2025 06:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764080243; x=1764685043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MH1rWdmJ5gnbvlrXMm8REudJ3jtrPYluVH8P6iO0nJI=;
        b=TC0wQlabozQ/ru1XSYqLX8dUmMYWHrFm8vUlD6Vwm8xu8qkqfRlACJwfdMyshEI+C+
         uU13QTTy/EDnKZ74GbQ3g1TzLqo4B8fd2Zx8kPuRgX/YxTYm8isLMM8Pz2r7ftSc0mXd
         jrl08KMcBwCncSL4sR5xRhu2jsVSl9/sHxRLxHM9WYucF8+qbYnJVDRva/7C9EKkYMqB
         /GQDas9vEbMNlML68dsd0kaDVXOrYQNpoz54OMDUKv/ZcSm66+nK4Yer46Sjd7hgF1rL
         oQbwrIWljJ664GKr6sl0Uod01c4itxhZ0SzGQQ0YJmNusBh1plqSYgCVEiIvB6f+n+74
         XODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080243; x=1764685043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MH1rWdmJ5gnbvlrXMm8REudJ3jtrPYluVH8P6iO0nJI=;
        b=DvE6T6M/3Kxn7pJ4EgWqCdMbIs5wOB603nx6JweJKnFFQgF2qjXzwWy2LHrLT57Tu6
         9iAshh53GrqNNi/XaCgiKVakIj7D8bC3YOjC82+HFXLc02MG1AJop8Yu4fxYXChccw5x
         a5ifE9nhMe33+yWdihCj6W9ZSBaLycKAYOBrCwMf+fgwJRVpB240suSsY5k5dsEHQmox
         JRkLxRP+P6CBIPMtVdXyEyv6IdsJduwKP7LEafiVWUWR6bk3iy952XrPr9+f9lHUnSjG
         2Kslxas9O7IWmTx5lfm0ib3+wCI2fuBsq34+vsJdIdp0AuTfJZrqYsRt8/jvVN8QqLrr
         Jtyw==
X-Forwarded-Encrypted: i=1; AJvYcCXkOL5YsJmVedO/z49eL2qfkdS5DOZ5THuiAM64r/eSl0yZsKopOUckxReCCh/c5YeyZ7/idT72YZlOVF0h61Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9YvyPMcSUP+gYIr3+0AJnTuqZfIGwNhZx9kV7tMLYejZ7ujSQ
	s1D6bB1G/AFZuWSlj9xwNWunPEhX6hQcdWu2P97Q0k2uexup4WJiR2Db+n1NFj7o957es2PGo4l
	3LovrXbmjZM6PdSWS231+m7SqYUr5vIkypuU9hmlZh4Nxqa4JCoaXvU/R998pX6vb0Df11eSQ4v
	FBxo3P+BFy55dWngr5bUypXf5Tiwp2/FcnycJt30Jh/W39
X-Gm-Gg: ASbGncsYfgRoUCaOtWzeBTLq0EtKFUoUid6UibwER2e2kvbUQl7Cwd9EkTTfef4U1bj
	feUkznPTijOid1IDKcTmUXadiKLFXemFZeJJ5yBLvDty4x350PMRrOKi4O0HISnvBTbuC9ZMMJS
	Vk/Ab2HLeutULnMHXz9iGY6EUJcJRf8KTXT/y4Qf/d01avbtSCqSz981McWz3nJwR8ARKD
X-Received: by 2002:a17:907:d16:b0:b65:b9fb:e4a7 with SMTP id a640c23a62f3a-b7671549d4emr1473433266b.9.1764080243233;
        Tue, 25 Nov 2025 06:17:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHccHLCbzUim1AflD/kSv+zwSb5LN6oqJ9nggj1U2mzdUJYKbwl087OCJjHGJfiEGfKzr68crTyOzbcQoKMIoY=
X-Received: by 2002:a17:907:d16:b0:b65:b9fb:e4a7 with SMTP id
 a640c23a62f3a-b7671549d4emr1473430066b.9.1764080242819; Tue, 25 Nov 2025
 06:17:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aSW1R8q5zoY_DgQE@stanley.mountain>
In-Reply-To: <aSW1R8q5zoY_DgQE@stanley.mountain>
From: Malaya Kumar Rout <mrout@redhat.com>
Date: Tue, 25 Nov 2025 19:47:11 +0530
X-Gm-Features: AWmQ_bkQnjnhw9dcwiFGTTUv_N77Mutrq6khqRVtPBZ7l2f2m7QQEuRywce7bqE
Message-ID: <CADD9qeiVv3zKTFkGL4Y_rKG5u6LDV_E6YULNMhzVF8C45jM7iw@mail.gmail.com>
Subject: Re: [PATCH] timekeeping: Fix error code in tk_aux_sysfs_init()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 7:25=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> If kobject_create_and_add() fails on the first iteration, then the
> error code is set to -ENOMEM and that's good.  But if it fails on the
> later iterations then "ret" is zero, which means success, but it should
> be -ENOMEM.  Set the error code to -ENOMEM correctly.
>
> Fixes: 7b5ab04f035f ("timekeeping: Fix resource leak in tk_aux_sysfs_init=
() error paths")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  kernel/time/timekeeping.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
> index 0c8b77ee4a3a..3ec3daa4acab 100644
> --- a/kernel/time/timekeeping.c
> +++ b/kernel/time/timekeeping.c
> @@ -3087,8 +3087,10 @@ static int __init tk_aux_sysfs_init(void)
>                 char id[2] =3D { [0] =3D '0' + i, };
>                 struct kobject *clk =3D kobject_create_and_add(id, auxo);
>
> -               if (!clk)
> +               if (!clk) {
> +                       ret =3D -ENOMEM;
>                         goto err_clean;
> +               }
>
>                 ret =3D sysfs_create_group(clk, &aux_clock_enable_attr_gr=
oup);
>                 if (ret)
> --
> 2.51.0
>
The fix looks good to me.

Reviewed-by: Malaya Kumar Rout <mrout@redhat.com>

