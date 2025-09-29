Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E3A1F30A9
	for <kernel-janitors@vger.kernel.org>; Mon, 29 Sep 2025 06:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759125962; cv=none; b=uaCdrP83pEqz3e86WScTpwIIMUd4eTj7SUyw4eIZJb0LcHiRwNEuhB62Nz6LrlO3GDdUXATiwx/4lhETwDor0fekFgBpjUy/yxL9ggMwomnISpfyKk8SkepBMLAH3u98d7VtrnQt05Yxa5OwpBp4GaxXwVRQz4B7jQUpCNIA7rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759125962; c=relaxed/simple;
	bh=4ZVJUKJcStOkfQvNu132ByH2QSL2oYRTRtM5t2938z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vDPfmgwWgKgaVvKp11f2jbA0RS4pIysvP3xco2iLSVBuF8QIhxXQHxVSV5c55iGBevvDuao4tBhBqdXfUPi/YzSTQS6W3E0Ni5vOUDqMD0llKxKquONQ1WcrW1tAhcwNa5MEZI899gqYFZRdm/BLsz1gE98Kfuld1wVYiRAsnlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WQVCTNvJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WQVCTNvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759125960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h1yGIQOsQZ3m8F6SURAT4ync4Dvco6agAIcb00xK3BQ=;
	b=WQVCTNvJaW5m/ND7GSPUf8ShW7fuIPJBB8JS+0XB+xA6NSG/LVOpqcXD577pjZUN/MXq30
	gICiLx1wCtxL5Lav2bwpYbjcmMImOMdtWyVmuhya0cVy1kNIEB59sMwHalbnB4VKPAi6xO
	aLAEiZREz4YuwTJBVaky7IUmXjXfsRQ=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-M8diHeVkOJK-Sp5QsUj5wg-1; Mon, 29 Sep 2025 02:05:58 -0400
X-MC-Unique: M8diHeVkOJK-Sp5QsUj5wg-1
X-Mimecast-MFC-AGG-ID: M8diHeVkOJK-Sp5QsUj5wg_1759125958
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-76c144b0706so45784427b3.2
        for <kernel-janitors@vger.kernel.org>; Sun, 28 Sep 2025 23:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759125958; x=1759730758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1yGIQOsQZ3m8F6SURAT4ync4Dvco6agAIcb00xK3BQ=;
        b=irebk9jZ1K1MNWLx43ihpxzvOogY6jHcQqwf4a3OzIRPXwnZm/b18NvRy1PwD/EsqF
         9+AAKvwDs+WpXmroK435hUlOJqvxiXAjEox29qC+ktImDGQfu4cpbwJKTC22nPNLfxj8
         OxAffY42XerGjJMRJi0+Juqc5za+ekBdI5U7CdXaYOq1A0SBXa7aFXl8V5VXmAlxLmnH
         PQWy3RHo8lgabjUSnCEJCiGJtPYsN8Yycv5kHupJU3ienn74Sv4b5lB00ACEHIWK5ZRX
         e5pY5cp1ACtF3L4ViyLNp/yBJsKyQQd2cI5SQ0oklC0/GYpFJ6LAQUxbFePUOwBrXBQa
         b7PQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1hUwlhvHG2mm8KP5cS7kHbZM7fI9DcHopfxArNwR0F4TOxmPBpU30Bc9X+4Ck21GXMYJ4gy3nxjAOT01AAnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT0eKAymNOT/KXecYI+o18tZGsdKe8XADPbzlQS5S+I261Xmul
	KDjOuzW6z2dR1UiB3S9RxDug3pllKAcffZ9yFssiJDRrQl+6445YRE1aX/ySWnQxM+2u7/h90Mo
	RH3RCJ24ZZtotmwToOAFwZiYGWa2/fTGWYla2uVdFJD5HuuoTTcV4073MbX/EpNGzxPHh/xvOrY
	LXhyvnEvfAlNgZCQI5fdmcCeYm7SQgIC7LSHof4xSYBhVM
X-Gm-Gg: ASbGnctWvrxGmNKfseiizFPLewEYb1mhPsW0orXgwILCjIeM85cE3s4Ek8AJVZb1bhH
	p5SsqOWTvdzmZreG/aaKNPxWlD/lWNDqXH4n8BAfMIUZYnLLMBWVd7PQwdzZh5ohq1sWDqUpFxN
	BDfkCWXUf2tgW0R0cAn3CTsIvllEA0i8la6Yp+7fa3puTf//nZ6c43IkmfJ0un9EgRYXaZ2s1fQ
	x8fABlp
X-Received: by 2002:a05:690e:4289:10b0:636:ca97:d6d2 with SMTP id 956f58d0204a3-636ca97d773mr16173569d50.20.1759125957870;
        Sun, 28 Sep 2025 23:05:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+BjaVuGyoNFx3yUGngOCBRLm43JB3sIAw6ThgC682NtQbB9nf4C73RlWOHPZlMIy2Osnpg0Z6d8vSJeF229Y=
X-Received: by 2002:a05:690e:4289:10b0:636:ca97:d6d2 with SMTP id
 956f58d0204a3-636ca97d773mr16173546d50.20.1759125957498; Sun, 28 Sep 2025
 23:05:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aNfXvrK5EWIL3avR@stanley.mountain>
In-Reply-To: <aNfXvrK5EWIL3avR@stanley.mountain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 29 Sep 2025 08:05:20 +0200
X-Gm-Features: AS18NWBs1i9BHagRuYUX084a7zMJ_6ylNkBNHWiX3YPpcoyysxZQU5lwQENWqTE
Message-ID: <CAJaqyWfBoY0_X=xRnGBecDFUJqSJEitgVKzopumA4fsZVfC11g@mail.gmail.com>
Subject: Re: [PATCH] vhost-vdpa: Set s.num in GET_VRING_GROUP
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 27, 2025 at 2:25=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The group is supposed to be copied to the user, but it wasn't assigned
> until after the copy_to_user().  Move the "s.num =3D group;" earlier.
>
> Fixes: ffc3634b6696 ("vduse: add vq group support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> This goes through the kvm tree I think.
>
>  drivers/vhost/vdpa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 6305382eacbb..25ab4d06e559 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -667,9 +667,9 @@ static long vhost_vdpa_vring_ioctl(struct vhost_vdpa =
*v, unsigned int cmd,
>                 group =3D ops->get_vq_group(vdpa, idx);
>                 if (group >=3D vdpa->ngroups || group > U32_MAX || group =
< 0)
>                         return -EIO;
> -               else if (copy_to_user(argp, &s, sizeof(s)))
> -                       return -EFAULT;
>                 s.num =3D group;
> +               if (copy_to_user(argp, &s, sizeof(s)))
> +                       return -EFAULT;
>                 return 0;
>         }
>         case VHOST_VDPA_GET_VRING_DESC_GROUP:


Thank you very much for the report Dan! that should be fixed in v5.

