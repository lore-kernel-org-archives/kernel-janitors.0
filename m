Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866BF18FDDE
	for <kernel-janitors@vger.kernel.org>; Tue, 22 Sep 2026 08:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064813; cv=pass; b=LqIkPfZbPSFlz7/BEmxYQsb0Aa00YvW+P0iZ8wAW17GZz5j/m748uUhCoV6mNoFysXR5cb04KrbbygqJay+PVW2PBluut1vL+ZrcSDJyrTiwCn7z/DzYoQHXGmmScDhP47sxyUDJPrD68k7BM3UHaWNwaw7DGFDF7oG1zJ0co1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064813; c=relaxed/simple;
	bh=z4yJ4d/PQ9eEbkDFB5YDhTveMk44MET3fVjIGIItEhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CdG6UtsbtUBgGTEjfKe6/UqsDb3Qb8u4xJIzXRLlLjUkUYNsG1v9M097cvP63rx68/yp4NwtevAY1KC/saf3qb2LS47GwN7OpVmQArKodX3CSnqlCFEx/6bgq4d2AM6FL8zLQjpBOs89Ff2GEFPAavgxqAnHJQnt3WApCrv/5So=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CumDQ3+V; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CumDQ3+V"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e56a1b327so2935989d50.0
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Sep 2026 01:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790064810; cv=none;
        d=google.com; s=arc-20260327;
        b=jLsCRg7YmLcY0H/6idyd7kmwu7XnkZ5KeLP4ijvbVSkF/X8Rb4MIqsokeLFfLai9Wq
         7rPZ7Q0JjAKyp7HMVo2Rmu6+WA+3wT4XEaHQlMea5+7JcgTHIuk/p4tWQ9XukkBwp6P6
         a7E5npZhMJkM3vR8dkKar+uMxKgyzwriS5qXVZRVZOYWDpJHMGa6h9HUASAVHkRt9QsM
         zxtASZJ4ZjjqOJzZ5SAO+djT3+hT0+0I27J3bSdwqRKeGEgXfgBY9kv24xtfb5qsp4F9
         RiQldj9pxsRAO15nrsSIuKXUkR2D/51tV6wBdB7fMjLf26kfxJYtfeyKrLPnEqd/5YME
         0aCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vi+eaHvPeGF3Sdq7zvAZY/QjCGqMSzvenzOG4HC773o=;
        fh=ZKhk8f7CoJazyJn693cDZJDDLGIG5A6HX9T5bQhlGpk=;
        b=VfvrhNWm1B1ovg0AcruPISMXTZINdGpnsDyOfL4RUh0VriMGQEYCtGgXRF2ActSxLi
         Qs+i/C9gg3OISCkZAaJN0XChA5jv2NneDg2X2EWUa1+MFTH26ZWEFhbngAh2rPjDiSS6
         +1JJDI9CcKr23h9UXMNBLF2zQQWaaTjNeHKnIDCT+XtmZMu2O7nxthl8f5kSgZGptpG+
         Y1VJFXrdnkeiV8FZ7N9zMhnhWanfJ4AWRb3AIPUK6gD9krtdpjF6RUQvqNViSVtr3cGB
         tWKCsbFKal4LeqetpEbDFXqZoXp2qLm2qGiqJnI/4ozETnXdnPyanx8liOEDs7X4WCVD
         W5DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064810; x=1790669610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vi+eaHvPeGF3Sdq7zvAZY/QjCGqMSzvenzOG4HC773o=;
        b=CumDQ3+VaWCfRAs+HRcvq/AzKHnhOr/Rj0MD+YQk4F3cQ2sJB06TZPqyScRcjdLmr9
         JVzPilfNhHcGu6dZNJkcW6VNxmV+O7fzVaYssQJX9X0BTtmzbJD5aZiS7/wbGMJ83D+L
         6rtop9AoOuw8RoLC+pDt0JQFtekfmuRGrEMO6u1WFDm7Tdt2AJ0m3nfKsD1m9izTA1eB
         lfRlB0wWGy0J0f5bzLREieD7wOVb1ceQy6ckjeUAez0B1Nbf2gfbGbPeE9NK0FpGbIpo
         kmKMAR4EERHXZchyCoNI6DbWYm2QijgPOVF6H4bEIjibkOF8gUd4js+7LWTPko3UIQJe
         02Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064810; x=1790669610;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vi+eaHvPeGF3Sdq7zvAZY/QjCGqMSzvenzOG4HC773o=;
        b=ZM2nW1/FW6ouC2ClQZaRzSt6TaegRJEtE4DTy46dQ6WSlkrOvBiU9QDzJ2JpUIGGHg
         JtOQW5aRdKWAynDtiS8omYrdmAAceC98/g9O3VSzU6wlgbsDTKrNwkJyynuHQmXRYfC5
         ExHA8FqFHgAMUjI+MQnURMUyDAb15lSktqEJB4rLz9tOfb4wYj2wLtT8pJS3XIwwuSMj
         C6fEqW5IsN7QUInxqymCRUCDW0Xb6DHbDnyzngTVkyCNgrh1TAOYEjBm6q3l0DD//gnW
         J1TKoi9xGKEI5iCOf9qfV/Ng8FvLRRSLWYSX7k9k5mqZGmvODOG/CddNKybD7sPW1MZZ
         5izA==
