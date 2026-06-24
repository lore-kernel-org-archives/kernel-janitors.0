Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A325D239E80
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Jun 2026 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306784; cv=none; b=lTKRw5SwqYQ4XVRjkY84o/5NPOsi2Xf/gQL8Vzo9XvIvi9L3cNgmZf2eB20I82wYMZ2PHlO0HyvbDcJ0/DNT7YXGOA0IM//OzSOyw2IY62m7LUnwidIlbhSgMHuZQUM9CBfupdSYKVPr9InJRXAmwVkHPqhxegAc53grA3jUpH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306784; c=relaxed/simple;
	bh=vX50m4/9mpoS9OAgy/n0A8z7SSW5XduuDoWYLqcBObI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZk/msjl3PnjHH3mBNOdNpNOHPkDA7pKosPSzI55nS9mBqlk1OuIfE/VGfxoO2IC+tGLwOLvhdQ/xnoc1RYabI4K/xo6hLqZppQ9xDgXk0IwN+Z0vlw464rf6CJ1uQ+XvEhq5xZ98NAwC84hxFdFv2tkSUWXvHJnGjXVW/GJKc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bc4a1130adso49453e0c.3
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jun 2026 06:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782306782; x=1782911582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVDJhQYbmltFvjjEnnmNhAk+/lIL15u/vSuc+udanW0=;
        b=mkX55c0uWKHm8T1O50yUQgIeQZrgjAA/lR8h9iT/00chv4kzp+hAK+l9s89LILO1Ny
         6mOvs+tbR8khIDinhyNEfHGQ+c2Deq5pwMBP4MEZfTvC3j1ZsA7PnH0vy4PqfS4J6sug
         eSPBgEqi/0DNgSgl00julfKU/cq9qaDdWMy0wmm8ZKQng1+Be/Fzh4hmjSoq1rVoTjnz
         qV+oXQsvjxYXRaQX08Mg0WKqDfAJk3ZSOQJ0PjY439HX6eFvNgHktwh2Hl3sRPotQzZM
         4KAYcH6a/HvLhRGoEMdmq37hHV5zRyzKUhqnxsFRuR2fQF0gUCYwtON+HkADmeD0TaDF
         j+EQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJG7aKMvS9pNGOXBFMDHj3FnAM+USB5lpGvVqtRxNr9uyP/78d8cvtTyw/1F24c+nNL4eb7GJQkiUpeEUqaqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWry/cV5gc3N83k0Cp2Wrq55K+a11Z/IM6YenIk0TPVhDK+JfE
	rvf0gLrVOEAConFucLgbdtjc5iTytxogwYovmGaDUpRABzV9E0oqF9r6X54Y53Re
X-Gm-Gg: AfdE7cl0V6EQ4Wrzek8fn+FQ/jY87/zpy5pcknWORSwp8ilmmEi4mSxZFrNKT7VnlKn
	xLSClp0jpZnqq6932vyZjPudshGkndgZmOiDE2F3EEXpMpSDAdr1EunhtiCnk9BlNFH2wIemsiZ
	tYykkhZeRPtNpOQ/4Ibxl5dBk/SjJgF3t7yW9x0uF9WZwMiyvxZQ+4kVC5t4dvRStdrdHUV7kkB
	yvSpahUr14Xg+oj0OdLoYBET7dmKboAodLKZAqMGh/vIW9bGShUEdXSBvm5jM85zQe+hW7tGneB
	4iXa+VTdG5QUon/uF+jeD99KaIKgJujj5pVXrNyN9DV/Ls0hLICctEJaCSyLf+CDNeLUwuIZzpF
	hK0yTrYe6Efa/LLugvPJP4kVGMU1r4LKxVo51o/qfVANQ/jwsrBmNXBNl15SZm4ZboZUuMDekHS
	+9WFaLQ/SyQRkADiLEfQmjJsA+cF1p5z5oOraCH6pwy+hlnOqN2g==
X-Received: by 2002:a05:6122:794:b0:5a4:5605:c681 with SMTP id 71dfb90a1353d-5bbfba134fdmr10910678e0c.0.1782306781596;
        Wed, 24 Jun 2026 06:13:01 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfc00dd02sm10606660e0c.17.2026.06.24.06.12.58
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:12:59 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9669195bc9bso427869241.2
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jun 2026 06:12:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr8e+tIqnsHNS49hRL/uGV5pW4tV8TYSbgrDWXkGbZW1mG+rg4b7OqM6pBft3bze2K0Ir0DLVXU+A85zQqWKAs=@vger.kernel.org
X-Received: by 2002:a05:6102:3309:b0:611:e0c2:1604 with SMTP id
 ada2fe7eead31-72b671e931cmr10142508137.19.1782306778248; Wed, 24 Jun 2026
 06:12:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ajvVfSusxZfjNxVN@stanley.mountain>
In-Reply-To: <ajvVfSusxZfjNxVN@stanley.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Jun 2026 15:12:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpnXGUHRNrT856RkBtsrO_So+0sxJ47cG0OihoChB+1A@mail.gmail.com>
X-Gm-Features: AVVi8Cf8LN4jqx6II-ppStxUS-9RUJFFL6cy6NRwMFT9fQRCj9ODD57bZVky9AQ
Message-ID: <CAMuHMdUpnXGUHRNrT856RkBtsrO_So+0sxJ47cG0OihoChB+1A@mail.gmail.com>
Subject: Re: [PATCH v2] thermal/drivers/rcar: fix error checking in probe()
To: Dan Carpenter <error27@gmail.com>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-renesas-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Wed, 24 Jun 2026 at 15:03, Dan Carpenter <error27@gmail.com> wrote:
> This code accidentally calls thermal_zone_device_enable() before checking
> whether thermal_zone_device_register_with_trips() failed.  Move the call
> until later to avoid an error pointer dereference of "priv->zone".
>
> The driver works differently depending on if we are using OF thermal or
> not.  We use thermal_add_hwmon_sysfs() if we are using OF thermal and
> call thermal_zone_device_enable() if not.
>
> Moving the thermal_zone_device_enable() call is a bit cleaner as well.
> The original code used a three step process to cleanup:
> 1. Call thermal_zone_device_unregister() to cleanup.
> 2. Set priv->zone to an error pointer to preserve the error code.
> 3. Set priv->zone to NULL to avoid a second call to
>    thermal_zone_device_unregister() in the rcar_thermal_remove()
>    function.
>
> Now we can just do a direct goto error_unregister and rcar_thermal_remove()
> handles the cleanup properly.
>
> Fixes: bbcf90c0646a ("thermal: Explicitly enable non-changing thermal zone devices")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> v2: Use the correct fixes tag and re-write the check in a cleaner way.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/thermal/renesas/rcar_thermal.c
> +++ b/drivers/thermal/renesas/rcar_thermal.c

> @@ -510,6 +504,10 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>                         ret = thermal_add_hwmon_sysfs(priv->zone);
>                         if (ret)
>                                 goto error_unregister;
> +               } else {
> +                       ret = thermal_zone_device_enable(priv->zone);
> +                       if (ret)
> +                               goto error_unregister;

This error path is the same in the other branch, so it could be shared
after the if/else block.

>                 }
>
>                 rcar_thermal_irq_enable(priv);


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
