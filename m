Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BB52F49F5
	for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761897678; cv=none; b=KChwtni54JgAuwefr+ZiGZO5YfBpeQTfjgkF7pnUIT7Rm6Tr1OQLxRxMh41E9AFTcrHRgoqyoKD6SB4qtqrqX5Az5snbeNo7mWkv6y6E9Z/1YLrSOwHzdVffkW7TXHHVA7TWKdszolyY7N9kg7zV4AIbOfOvbSvabaGgiUo4Mo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761897678; c=relaxed/simple;
	bh=6RExzYFt2jFngKeLwZZhIXhryDhrEYofiRI4ar8KsXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwS0YxapKZWgraP6wRtkN8nj6SwckgIckisfA8q8E1Q3K8nRwNkKaPBU+vGh53amHW+6rji/nEErlmq3w0axFlZTkKAuaRQHkhzpsfadEhnDn2K39HCNCYHChordQ2Y/XJ7ZXJ8xoZJYIaPVtROOBBldCagO9hUZ4C/DyA69NQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5db37a935f1so886241137.1
        for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 01:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761897675; x=1762502475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9bvdnPD20ODXbm88Rkbvmv8aTDyzXTmQyD55LvW55s=;
        b=ovqH93XShSeZmo7vksfYYtu6YssXQSzmf5hqTWRzFPe8suJhzRYO/YdiYeNF3JMLLI
         xx4cFKjHpqUptirqfUmXS9FTcs2cpkAggA0rqH5WhUaS4MzbFEJU3ic7kGfJsV67iz1C
         NP8SjSdv9veo59tkYnIfj3J1nQKD8gRNp/tB5GTIyGKa+SKOZPN/RnZ+Ca/RsxQ2kmz8
         CoC1JoShEWgdVE9NYiKUtCcGmFQTkMa2Cmk1yz1sPJGKDpqrF9SmBebrbsyg7aZX83nQ
         /mbCAnJcqpHUriXLmDNcmg6KxqVIqIzkmtvp7yyCkcPKr+L+9nF00+lAY/mr2q3Zofth
         xTMA==
X-Forwarded-Encrypted: i=1; AJvYcCW/Y4Lae8XTMDeNHChcJw0aWkt9FaKUgc7LDbW5itiDdb5t7zJIKcpB0rZdSvhfvI874/hR5P2Stltupk+BJEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx70g9sTPSv3XpBMLAzvucBav9zmZ6olxE/OLhZJ4eTCkN0zgac
	jES5A5g2fTzTZQjc6KlAzvJZPKCLotH6B4exZYFu2W2becV5BtdEJ9WpyIFtl83t
X-Gm-Gg: ASbGncsteT4MHioHCqzNIc17865ASo5PBlU0e1CJj6v1jqUPXDMOIROSSIFJ5QPGdRw
	n/21cfjvNlAT51eH2GfmEQYZ8FrRt8GoZgqFpLhzCV0WcxwJWp75dOF2AsMbW+N0ZfEM1HeGpsw
	PLFXA6L4P1zAoXPReCcVj5Ai54yC9DmroU7hUXRxJ1I4mgEReSWHrfLqje5lvhmsBzJ+/wBOEPy
	VgnTeF7WUKEzwhX1AHnHveKFgKdz6ZAaLOfA95FCG3C9P6cOGVKrEIiCTJi0wGXmQD6YBr45Sg8
	z7GdO10KcoX3uQJkxq/tmkpzx502y+QfU0zErtfJJmxTBdlhHOSGQa/NnqvqgFj8l5Z5RZH9lcZ
	rC2uAvpF2+jety2CepiO/8lUGY2peHAdOf6PrdfaiujNNOIiWqxycvvpjwTxueqdbpwtI4d+pWg
	Kcjx5GNth79EXvCvyrkrJePe5zKyq00l2poU4wegEqQg==
X-Google-Smtp-Source: AGHT+IGRUHxxl5i2ukJb2na7TbZ25dyL9v8NPURen64cenNJA7elL5FKGG10cbAB3065EcUJQbwWGQ==
X-Received: by 2002:a05:6102:c86:b0:5db:3111:933f with SMTP id ada2fe7eead31-5dbb135864fmr672726137.36.1761897674808;
        Fri, 31 Oct 2025 01:01:14 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93512b82026sm410428241.10.2025.10.31.01.01.13
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:01:14 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-934fb15ee9dso722778241.1
        for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 01:01:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTQC3oUt0ipF2lDGsiXMUf4thnZ+JOQWtKdB0WlchImmHaVWAaM8N44ETeu8XUxFnudSKEqckKV4Xr9EHQ3O4=@vger.kernel.org
X-Received: by 2002:a05:6102:4186:b0:538:9b66:7655 with SMTP id
 ada2fe7eead31-5dbb12466ecmr618067137.18.1761897673256; Fri, 31 Oct 2025
 01:01:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2fa899eb-60b6-4637-9035-aeff78e261fa@web.de>
In-Reply-To: <2fa899eb-60b6-4637-9035-aeff78e261fa@web.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Oct 2025 09:01:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-uKt3-Lb2NaxmONEqWdtFgTOqXEo1nOfGq-R8ysHfcQ@mail.gmail.com>
X-Gm-Features: AWmQ_blCO1e8lSBOgkh0TQ3Lynfwp2Y7X0NnvV--2NjFJHk-coEQ7bju69mPh3U
Message-ID: <CAMuHMdX-uKt3-Lb2NaxmONEqWdtFgTOqXEo1nOfGq-R8ysHfcQ@mail.gmail.com>
Subject: Re: [PATCH] sparc: time: Use pointer from memcpy() call for
 assignment in setup_sparc64_timer()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: sparclinux@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Andreas Larsson <andreas@gaisler.com>, 
	Christoph Lameter <cl@linux.com>, "David S. Miller" <davem@davemloft.net>, Finn Thain <fthain@linux-m68k.org>, 
	Tejun Heo <tj@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Markus,

On Fri, 31 Oct 2025 at 08:46, Markus Elfring <Markus.Elfring@web.de> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 31 Oct 2025 08:36:13 +0100
>
> A pointer was assigned to a variable. The same pointer was used for
> the destination parameter of a memcpy() call.
> This function is documented in the way that the same value is returned.
> Thus convert two separate statements into a direct variable assignment for
> the return value from a memory copy action.
>
> The source code was transformed by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks for your patch!

> --- a/arch/sparc/kernel/time_64.c
> +++ b/arch/sparc/kernel/time_64.c
> @@ -760,9 +760,7 @@ void setup_sparc64_timer(void)
>                              : /* no outputs */
>                              : "r" (pstate));
>
> -       sevt = this_cpu_ptr(&sparc64_events);
> -
> -       memcpy(sevt, &sparc64_clockevent, sizeof(*sevt));
> +       sevt = memcpy(this_cpu_ptr(&sparc64_events), &sparc64_clockevent, sizeof(*sevt));

IMHO this makes the code harder to read:
  - Only 0.15% of the memcpy() calls in the kernel use the
    memcpy() chaining feature,
  - The line is now longer than the 80-character limit, which is still
    customary for this file.

>         sevt->cpumask = cpumask_of(smp_processor_id());
>
>         clockevents_register_device(sevt);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
