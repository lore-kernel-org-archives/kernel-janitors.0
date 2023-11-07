Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2952CBE5F
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Nov 2023 07:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7O075KE"
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC9D810F;
	Mon,  6 Nov 2023 23:05:22 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1cc0d0a0355so40124205ad.3;
        Mon, 06 Nov 2023 23:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699340722; x=1699945522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVdEO2KP+08TtoY+y0LCZZB2YuLs/yJFzWmvsh4Fx6A=;
        b=S7O075KErKYFXNVcQdjNgRsTCn/tyxr3Lgo/hopz0f917e4tNMCIjYLylMkAqPP0lj
         GA+IsVcgpWEne2SVO3tL7Wv5uUPbZT9j9FJ7yGS1/DcQhoIqeWGPfu77rtOcyL9PO5LP
         pEFC0oWfBP8biUxKtHuB3iX7/+RsbnrhJcJINatmywaSR5AVGdpUAJejq+O/pOG5bunr
         Yg/+4sWUTfkmIvOgJlCnsoXZviEs1CbCkw7t1a+c11weZBJnXmyyEdWvqNnK9+8QfgPE
         Ror5FhJGgIcALIb3MhC6wOWo70DuSzGADI+FXaxil6u6K+F31IYB/zFCoxVqoedE3qfz
         ad1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699340722; x=1699945522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVdEO2KP+08TtoY+y0LCZZB2YuLs/yJFzWmvsh4Fx6A=;
        b=uhV2pmbMQGqpNIDaJ8KkluqGo24fNDF7xwqsllro3oyzqwATA3D0R78ZdArghu8aaO
         2+R/Mi3mM0PySEY/QR3s+/Pt3E065+D0yd1Aq08FfsFR+XdLH0361jWHyI4rLdgAljME
         cZz/678i16+4pgO2tF1pY4VCHl76nMPW+1QNUUc+2h9MOBpJAfzIV6UYH6SKi3+YOs2c
         /X9xe1PoPFGFZIxuzOegwx2ZYV01UAhJoMGU7lcMKmKgpF5sOwGsi/aZR6KW9DS+QIo6
         vNxA49IbgW4tIuDb6Flwip/1aWwDM1jen+o8sE3EuICINrXosVwgiT7d3kO3PqeIQYEk
         lKkQ==
X-Gm-Message-State: AOJu0YylMGFxlk/XuZBKAaovfGQ4AluO3WXEyG8o8dcTCi2oA6bSoEJq
	V90AWCJfB88zCnwPov8fxk7bw+bM+wOiDr3GNsU=
X-Google-Smtp-Source: AGHT+IEl6p32sv6Y8/3x3iGEyshuoybc9pkOJVTbCZupieKptfzKLGY8Ok+Jr8ca/1qaRuzxWfVMp41W5osIXTmad8w=
X-Received: by 2002:a17:903:1103:b0:1cc:e76d:e7b2 with SMTP id
 n3-20020a170903110300b001cce76de7b2mr3490283plh.22.1699340721976; Mon, 06 Nov
 2023 23:05:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <435bd17b8a5ddb2fc3e42e2796117ee02263d02a.1698831664.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <435bd17b8a5ddb2fc3e42e2796117ee02263d02a.1698831664.git.christophe.jaillet@wanadoo.fr>
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Date: Tue, 7 Nov 2023 08:04:45 +0100
Message-ID: <CAP+cEOOEmbgon-VjUQtVBVXDcsgmJ1EZr7p=kqt04eUE3D9TeA@mail.gmail.com>
Subject: Re: [PATCH] ipack: Remove usage of the deprecated ida_simple_xx() API
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jens Taprogge <jens.taprogge@taprogge.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, industrypack-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Christophe,
Thank you for your patch.

Acked-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Hey Greg, could you please add this patch to your misc tree?

Thanks,
Vaibhav

On Wed, Nov 1, 2023 at 10:41=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
>
> This is less verbose.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/ipack/ipack.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/ipack/ipack.c b/drivers/ipack/ipack.c
> index cc1ecfd49928..b1471ba016a5 100644
> --- a/drivers/ipack/ipack.c
> +++ b/drivers/ipack/ipack.c
> @@ -207,7 +207,7 @@ struct ipack_bus_device *ipack_bus_register(struct de=
vice *parent, int slots,
>         if (!bus)
>                 return NULL;
>
> -       bus_nr =3D ida_simple_get(&ipack_ida, 0, 0, GFP_KERNEL);
> +       bus_nr =3D ida_alloc(&ipack_ida, GFP_KERNEL);
>         if (bus_nr < 0) {
>                 kfree(bus);
>                 return NULL;
> @@ -237,7 +237,7 @@ int ipack_bus_unregister(struct ipack_bus_device *bus=
)
>  {
>         bus_for_each_dev(&ipack_bus_type, NULL, bus,
>                 ipack_unregister_bus_member);
> -       ida_simple_remove(&ipack_ida, bus->bus_nr);
> +       ida_free(&ipack_ida, bus->bus_nr);
>         kfree(bus);
>         return 0;
>  }
> --
> 2.34.1
>
