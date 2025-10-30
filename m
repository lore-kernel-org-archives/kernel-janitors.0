Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D7D2DC77F
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Oct 2025 01:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761789244; cv=none; b=ikoy/w/5Ma09o6nLf7OSxAkqAl33UM7pXD5RCUEVufb2AJZ5AfyQKrVS+LwOZ+nqkH2s47gpsTtdjgY/p3QT75rlNyjMVhX/dLLYnEciTv7gVYnlZjtkn+EHbWhWV8Y9ujJABDoWveAXt9VS3CV+UrB+BOVIoF27BPayO9StiDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761789244; c=relaxed/simple;
	bh=phF+41jPYGFsWZNLAeFbe1hdIEJHWy1G5CKaXfNjyN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIFbGiCg8y4wn2ErhQ0iDmGpHKUtyBEYHHjciOdVdGIR0TU9LglVqwJ4rCxaEi6uIzM3AkFN/6WNGdwLWG7QsDGG42v24eRuKC5RRJ5TZ1VZUkk/gSXVFS9FLdu2OZTWJs8x9kfTHShwJLyiY4PD65h2G+xskJmWMKPStgHfC6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeJBaKpd; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeJBaKpd"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4eba6e28d06so3656521cf.2
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Oct 2025 18:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761789241; x=1762394041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cny/pF2/UWb4s3KOzXzTRQuku/xp77wec9CPlPDB6hY=;
        b=ZeJBaKpdd8Iel2mR+bBE0meijEo9XDUB9fJssBwFqrL0mTsyiCzoFmfcrMM57TpFG7
         jFUALzWfreSWXbcm3OJQHJWwsBFleVqDA7whA7JTuWNcQix0syjyeMa/4Hcs/BKTvOdU
         1R04aPYrZ62o8mytpUmRRIyj4R+b4vLUNZeclg5eSCHogLYfWACliOT1I3hCj6ieuKRL
         wz5LnRQ3OHsU09t05NWvktgwhmNzPVBIurfAcClv2jpc+4yECVoT7Evrz2NS/ph9TbQ7
         MDqme3ztOldeW4oHuNHu/jhrcHr5wLfEGTLIyQdqQGAkUWxJtleNEAVsT4IKc/x+Dsl2
         f1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761789241; x=1762394041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cny/pF2/UWb4s3KOzXzTRQuku/xp77wec9CPlPDB6hY=;
        b=tCIIEfxc1spVdgXK4JHsSp6KQ7VLDzMtgKFujQzcSzvdo/9nccl3GkD4Ayr6MofTsD
         rkFU7gr1IL307UiaxLnsLXBN0kXuGoFCOrW3fSoqaN7egPuHuvrUO2HGWvSMs6HsHdlB
         4J0mddz8WfKYoTS0PdsYRT8o5n39erlAylp8LZs/I/dtUlvCQXO1ySOwTyB3NFebKsdT
         Nv7dzO7xyEolXzo1CiIf2bECkzwhS+FcfV2V+/B0JO3sNEoBS4QEyXIBoCQtLpCtzZLf
         r9+D+3LCQ+bna/tv7yI6aivGM92ApbjC2sIUqyx3grDU7BNPevjYclh5wQbVNEG+A71d
         6e1A==
X-Forwarded-Encrypted: i=1; AJvYcCUdUbXo6mawXZtant60OZLT1rtHpK3+6l5MwhlVmtY7/Kmk6BacT5MREbYOHhNCyCS3BWDTdQMVmc+XIcBZlDA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1NzPKYAHItUK2h+/l4E9sETSxjknDjTxCKvoNYIGyVGKElfCI
	zJZalKbYiGZfFXQy0y7m2DwVFlb9ovbg+0Lh4mNfdMNqkklHa9uRI2mD
X-Gm-Gg: ASbGnctcTfwlCG4AAIiOW9kkJ2hn5vVN8ZcdpLQrI8BQHFBKXa0YJtUra9C2E68F9M0
	8winruou6PP6V2iM9riYnTOaRK3B6xioaZIC+7iarHD+E7ZlC1+wYYnGjyMWeuETIYQQb+mZQqu
	sS/U9vDwEHu9g/LCUQ0eFtQHvUWRliv6a3h0snAxqty9Fk3mgHs9D5SWIuc+27LA9rX04xNgPYK
	S29nae98STU6oRr11B549XWEZVh6zi/c2Ugee7vemjL7z6W6r2Du5KwUdx7evND/9fX1cWibcuh
	vnSF+L2gEq+A1EZrI4lwdXZXHIks5hnYVOABk6cat6/BuH//xI2zRiZjo59SssiOdgfba4dBzVg
	Z2o+UCSg2DGhdJbRGV7pDKa5eeQ3yY3PSKNasctQ2RLJULJ4tiY4VzLV2xdEXG5DgTa8295KYU1
	w=
X-Google-Smtp-Source: AGHT+IE+61G4p2S3GzFHVNxAsZS2OUebLYMCNTGNbtH9VbO1FZnXm51zQySPKvrbNYQTOh7o+SE+Fw==
X-Received: by 2002:ac8:5889:0:b0:4ec:f9a1:17c5 with SMTP id d75a77b69052e-4ed15bb2b3emr57941951cf.10.1761789241028;
        Wed, 29 Oct 2025 18:54:01 -0700 (PDT)
Received: from sam-fedora ([142.182.130.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba3863cc2sm100445901cf.32.2025.10.29.18.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 18:54:00 -0700 (PDT)
Date: Wed, 29 Oct 2025 21:53:55 -0400
From: Samuel Kayode <samkay014@gmail.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Samuel Kayode <samuel.kayode@savoirfairelinux.com>,
	Samuel Kayode <samkay014@gmail.com>,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Lee Jones <lee@kernel.org>, imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sean Nyekjaer <sean@geanix.com>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in NXP PF1550 PMIC MFD
 DRIVER
Message-ID: <aQLFM2-WgRvDHfZT@sam-fedora>
References: <20251029104228.95498-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029104228.95498-1-lukas.bulwahn@redhat.com>

On Wed, Oct 29, 2025 at 11:42:28AM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit ebaec90ec0b5 ("mfd: pf1550: Add core driver for the PF1550 PMIC")
> adds the header file pf1550.h in include/linux/mfd/, and commit
> a7d6255a0bf3 ("MAINTAINERS: Add an entry for PF1550 MFD driver") adds a new
> section NXP PF1550 PMIC MFD DRIVER intending to refer to that header file.
> It however adds the entry for pfd1550.h; note the additional letter in the
> filename.
> 
> Adjust the file entry to refer to the intended file.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 70de2f9c4a50..e428ec79dd24 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18718,7 +18718,7 @@ F:	drivers/input/misc/pf1550-onkey.c
>  F:	drivers/mfd/pf1550.c
>  F:	drivers/power/supply/pf1550-charger.c
>  F:	drivers/regulator/pf1550-regulator.c
> -F:	include/linux/mfd/pfd1550.h
> +F:	include/linux/mfd/pf1550.h

Thanks for catching that.

Reviewed-by: Samuel Kayode <samkay014@gmail.com>

I will be sending a patch to update my email on this.

Thanks,
Sam
