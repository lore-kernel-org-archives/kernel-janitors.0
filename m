Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E7621315C
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Nov 2024 14:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730991154; cv=none; b=tmHAvZrQzt6UcgTsubjeuCZBPliHxf64PY7eCmvTNtHg2s6Cog5f3RrXOreCYUJ3ZFmh+YGtHDdheEaAMOFIRHEtBEa4rt6OSEZwYnp/jqizzDxsNZjGDJcfMmS+JI+l9rRGuGPSRGytk03bRq0q7JgezW3ox1S6ueHMPI60+cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730991154; c=relaxed/simple;
	bh=XVF/x0LDlBb9yXRs1bVbTtLmrXmFrENkF+22J4yL8ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TosmwAjEUDR57KvGE/7BtBjOJ9jCJMhqzfaPW+3cHGhT6lfXfzX5upeYCGjwP8J6ZIZnFbtNwIhnoH+THkQrYkK80M+X1KblGLELzTHUiIYvp4IMdTa+frFuxqOSbeDnVJcX7lfwv8bxO2+9dmOCIMWNQ5SvRb2ybXWENzcArbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=crhZTEyD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="crhZTEyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730991150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Ff04YcLV8SPdoJxeVSiu4v58xp2P44LYVgJtEbYZ2A=;
	b=crhZTEyDa69Fh/WYoVhBGAteI5MYHphmFLkJ9/w8Np02X8Z3H4gn+9qP7CbfxVS6uuzGWt
	T0AVz/QZSaGwQtyGRSKuBW2zyFf/F6+GNn6oBK1nSt5sumemd3e8CETzTokX43wjb2Uq04
	kOo1RCFhskEe/5oqYsIYS9JJcBy6yhs=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-gg6dSXLsNZemIZtLKD-jog-1; Thu, 07 Nov 2024 09:52:29 -0500
X-MC-Unique: gg6dSXLsNZemIZtLKD-jog-1
X-Mimecast-MFC-AGG-ID: gg6dSXLsNZemIZtLKD-jog
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-6e3c638cc27so19389627b3.0
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Nov 2024 06:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730991149; x=1731595949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ff04YcLV8SPdoJxeVSiu4v58xp2P44LYVgJtEbYZ2A=;
        b=ZAOQUaHCDYlFxsFFJnLB5Rs16iGR9js9lXTjBGsH4hoIi+DV2wql+Zn/jSYzEhSEJg
         y+zXlPCX1TiroSExU/se+ACUqusnZiRtZRj6TLSNYd02yJdjMMX/wYM1DyyvzPTqUqcO
         3npN7xSG6P3RhTODoB3Hh31vO8+d8yXN6eekuWmrps3kNu13F3gLvquq8+ulODYStCtk
         Tx6uq4YMkOpBqDAQsYrxEfhdopwE/j7K7R/6nSlMPH1m4R9OKhzNV0T57vy7+VUjD5m6
         oQkXpo8aUma8AE8aB3lVJWUeAkHxIhFCzFUbzzpk+dEsoIyaCm3GsU3t5TRimWRSClQV
         cq1w==
X-Forwarded-Encrypted: i=1; AJvYcCXapqXV7dIDKo38jpsTYgR0+DEu+wUmiKnaqkCmG8+VJQPeoUSAcHT18Y7KIaNb8dVyGdPfKpWplciB2Ml3+Ys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhaj1cl0Bczmub6sSgIIHLxzIQJUoH7ctbUq+jGaQXCW4RzYO7
	L9SbdUvf477MrLtX3EBj17OPG2rtcSaJmfViVOrQTpRhYW9X+uNLGEktPSSdDSIT2SI1dQd40gJ
	TmATKK1YlN6Anf4Zs1kpyvXJggKF0W1DihA1f5ELwXjOGY99R/bcxO531Y3IB9KbPLsOgy0JHHC
	qWezvz2ZA41t2594fdCe9FkKRT5i7DAKdKIHbr+6br
X-Received: by 2002:a05:690c:460e:b0:6e2:c13e:20e9 with SMTP id 00721157ae682-6e9d8b056ddmr313423027b3.38.1730991148939;
        Thu, 07 Nov 2024 06:52:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYqvt7/lT13XxcBmf4h4l8ghmjNiRZf2d8+XdMbFjM2u7ezJTrQtXi3YGHHMc7lpnFy6cI9XHQYWgxd3fJnwI=
X-Received: by 2002:a05:690c:460e:b0:6e2:c13e:20e9 with SMTP id
 00721157ae682-6e9d8b056ddmr313422887b3.38.1730991148691; Thu, 07 Nov 2024
 06:52:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107132114.22188-1-colin.i.king@gmail.com>
In-Reply-To: <20241107132114.22188-1-colin.i.king@gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 7 Nov 2024 15:51:52 +0100
Message-ID: <CAJaqyWcp2kbm9uwzqPXi-M3AUT3P54az8SLHv0Ex7HpM7zHHhA@mail.gmail.com>
Subject: Re: [PATCH][next] virtio_vdpa: remove redundant check on desc
To: Colin Ian King <colin.i.king@gmail.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtualization@lists.linux.dev, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 2:21=E2=80=AFPM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> The boolean variable has_affinity is true when desc is non-null and
> ops->set_vq_affinity is non-null. Hence the call to create_affinity_masks
> does not need to check for desc being non-null is redundant when
> has_affinity is true, so it can be removed as well as the now unused
> default_affd.
>

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!

> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/virtio/virtio_vdpa.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
> index 7364bd53e38d..1f60c9d5cb18 100644
> --- a/drivers/virtio/virtio_vdpa.c
> +++ b/drivers/virtio/virtio_vdpa.c
> @@ -364,14 +364,13 @@ static int virtio_vdpa_find_vqs(struct virtio_devic=
e *vdev, unsigned int nvqs,
>         struct virtio_vdpa_device *vd_dev =3D to_virtio_vdpa_device(vdev)=
;
>         struct vdpa_device *vdpa =3D vd_get_vdpa(vdev);
>         const struct vdpa_config_ops *ops =3D vdpa->config;
> -       struct irq_affinity default_affd =3D { 0 };
>         struct cpumask *masks;
>         struct vdpa_callback cb;
>         bool has_affinity =3D desc && ops->set_vq_affinity;
>         int i, err, queue_idx =3D 0;
>
>         if (has_affinity) {
> -               masks =3D create_affinity_masks(nvqs, desc ? desc : &defa=
ult_affd);
> +               masks =3D create_affinity_masks(nvqs, desc);
>                 if (!masks)
>                         return -ENOMEM;
>         }
> --
> 2.39.5
>

