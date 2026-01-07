Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2662B2DEA67
	for <kernel-janitors@vger.kernel.org>; Wed,  7 Jan 2026 10:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781204; cv=none; b=EDRWn2FEaBU0pDxpk8FipqjCLM3guhRExJN1xXzsdSPXMXenUx1qsGDSwp9IYlwuAPYDMtaC5DTwZ1ki6MeuRHWrlZvT5am9dzATDdXwD2/C4jciC/6dJ6fiW5+aeculiIFrtD8T7VFPpUVDOuUZbMFRgnuTvCQwy5xTsFfQt0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781204; c=relaxed/simple;
	bh=LHpq31jb131mLfSGnY4Ziq9pimILVbLw9BqnoqFcvrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYUQ0qAp5Awqbvx9gIgtZsu4XlCZPWX5SQtjzE7kkRBYBdMlmc+MYj/Lz27pP3Y4xQ7noijKjqPw2SsWDO2yXX4bClgrrqFG4FTmwgE7/jNX6q4LwE6rIDI0qf4DtvB4V5U8wHnKWQDU2YmVrkfhfaJgwX2tYWIYyJdPY+E7PIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5597330a34fso1282091e0c.2
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Jan 2026 02:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781200; x=1768386000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cczIBCc+dLHuZXTLgaBKViNuxTCEGSUaGSx91WGct5I=;
        b=eSmYJ4uedsqcBlT4cSVax6MZ7VIB47TNB9c97iH/TDYCiXBR0TTgAoGg3fo8LkB6RH
         B/OpfTDRJrntXmHtbXIXKIE8s8E/1cYEr2GOrCRemj/ZCovkcHJUKpvteNerDk+W/I6H
         E60bGNdYHLf5V9koMe9APGP3x92VASv1FPO1NoxrGeC8VpSr+JFikl26p8Nj4TRqKX2Z
         zksl4749Sau3ysaunH6Sg34ryxC5rEYTAVrQZW62zEfRgN2Nofwv660+nHYJejYb4UdQ
         fhQHmKEARMRIk7siy4lDfeb/f2q7+sgoU/W312Yh0z74k/DwKlB5vCQyN/6tWlmD5fze
         438Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5PNmh/lUqKjN2J38EuyRhjpWVSbpzvPCF88M9pGB8JCo3jbc3AIown+Mn3E4oYTZGT9I1qez0CCbQXMApJU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR2o2CYqLA9pa5qyTKgLMJLVO4mJeykiiQGIDLDu+tEPHvvtNl
	EiKC8tjI9+PhG2rP0N3JTf9h5l+mYFxMWXu0WVEo/ATvi0/bDXyQEu4ZEa5vYR07
X-Gm-Gg: AY/fxX7m1nZRP49RjQvYmcJ0cqPu6EoNsZlAuuHObyfcREYHvIy244Ugo60O8URwYQa
	J4URbr6s4X2KzpLYY1hOSkm4QfdS0KKwHz/88d4LkTKwJgdZvjaFclRGAoWcTZ7yBfmm0D1FPdM
	mmTi70ijnDzKaJgAbldRhmFbtdzG5Wsg5dcmaaOJDGpD5bw8J7SaH9gYPzgE4tPUIhA3pMegTR1
	VNUNiWdKDyVAn71CqTn6WlHPx5m37hbDxGaoby899nq+rLJ7IqVPiovE7rFx4e1S9lT//hUijbF
	pBfdK9zCJM8XlTPrFwvuCov6MDilj0rgUAvYF+BKXT2KwplawCpnq5hkOLL1bVdYtzqKEGvb9RU
	GlawTcB0hbLHqOdFYQKmXnFdnN0wZsG4rKLr+9ArZi7OXhkCvlswhzk7rIGgpiKyV46Y2yYmTkg
	Iifib0UBmiKhZboG5/mGFZTq6vYLfafM6UorXU39WO/+gyXAtz
