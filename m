Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80EC1E7C03
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Sep 2025 19:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757014653; cv=none; b=er97TL0cZbBvkbZmG3BkZx8bbchHzJEmvUb/3DOqIdfs05XZxtSd+QNt3coAQB1uWMesGy4DoVZxUydwH4XX/c670dhDur+N/sa6tikSWPM0jiCc6Vtm7Z3P6y6MywlZLy9/B6PkK84tP8qaxqTbtrio+p5okE5Xhjy4e7BwxQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757014653; c=relaxed/simple;
	bh=b71mBa4+CgOQozq8su9h0GwymINkcoGVGaHXRDgYI7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UlAwAxLXfpEtr6Bdh2x26+XVFr628EIbx1IaU16ABkLVTa0NT9kNIcrzdfqL830avjMw3Iu/Cg3DknC+FDqnMU70GlHRH2r4/1dlY6MPA0t+4hcVZakZyWlNWeFAluSaRb3Pf07ib9ieYgMBKxNl5J/97gDYv4A8eAkAuuwiCWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JYcAXvCa; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JYcAXvCa"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-336dd55aae1so13586421fa.1
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Sep 2025 12:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757014649; x=1757619449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AJ6DtMOF3y4OJW8/5WYqkSHHcxXo8CUAVBKpGx+P1k=;
        b=JYcAXvCa3oYT9bKK9TdTArz+3Hk84wC/WowFikdApkO0gl8lVjYMVnYmw1t1x8dIIf
         gVexotT3ogWMSxUVOoUbnSxAV6Enr3hhIREsp29oKmHgzH1bIeKhqGut7LSHqaS3YT4r
         /FHP3o49+pNJMhnpHgU7Ug9rgJql+ysTBedoQiusUSfWFYwBVdgp3jPe8T0jNhRp0ZgD
         vPieqEw0ajZv8eUhvi/VYSUi3/OQY2GI2lMuv8u+OiyTz3rRhE5nefW+Y72Y3pht3XsD
         5LRW6vzIsxNnsgzbi3KC/Y2bg/XDPatLL9jYdNw43MnqQ95JF8KkLZ7RiN5j6WVZn3Ry
         jXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757014649; x=1757619449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AJ6DtMOF3y4OJW8/5WYqkSHHcxXo8CUAVBKpGx+P1k=;
        b=Sf2rmUbs7OWhG0V0hzFIW5nHl2Sh1kofF66h+OpQ1SqXBL8Tm41oeeHNPQ9q9NumBj
         69zk8vjpd8q9IeOZaQ1RdYVJGUOtHH5spE9vSaOtobBFGEzqmCop9i7ARtYbFKUFPEvw
         e/DVpoRnFnTqLXYKZEged5I8VMyRsw5Arw6JWCR7DxkEvo2Z37PPzuce5XP6HxmglZJF
         hoo/mtQlL+iZOl5fhvg8sswgTZFh52xK7+OHB4zBBUBq332k/XHMScn1xMd3IBt74IUa
         sLpV74Au/tpACCxVRd6yuNx1+iL7TU7cUj0sFhbKasH3PGVdS0n0Yk1d1gEKA8NkiOCR
         vYCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2tLXpew66Mo4JNWix2Hpsuhpz422l9cYJJbX9xnN7GPcwyO8wvjnxa9Zqod9VYyEPHywfEi2x+cs7ANbvFZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyElPov/eMoMDTWTfsG/GZAkpP9Y8lgqRNKx7krT69cm//0gFiu
	hdMig0OCu6Kl+FBoI98WXdnJ4F//Csw6iuUqunuP0LaFesJn03kObI4wFA3gCfPYMnntzI8P4bA
	PqfOmfxe4wY3/AJJOxmj7MPbky6dKQ24AlnRN2AliVA==
X-Gm-Gg: ASbGncu55V9cnI0CibyOcr1NQveMmrdM2YgXSV7R4gk1nxFEDGLd7sTAlnW/aibA6S7
	HXCQzFqjyFZhuUVLKJg4chSLvzX4+6naxJOmyqkiF7YE60VMz+/fa0tfvkEDOCsPGJCLV9i3wZz
	Ig46fI74aabuCMVkQLrf1bgQR/WeSXTdMSi9KFvf2B2Cw9yVHCzH7oKOq5x90EvwzlH+Xv48MCS
	PXt/klxPDd7tWzJ0g==
X-Google-Smtp-Source: AGHT+IHcxZXWcQcGpLSD+vSozPC/BlwJwc3PxIluTYmSvDgzHTW8BmhbS+tPWNA+mMMfD1/Pl6uPG6IqMUkocmLUfrY=
X-Received: by 2002:a05:651c:1501:b0:337:e3e0:39fc with SMTP id
 38308e7fff4ca-337e3e04b6bmr41778151fa.21.1757014648753; Thu, 04 Sep 2025
 12:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aLnhbpfeweBI1H4N@stanley.mountain>
In-Reply-To: <aLnhbpfeweBI1H4N@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:37:17 +0200
X-Gm-Features: Ac12FXwwpWbvmfNMOzJViHg9lMWnmNonsNEwaek3gjtIoQRyh6dIvrGKZ4b12vc
Message-ID: <CACRpkdb4RjOSFwmao_LD0GM_+BSc5Ei2RmcXFPV_fBGRhB0DgA@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: keembay: fix double free in keembay_build_functions()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 8:58=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:

> This kfree() was accidentally left over when we converted to devm_
> and it would lead to a double free.  Delete it.
>
> Fixes: 995bc9f4826e ("pinctrl: keembay: release allocated memory in detac=
h path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied!

Yours,
Linus Walleij
