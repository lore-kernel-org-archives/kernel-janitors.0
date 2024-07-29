Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F153D84D34
	for <kernel-janitors@vger.kernel.org>; Mon, 29 Jul 2024 19:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722280610; cv=none; b=W5wTZLHRAgSttkfoS/8rGWaG74IAZA3RyH2khRZzVf2OqR3qrFTWcByC3xjAkV9u8uxvKUNnoycpmwntEOicJfRuAmVa9cVe7BvGhtrYJuZVb+vCUJyyrHdqk5qCP6kDx4+4eUAp8aKL65KfcYIr6L78EDUCxgsM1Y6H5rpJeqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722280610; c=relaxed/simple;
	bh=LVVYNh/Q/hDL+l5YEn1iSdbdD0THwuE3gCmjKeRGc4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpMx367/L0Z/wgSWAB9eDI18AFVOD7+wSB4EeNB+/ylDYAnfhyrUhxWC4wpsOGdDDBeCadhVY6Ecxfy7A991Ij9GXfobCrwd+tUtclllStnNS0qTioR575aEZtqcDnM5zAl/ObZHKYNGPW0SBlt2AMHILeNHDwrcPfG1gODmz+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FhnctADx; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FhnctADx"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e0874f138aeso1921369276.2
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Jul 2024 12:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1722280608; x=1722885408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aSdBNepOuMwe3ip16SyZwC9x3sQ/b3cOtgS+xLwo54=;
        b=FhnctADxiJ5QptX4bJNAAygQh2CU/lkXisDKAW8nvSU20ncclTVFMev4hcT58GmHMx
         a872aPb0jOHdV622auqIyC0pdawkb0uE9zHzMDXbornD20KtL4+XVMaG2ruT7cfGlXo0
         6pFezVDMSrsN7X1uJ0dAfMW+0fig86I72QnmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722280608; x=1722885408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0aSdBNepOuMwe3ip16SyZwC9x3sQ/b3cOtgS+xLwo54=;
        b=OVioLSf6X91o3vxk69Xq7oqaTZ0fEtKaXn/VkJntQ4TwLD88YrV+S0qbu5whmxkS2c
         ygT5YjJ1emFWIj7YbO5DtdUYF5OqmrPSBS+ZoEXlmSU5wzR2fidHX2rwclQA5FTmTK9E
         UYxDmbKULG7kITihb3MimKofMupu+FXvUOKgvsEHp01N8NJJrgcdDfnyRvsAVdqTd+TE
         B124lIyLhqyxxJs0B8eahp4Ua5DBRWk6F7j8lNrABI2Zd6vTV35Hk9ti2lN6kEo81NVb
         B+6bwAiLVkOiI+jIA8h7njj2MkS+hzqwAY+XdpsOrwX7jNkIrZkPGFV/IVWcXpnsRKqT
         SMpw==
X-Forwarded-Encrypted: i=1; AJvYcCXKOxtdZbQ2WWgJCX05HZNaQOX30GQUW7BEmUCxnDAn9qvntvreRidNv4oLWHkcvM1BYM7rMd+i5JNrbnb2OUZvLQYqDYYL+18UXMsMlwuS
X-Gm-Message-State: AOJu0Ywnz8ASpFQu8rXRXmkDIBRnog0zesCWyrEbWIg+aZMfGSGRQRRC
	GF+02+0VW5NLuD4SMh0q6ZwY/Y5AFIiov4WlLCokdW2zlynHFDZalaFFDzah+saFxPplOrMVIrD
	XhFyOoawppcm5radkx1JuYdPncmqGqYn0RPa9
X-Google-Smtp-Source: AGHT+IGnAwXRu4C7Y+PVR0T60A7xON2fH9xIYdK2KzYMvBB0JclqD2TJEFzTtyWNuV59HkwKot/gKomKKo9k8ArfpBI=
X-Received: by 2002:a05:6902:704:b0:e05:fcef:c842 with SMTP id
 3f1490d57ef6-e0b54600502mr7711564276.44.1722280607875; Mon, 29 Jul 2024
 12:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <83d9bb89-1a16-4ca4-80b4-1965fca498c1@stanley.mountain>
In-Reply-To: <83d9bb89-1a16-4ca4-80b4-1965fca498c1@stanley.mountain>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Mon, 29 Jul 2024 15:16:37 -0400
Message-ID: <CABQX2QOoq3H=eHdM83_k5vgHiaMu9Zsto=H7S95QHxT-s16jEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/plane: Fix IS_ERR() vs NULL bug
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 27, 2024 at 1:32=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The drm_property_create_signed_range() function returns NULL on error,
> it doesn't return error pointers.  Change the IS_ERR() tests to check
> for NULL.
>
> Fixes: 8f7179a1027d ("drm/atomic: Add support for mouse hotspots")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/drm_plane.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index a28b22fdd7a4..4fcb5d486de6 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -328,14 +328,14 @@ static int drm_plane_create_hotspot_properties(stru=
ct drm_plane *plane)
>
>         prop_x =3D drm_property_create_signed_range(plane->dev, 0, "HOTSP=
OT_X",
>                                                   INT_MIN, INT_MAX);
> -       if (IS_ERR(prop_x))
> -               return PTR_ERR(prop_x);
> +       if (!prop_x)
> +               return -ENOMEM;
>
>         prop_y =3D drm_property_create_signed_range(plane->dev, 0, "HOTSP=
OT_Y",
>                                                   INT_MIN, INT_MAX);
> -       if (IS_ERR(prop_y)) {
> +       if (!prop_y) {
>                 drm_property_destroy(plane->dev, prop_x);
> -               return PTR_ERR(prop_y);
> +               return -ENOMEM;
>         }
>
>         drm_object_attach_property(&plane->base, prop_x, 0);

Thanks, that looks good to me.

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z