X-Google-Smtp-Source: AGHT+IEwsZeD5gEf6iCn564MYCnFB8gCivsp1xzpLeLcc1lHzAuHnps4ewiZzvNsHHYyXKhVTlYEnQ==
X-Received: by 2002:a05:6122:322b:b0:55b:305b:4e41 with SMTP id 71dfb90a1353d-5634800fd9dmr719825e0c.18.1767781200019;
        Wed, 07 Jan 2026 02:20:00 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634e959afbsm506978e0c.1.2026.01.07.02.19.59
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:19:59 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94130b88642so1113087241.3
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Jan 2026 02:19:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSboLTotqlZ40O8pONrBFtLW5JDlAqDsdud6Dtvi561F7RA5IXMYyWripgndUdwEZNBOGAxtB+4rPt05EjC4Q=@vger.kernel.org
X-Received: by 2002:a05:6102:38c6:b0:5db:d487:2ef8 with SMTP id
 ada2fe7eead31-5ecb69382e9mr732064137.20.1767781199325; Wed, 07 Jan 2026
 02:19:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107092101.24545-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20260107092101.24545-1-lukas.bulwahn@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 11:19:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5nz33Or4Ygi8CQ2zT+qCp2r20w5xk9PB9y8N7HRPf3w@mail.gmail.com>
X-Gm-Features: AQt7F2rQTCG-Z1jjSRVwvE9mi0RLGpBvUlwI-btWe4ni3tZhuIEHpZY6d0UY4q0
Message-ID: <CAMuHMdW5nz33Or4Ygi8CQ2zT+qCp2r20w5xk9PB9y8N7HRPf3w@mail.gmail.com>
Subject: Re: [PATCH] m68k: defconfig: Clean up references to non-existing configs
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: linux-m68k@lists.linux-m68k.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

CC gerg (coldfire/m68knommu)

On Wed, 7 Jan 2026 at 10:21, Lukas Bulwahn <lbulwahn@redhat.com> wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
>   - Drop 'CONFIG_I2C_COMPAT is not set' (removed in commit 7e722083fcc3
>     ("i2c: Remove I2C_COMPAT config symbol and related code"))
>   - Drop 'CONFIG_SCHED_DEBUG is not set' (removed in commit b52173065e0a
>     ("sched/debug: Remove CONFIG_SCHED_DEBUG"))
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  arch/m68k/configs/amcore_defconfig   | 2 --
>  arch/m68k/configs/m5475evb_defconfig | 1 -
>  arch/m68k/configs/stmark2_defconfig  | 1 -
>  3 files changed, 4 deletions(-)
>
> diff --git a/arch/m68k/configs/amcore_defconfig b/arch/m68k/configs/amcore_defconfig
> index 88832e9cd7cb..f310b5dacfd8 100644
> --- a/arch/m68k/configs/amcore_defconfig
> +++ b/arch/m68k/configs/amcore_defconfig
> @@ -61,7 +61,6 @@ CONFIG_SERIAL_MCF_BAUDRATE=115200
>  CONFIG_SERIAL_MCF_CONSOLE=y
>  # CONFIG_HW_RANDOM is not set
>  CONFIG_I2C=y
> -# CONFIG_I2C_COMPAT is not set
>  CONFIG_I2C_CHARDEV=y
>  # CONFIG_I2C_HELPER_AUTO is not set
>  CONFIG_I2C_IMX=y
> @@ -83,7 +82,6 @@ CONFIG_ROMFS_BACKED_BY_BOTH=y
>  CONFIG_PRINTK_TIME=y
>  # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>  CONFIG_PANIC_ON_OOPS=y
> -# CONFIG_SCHED_DEBUG is not set
>  # CONFIG_DEBUG_BUGVERBOSE is not set
>  # CONFIG_CRYPTO_ECHAINIV is not set
>  # CONFIG_CRYPTO_HW is not set
> diff --git a/arch/m68k/configs/m5475evb_defconfig b/arch/m68k/configs/m5475evb_defconfig
> index 2473dc30228e..9be4dae84ebf 100644
> --- a/arch/m68k/configs/m5475evb_defconfig
> +++ b/arch/m68k/configs/m5475evb_defconfig
> @@ -46,6 +46,5 @@ CONFIG_EXT2_FS=y
>  # CONFIG_PROC_PAGE_MONITOR is not set
>  CONFIG_ROMFS_FS=y
>  CONFIG_ROMFS_BACKED_BY_MTD=y
> -# CONFIG_SCHED_DEBUG is not set
>  CONFIG_BOOTPARAM=y
>  CONFIG_BOOTPARAM_STRING="root=/dev/mtdblock0"
> diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
> index f9ecb1dcc060..515d9b208b10 100644
> --- a/arch/m68k/configs/stmark2_defconfig
> +++ b/arch/m68k/configs/stmark2_defconfig
> @@ -90,4 +90,3 @@ CONFIG_PRINTK_TIME=y
>  # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>  CONFIG_SLUB_DEBUG_ON=y
>  CONFIG_PANIC_ON_OOPS=y
> -# CONFIG_SCHED_DEBUG is not set
> --
> 2.52.0

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
