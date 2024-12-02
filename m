Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0D22040A7
	for <kernel-janitors@vger.kernel.org>; Mon,  2 Dec 2024 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151916; cv=none; b=Kqnv1MbLNpZAJorB0g18IaqISwYLmy4A6eRGK0wtkyGQhF13KLqGmfSod3squfanY41ErrAGLVh5++6ss+fhmS1XZowfdUYBGZ6INfE5bj2BG1UOQV6evva9PlU+SBeOAAFITQCuhi3RnScq497tYapsxBl30tqYecda5eMGpTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151916; c=relaxed/simple;
	bh=kNGiCZdzIlXUf/Hf8biWZP3yf+DnBInMTrMFp3DPZ0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcsUuC1xVgcMpkuCm2gY5BYQKcdBd6eO0uSd/38UrjJDIEeyTTHGwRU9mDR+ou5y1wad62u3x+DALE4s43WWoWOT4BWNNugOTvkeJbEhLzRduIM0sQKN6nzUDW4nKsGaaW7uRKbV28Yq7ae1oNJosYeiqvz25s6fSF5YKtHkmu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3J9x6Vea; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3J9x6Vea"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b66d55522dso331574085a.1
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Dec 2024 07:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733151912; x=1733756712; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bfBZkGGwd+WXNqsHeftulIPKfKwX0tDqU4K/BD6pObg=;
        b=3J9x6VeanEqZqOkRoR5c0ePE5rO03WvfeReZmDAQkzwoSk5YeqG5kcsqTbXuQurDgf
         bo70t4MW/JZA/rDFCnY427wsxhAbSGXUNuWPfLTsT2FkOBHqfRsWm7UulCK9pY18Uz15
         jBFV2rHgrukvGrZZYw6eN8wdrfgy2pVPRJzlmFO3ddOcvw/aQGuTFGwU2xOgHIMV4myQ
         JTshWDZcydkE5P1sE97Fd9qCOkC5vFcQW0Dxx44ze61pInVa9HkFvBV6/vpNbnuPpo5H
         9e66cVPq0bUkJVxc2ZNLZc29lswYYQRroUxWrroeaydpVJyfDzJ/sq1Um5zSD5EAi6Os
         xQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733151912; x=1733756712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfBZkGGwd+WXNqsHeftulIPKfKwX0tDqU4K/BD6pObg=;
        b=VM7KwemFA4YHsU20/1Roxx2UNQqElVoCTjzcyM1LzWQp+Tx4he6UQevjCcunaE+Eb8
         XAYZ64s2T7voJyXhFVffGyDdpHx50UAPL1rTIqQuLLPJ9zm03jFzu5y2uKErFkORdv3P
         rZWbo4mLiRTlpVtYlxdkV7HwgPAGfsjWaOgaO7y5tzVnE2uYe/BzHoR9qaNG6cHkz2lm
         HlcnAHn9kC83Ely9qZVsgF/FUC+DZbfW4ybmacAdvdIJsp8LbkNYm5JlQ9rMzlnjvm2h
         lI5mz/0YgRLMmL/yvUpa9k1bS8VVcevNlSMvpgApAt1GR48rTj9oLf7a7V4yRuNczyj5
         7N1g==
X-Forwarded-Encrypted: i=1; AJvYcCUOwlvtyJOprD7g/vtGKjJoLnOdc9pFtf3Kvnsj9Pq1UB7C1/jkR1LhRqcnhf87sm2LbU2Vq0x8tLNlfGWzCeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGcJsARGA4XZKhE+TwJ3eH1Z2WAYsM50mpY0Opr/4TyBljLYqo
	aUKLeIpLYjdk2TLLF+DkL+cgdGOKSPV1uvDCwHQ2z0rk2PngV9Rg9XxSDZE6VBEajO2fNCrwbMA
	ysPHc0Fi/MFyK39leZBVBZcGm0OqK+6z2/EKx