X-Forwarded-Encrypted: i=1; AKwUvBwoblOmWZuYRFEfFU/RbAEuCwolIM2/ZzeXYhv5rWJWWCTThf341xmDiKBivzoj0euNXB4NlS17iYcbNbL6J5k=@vger.kernel.org
X-Gm-Message-State: AFuF++kOsmwhUfrAd/wEYHg+kl1R4CJdCkoPHUZ/4JHJ4m/M+c6IXnCv
	BIlLKeiXlIdSkqODfT2M/IOO2em28hY3moofiA1nhKK4sf+KFnb3TgkalJR6cj6SKfx+gS4jI6b
	dqNtcMjmIGTPwXxS4zZjR7s/ViFIO9b4=
X-Gm-Gg: AYBFou0sIgc16MPa/q3rkr0UPDATKTJ4PO/pp2dLAM4ud4mZGTNDLK0A8/fZfAgL0Nm
	DXA8cS2PqnNDkOlBh52pl8ty+bewab+3HQ7WJ2bv6IOrh+dpWxXtwtuivJgAeEstNuxpuLSNQWQ
	0AxUP+EBJWpVafaUuoWPeOw2/hD60QNuSRAvltZgg0BkEQEx6EMc5RNaG4GL2OUuLbQRSftddgX
	abczWajR2YwAzD5arg1TwNECYML2eSNATrUTbApTzei6QDncgOa6qRSS7cXs0VsO0spIHuo1nSU
	hUqxDAAFpq102AJjxbRfESSnEh7IPlnp0TnVil0FcG8TgaHKijHQLR0WIg==
X-Received: by 2002:a05:690e:80d:10b0:671:1a13:99fa with SMTP id
 956f58d0204a3-6717fcde0a7mr2703957d50.27.1790064810342; Tue, 22 Sep 2026
 01:13:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921075312.120983-1-lgs201920130244@gmail.com> <cdb67eed-9e75-4310-ae4f-21ca67f20bd2@web.de>
In-Reply-To: <cdb67eed-9e75-4310-ae4f-21ca67f20bd2@web.de>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 16:13:17 +0800
X-Gm-Features: AcwNN1WgyEuKR8AButHilBQBtiaREfERPd_f4BSEyPirEeQ1c0aH3J078-wD1lE
Message-ID: <CANUHTR9+rLuPrd1aifKws++POOKSm+2jxBaJaC1iF5z5x0e13Q@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: simatic-ipc: fix platform device leak on
 registration failure
