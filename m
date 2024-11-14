Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCAF199FD3
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 19:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731612463; cv=none; b=e1mxL3WeEs/wKxxSdFdJY4RJKrGUcDQnRwCk7OAGeNkZCke7TO9ilxfNcybZ5ux9baNLWYjvds+KNLbc8KLZD8fY3Wg/l/5dEXZPO+4DOh2aspwHhqfl4PooRvZG9/+FuMINNPmCDSTiHeZIS00SHD5r9gu2+/YXFp823v6N5a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731612463; c=relaxed/simple;
	bh=txcz9rml5UlukCVS1D+ITLftMxjZTir6dwyu0ic8vgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1YymavPX1L/C9dMeyo+p+bQ2Ud1PL5OovyVLyW+i1ciw2xBV4RToimztZmhA9kECc/hv00CeIHhNjzfqfRCvJBRppQOnIuUatzPZWIONgyOmUi4nZLVOVSu66dI0Kb0bvenqKGwb/RSpW7GnZJXznDUBKFBYU+YbxwjEpu+IYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=lkmqC5Ym; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="lkmqC5Ym"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5cf8b788f5fso288196a12.1
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 11:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1731612460; x=1732217260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeniB389OKvN5zEj18bT2eYMneg20P17C1/p3gN89l8=;
        b=lkmqC5Ymx6d3saVpOtEWzHv1FucT57O8Ag67el/sfpPgk5EOvJYm3BD3HmwfyRuBBS
         vP9Zgk6NTf00bk/GvcYeS1rtxCWYpzzaTCni5rBKUukfeBPWJfSlSFPX5fDTOUdznqbR
         sU1PMlrIYyVPOZWcXpwr0mnK+mOPKPRGybkhVQKM6q2hPxj4TMyqlhidAh2y7zWKpZ4s
         EAIJP8BpoTzJNFTgUXWAk1m5wFda0g6c8SbRxzWFHuFMzahHlRtZ0+9Oats6c0GDFECl
         uRWCq5ale12V4Iu+2V75nqhFWeBVJdm6qHvfju5s/r1dqlXPTJQsDVjvYN8ZsW4JpfIL
         8BLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731612460; x=1732217260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jeniB389OKvN5zEj18bT2eYMneg20P17C1/p3gN89l8=;
        b=Ix02vBnYRQj7iy+tc0te7tpVa6LqN9+0XMpV93QZnpz4rcYAUKtAdWoUJoFtDezEoP
         V55olTz5PlOpQf23xKF71oBE3J5558Ft4zcu3uRKepWSCSemXAJCforDienRV4Y9UC/Q
         cU3I6wNP1o0YPak/kWsc10JQFaCGIZ46VjlWDo0qtBCQmdP5LLKIXHzwtyGDIygBfPiT
         kNXz1qI0vzSu0AKUif2AaQJNFGTzak0v6Xz96+WMyEN/Jmv8f3UGV1IXmVyJ9fWA4VSx
         bWls1EG+hrkVTABWzFucl8Ac4Fvs17FsTHRMEMaywGoG5tSgepnis6ULpXC/rT3S8cGz
         DI6g==
X-Forwarded-Encrypted: i=1; AJvYcCVLZ253U+vPhd6/DOArG2uM1PJz8S8LarwOHU9tVqd8y3GSxu4qMIHz27arnw1P7fOFJSmY0zaunu734UfONck=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMFvA7uYVsfPeqLZ9L/YWpPyL4DTC5wG9Agippi6+ABb4YIgSp
	mjCFwUm+9ZXyx5+5H+uJqeQhzExUPIOmXE65K7yOhFJOkRuY1B66kyplAMvoTGC1hKxnOLXX8q0
	a/14ZoDLQq+HqWpfLs6BXuFwsfai009KsTUle7w==
X-Google-Smtp-Source: AGHT+IFSQszniN+RtUbvA9KWKxINe1wk8KIYUXCCO8l/ucVV+qEreHHvFvj2XdwHBbQri+4d2NNe/piuHj9oJNb3iSo=
X-Received: by 2002:a05:6402:2792:b0:5cb:dd06:90d5 with SMTP id
 4fb4d7f45d1cf-5cf77eeb2acmr3116704a12.26.1731612459509; Thu, 14 Nov 2024
 11:27:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112233613.6444-1-everestkc@everestkc.com.np> <20241113105939.GY4507@kernel.org>
In-Reply-To: <20241113105939.GY4507@kernel.org>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Thu, 14 Nov 2024 12:27:28 -0700
Message-ID: <CAEO-vhFzEo12uU7EBOb6r6J7Ludhe4HNNGvfN71fSDQRmR16pQ@mail.gmail.com>
Subject: Re: [PATCH][next] xfrm: Add error handling when nla_put_u32() returns
 an error
To: Simon Horman <horms@kernel.org>
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 3:59=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Tue, Nov 12, 2024 at 04:36:06PM -0700, Everest K.C. wrote:
> > Error handling is missing when call to nla_put_u32() fails.
> > Handle the error when the call to nla_put_u32() returns an error.
> >
> > The error was reported by Coverity Scan.
> > Report:
> > CID 1601525: (#1 of 1): Unused value (UNUSED_VALUE)
> > returned_value: Assigning value from nla_put_u32(skb, XFRMA_SA_PCPU, x-=
>pcpu_num)
> > to err here, but that stored value is overwritten before it can be used
> >
> > Fixes: 1ddf9916ac09 ("xfrm: Add support for per cpu xfrm state handling=
.")
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
>
> Reviewed-by: Simon Horman <horms@kernel.org>
>
> For future reference, I think the appropriate target for this tree
> is ipsec-next rather than next.
>
>         Subject: [PATCH ipsec-next] xfrm: ...
Should I send a patch to ipsec-next ?
>
> ...
- Everest K.C.