X-Gm-Gg: ASbGncsHWzmjz/hLpFBWFHa+LqKNy2fO0PgEYgoSYrElbNqw9dISdnLnOaKB7OLSjRl
	vHq48VrYH79WzjkBn/hVgAdmvmCqDOQ==
X-Google-Smtp-Source: AGHT+IG9Nz7EUYJBmLwTEZx7xuhK780YVC2j26Mdb+DOgr27uTLe/GvC8A8DFrnSF1rOzPtzTKtw+7qHiQR+ULbiPac=
X-Received: by 2002:a0c:eec9:0:b0:6d8:9124:8795 with SMTP id
 6a1803df08f44-6d891248a01mr148347966d6.1.1733151912026; Mon, 02 Dec 2024
 07:05:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <60e3aa09-039d-46d2-934c-6f123026c2eb@stanley.mountain>
In-Reply-To: <60e3aa09-039d-46d2-934c-6f123026c2eb@stanley.mountain>
From: =?UTF-8?Q?Beno=C3=AEt_Sevens?= <bsevens@google.com>
Date: Mon, 2 Dec 2024 16:05:01 +0100
Message-ID: <CAGCho0Xe-jGcanAxehP+ENmrG0Otq5DzQO-yKHx7Ot_UzSRXWQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Fix a DMA to stack memory bug
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, wangdicheng <wangdicheng@kylinos.cn>, 
	Manuel Barrio Linares <mbarriolinares@gmail.com>, Lianqin Hu <hulianqin@vivo.com>, 
	Shen Lichuan <shenlichuan@vivo.com>, Cyan Nyan <cyan.vtb@gmail.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Mon, 2 Dec 2024 at 13:57, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The usb_get_descriptor() function does DMA so we're not allowed
> to use a stack buffer for that.  Doing DMA to the stack is not portable
> all architectures.  Move the "new_device_descriptor" from being stored
> on the stack and allocate it with kmalloc() instead.
>

Thanks for fixing this. It looks good to me.

Note that the commit that is being fixed is already queued for
backporting, so I don't know how this usually goes then.

