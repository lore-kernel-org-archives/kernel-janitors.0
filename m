Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F80E30C606
	for <kernel-janitors@vger.kernel.org>; Fri, 24 Jul 2026 16:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910837; cv=pass; b=UpGJzVSrJF6wVG2cdKnmXsinsmyitVpXTk/xIWN0hFod0Kkefk1TitXVPDt+IDcYsao0z07B08u10HP3iprHO6hS5qo6co1CE3FD+QASzlyakS+migeHMCKNvCOLo+iBSHxfUn6Dllr1WziIvraAmAvX1jyYK1a6QpV8Yfg+Pgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910837; c=relaxed/simple;
	bh=w9j1krmH3aRjke9K7bjpxKBfWTwd/PFuBqDg+CWydhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mhc1AGhaOTFZ7hG0QZqP/xFx4zgS6MHdQJa0MDUb5+TU1MAt4/IthZSR7f8hiZ/mjbqPPbqFtXuSAJKFEwkVRq4gZGAdHyID2R7wJ+Ton1eJPPZKQQRO+FPjQE6nKGYBtpiEcR4oDkmaoKKw5vePWdyfZED69GteJpgGCzfKezU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUEtQINj; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUEtQINj"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66843536f94so474715d50.3
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Jul 2026 09:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784910835; cv=none;
        d=google.com; s=arc-20260327;
        b=owItCV+/8WTi2HS+gOJhe9ujVClk+06zI1aeQ/3Ng3ioCKc+ImD7VQJGgL7qglDBLI
         p7PNbFRCrHJcAfdasWGgTZ2ryO3TUtwjQR6jHDfFyENS3JOdJ3JeQ7YdRYHVgz14jAPs
         2CPHSxvPgLP17xlIkZ2lM+vnCo7QpYz4WOulnnWNRxAhBucL/pInciQpt/xVFsetlcZv
         CpANQ4a7bS5nrmABdZsN0S8rIpwpk5UfOYkHnF8trnplR/ZF5pjrEGFfK/Rg7A0XT3MX
         fO4GU594MMhnP6eEZS9U7TfHrKg0wBKO/4MefoYX2oHOPAl8EF4pqCsXAKjdyuKbxcHq
         DhOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZBoRH8lGzaxL4Dd0YVaMryVasfc0C6Hqs/Glo/xz+as=;
        fh=hVZpI22YP2poxFiWw9amxhvE/LaU4azUlYbyV4wSB88=;
        b=liyLJ+pGAMLFpFBUhK1WZ52+FKr/5iPeval1SwQ7+mQIwUQyK+oPF7xfR1XYzUefNw
         FoHfMSUOT6gMP6t9IOS9JNbet/yAUIG7JSvVGGRG5QYvs5xXon2AbCR3qMYZh8JZrujp
         44TRZW1AGr0ZR8OntlrPAn1U+4eQ80U9QGbjeasXxMIARjA52Mvqdg4qr8R1wN/YpjNa
         1kuG4R/wGjN+vb+a96TWbQRinIRV/bUzfd5G0k9hUCb/vZ+Z8yyc/x92DF8wKKqH4USV
         SG1vB1ktq7NcITNVyYlD6I0OLLTDkl4n+kz5cgUWxlHTm1QFZ2Z2Ktdrx29vh5TrwTJ5
         HtqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910835; x=1785515635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZBoRH8lGzaxL4Dd0YVaMryVasfc0C6Hqs/Glo/xz+as=;
        b=FUEtQINjQjBHFSZ8MIue7R/vGmSqB7ftC3EEsdZrwYglCLhd9SeJEN1IRJ/OH50KVu
         eA7IV4BfCFofmajjtZH7HCzy9P3MwVT2onsEUxsnnSTIPCMiznMvmeT3E1vhKzGqXaxy
         CSoZnNxB4tgpUtX9Sz4zdOy5/erYU6RHoQ8mbOgbd9c7l0QJDKpVWCrSLYvc45SJtZXY
         kdiV//tIRfYUgiLUeLYKSp5Dq2hxW6W5M9lR7+NW1RO+FU9JZ8bOm+VUIFFZR2CMxuTZ
         sW7ytdR5QwScycQpRwv+ILzBmf1WEhbj4AIWRwCgcqcENYMzZp4HXAuKBs0QVTCjbVdy
         uObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910835; x=1785515635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBoRH8lGzaxL4Dd0YVaMryVasfc0C6Hqs/Glo/xz+as=;
        b=qI+a+gGk6JSfZRFk71rHaGHbythwNUHlEPvsq++8SpCHtuAY3VCGZKgG7gnOcDYMP+
         iKmCd1fdQ93Htfpwavu+G+1tnd2R0otwrLszgqQMN/r2HgQ5U6/WOTDOOKHGHS4Wy7Pj
         vFvlWNg1/pbSjg6liOcGJGT1eblkBNl949TmjtcbnVzRwN1JZQGo3DBS1xLmagIcWj0H
         O5c7AFV0jADjBff0/8ndpdn7E+ZJnjPlU+fNGAyhZJoA5D0c8uxd9bKJc6hLnp4Pc83G
         sfxbaNshjJ1yTjnomJAyEHcTVoeFidkVwqYG8jLgzLC+CuzcTODrvkdzt+6miozi7UKh
         /Ipg==
