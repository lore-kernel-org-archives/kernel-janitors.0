Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC1E41BA7F
	for <kernel-janitors@vger.kernel.org>; Tue, 22 Sep 2026 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065226; cv=pass; b=BSI8iCa8MtwRKdWkcS2r6zAGV1OSd7JbwXc6GVld7aRuD66dMB2dpQFMJr9cqvxhmYElVgAsnJT2v8I292gn3tmo5mCtcCkqNhTRy16OTcdyfMNWanNiYGEOm+SOcpH6JFX+6WopfkPaA5QqxWsxNl84j1cAldodF3o9CglBjtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065226; c=relaxed/simple;
	bh=hM0EaCqPsrA1hAcKzwMcf0Q3QOnu+qe7h0GMMmXoql4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1fXvoaGkm7VgbKk5mJjEm/MblNqkxk9w+x1xfOB+f7c3ACmJQFo6N8LL8Ju5ofmBTUUNpsMxHuJCpJzN/DHgaXVUFuIsfiVLzzGQh2KZSCUJ5MajoIQI79IdU7EcwTgLoO53KeNmGaaNBNxUIuzpYFIMbbDXkNtpF8Uf9JIcg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBmhKwMq; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBmhKwMq"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso3724632a91.2
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Sep 2026 01:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790065224; cv=none;
        d=google.com; s=arc-20260327;
        b=iO4UfUeOpoTKeEWh5ZSi1zEEMpzaIbhxxI5nzv53dXLOqFpnlPMXN8eAvwX798mC0G
         RDhj8HVIVvndPGp1eBTCRCHyPERONMANffeCslgB6Ndr3VENGm4A+RAF6xtQeQKEVRdA
         KiVAF/12QWShBJ+I9RcB21tbCiDWOyHcESa4gMZUJxt6woP13w2LMMKt/XmCpde/jSMS
         Ijg+C14ArjBT3E2r5EcdRqO9F/nKigA2MsCf4iZtQ1vnBf2DNl1SFfuCEuE9j1FR+BTR
         qNWAGUdcMWT/VbJLDQRUvtIGpNteg4jyEoQg/NzUIXn0u+KlR180D/YxdwIKabao0HSB
         Fgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=etyNrSdg7SELADqdNG6OVH3H+CXSg23SDODY/D8rF+4=;
        fh=FqZmo2+AvkT2zwRbEZsaCPvk05VZjAvFEy+yjjBDmic=;
        b=KL+RHLNVH6/dpKrgwunWzVeptQdbrMg/85dum9Z2hxeGO8x341YnbcYZzJzrhqZgMV
         kH+ZbunHLSvjr0n/O8XR9PqLJcs0X05wNRAGflDuDmKuSpEno7SzKrwyJzbu8p+OG7r1
         6IbnuUIXrBR3gFfrQi978LjLv2hSFlC986mTuk2krNDcEWkfMTvlma6vpZOzwSIpcCMx
         Il7V9hUiLNMaAAiFA/+neHXtlXc1Fxm2ea0VH0zbdmQvOPeMR/fyUZg0qQtQxQj5L11V
         X/DXbFXW83NpXk2BfJDoYB9IjC678NwIm3YxQUi+HJQG0M7hB31WTyA/oLa7WWmvWfYR
         2JPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790065224; x=1790670024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=etyNrSdg7SELADqdNG6OVH3H+CXSg23SDODY/D8rF+4=;
        b=WBmhKwMqI8+7VIgKMApl/5FozsahuYbt3mZUF9jH7uuvf9TSGL+z0jgchG6iBxoy0/
         +Cb62Vc+vC8FAJXtcoW4VdJUFs9SrT+54X3nEmI7+s7eMHBcYwovk/wR4lrZase1WBlc
         MRDoKKyMflBhmrvjzyt3MV7XXXYz5q8D6CsCYJQxBskzziC+UNYx2Ix/5svtl8Od5aJW
         5rVZGgMhkgOFqo1dEkIHLhEEU/A3lPvmIzzLRiWeQk3d1QPCqZMwqLqCq70lEEeZfaYL
         gQ6BKcDnMnQFAyYF/f10++L3ADTmsjWH/2uQ3QvVcuW+Hd4OTsDd8yoYsYAxU3MgrkiW
         4Pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065224; x=1790670024;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etyNrSdg7SELADqdNG6OVH3H+CXSg23SDODY/D8rF+4=;
        b=UXAgEmSB//zBPN5gvEg6d0M6D3MTQB0jrq4fHrAlmM2cG7eSVKXPZWsiCzWconoYbX
         vb4HfU6EWboVTIskOWQZyIGI5hq/cCQ+l1M5uZytI4o+Ole07HF3SzFPKWvm9Hi10fs/
         F8pxGWx0hrvjpjol+jYaj/FZp5vjcdBm0mTPWvpvVIkB84a85gTOatF+tpWADC4czwDl
         5f4qweqDi956UA8NEW69WuqWj5ENC1jt4n0ORYKerE0JFD0xKMuXX46Nm8H87RKkTuiG
         W0XT47mbkZ9e+vVYvk+xJ/WLznqnQjrzH6TCJW+uIKbEhjqQkOP+ZwYmC6Q8qUTYvR/p
         YaDQ==
