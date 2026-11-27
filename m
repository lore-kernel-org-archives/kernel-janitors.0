Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795789587;
	b=ZJz8W/LXxLyCfjPJJ1J6j0Mro8e+TdmgHp1IcMNTZBoOCrzpNxuBixrq45gJoEDM5nMq
	 RxwnERQzM6AgKDzPZSqliOPZedSkwFVXL9h1vcAESS13mhSjheE8xIF7qZyGjE4T54Zd7
	 kW3tFJlWXRP8xrWIPsy4OkEFgTjNI0mcnI6piHk6Y+K0n6+t9BQknzyb6zLKxzRHDfUIE
	 bDkTVf7j+o+oGZ8viKJxNXYv7O1UlEc+yumuPs8ifCKD8oXkXuGQUqlUAQPE2NgpjsXUl
	 rw5M2Cyz7Y4zcoaXkvrblcozElth2owvW0pkC1ZU9ACpc14ts4w5BO043xvpjORzIjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m1DqYt/Feo6Tg97bGood/CsVYKHCLyHFMxbJBDzqGhc=;
	b=IIWzGLLC66qkqe+tl75+Vxnd6dPGxCWrOGWv24S2oxu++os8oOPCB3nKNz9WFPFZ40o3
	 liA5wqmTE4taJE7cdyAo+qsMFHsVXkdm2alHdS9pU1XA7IwTNDTuG841De3TxrG5hvw/8
	 RsUhnvSb5UlHLr8ixbDCNDZwSsDhHbQvRc952G7XKMJVuABmOUaK2ek3xArH/cevOtm1k
	 72rlwQUnyxLvoGVrl43Owxfcwhpu9lQYhdiF+aGjoySi6FUHT8Tv0CfTvB1X64eBdMx4z
	 YmlOVamvD67/tyW0OHFVmZcp4xnomINOB7HTsfkEBxN/xXCBZgd1QQ+8xDvwm03tldw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cC+qyaGB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39866606A68F
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Nov 2026 14:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39866606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cC+qyaGB
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67c24619b19so6908741d50.2
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Nov 2026 06:26:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795789586; cv=none;
        d=google.com; s=arc-20260327;
        b=AqV36WOVexUF0MGpG/OYwa4wLV9zvKfv+z2KTcgpZU65irxqTg9ZdEplpls/4TR3Av
         8T/CsBVx1VeOIXQvKa5t0d4Q1Z62HfdsrisUkTQ6r/y+QHXcbAcYTnEPnwN8LGq5TWqH
         sqJ8sJ6vNn5kIS3O4rMAJ+kghe5dCYjuPNh7RJk2ZCqpMUpb2uUN6g7CNPdWsQZ1LrSb
         ILns4mNIEfOIWOOlaeJWLVqMe7ri1Us2GOGUvbfO1Va5jE0WE8QKA/UsxkuErKGJiiGP
         156uucgu7hiNWTtnjCq8ClY1o8XTsgEHlm8FV+BzFV39CdZtsBMAZCVUwIHk43pZTUr1
         n+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m1DqYt/Feo6Tg97bGood/CsVYKHCLyHFMxbJBDzqGhc=;
        fh=n3D67ogV/Dx4dMc1RLk/eeA5N/DSU/TPYcmfYCfF/0k=;
        b=YGDf58ckRjHO8lEc1YvIhAQNtIkcV01N/z44kcvt7lS/YTnoRlY2VZBeYIDDV0QPF+
         j7QgfcRZTl8SmlhT87TJznJdHpP6r4vTU9Ix2IxqpCB3uFEJ+9tyHEfxOVZK7YAPYJeH
         x7FJTudaEl6034+ioy/9V1ZjvrNpxGzzuRmunrZL7+Daaky3TmBeTA36BLU45/IM7MNJ
         +Yqskp99D5FpHtYMUlv4z46/821K+8jUtF305VTWexay+7gPfgY7OTZNC36F3yuzXMjB
         cebs8fC/vlILcr92ajUUtEXwjfc0H1zk0QfsEm2gtyL7PlMaIGIBFkoxy4JJAitG6LVn
         wdaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795789586; x=1796394386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1DqYt/Feo6Tg97bGood/CsVYKHCLyHFMxbJBDzqGhc=;
        b=cC+qyaGB7xL9/hIvPM4ljhUM9AVaeCKlMK0ostHAZv1kgp3lsJC8zl2UpLsbY7otIa
         QCDU6cUBKgiLBSOY57PzbUabzc8p+p2iAhbHDJrNScBluGlgc0Q+/7lPscZQ1NgYX+Mg
         OiZgV5RY8nh6r6xs478/Ymbq/NlSuyXmxF3gNVJb/WMt2D+JOcxR3B5I16d8UzC4GREF
         8b2kbs1gHoy1BP/XSOM+TplqEspcJjKGaFdKuTwX0z2lLH77QyrThzSem3Xmf9nG5O8/
         tapWNSHQpmghvv/R0hhEZHG+3z0HyAzNPU4RhLafw+Sop5lML9Y6MnGWkUm/ySctlfLU
         F5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789586; x=1796394386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1DqYt/Feo6Tg97bGood/CsVYKHCLyHFMxbJBDzqGhc=;
        b=TrlRggfO1pYdMXowjSau01RjoXcEnSzgOJ3i0m6mrf6pb8yO6zOHPF6a964koTLo8o
         hA5a7GE4b/k5tHz8yl7nBegKRR4DR3B1dsT9r+/MZhJlDQr6LuWxiUdbpwmfaWWnhCKx
         vwXbOuVSbHB9T11VMCBEQnSNPlKayftHqayEtYw28DLJKJB+InAobkAVFXbtCyAlNtyq
         QGHfkberTLQPD9p5rRT5QW0ia+2nOOAfnN9l8xSKLEllkoM6mr4s+4Hh3xc7YclI87HK
         hX5ZueCa/97y7bWHLsMdaaR8X7QNxWh9xMEomaZJFBCYEeXBg27rDaKmE4JQkZSFXHiQ
         i3cw==
