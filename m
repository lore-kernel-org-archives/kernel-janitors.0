Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809E327145F
	for <kernel-janitors@vger.kernel.org>; Sun, 19 Oct 2025 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760868976; cv=none; b=U6Kn1yLQGwB7otqwVgZGEV7xZ7nqF9HVMru/9Ondt6fitOvwZb61/zUfj70EB7fkB4HuziG4pKj22CKscjTC44RGkzBu2oQ10ro2kq7YyT4XSKOhSFWY5q+xlb2Mx3EFZbIMzj2JFOlo/9TA7jbPJ1IkOxxDqToMes9Z102sTVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760868976; c=relaxed/simple;
	bh=Y08tXfyNPYZyI02pzti3KblHd6VvVvbdphmuQCznqJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cd+9294G14t2c5g+ShE7dalobWUzvdUvoF/VFxC1EBXFQoe5LH73j2ywRjXhCxHFTDOrgQYCFw3rpwS40BOKWfgzoInFcWsgxvFHT8RMxNaVqGB7CVXyi2KWSuJYJVIIYZ313kiSH63PiCGjoPRSQ+X1hHfpZ0m2ZWGL5Z0w80Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RORhZ9RV; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RORhZ9RV"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-62fc0b7bf62so5127638a12.2
        for <kernel-janitors@vger.kernel.org>; Sun, 19 Oct 2025 03:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760868973; x=1761473773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9u83kC+rt7nZCWulip1b6xtkpKKymTmDmInRZDupgQ=;
        b=RORhZ9RVQjE/eG+e8iqUd1Nz4wVVxWisUfjM1Amqx130yHRgfY0VC/r98RDcMMLjDt
         i1eAO10C5GhNXRG/qAZt8hPjKQP65u6TqH/JuU6RoWu762mM2PeP2eWJHjkoCJBD+l1B
         f8Rl27M8YQoJc7J9BadURA9utXknvLaOIOxYhe0yu5/oFRm5/w0blknUnj1F75GLE+zm
         hlG+yjO3MZIQjTGhe0swuUGsKQ6feF5HVhKYXXaLD93RoBiBprOHFG3Sc3IGD/RqsucR
         1wmc6ACTaxNdIuVvdAu0vWjzgM9t+zEiGY5QdUj2FUjyUaY+syKM0u+teJLznhFdK4Xk
         ItNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760868973; x=1761473773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9u83kC+rt7nZCWulip1b6xtkpKKymTmDmInRZDupgQ=;
        b=NVIDFErNaEP7CE9u13J7ugql5GvF4tGcGAqZSd4nY7eJEvpuLn/PTitPfu6scdKNuI
         ZnwFVeZvJP/Js5rRCuGg37IBvW8Y76ToRQLy8kJt4xXBA2QBGH+h6pW3imOniJXwtifw
         SCfwMFndvEX1dCpWnbHF5G5YTI3/heh6MUdE6/MnehuJe7Sgg7aABBP+rKny6SMj9MK9
         km0hFPb4Dr3qjVt2aF64Yr28cr8WSFoD3FIGxY31k2uK3jZqdDvoCtps1DONPBkh/cnO
         0PeVcvGHcKxy3tdpPWYeSPsEO7mXHmGZVIOmcgGW/ATHNqC+mAdwEzvz14eiPvvvDsIr
         E3nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPGo3Nuok9drzzfMOstcBNXsUV8KZl3TM+PKYAao/FxbmOkAxIxSO2k+vaqQtyaCoEIjlDULtyWJ7a/f7dFN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YynrtPE5veJ8wBO5xBSbZiRF87+aM3R9p9kCmTrbD2CxZc5KOK3
	YGH1yyuf1I3m92LHJvugn/POpgRpsEzlKsQZbcDZB+H6FQMk3KZf9TcR2cbmxS2DeejhMFdFNdk
	7LNdyUekIeC50xjEUMk2r//7szzUx9mQ=
X-Gm-Gg: ASbGncv/2omrwGUWY+Tet/8iykww5N6F71oW3ATbahgz8MRCs6+k8S00k6wN2ps6GbT
	XSCL7zF+Et7jZW24iDAI+cLYl/AoE2HRSJMd5koMkUkAg3auGXIMMxtEHHOgi1yUTl52NbWGZJA
	Kqa6BEMq7Qftn2dl/FFRcfDJ3Z5hjsmfG//A5TQp+mMpXYUI80iYToUf8YE4mDHL8S2kFybElAQ
	XiRj71zPhkzN7nES5ofT4pk5eNZyDNOWO1/OkIv1vWz201EBMBo9X65nOoHOWiSGRzKFQ==
X-Google-Smtp-Source: AGHT+IHF5j3FxHGqGSMc6gTJFWS25mlgIJJ+B9ZAQH84yMytfrS9hAu85pLm9QkNmBBzhedGsITk+O2Ty5GQr/NWr/Y=
X-Received: by 2002:a05:6402:3492:b0:633:7017:fcc1 with SMTP id
 4fb4d7f45d1cf-63c1f6458b6mr9014013a12.14.1760868972724; Sun, 19 Oct 2025
 03:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014113234.44418-2-linux.amoon@gmail.com> <a2cefc72-de44-4a23-92d2-44b58c8c13fe@web.de>
 <CANAwSgTtaAtCxtF+DGS-Ay4O3_9JMwk-fJ27yoijhWWbF2URrg@mail.gmail.com> <cf656a57-bb2f-447e-ac6c-0ab118606dc9@web.de>
In-Reply-To: <cf656a57-bb2f-447e-ac6c-0ab118606dc9@web.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 19 Oct 2025 15:45:58 +0530
X-Gm-Features: AS18NWDvRsVHc0V4iNWmDuNrhP4ZScJhRSS4H0sOBjz9i6y50fgIVE5YKoNz78A
Message-ID: <CANAwSgT0jSQ3pFR3MQo-ENziqrm=yn-rFBTdHegmknMeFd44OQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] PCI: j721e: Propagate dev_err_probe return value
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-pci@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus, Vignesh,

On Sat, 18 Oct 2025 at 16:12, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> >> I propose to take another source code transformation approach better i=
nto account.
> >> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/base/core.c#L5=
031-L5075
> >>
> >> Example:
> >> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/pci/controller=
/cadence/pci-j721e.c#L444-L636
> >>
> >>         ret =3D dev_err_probe(dev, cdns_pcie_init_phy(dev, cdns_pcie),=
 "Failed to init phy\n");
> >>         if (ret)
> >>                 goto err_get_sync;
> >>
> > No, the correct code ensures that dev_err_probe() is only called when
> > an actual error
> > has occurred, providing a clear and accurate log entry. =E2=80=A6
>
> Where do you see undesirable technical differences?

The primary issue I wanted to confirm was the function execution order.
since cdns_pcie_init_phy within dev_err_probe function

If other developers agree with the approach, I will modify this in a
separate patch

As Dan Carpenter pointed out - " Wait, no, this doesn't make sense.
It's just assigning ret to itself."

This patch seems irrelevant to me as the return value gets propagated
to the error path.
Sorry for the noise. Let's drop these changes.

Since I don't have this hardware for testing, I will verify it on
another available device.
>
> Regards,
> Markus

Thanks
-Anand