X-Gm-Message-State: AFuF++lzm1Llg2IOVRop/7ZNjYYVewH0evtMDAN9bKrAYZeFECWkMZBR
	khmJAsHhAbibqcdFoMMDwy1b9H5y6FDGgbrGJlSIXVIeHoWINJAKxVZqRFA03eBNUXIxze1Ro/W
	RSZXZhvf5hRQj/Upg/M2mtso6gLXo05c=
X-Gm-Gg: AYBFou1DCU6MVaYJaTlRaUmLye4PhuvScEuoWdasS2dfBYpTa3DlTyO5s8oEoexeB7B
	JRMn5gO0sV4h8eQ3488X8dvGnUyvHAoOu62wf8HtGVP1vFCPWIxL3XYME8xJuyibvY404oewJUE
	IJBBkBZrJAjBeu1/GUMFppwQYbmIfEz4sP44JcEqWlQIcWZVmcz2ittLePrGXb+51g8Ahy9+WM9
	Rg6qCeTrw1X+y9jBhTKZcFjR7jp+owOGOJ+uqWPTYIHTks4TkXImHPLJWZD5QRYlmQILPLhyqsc
	Z+O3sd4I7+hWuBxPCbmU4Ot3F0PyYIcQfbFIncpQ0TrL4eOQV6iKTFH3UwY=
X-Received: by 2002:a17:90b:4e85:b0:393:19a3:4f1 with SMTP id
 98e67ed59e1d1-3a07309e835mr443959a91.6.1790065224306; Tue, 22 Sep 2026
 01:20:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919175925.3739806-1-lgs201920130244@gmail.com> <4d1536a9-6836-430b-a84d-aaa19f6af9c6@web.de>
In-Reply-To: <4d1536a9-6836-430b-a84d-aaa19f6af9c6@web.de>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 16:20:07 +0800
X-Gm-Features: AcwNN1VeRLDrIbQQKRLeG1AyUpioVwyENSebpLtVmqJsNEPTYC8bee9d02XlHxw
Message-ID: <CANUHTR-um24oLb-446LRtHLFBGtJ7h=QwEksSjvig-SFonJpRQ@mail.gmail.com>
Subject: Re: [PATCH] dca: fix provider device memory leak on domain allocation failure
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Dan Williams <djbw@kernel.org>, 
	Kees Cook <kees@kernel.org>, Maciej Sosnowski <maciej.sosnowski@intel.com>, stable@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

Thanks for the suggestion.

On Mon, 21 Sept 2026 at 19:30, Markus Elfring <Markus.Elfring@web.de> wrote=
:
>
> =E2=80=A6
> > +++ b/drivers/dca/dca-core.c
> > @@ -368,8 +368,11 @@ int register_dca_provider(struct dca_provider *dca=
, struct device *dev)
> >               raw_spin_unlock_irqrestore(&dca_lock, flags);
> >               rc =3D dca_pci_rc_from_dev(dev);
> >               newdomain =3D dca_allocate_domain(rc);
> > -             if (!newdomain)
> > +             if (!newdomain) {
> > +                     dca_sysfs_remove_provider(dca);
> >                       return -ENODEV;
> > +             }
> > +
> >               raw_spin_lock_irqsave(&dca_lock, flags);
> =E2=80=A6
>
> Please avoid a bit of duplicate source code in this function implementati=
on
> by using another goto chain.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/coding-style.rst?h=3Dv7.3-rc4#n572
>
> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/dca/dca-core.c#L=
335-L389
>
> Regards,
> Markus

Do you mean using a common error path like this?

        if (dca_providers_blocked) {
                raw_spin_unlock_irqrestore(&dca_lock, flags);
-               dca_sysfs_remove_provider(dca);
                unregister_dca_providers();
-               return -ENODEV;
+               goto err_remove_provider;
        }

        ...

        newdomain =3D dca_allocate_domain(rc);
        if (!newdomain)
-               return -ENODEV;
+               goto err_remove_provider;

        ...

        kfree(newdomain);
        return 0;
+
+err_remove_provider:
+       dca_sysfs_remove_provider(dca);
+       return -ENODEV;
 }

Would this be the preferred change? If so, I'll follow Krzysztof's
suggestion and include it in a properly organized series for v2.

Thanks,
Guangshuo
