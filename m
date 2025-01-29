Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F3F166F29
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Jan 2025 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738140064; cv=none; b=KARG5br87z6LtBJcg2DBRowmMo2Xn/AXuZoCHNjQyTCV7k83rIvH6p5AXVX+FrM3cxLDJRLs88E5jSUaNHaBrux5lbt2GK5MpzN+f1i+wvJH6b+9hGLXuLrs5ewxxksDmg9dk0ryHPm8udGg7VVNb7oRqc/nOzRLH5cGExNzQuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738140064; c=relaxed/simple;
	bh=cO39370VtQtqphEmZUqo/vdz5Ks//iXnVcC+FwG8BVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6IFXHCGh3Z+almd3b/+maM66R5Pz+cweNuEV8+IRUnxtyk7bPiahx6/25HIl658lHvrIvaeZ+nxaDo2iTgRYtG8qa1ZjH+yalonNkGsDjULlZfgCjl7Dj17cYRpUD3M+/yVCO7BHTGJKrFp5ooLwNFWzZ9Eb+cEoTkhXHFU+ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U1SmZjfv; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U1SmZjfv"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-304e4562516so4821581fa.1
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Jan 2025 00:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738140060; x=1738744860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cO39370VtQtqphEmZUqo/vdz5Ks//iXnVcC+FwG8BVs=;
        b=U1SmZjfvMEpo6N0Y5qqD38y3mbHGav71QbpA3gKsgezW2nrXwWngCZflAGfODgJcb/
         f4XW0tBQF3ZpMtxlVBPBntPsRA1UIDbWBIKJ/seCcteWUJcbfaM6JFSEjo9E+a3x5cMX
         dKZ8AuBedwUfIeNTCrcrhmbqx3mhwBmduw2sQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738140060; x=1738744860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cO39370VtQtqphEmZUqo/vdz5Ks//iXnVcC+FwG8BVs=;
        b=PJvJmBO7tBBoKkCBC3esnGFjD8++Q5Owzwv5s/FUccYfzAxC936fiRR39N+QqBLziL
         qW1cmIahU4siE3WozYmwamJOx7DaVXixsbHuBkaQlQ/5jLaCguNSyGKMUgzqNfJBdAhn
         J5IEe42PCFCTzZO3hWmsPso32eNjMbLLnI+iyTn6I54WZCSAMPlKzV5n9lq2/sFUx2ac
         S8MEGA++jSR1jeQw06sDwQQbNGBB7bdq258fGOZw3zPGQCafgBSqw75AlH2Lj6d1YqDQ
         59YP/5mG0lsxk8LugTX16r8tsik5j6TfMoCr8AjYZEznvwgKKfRvlWZS/j4ciyvfkXXD
         uMcw==
X-Forwarded-Encrypted: i=1; AJvYcCUAjMGc2rQTjFHnYBHPuK2x1ykGXuCkDrYkHfm0yIxmhGLntmmYKYS8wCoyMqN8Y6c4pS0iiAcgZBCKQigWbTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUfoxa8w/JKov4PXPjZ/5RJ9DbTp+6BDwRhNLAkF61OJu55Jji
	Vkk4ExrcNKsqg00zGKKTYhob66wL1AURRMRzpvtMUgwOHstemgrSQz7k7zLbQh5cQWHVZmdv1Yw
	Jhg==
X-Gm-Gg: ASbGncvWk2Q0SMSt5yjcCgLUfiK5t0b05YqZuDLevTmrVw7VJuoikp/rfq/VWzU1NgK
	LZ9jqEOgA3FH/M99PYrDmMU5JYTbdh1LQFbLNWSwu+fVt/9c24Bjy91HtYbV/Zh/ipxWrBdORv2
	OCiIzfUI+Gu5wAkpAzqAjIJVzj2sSNDIeH08fEAgMTmYmpGgrMpj+y6zXN0FBZiTYB26tZ3O7pb
	vHoFuzvUKtTxofuKmJgyrUqYkK31ZVlrz9dcezlMIavNZEeLA5dvnGwYkmxC9UsxvRc44Rh4Jwx
	KALpdWeOgSJ5Of6jcA/DCM294P059pERVVoM+lu8FxcUHd2YH9E5O0b9iA==
X-Google-Smtp-Source: AGHT+IEc3Vp7TKRn751DwYFTxLLwmE1lOFdzRDh/OunGhzTMey0GTuNFafevlucjKm8sJLbnTzBitg==
X-Received: by 2002:a05:651c:2213:b0:302:251a:bcfe with SMTP id 38308e7fff4ca-307968d7fc4mr9056651fa.6.1738140060278;
        Wed, 29 Jan 2025 00:41:00 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1956csm21261451fa.70.2025.01.29.00.40.59
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 00:40:59 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30225b2586cso4475471fa.0
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Jan 2025 00:40:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxO+UGVrjo7Yx+h7/cvBv5S+2LhEGjZxWj+zDGc11D8BA970IkDiliGNtW4+ifs+hFcksXCtJ9O1EF7oMaxuA=@vger.kernel.org
X-Received: by 2002:a05:6512:1313:b0:542:8bf0:2fa3 with SMTP id
 2adb3069b0e04-543df6ae7a2mr2036916e87.5.1738140058920; Wed, 29 Jan 2025
 00:40:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129-secs_to_jiffles-v1-1-35a5e16b9f03@chromium.org> <fe13604a-2626-4641-908e-87eeaca53288@web.de>
In-Reply-To: <fe13604a-2626-4641-908e-87eeaca53288@web.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 29 Jan 2025 09:40:46 +0100
X-Gmail-Original-Message-ID: <CANiDSCvufe0nK_NLykSRLb9RmttNOhw3-mm6aiC=gj41Hxtgiw@mail.gmail.com>
X-Gm-Features: AWEUYZlpM9GVhs5ldC_citqJGj5iIReMpwx347jREvFQp64Ws0GIJSK33decl3Q
Message-ID: <CANiDSCvufe0nK_NLykSRLb9RmttNOhw3-mm6aiC=gj41Hxtgiw@mail.gmail.com>
Subject: Re: [PATCH] coccinelle: misc: secs_to_jiffies script: Create dummy report
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>, cocci@inria.fr, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Victor Gambier <victor.gambier@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus

On Wed, 29 Jan 2025 at 09:37, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > When running cocci in report mode, eg:
> > $make coccicheck M=3D"$dir" MODE=3Dreport
> >
> > It returns this error:
> > virtual rule report not supported
> > coccicheck failed
> > make: *** [Makefile:251: __sub-make] Error 2
>
> I hope that more collateral evolution will happen because of such informa=
tion.
>
>
> > Create a dummy rule to avoid this error and run the other cocci scripts=
.
>
> Please add proper support for operation modes around discussed source cod=
e analysis approaches.
> Will it be more helpful to work with function calls like the following?

My main concern is to fix the CI that was broken when this semantic
patch was introduced.

I am sure that a person more capable on cocci patches can implement
the report mode in a follow-up patch.

Regards!

>
> =E2=80=A3 coccilib.org.print_todo(p[0], "WARNING: opportunity for =E2=80=
=A6")
> =E2=80=A3 coccilib.report.print_report(p[0], "WARNING: opportunity for =
=E2=80=A6")
>
>
> Regards,
> Markus



--=20
Ricardo Ribalda