X-Forwarded-Encrypted: i=1; AL+hErEDP8PcorX5Ux5xjLW1vknmOaX4eW3LCdnL5jFrDKIfae8cVfiMLE1ROQ2GAZmL2SDP9bledqj99Nw0E7Em5QM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JZLArmglffqqNY7akddJIudQYKP/tJtIRTO7I8xUP3d18IWfB
	vcDUTU5mGscqTfVP/p6t3GrPJx9d6xyUPrAdLlYK/TbTdgblw8QXH6N+mwdde6akfkkEXuXzjmn
	OQG3e7DD7llhj2b5Ww6c67BFEZhCQ7Jg=
X-Gm-Gg: AZFdTZdyLb+vX9aCVr4otkKFW2jvJ5/ejtePWpSv8c9BiLq/gQkkHcDyeYXwSXVCD3W
	1sDqVnNPDl58BZkDVFLcgi/XaY8WDADWxnnYwvW9Ip/7RPteufj5L9ttnD0FY6+IDj+QbVwSFKi
	WiFPEDKxO3Wt6RUSM97uJxMUb1mYic7bNTc5HARyqtuAaPKl6EGYNwwTMirRRf3OETkKjzczmPt
	Z1LVMphn/wVC10u+DQirKSpgvzunUzT34nk9awhKty1DjJ9+7U2VwdtAHGOfjvd26ahZCsCzHj4
	yU1It2mNVelm4cgzEQ2E98EAogL0HoOV54YFeLuI/cTeJwDVNQZzCQi03tSyp7ozVo5nat7Xcu6
	DXPb1yFRjaCI940ejoLz0hrW7rQOWN9r9gR/94FTzAqHTWSPWiU8lotuGDLXQr4Ex5glQ6zaH+1
	nJUslaL9UYLtT9Jln5CmyaYphDfVuJ7ti6e5l2UyUW7IIgqG+jCWr03GBCx7fa0G/ygjTsDv0j9
	MqmFe8OPbc8ZyaMSP8tYLXoOdLk8fOPCH72qN0515U+Ht8fc/vSAXKg4vfQ+A==
X-Received: by 2002:a05:690e:1489:b0:679:5bea:d3fb with SMTP id
 956f58d0204a3-67df44ff2a3mr11332814d50.98.1795789586210; Fri, 27 Nov 2026
 06:26:26 -0800 (PST)
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <7d7b20e7-6749-46c4-a6f8-462f83cd27e3@web.de> <0302adc3-dbf2-4e62-ac9b-8923ac285506@web.de>
In-Reply-To: <0302adc3-dbf2-4e62-ac9b-8923ac285506@web.de>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Fri, 27 Nov 2026 15:26:14 +0100
X-Gm-Features: Aa3M54rU861K6hVH_v4BM8VXqJq13L8vPQqUixPloEFQahDxyt31sYLJ9SxYLgk
Message-ID: <CAOiHx=mX7HYFXt05G_cH+u3uu3pVZEF5W5j2M0tRs6PG5swd_g@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] bcm63xx_enet: Prevent unbalanced
 clk_disable_unprepare() call in bcm_enet_remove()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Hemanth Selam <hemanth.selam@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Florian Fainelli <f.fainelli@gmail.com>, 
	Frank Li <Frank.Li@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 3:04=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 27 Nov 2026 11:52:23 +0100
>
> A clk_prepare_enable(priv->phy_clk) call was specified within an if branc=
h
> in the implementation of the function =E2=80=9Cbcm_enet_probe=E2=80=9D wh=
ile
> a clk_disable_unprepare(priv->phy_clk) call was unconditionally performed
> in the implementation of the function =E2=80=9Cbcm_enet_remove=E2=80=9D.
> Move this clk_disable_unprepare() call into a corresponding if branch.
>
> Fixes: 7e697ce99ceb09538cdc1dfa9ebb3db60236b0a7 ("bcm63xx_enet: use manag=
ed functions for clock/ioremap")
> Cc: stable@vger.kernel.org
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/net/ethernet/broadcom/bcm63xx_enet.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/e=
thernet/broadcom/bcm63xx_enet.c
> index f6595fdc888d..cc9a5cd2a2a3 100644
> --- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> +++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> @@ -1915,6 +1915,9 @@ static void bcm_enet_remove(struct platform_device =
*pdev)
>         enet_writel(priv, 0, ENET_MIISC_REG);
>
>         if (priv->has_phy) {
> +               if (!priv->use_external_mii)
> +                       clk_disable_unprepare(priv->phy_clk);
> +
>                 mdiobus_unregister(priv->mii_bus);
>                 mdiobus_free(priv->mii_bus);
>         } else {
> @@ -1927,7 +1930,6 @@ static void bcm_enet_remove(struct platform_device =
*pdev)
>         }
>
>         /* disable hw block clocks */
> -       clk_disable_unprepare(priv->phy_clk);

clk_disable_unprepare() is NULL-safe, so it's fine to call it
unconditionally. This change fixes nothing, just adds potential
breakage (disabling the phy clock before unregistering the mdio bus
feels risky).

>         clk_disable_unprepare(priv->mac_clk);

Best regards,
Jonas
