Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB7118F2CE
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718614813; cv=none; b=hNRWK7BO6FSLPs8ZMdBqltIKzosLleCdjRybJeY7dh+AtIqJGOKz5Fx8Fx75sYyD+MDLTx5L8Q/rtmgwA1zxoJmqUk2pdxKVn6ZeqU9WQfdp/WPPgXUK3inif5Lf2cUYT3HlLkoWbY6Bx2O0i4Tk7evmVGmK5azcyi7hPIr8qMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718614813; c=relaxed/simple;
	bh=V1FSShmentoBvRry0j/39LUajSeLEBqH5nME2N3UuAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9zOlFaIp/1t0R8pyceupk6/BInAHl+vCCXjEozoTWz1GWbdDCkm0mNWjYvyhUUPSMIdt6v7lvHztSfSpNy55ZO9d4ss7sNsfKwxHrVT5rHtZRy8SMhGnmwDIp7sv5u3jSYckeW4CxkasJP0V1w8Jxm0UJNoH0adW0Qmw8nbqgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M3sM4XLl; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M3sM4XLl"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cc10b5978so158651e87.2
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 02:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718614809; x=1719219609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1FSShmentoBvRry0j/39LUajSeLEBqH5nME2N3UuAk=;
        b=M3sM4XLl/5Q0V3CRwkqgQAurW4yprqo50nshziVg/WYZi9JFR+GmPVDaXS1OxKO/Et
         b1u5qLcDIYPKS34p6cYhDZm3QatFJq4yydOmrydLzwuTgTb93oGc8NYZdnxPCxLpaGDp
         2kPDQ+EcFk2WQRLAa6GoBFKCKdTWTAsVPemqaxUvCginqfwHRj2AC5eHJZpST3ppZ3br
         J6HKyAr5ByeqqD4dlnVrGDwHusROlBfL2H23vb2GL11uHVHoUpQ+hVzaVCVogsnXzHEF
         h5naa9zSVWs8YlxT6YC9X2+hvFKXa97wcSUnlDNr34EDOFI0toWZxfblkLRxWWZCU9KR
         8gWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718614809; x=1719219609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1FSShmentoBvRry0j/39LUajSeLEBqH5nME2N3UuAk=;
        b=uzNNvqxRQGEkJBCyUmCAbNOQ0vKLz/wIK5z/IDJXPqvVSBEb1N4tc2J7RDDkO9pzaU
         qblSR6K7fp/7gT5sGXaQzZgQHjp09lHY6xx8mLaC1Twl4WnNZkijkxGTSdeNKG8jQQcT
         Qd8DT/t6RdD5JWEEuP1KPZqkyLGLBehbkp3/CVFs0RHvDMwpE1Fa0rqhruB28j2dAccv
         74c094AER6ceXoyjFxg6efjNkiezAjyxh46VzNMGGytJdmABaM8gmXI4ZfFYskDcFBx+
         6s4rVKMI9xYyMeTGYowJfPLoebggHqk7gN+cx3s9whiSfKgT4YTEtZbSSd9jllojdtwX
         8UdA==
X-Forwarded-Encrypted: i=1; AJvYcCXPAbKBYShM2u1kqKbw7g9mT4hRPGgyRKkRE7TYFvx9G7RvLYwcEOAlo1ZAxegrujraQjALggtGC19W0TAMnIOhGriYkJ0V6WRu1rLrD/t2
X-Gm-Message-State: AOJu0Yx6GIrsb2g/8nZsq0Euc6qgZAdjm8UHLunh0hKyxuCehqAd93a3
	uufySiIXaGFGs3Dv0jPbwjZQMquRbY13psngDLKSukmleW9T2ICuZWqmE1+IFbTNh97fCu1g5+A
	fbwNKrM27bX3k6MHBSCP6YQFgkvhQaSPOemeD3A==
X-Google-Smtp-Source: AGHT+IG9zighTs6xvh63BukgGULZA+rm8EHxMlcrHikHKdNririru1xtsssJ0ZWvnvp2q2oJd7kXO4xZ0dX+3hN0oTY=
X-Received: by 2002:ac2:5a4b:0:b0:52c:884f:5a31 with SMTP id
 2adb3069b0e04-52ca6e6dc0fmr6141428e87.30.1718614809351; Mon, 17 Jun 2024
 02:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610-md-drivers-pinctrl-v1-1-68462e3d960c@quicinc.com>
In-Reply-To: <20240610-md-drivers-pinctrl-v1-1-68462e3d960c@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 10:59:58 +0200
Message-ID: <CACRpkdY9aRr+OisO3Bs5-p7gtF_PbGh9MbWnyuURXSuMBW34Nw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 6:21=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:

> When ARCH=3Dx86, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/bcm/pin=
ctrl-bcm4908.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl=
-mcp23s08_i2c.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl=
-mcp23s08_spi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl=
-mcp23s08.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/meson/p=
inctrl-meson.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
>
> This includes many meson drivers which, although they did not produce
> a warning with the x86 allmodconfig configuration, may cause this
> warning with ARM or ARM64 configurations.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Patch applied.

Yours,
Linus Walleij