To: Markus Elfring <Markus.Elfring@web.de>
Cc: platform-driver-x86@vger.kernel.org, 
	Bao Cheng Su <baocheng.su@siemens.com>, 
	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>, Hans de Goede <hansg@kernel.org>, 
	Henning Schild <henning.schild@siemens.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Tobias Schaffner <tobias.schaffner@siemens.com>, stable@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

Thanks for the suggestion.

On Mon, 21 Sept 2026 at 18:10, Markus Elfring <Markus.Elfring@web.de> wrote=
:
>
> =E2=80=A6
> > +++ b/drivers/platform/x86/siemens/simatic-ipc.c
> =E2=80=A6
> > @@ -118,8 +119,11 @@ static int register_platform_devices(u32 station_i=
d)
> >                       platform_device_register_data(NULL, pdevname,
> >                               PLATFORM_DEVID_NONE, &platform_data,
> >                               sizeof(struct simatic_ipc_platform));
> > -             if (IS_ERR(ipc_batt_platform_device))
> > -                     return PTR_ERR(ipc_batt_platform_device);
> > +             if (IS_ERR(ipc_batt_platform_device)) {
> > +                     ret =3D PTR_ERR(ipc_batt_platform_device);
> > +                     ipc_batt_platform_device =3D NULL;
> > +                     goto err_unregister;
> > +             }
> =E2=80=A6
>
> How do you think about to avoid duplicate checks and variable resets
> in such a function implementation?
>
> Regards,
> Markus

Would it make sense to share the cleanup path and rely on
platform_device_unregister() handling NULL/ERR_PTR, like this?

+static void unregister_platform_devices(void)
+{
+        platform_device_unregister(ipc_wdt_platform_device);
+        platform_device_unregister(ipc_led_platform_device);
+        platform_device_unregister(ipc_batt_platform_device);
+}
+
 static int register_platform_devices(u32 station_id)
 {
        u8 ledmode =3D SIMATIC_IPC_DEVICE_NONE;
        u8 wdtmode =3D SIMATIC_IPC_DEVICE_NONE;
        u8 battmode =3D SIMATIC_IPC_DEVICE_NONE;
        char *pdevname;
+       int ret;
        int i;

        ...

-       if (IS_ERR(ipc_batt_platform_device))
-               return PTR_ERR(ipc_batt_platform_device);
+       if (IS_ERR(ipc_batt_platform_device)) {
+               ret =3D PTR_ERR(ipc_batt_platform_device);
+               goto err_unregister;
+       }

        ...

-       if (IS_ERR(ipc_led_platform_device))
-               return PTR_ERR(ipc_led_platform_device);
+       if (IS_ERR(ipc_led_platform_device)) {
+               ret =3D PTR_ERR(ipc_led_platform_device);
+               goto err_unregister;
+       }

        ...

-       if (IS_ERR(ipc_wdt_platform_device))
-               return PTR_ERR(ipc_wdt_platform_device);
+       if (IS_ERR(ipc_wdt_platform_device)) {
+               ret =3D PTR_ERR(ipc_wdt_platform_device);
+               goto err_unregister;
+       }

        ...

        return 0;
+
+err_unregister:
+       unregister_platform_devices();
+       return ret;
 }

 ...

 static void __exit simatic_ipc_exit_module(void)
 {
-       platform_device_unregister(ipc_led_platform_device);
-       ipc_led_platform_device =3D NULL;
-
-       platform_device_unregister(ipc_wdt_platform_device);
-       ipc_wdt_platform_device =3D NULL;
-       platform_device_unregister(ipc_batt_platform_device);
-       ipc_batt_platform_device =3D NULL;
+       unregister_platform_devices();
 }

Would this be closer to what you had in mind?

If so, I'll follow Krzysztof's suggestion and organize the related
patches into a proper patch series before sending v2.

Thanks,
Guangshuo
