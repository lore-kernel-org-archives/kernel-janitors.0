Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17D4401A2B
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Mar 2026 19:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343849; cv=none; b=anWm37aEePXpG5HnmmXF61sYbUwmNeuwRy6ZvTaS6FR8oCsewjLoUBvhv/3Tt2CIrF9yK+WgMI00fXbvejTQzgaDi8i9oEF7Q/eRDOBdtfw+twDUHRduzj6FsYHz1UDjGeJzQhTGRhRKrpxnLJSe02fQ5BX3ITw3mhdPaPn3KYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343849; c=relaxed/simple;
	bh=y7Ic8SkZEutrwZjF9wbUzch2Yj6Ry/4aJx/GuhaJsnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cn7TZ9I+9r9qp+nJCwrpl3mKw37/oYzHPeaTNHw9PuPTx4WW9dj4hSlPUzACVZttI/8ZEgJ+STRGNVRRLh61QPKgcnrtLRJNk+Mmulx1YC2RQ0hNs+R//JsTvEKNjChH57fJVw6Q/sB8qrEImI8YAKjTjQKCw3YLbXOvcbSy2fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d556c1a79eso1553588a34.3
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Mar 2026 12:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343846; x=1773948646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nwiFGJRSfB6hzdknB7fn9cdgGxf64BtP9o6kcYSkeQ8=;
        b=f/OXeCtKwTGi3oym/3k8gLDCS6BPettmC6aCsRqIlEdk1uF7wqU4Cxl/8ZEyTnL6wK
         mYKtTt+YPi9nLJLpKa7nJEZtLO1Jd+TpcVITsDpyiJkbBnsUeCyYQkGXoPiU4CZAgOVO
         aE8ovbpyIlFyRmFxoyYPWL94x1/xmC6nQAJsVyAMXLOZwSUZmJ71dwgF8/Wx+38IqrpK
         Xej2EOtDxtyS5mnPGf8d/+3otuV17w//WZLnVJNDmwQ3gxOYSYmjFptw6yYFpywPKdmN
         26MkximWfIUIg0t5hyPyjiWoq0e7OHWk+mrJAUbyYXs8Fe2x7G9+12nK6ZumDhcDxvUQ
         nOcA==
X-Forwarded-Encrypted: i=1; AJvYcCUp0JJu00p43RmvU2Sqhy9p0R3+rpfBQjTKGh8xxnZfFcMwjvjmv1fQOLiqCSLXHfbCNuDe5bOG5/vw+ZeMnp8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykp+wsBU98aUr554/VNEWSd43CziQ07qDkB9GeqYH1q6OGMWV9
	ZU96umOitIFhgla7Y0h134w17mfdRJbkMDwSsWQ0at817l39PuHMEN5V2XYcqA==
X-Gm-Gg: ATEYQzzOzQx3fc3CFSraUuUnb8TE649iZEsPomlCgqIIuzudakBz+8GiKLHJoW8JlNP
	RKtPY/6AyQBIHwTSxBaG/L0HzB9PFX6eGPcMl1vuMafevGZgf6Nv4M6UDpWxpRsCfCA6b/remwi
	gXUbK2+uF/6FjguWhIdqLBVoT72yu7nY5saWlKId1BFpD3EPwNpV5uMLzHwuGT98OHIGBnCs6Pb
	aPV+rJRcd6CJvScC79MQT53QdbVuupxFAgnHMS93OPubWm3peOYDjA71mVstBdCD1tjccNqGK2L
	09RH1RerCO2MLsTFO5RaiT2vlGn9ePE+E+wixE3bLFdjYkiSBXt8hq/aIyd5LDcrI/9oPdGmY6/
	LHcSOrcmVvUf1OZ13zF32iDBUvfaHxXCBIzo6c4khOFg21jijPaGtizPfEFzD6I7gB8AqNqIRkB
	0azBJic7I+EaOmriPRCWLvepeTcA1Bo7sFKc/giT6IjPQE+aVfkQYKg/ZJ2YcfCZyKqp5qA4jyv
	5Ne+GEUNErUkgWMyIDGszNLfpkPLu+y6oPMPAiJBfVyzgSOC/ouwjEQ7F0vz7k7flNGdp0pnGvS
	mlUxqdwY
X-Received: by 2002:a05:6830:4388:b0:7d7:55c2:d768 with SMTP id 46e09a7af769-7d782574e58mr386663a34.18.1773343846444;
        Thu, 12 Mar 2026 12:30:46 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76ae68a4bsm4660837a34.19.2026.03.12.12.30.46
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 12:30:46 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d77b179b52so939174a34.2
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Mar 2026 12:30:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZwNhHgs6OGJFK6WIXQ2IjocadL6jIG8nVjSqAFtvkoGUlzt49bpKLXbHvuCCY6AIfqHCp9JTtelkNlN2SZg4=@vger.kernel.org
X-Received: by 2002:a05:6830:6508:b0:7d7:44f2:cf6 with SMTP id
 46e09a7af769-7d782574aadmr414436a34.22.1773343846017; Thu, 12 Mar 2026
 12:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2838895.vuYhMxLoTh@fedora>
In-Reply-To: <2838895.vuYhMxLoTh@fedora>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 12 Mar 2026 15:30:09 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-KwNNGoi3mpPeNq3Jmtzj_5seuj1Qeh2_1dt994iCJSA@mail.gmail.com>
X-Gm-Features: AaiRm53c1qZCB280A2IGi5tKHEffuGeO3K6uS7gw8tLpnvn5EhoDD4Js_TJQtX8
Message-ID: <CAEg-Je-KwNNGoi3mpPeNq3Jmtzj_5seuj1Qeh2_1dt994iCJSA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: apple: fix spelling error
To: Axel Flordal <axel@flordal.net>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 7, 2026 at 5:29=E2=80=AFPM Axel Flordal <axel@flordal.net> wrot=
e:
>
> Change "configiguration" to "configuration".
>
> Signed-off-by: Axel Flordal <axel@flordal.net>
> ---
>  arch/arm64/boot/dts/apple/spi1-nvram.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi b/arch/arm64/boot/=
dts/apple/spi1-nvram.dtsi
> index 9740fbf200f0..d2720b307774 100644
> --- a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
> +++ b/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
> @@ -2,7 +2,7 @@
>  //
>  // Devicetree include for common spi-nor nvram flash.
>  //
> -// Apple uses a consistent configiguration for the nvram on all known M1=
* and
> +// Apple uses a consistent configuration for the nvram on all known M1* =
and
>  // M2* devices.
>  //
>  // Copyright The Asahi Linux Contributors
> --
> 2.53.0
>

D'oh! Thanks for the spelling fix!

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
