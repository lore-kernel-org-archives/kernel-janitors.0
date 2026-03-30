Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D953B47F0
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 09:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863327; cv=none; b=lTZkGqMJ4WoiEq8dFdqbBlOHIB1Y1hoJ0GqnV2GZJiIwSuBrvP0dlF/3OopQ9e01pca315fX19B91oB0gM78Bit+vGD+YKzjtCdU/3IWpnoh6Zgh5KgqKgSDnISo13SYBqiZ8HvS3Xijgy00UehECXV4zqO/47yyuMONywd6wYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863327; c=relaxed/simple;
	bh=MbEvglgKW5QKgNw8R87jfN5gG7ywh6Pck6J4AnF5JuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jueUqzzFKBLFkSIk9LDJFPyDZbnz5Ls3iRce5ytE1qjCVu9VYK9OMEBK0nQTtsvfaPe02lZWa5xyRg8aLWVwmvuwzhJ+n8egWNiliZwybEtP7Lbwjk5ltaGvPRoMvfXiK6V/AE0V5O5jDPG8nW7wle2aqSJZe5+e+gEmnWew8Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rns6AULg; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rns6AULg"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a3066b68bso26362171fa.3
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 02:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863322; x=1775468122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zQoul/C2wp1Bpwsfep8wi8P0HEIcwz2SkQ/ybqnSdGo=;
        b=Rns6AULgJXgW1nXoF+StRWXtKDA5cTu0zJzKIatAjuGDv+dknmlWsTvv5/fSWtks+x
         kLhRVD11aE7js1I1beZlkQG3g0vS93wyu2WxjYlhaDOluum0FhnXPuAxdXZas2Fg7O5T
         LCQWNCY8B5vUs/yVB7r6rrchXb+6oQmJBdvDlmjCb4+OBQIf03wFXPf7H3B4Ddlhot51
         Aqpe3u7XUy55PRdZc1HAf6+VuhddVZEEIslUdXQpRXRheqlVsel3Hmt/9yapm38B5jfn
         dO9JsVAvEsVSfp/0HzgkPRdF3oe6yZN4LjqKzVeSvzSqIptBp4S0Kz0XnPh98fBcR0/N
         nA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863322; x=1775468122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQoul/C2wp1Bpwsfep8wi8P0HEIcwz2SkQ/ybqnSdGo=;
        b=i2tqdtROKvaAI9WjDKi+JeBT+0taOiory0SjZsoW+yKICnz1LiJH+BWvnuAsyhMVDi
         EVwaIF9x7VLkjf8ovOodcfQrVWcqKQt/fhQaruCxw5ZCWFvFAD0CJKrMyxgYgR1koQCV
         63CtxSA3apBunDCFhJO2a06fmipfzCe+JDxYYkbpNv37YR9aYhvdU5RLiHLzGhB54Cec
         FgNA9JfqqMfQRGgmhT+iiU1tHhOaJfw0xEljt3mnVn0w3LcFieYalBTdu10GGXdHih9j
         Wnzll02JCiKr/hnT/v55BEgmLkOIbKrfmccxDzup8E8D2ibPIsvxHeH7KUAUZIWV30N2
         E39w==
X-Gm-Message-State: AOJu0Yx19IshWz5saEO5/w8s0mkqkUXzcdy7h8UNy8lyZ3zmHamG53He
	J9+QfOKDmeuz2cvmthHxbMMWoS+4KJQ7Qgl3AEIOgKyUOCLwlZ1cn7p4SAXXzg==
X-Gm-Gg: ATEYQzzxZCLlvRZQBAms2UWWTbyAnOX4sFf8xmEzyc0veX88maB14X8q3D1hFE3+MES
	AksBYbf+FtCVjVIY+Z9yL6SeU5EaILjXo1LzHRDFwf5krrofDXdQAHnwMPWj6HYUA10vBSQqaPI
	Q0RXt4fMuEDFxN4sbYguzFvfRfRvXqXpeTWlihyMICJcWMunrsbOpulS5gpfH21Nppp445GKWX8
	WGVnmr29rcv6/uBwHwHhj+H8zLeS059qBwYRjz5JWIotq3rcqVr8My7uP5VhKVW7gYRrVYiapN4
	oF1Ck+pSRNbFyDWYP8c2TKsmNH8pRfw7MIdJbc08TEtyssv3DdfPqRz0f0NPrYPlKU3W0AdivTz
	sWDV2z6dwzEpTWQvyPzKPZ6H62N6DOP+hjUFnQHwq91tYd/eZ1hmU23O9nF95K6yUAMkUffabS9
	3ATEnm85GLbCsr190k8Kk=
X-Received: by 2002:a05:651c:4196:b0:38b:e639:4456 with SMTP id 38308e7fff4ca-38c740908f8mr31757991fa.26.1774863321430;
        Mon, 30 Mar 2026 02:35:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83911aeasm14323341fa.41.2026.03.30.02.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:20 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adrian McMenamin <adrianmcmenamin@gmail.com>
Cc: kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Update email addresses and firmware URL for Dreamcast
 drivers
Message-ID: <acoiS9jv3VmAjSXK@stanley.mountain>
References: <CACwZE5SoPg6oAgt6ok1vMfrZdCfwLTztoWbrLAnZ1y1BZOzkew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACwZE5SoPg6oAgt6ok1vMfrZdCfwLTztoWbrLAnZ1y1BZOzkew@mail.gmail.com>

Hi Adrian,

Kernel janitors doesn't really merge any code.  You need to send it to
the relevant lists from the scripts/get_maintainer.pl script.


On Sat, Mar 28, 2026 at 07:09:05PM +0000, Adrian McMenamin wrote:
> None of what follows alters compiled code, it merely updates contact
> details and the address for sound firmware. Hopefully this is the
> correct list for this. If not, please let me know
> 
> 
> Use current email and firmware address for various Dreamcast drivers
> 
> 
> 

* The subject needs to have a subsystem prefix
* The commit message needs to say something like:
  "Update contact details and the address for sound firmware for
   for various Dreamcast drivers."
  The other meta information is unnecessary or you could put it under
  the --- cut off line below the Signed-off-by line.
* You need to have a Signed-off-by line.

> diff --git a/sound/sh/aica.c b/sound/sh/aica.c
> index 9438c3a68ee9..ed262e2263d1 100644
> --- a/sound/sh/aica.c
> +++ b/sound/sh/aica.c
> @@ -2,10 +2,10 @@
>  /*
>  *
>  * Copyright Adrian McMenamin 2005, 2006, 2007
> -* <adrian@mcmen.demon.co.uk>
> +* <adrianmcmenamin@gmail.com>
>  * Requires firmware (BSD licenced) available from:
> -* http://linuxdc.cvs.sourceforge.net/linuxdc/linux-sh-dc/sound/oss/aica/firmware/
> -* or the maintainer
> +* https://www.alsa-project.org/files/pub/firmware/
> +* (aica_firmware.bin)
>  */
> 

I don't know the ALSA devs will care either way but I would probably
put this change in a separate patch from the email changes.

regards,
dan carpenter

