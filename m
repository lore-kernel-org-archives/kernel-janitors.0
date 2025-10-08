Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4442EC0B5
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Oct 2025 09:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759916302; cv=none; b=lDzgbPd93MJzY5PeDJdEyIfdCQoefrH85m80yvxg1z8Fr+nWSkIuiyTTgdL6gJ3KSu8G4WsvRMbQ1ZnY+kJ2WaDp+yJCuaRLOW6ddwzUAjZ3niD9SF/p5jRoE7eB8Gz0EscBKY4BkehnKhSmMegYWmxJNC5jzW/KRWVfLD6CUNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759916302; c=relaxed/simple;
	bh=QZNWWheMYqQzuuKISvLeOiDECD6lMhoLTkQ8WAFFFfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXBGgoBhLZ9PSZuGMqjn8FBrCGGYVPl11/5H5d+W59eVyZPA7FezUK3NLuXVb6sXkhMlTaG5A0AmvDenapp+hnO04lrg+WTa31WaXuAU43fSNsqsE/48177LRkYgz834qXZolz2H9mQCgXhspYXMCHpohTrBwp//yRuWHbhJP7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-54bc6356624so496972e0c.1
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Oct 2025 02:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759916299; x=1760521099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6l+B9owPtIKrCSeyTE4F8NmW+PJqEJv1NByjt8yVUI=;
        b=pohxHm7Wtwh4mm5BSjyCdpSRzarh0vQAz1AVZQOJQGIqV5SQeSGLsYkYGj/hnA3CH2
         dZeAs24A/O84MYNDWzfD89ohzKTIK6v6zvj3CkTqrUi5W4Fh5dWn275NA4uryqdoGeNb
         YIYF6bsb+nwbgH+DFWLMT0C2htSI0eMllJnHIOR1KCOKWPrPy+SFu85R5DUZGtXBtODP
         oR2+T1fSNHqrhxFfBMPjBIZ/i9I2fgqqKJWIJ1HQxwaDjhHk4XrVJ4CvtlDTEruIAUQv
         Zx56mnLZ5JuydGWFxzQXpK5wWwvx/UWmlTz/cz41MxSiuPVUP0V5ImB0w+LExX/7FnGC
         OKuw==
X-Forwarded-Encrypted: i=1; AJvYcCUARSyVKAbbPgfPlsPQOkLtOUAq1UW6TPGnCs4QpOmen5CQDVaaYyKHd2k2grrbXptTjkYaOForNLN/WUV8gw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNSkq3gmM6aUlUfz4shEtQxCLEVc7WruLfgRJNZGnCCk5eUgkN
	Te9vBguhZgaeAt/OomaZ7WbHNVBfkpFJueppl6ghd0F1F3gfoK4RqQ+icnJrK76x
X-Gm-Gg: ASbGncuy83wN3g5AdwAfW8zFyKgBf6sw4jhcgthcYlqmCOIBiRXx9phULhGz2E3+Jr9
	ec+XhWAJC+cQM7wIwub2ypU0TECP/2LeUhPxvShTo4Ht+R+gNzh0Amir/vWOXVvpjCEqMPEJtFf
	b4SeaIOB2r1SYbsFYCCI3H+nW4sCSFRz5iEr8QqxxgF9c4oQ/ZyYUs2v+Ci1Bjy22JFALp5Bus3
	TYHWREQ7YmPGc7DZUwxPciOfsfDRp3N77ydA1YIJqvs79H8yI127ecBtUQSZmJ//BRPUSen6DaR
	9c36z9UGQrv1ti+anKgtSzzXVc3HoR5LDJ+fHUpjwMhZIE1I6Ay+GH1dS4kLuxhGDaXcRO8OH+X
	JSY9+c24CiT0hG/NDw6YazaQUCGUYI4Y5jhUy/yRfJ6MXkFaguAbbDyKX5j2n1y1EnBsTnPgdKT
	ZqJxMv3L70pM74su3U3WWErDw=
X-Google-Smtp-Source: AGHT+IFBj+XsSFpIW+wRG5Zh5AF4DZdPuBCSCzfn3fuxU1mrUBlIoQAXbrZ0xPsIlrH5Whrx47hhXg==
X-Received: by 2002:a05:6122:3110:b0:54a:1ec6:b1ab with SMTP id 71dfb90a1353d-554b8f3e2b3mr1044971e0c.0.1759916298909;
        Wed, 08 Oct 2025 02:38:18 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf3e0fcsm4372065e0c.17.2025.10.08.02.38.17
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:38:17 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-54bc6356624so496937e0c.1
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Oct 2025 02:38:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHRsZfKkg/DEi/e9JEh6+3Bx49uOly2Tu4TGmYGZOXSxFSTIxbM2OR33izPLzriBUhM5SZCJ8nzQuwqmVJwrQ=@vger.kernel.org
X-Received: by 2002:a05:6122:e011:20b0:54a:8ad3:7b5 with SMTP id
 71dfb90a1353d-554a8c9b568mr2813894e0c.1.1759916297008; Wed, 08 Oct 2025
 02:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aN-XoqpP2Jz75pjj@stanley.mountain>
In-Reply-To: <aN-XoqpP2Jz75pjj@stanley.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 11:38:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwpWLvnAWhHqPUL1Cg7dq3rX8wzptHrWC954T0sh9bEw@mail.gmail.com>
X-Gm-Features: AS18NWBegczPMChD6JEBf2DL6C5D4h1G1LphqBzffcl9ZraTnd023jN3u5ksKbg
Message-ID: <CAMuHMdVwpWLvnAWhHqPUL1Cg7dq3rX8wzptHrWC954T0sh9bEw@mail.gmail.com>
Subject: Re: [PATCH next] mtd: nand: realtek-ecc: Fix a IS_ERR() vs NULL bug
 in probe
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Oct 2025 at 11:30, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> The dma_alloc_noncoherent() function doesn't return error pointers, it
> returns NULL on error.  Fix the error checking to match.
>
> Fixes: 3148d0e5b1c5 ("mtd: nand: realtek-ecc: Add Realtek external ECC engine support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
