Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2F92FDC53
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Sep 2025 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268767; cv=none; b=VqDRkaqAr4WhssS6sThDd4TSZ8YQTFtcPWA9W0cqMl12h9As3Kw3dAF1FpggA3C0qWqmsumsck52z9oG52Qtcn4KnijxmZF5EMEim4apqXRv3VuK+OapQTf3vBkLAEw6H4e63Ja5OUbMxuIvelDCpG7CthoTb3g/FaJ0QMRK4Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268767; c=relaxed/simple;
	bh=FwMus99U8OAhl7KhXnsvGESrZFJWyVna+f36n8I5bZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGa4px94Fat149hb+4MtXljjasjsUJor3+GP+ycMB3SvSetvYLojNRNvb9OjPIA98og4j0PhsxKOMuOH9nJNzqr2K00WKvU5khcwTbxEfHtybFPOKUYr4gu/6Rzj8MfMKTv993x4pCRCUMdUKWddDFJVAMeLYs7dtqNOgeeqYFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YR7fQ92I; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YR7fQ92I"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-74381e2079fso1806876a34.0
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Sep 2025 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758268764; x=1758873564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASDqAkH4cmxDPZSFWYENHrs1T7W+4jRPHJP2+bsh1GM=;
        b=YR7fQ92Ia2V7geu1PHmvzbLL9QMop1gN73J1L2hxicnLCpQxFtU5C0a5xPX9YXpkmD
         E+6ZVepeYfpFwxM+4NFBLwfToq82fs2O9z+xLYzycg2b5XUfVhOco39Nm1/q5Tq1Sv6A
         d2SeyfKkE6Lu6tC8Xk9SlObyC/T1QOmz4IlD8mPAK9V4//xUGL95jjSyAiFSJq4EW+8S
         7r3aDKjg0z8I/6SCHEEV0LccVroN+98TvDBaZnMv0zBlVfKGgcLjzUZ+irgmd2JDZCRj
         sfVwwjmcGLK0kS8dij6ndG7Eu+9zbU8TZUz8yfcsF4xIHgThy9IElnuZtVUWgYrI0Ag3
         H+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758268764; x=1758873564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASDqAkH4cmxDPZSFWYENHrs1T7W+4jRPHJP2+bsh1GM=;
        b=LTgAgBK7LW4JyvLmvw8/RF9S8dl8KjsIUNFrTEGzwPEu5iJpZ2Bqyz72D4ekvRazV5
         HDd8tCyTe7eqQq/UFX6XWKum5ON+4qu6pv4Yy8Yqmod1+14ZlNJ4JWPh6ytYnKg4Nfgo
         ak+UA2a8adP5+lTz3x7duQlJ1riQAxCodgJDTN/BXucSlAHIoVrPxGSU6U9K34R7IdeV
         5+Inkp1LwAVEjemUbPCpsfN1bg5elJ6XgNqxPCrOYEUw4ROZmeuOXWI9isX+FkKUbHFU
         4SfQBrWTfXSjs8pHPJDexNakFGlR6JAb0roP3XI1D6/JnoEjEP+NyCU+mJ4WYJFQG3t3
         3feA==
X-Forwarded-Encrypted: i=1; AJvYcCVvBQrRnkG4McS/oyOqnD1DotgUIbpyjeJyRpDEJ/me/Rgs7MSFsPtqcMi4BWKFYkesbas32RoSdufDzT8bFLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO1BFRJ1gFxvN3ups7WWQbnUaHXEtc/babYwKjJCDlegoQkfbe
	zCJNOeoJuJwzX2oS2casSlvazoXk+wuER7qRvIYJbHYCzGg/DsA3LfykzJV3M4yAdmAuh8i1zmg
	wB8sC2mgMFItpLsFNB/hs2eYY7mQn7e6F3v1s8wkm+w==
X-Gm-Gg: ASbGnctKNGrgLVAdsK3SMUFHBjGnKGN6IZgvhXneLqfKQff5lc/0CPNHbsdn3pbBqVx
	JgIMNrzJjQ2IF3NQ3e+QfvvUcGufyk6nT6y45xREK0MUZIeGqR1MJq2wdTYEgZqmrmbK3PiZlB/
	hLLzO01OF+YHm22IGnTvRqXG9ia2YYB0DW4J6olHojCpUav/WcxWBWuBrPr+7bEylDdDYU5TRPz
	KTaR0Wo
X-Google-Smtp-Source: AGHT+IEekOH9/D2Na5uJOAYH+Gd3gYDqTSm7RjBTFazB5QY2j1Nx/k/QnGRih+TMOqi+VBgoo9dEC9T1EDeBavQpFxI=
X-Received: by 2002:a05:6808:5094:b0:439:b674:d9a3 with SMTP id
 5614622812f47-43d6c26736fmr1011006b6e.35.1758268764408; Fri, 19 Sep 2025
 00:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aMvV4kK386Sni10i@stanley.mountain> <aMzoPc67ws5NMpKS@sumit-X1>
In-Reply-To: <aMzoPc67ws5NMpKS@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 19 Sep 2025 09:59:11 +0200
X-Gm-Features: AS18NWA3C9LQrIakhvqgeKImPW9n-BTnckAYGagXPywalztGB_Wmp1fHsBSux6w
Message-ID: <CAHUa44G96pdFL+08Rn8yr_5fp2MpUCjLAUsUcgprnrZCcSyLxg@mail.gmail.com>
Subject: Re: [PATCH next] tee: qcom: prevent potential off by one read
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 7:21=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Thu, Sep 18, 2025 at 12:50:26PM +0300, Dan Carpenter wrote:
> > Re-order these checks to check if "i" is a valid array index before usi=
ng
> > it.  This prevents a potential off by one read access.
> >
> > Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/tee/qcomtee/call.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Applied.

/Jens

>
> -Sumit
>
> >
> > diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> > index cc17a48d0ab7..ac134452cc9c 100644
> > --- a/drivers/tee/qcomtee/call.c
> > +++ b/drivers/tee/qcomtee/call.c
> > @@ -308,7 +308,7 @@ static int qcomtee_params_from_args(struct tee_para=
m *params,
> >       }
> >
> >       /* Release any IO and OO objects not processed. */
> > -     for (; u[i].type && i < num_params; i++) {
> > +     for (; i < num_params && u[i].type; i++) {
> >               if (u[i].type =3D=3D QCOMTEE_ARG_TYPE_OO ||
> >                   u[i].type =3D=3D QCOMTEE_ARG_TYPE_IO)
> >                       qcomtee_object_put(u[i].o);
> > --
> > 2.51.0
> >
> >
