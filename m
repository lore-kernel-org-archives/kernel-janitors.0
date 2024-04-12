Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6742926AF9
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Apr 2024 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712918044; cv=none; b=jsCSNEtbdAsniB+uUodyLNtpIkGzJjOAx3CWQbRnmH6E/jA5+MY+bmTKbYwvRzBSSRgGkMF/g3EfH1qF4DQsA16zmUIrlRR6Vxspa3xEbKKtxYvYsNXfhs1aIubD9ZGIntlVNmv/fe2r757bZR+YJ63kNfSeEMEXCrYlLtrdMzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712918044; c=relaxed/simple;
	bh=aQ+0dgYl5PSPxKi0XkUYJ1LBvfFy3GUwsB3keBtJ+HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZxVhHoLdwh6ZcUCiRcgcv0pxR9YG2SUC51ARzkoL33SKkbD4fC+wgSByWXcKOGyB9sSev8Wj2axVvl9o1GgY8abG5oc/4Voa9H+K/bkbJ6sAIMAUvz/9+7N7gb/kXRHZpAJnwf/lH1QKYmP/e4qvz5Gxn8nX/LnQ/xrPuLrFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C1AKa9tm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C1AKa9tm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712918042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aQ+0dgYl5PSPxKi0XkUYJ1LBvfFy3GUwsB3keBtJ+HE=;
	b=C1AKa9tmaaiwY/XHPshIpJ1WdrKKFzzn5F5CXwcnvB7G4TVXf+Y9oD4vf3n1YfeZo8mqJw
	poO1R9x6AwEw9Dl/LMug8QizaogaM0AR2OMnfmt7OEbJN7cEzlBM3NO843CRX4xxnIOtVJ
	WpuS8HnV+305te2iKUoCVSMdne3Sm8I=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-mgWaFrg7PTigVA-id6Rs4Q-1; Fri, 12 Apr 2024 06:34:01 -0400
X-MC-Unique: mgWaFrg7PTigVA-id6Rs4Q-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2a4f128896aso1449606a91.1
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Apr 2024 03:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712918040; x=1713522840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQ+0dgYl5PSPxKi0XkUYJ1LBvfFy3GUwsB3keBtJ+HE=;
        b=Z+E0LQVStTmvug1ggC6UsfwObKUHCO9LPmNq5zYI08RMOI724ndDDxr6FdF+z2gGPY
         kcvnlwpbCH6lcPJFSTQTgMlsBCE200nQreMYLvZs+xpUGgTjTyOgDx9ogShPuw5U90Mi
         HnEQfCRF0VM1TL/D9dFmmrpaQKBh72AePEkeDUsCgNgHf8CBHYeLEAPL2YUZhkfaBQkB
         uMHBq1GhoHDta03+u27Rha1fSPP9Jkf41I4e0vZMIOs4dJ7Jy/PnFTaxi01qejscPGde
         nzZYkuTNPXjw5l7wFMZ06w9wsByHsdOz1FwKnFgewNMrRkahtv/GzKKyAQ16V2mNsbsM
         masQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEZn9XsmqEpHWLT9Vhsc0gSeHT74kVwD9T9P9Idpqdkd1LhiwaxAQn5mGTaefXF0HIzvFGtEvcd5XIuUg1Rb1iaCJtzmaAkWsMx/oBqmKm
X-Gm-Message-State: AOJu0YzG8AhH38HhVqvMbMkvX+lI2x1Qv5X74ab7s4F7dys7P2SpEMvj
	cWG02jHaOgKEadN0cZb5G6yjwrFWXQ5HeV3nA5p8+3eb/AfDq2DOy1RkY996OaRmUrqXdUS3OSu
	0TUfiH0sb8OtcM+hYAnuBtWtTsQoNZAhgHCpcSqFwkoaGZIiTRFmveSm7cx51YP3vKC7QwphK59
	+WsAUVgaJfgk4ZgymQSnJQKSZsGAznWzmQMoVTUdxK
X-Received: by 2002:a17:90a:7146:b0:2a5:be1a:6831 with SMTP id g6-20020a17090a714600b002a5be1a6831mr7419615pjs.19.1712918040021;
        Fri, 12 Apr 2024 03:34:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmKBGYsHbd2vrqtRgYlvMbYZxsQ0Q3qtnhsNOclN1VHDo60nE7x6ha1MFRXl0o4DhGGAkDEArkejLpWG7wisk=
X-Received: by 2002:a17:90a:7146:b0:2a5:be1a:6831 with SMTP id
 g6-20020a17090a714600b002a5be1a6831mr7419601pjs.19.1712918039715; Fri, 12 Apr
 2024 03:33:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411050257.42943-1-lukas.bulwahn@redhat.com> <bfjccttmurk7aajps2m7gcyl532rg7rnlutfhbvupsphxjk2pa@fx5onnkr7625>
In-Reply-To: <bfjccttmurk7aajps2m7gcyl532rg7rnlutfhbvupsphxjk2pa@fx5onnkr7625>
From: Lukas Bulwahn <lbulwahn@redhat.com>
Date: Fri, 12 Apr 2024 12:33:48 +0200
Message-ID: <CAOc5a3P-LX0dkhLFxF-ggOxqkLqM0DJcXqccMJJqtF9U5rbEsQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>, linux-i2c@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 11:34=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org>=
 wrote:
>
> Hi Lukas,
>
> On Thu, Apr 11, 2024 at 07:02:57AM +0200, Lukas Bulwahn wrote:
> > Commit 20c9819ccd9e ("dt-bindings: i2c: nxp,pnx-i2c: Convert to dtschem=
a")
> > converts i2c-pnx.txt to nxp,pnx-i2c.yaml, but misses to adjust the file
> > entry in ARM/LPC32XX SOC SUPPORT.
> >
> > Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains abo=
ut a
> > broken reference.
> >
> > Adjust the file entry in ARM/LPC32XX SOC SUPPORT after this conversion.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> before taking this I just want to make sure the e-mail in the SoB
> is correct as checkpatch is warning me about 'lbulwahn' and
> 'lukas.bulwahn'.
>
> It's not about the warning, just double checking the e-mail
> address as often to mix my addresses up and looks also your first
> patch with the redhat e-mail.
>

Thanks for the hint. And yes, that is a stupid setup mistake from my
side or at least from the email server's side.

I joined Red Hat at the beginning of April and hence, it was my first
email with the redhat address.

lbulwahn is my 'official email address', lukas.bulwahn is an email
alias to the same mailbox. I actually want to have the commits in the
kernel carry 'lukas.bulwahn@redhat.com' and not 'lbulwahn'.

I have sent them out with 'From: Lukas Bulwahn
<lukas.bulwahn@redhat.com>' in my patch file; so, checkpatch did not
complain locally.

The gmail server however turns this into:

From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

I will see what I can do and send out a v2.

Thanks again for the hint!

Lukas