X-Forwarded-Encrypted: i=1; AHgh+Rq37HCqsnjm9tXCMNvP3orFxv6kuiMIQARBpy+DRPId89n6oPVBxuBml0Z4Kdsw6t9PKcnXPCgh02+sROFQv2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAjvAIUXFWLtL0u/dl/XtAzZ//RsU3WCdCGYpLa6rP18dcgNED
	/9IOpMZ5eSYCX8UdCYv5F6k5wiC89XLuU6Ym469TphiePnquVXDfMJQcqch+dNLRZJjRrEoj6qH
	N3MNgAi4w7tZPdst+uV20BzDn87WMndQ=
X-Gm-Gg: AR+sD10RfifyxGBZtmPEI23SsQsid+EN2Rc3h6QeB6rBH+Mz9UKC2EHkXHemTG3d6wm
	2W8l1Q9FCexGNY3lcSvoAbV4lNMfMJ8TudV4i2HN90UHnBvwea5nsKUSwTs4gFHE8uBx+ypREqM
	5G029iJju/1K+pJJFMg/y/P6FvtczsceZr5Ah1tQDh/1YXUCmZBb64eOalVTG+cFg7nIVKtzAf8
	gKpLx0SZgkJuGsf15tp0MNNZt4SuTTPfeQsyT8yyBlz4mHk/fonqBY3UGI=
X-Received: by 2002:a05:690e:2510:20b0:664:ae6d:ad2f with SMTP id
 956f58d0204a3-668a4f6fb70mr1772197d50.73.1784910835142; Fri, 24 Jul 2026
 09:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723184538.3888637-2-ekffu200098@gmail.com>
 <b0577cf2-d8eb-473f-87af-82ecc653f29c@web.de> <CABFDxMFYvuAZSGcPmhAj4H43dwYBG01P2-UQPGa=-M=yRE8YKg@mail.gmail.com>
 <73b974fc-971b-41bd-a039-7566442ccc63@web.de>
In-Reply-To: <73b974fc-971b-41bd-a039-7566442ccc63@web.de>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Sat, 25 Jul 2026 01:33:44 +0900
X-Gm-Features: AUfX_mxLKAeAr6h_oQLAkAcrcxCdk7ffjyXVXTOD-PrXHvihesP4WIxTkabK7U0
Message-ID: <CABFDxMEsXs+kJ1utqQveP9NNi+dVN-2ReNt3zWvf_TU=xofohw@mail.gmail.com>
Subject: Re: [cocci] [1/36] coccinelle: misc: add cond_return_no_effect.cocci
To: Markus Elfring <Markus.Elfring@web.de>
Cc: cocci@inria.fr, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026 at 12:32=E2=80=AFAM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>
> >> =E2=80=A6
> >>> +++ b/scripts/coccinelle/misc/cond_return_no_effect.cocci
> =E2=80=A6
> > Combining them with two separate metavariables would be okay,
>
> Thanks that you can think a bit more about such a design variant.
>
>
> >                                                               but I
> > don't see much benefit in that change.
>
> Further metavariables can eventually be shared for an SmPL rule.
>
> How do you think about to avoid repeated search efforts by separate SmPL =
rules
> (for the patch mode)?

Are there impressive performance improvements from merging the rules?
If so, could you share an example or numbers?

>
> >                                        So I'd prefer to stay existing
> > form.
> There are different SmPL coding style preferences involved.
>
> Regards,
> Markus