> Fixes: b909df18ce2a ("ALSA: usb-audio: Fix potential out-of-bound accesses for Extigy and Mbox devices")
> Cc: stable@kernel.org
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  sound/usb/quirks.c | 42 +++++++++++++++++++++++++++---------------
>  1 file changed, 27 insertions(+), 15 deletions(-)
>
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 8bc959b60be3..7c9d352864da 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -555,7 +555,7 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
>  static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interface *intf)
>  {
>         struct usb_host_config *config = dev->actconfig;
> -       struct usb_device_descriptor new_device_descriptor;
> +       struct usb_device_descriptor *new_device_descriptor __free(kfree) = NULL;
>         int err;
>
>         if (le16_to_cpu(get_cfg_desc(config)->wTotalLength) == EXTIGY_FIRMWARE_SIZE_OLD ||
> @@ -566,15 +566,19 @@ static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interfac
>                                       0x10, 0x43, 0x0001, 0x000a, NULL, 0);
>                 if (err < 0)
>                         dev_dbg(&dev->dev, "error sending boot message: %d\n", err);
> +
> +               new_device_descriptor = kmalloc(sizeof(*new_device_descriptor), GFP_KERNEL);
> +               if (!new_device_descriptor)
> +                       return -ENOMEM;
>                 err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
> -                               &new_device_descriptor, sizeof(new_device_descriptor));
> +                               new_device_descriptor, sizeof(*new_device_descriptor));
>                 if (err < 0)
>                         dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
> -               if (new_device_descriptor.bNumConfigurations > dev->descriptor.bNumConfigurations)
> +               if (new_device_descriptor->bNumConfigurations > dev->descriptor.bNumConfigurations)
>                         dev_dbg(&dev->dev, "error too large bNumConfigurations: %d\n",
> -                               new_device_descriptor.bNumConfigurations);
> +                               new_device_descriptor->bNumConfigurations);
>                 else
> -                       memcpy(&dev->descriptor, &new_device_descriptor, sizeof(dev->descriptor));
> +                       memcpy(&dev->descriptor, new_device_descriptor, sizeof(dev->descriptor));
>                 err = usb_reset_configuration(dev);
>                 if (err < 0)
>                         dev_dbg(&dev->dev, "error usb_reset_configuration: %d\n", err);
> @@ -906,7 +910,7 @@ static void mbox2_setup_48_24_magic(struct usb_device *dev)
>  static int snd_usb_mbox2_boot_quirk(struct usb_device *dev)
>  {
>         struct usb_host_config *config = dev->actconfig;
> -       struct usb_device_descriptor new_device_descriptor;
> +       struct usb_device_descriptor *new_device_descriptor __free(kfree) = NULL;
>         int err;
>         u8 bootresponse[0x12];
>         int fwsize;
> @@ -941,15 +945,19 @@ static int snd_usb_mbox2_boot_quirk(struct usb_device *dev)
>
>         dev_dbg(&dev->dev, "device initialised!\n");
>
> +       new_device_descriptor = kmalloc(sizeof(*new_device_descriptor), GFP_KERNEL);
> +       if (!new_device_descriptor)
> +               return -ENOMEM;
> +
>         err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
> -               &new_device_descriptor, sizeof(new_device_descriptor));
> +               new_device_descriptor, sizeof(*new_device_descriptor));
>         if (err < 0)
>                 dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
> -       if (new_device_descriptor.bNumConfigurations > dev->descriptor.bNumConfigurations)
> +       if (new_device_descriptor->bNumConfigurations > dev->descriptor.bNumConfigurations)
>                 dev_dbg(&dev->dev, "error too large bNumConfigurations: %d\n",
> -                       new_device_descriptor.bNumConfigurations);
> +                       new_device_descriptor->bNumConfigurations);
>         else
> -               memcpy(&dev->descriptor, &new_device_descriptor, sizeof(dev->descriptor));
> +               memcpy(&dev->descriptor, new_device_descriptor, sizeof(dev->descriptor));
>
>         err = usb_reset_configuration(dev);
>         if (err < 0)
> @@ -1259,7 +1267,7 @@ static void mbox3_setup_defaults(struct usb_device *dev)
>  static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
>  {
>         struct usb_host_config *config = dev->actconfig;
> -       struct usb_device_descriptor new_device_descriptor;
> +       struct usb_device_descriptor *new_device_descriptor __free(kfree) = NULL;
>         int err;
>         int descriptor_size;
>
> @@ -1272,15 +1280,19 @@ static int snd_usb_mbox3_boot_quirk(struct usb_device *dev)
>
>         dev_dbg(&dev->dev, "MBOX3: device initialised!\n");
>
> +       new_device_descriptor = kmalloc(sizeof(*new_device_descriptor), GFP_KERNEL);
> +       if (!new_device_descriptor)
> +               return -ENOMEM;
> +
>         err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
> -               &new_device_descriptor, sizeof(new_device_descriptor));
> +               new_device_descriptor, sizeof(*new_device_descriptor));
>         if (err < 0)
>                 dev_dbg(&dev->dev, "MBOX3: error usb_get_descriptor: %d\n", err);
> -       if (new_device_descriptor.bNumConfigurations > dev->descriptor.bNumConfigurations)
> +       if (new_device_descriptor->bNumConfigurations > dev->descriptor.bNumConfigurations)
>                 dev_dbg(&dev->dev, "MBOX3: error too large bNumConfigurations: %d\n",
> -                       new_device_descriptor.bNumConfigurations);
> +                       new_device_descriptor->bNumConfigurations);
>         else
> -               memcpy(&dev->descriptor, &new_device_descriptor, sizeof(dev->descriptor));
> +               memcpy(&dev->descriptor, new_device_descriptor, sizeof(dev->descriptor));
>
>         err = usb_reset_configuration(dev);
>         if (err < 0)
> --
> 2.45.2
>
