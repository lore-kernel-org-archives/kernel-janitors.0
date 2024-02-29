Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48FD4594E
	for <kernel-janitors@vger.kernel.org>; Thu, 29 Feb 2024 07:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709191314; cv=none; b=CKdmNmn+4mRYqJiKE7yD9c1oqOqZoZP76mJPbi9apC1gJpK7xYE3ZKwNI4bV/H24x5Ylhn6+xcNqrJghdAG49MBnxwJRj+woGpHQUvNqD/v+97kJRlcKkGo29y0JiKtgmgRcC1t2Dv5/SAq3eaJ1Gpq1soJqa7YZdXU9zTgMyec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709191314; c=relaxed/simple;
	bh=HqknOjEjlYxT7iVdqKOIUCiHsRYWnF8WRHrWHM7BaNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYu0hId1MsPrequF1lL/RzH1vidGvKrlsv0FAII5FL3Y9M5X4QJa0qu//gJfzk+GvWBY52pPjrFLpqh3ICS33xaAxMyHKzlvBqQNqkOZRMyC5sZ3DB82P6zjQmItc5yHsop5DfAY0+7XiPYLylhP2mvalhdaMHqpbo5tEk7da2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fuAnC3Lp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fuAnC3Lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709191310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Net7WSZ0SLXfX6qP1fBqoZy/fUubtzc+/J9dRqSPBjo=;
	b=fuAnC3LpSFsEfOh0B2+6nUeT3+gZjZkEjbcVPUWgw2RUz8ZHs2RDDEHoe6ohr0ROw1/nYy
	LEpxh5FdUX0Uxdczz79TeCqs/68hH0AToWWpFRcZmlLeSvf2htWKG7rFzq8fS64nx+WB0W
	dnC0UjiT5P6dgqyHBWeSxfH9EHb+oFo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-7KLNzWEcNzaNzCuV7b8VJA-1; Thu, 29 Feb 2024 02:21:47 -0500
X-MC-Unique: 7KLNzWEcNzaNzCuV7b8VJA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a3ec1d8b1e2so37350066b.3
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 23:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709191306; x=1709796106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Net7WSZ0SLXfX6qP1fBqoZy/fUubtzc+/J9dRqSPBjo=;
        b=DogYz7QiKpqjclLEQhQwS2+gZQZGhPswfT4dLedXOnemyv1ziBYCO1IcvZkjt+WKRX
         4ZieUFTc/s41RJFaYZnKKmicUJBzmIl+QqnUIXxUzHsN628zmgAQlmhH1TTlqz7fnI6W
         3in1unODyI9iXSc1CyHvowz8Op1ul44mvyq3IkNopBiMyuQHDZf3KAFqVZOAjGpIrdr9
         /ACHbqgaDDwC/5l9shDpbnow4YMci6UglHBZoUDcIh/snAP9ft00O5Am8hTru2OuUEqH
         8hQWkaYrqaccEPuFK6e+Qfc5fcI3Xh14a5uMZae/oEeW1AEgNzlLeODqAY1eviC/ttby
         1SsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHjdaRtS5PdWdQyuDMBvJ3K0pcKAJDBTREV9l4BQye7ZJQy99Jy1c+fFASU4zUyGqmkBn+Jvo8pR6d33Lpmm0GZ/ABN7xTSD0YoVR7pruE
X-Gm-Message-State: AOJu0YyhwmkR023e5jMWY7rNJLvCbUmt6bFF71Jl28hWO4h6H8mkP5k/
	fZzRU5+XxBSHKF93xEp3DLOiq4oAn96Z0ns5e/i+MKYhgoyVHOdpnhoNWkeuDLIueUQiuxXtGPu
	BMK+eIRUpGCd0v6GLjeeAt4rMDiFp7qcvh9r4G2tZi6V8HNDCapVIUu6Wu7W0Sfo/VEZtc22a31
	5/s6Bzb/VvMXUAm/9GsWZxxHVgHplbcezTzEyKJZJ4
X-Received: by 2002:a17:906:f848:b0:a3f:d71d:d820 with SMTP id ks8-20020a170906f84800b00a3fd71dd820mr688211ejb.26.1709191306655;
        Wed, 28 Feb 2024 23:21:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHR1+8q9qhWcpHCQv9NfHXzSbTJvOggAWbOmIh8P8wUWatZVIF7qiSuP0cDF+Mqh1M4VO49hebtH0JZ7m1N8oM=
X-Received: by 2002:a17:906:f848:b0:a3f:d71d:d820 with SMTP id
 ks8-20020a170906f84800b00a3fd71dd820mr688204ejb.26.1709191306393; Wed, 28 Feb
 2024 23:21:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <98298b2f-7288-4b0b-8974-3d5111b589cb@moroto.mountain> <CAJSP0QWW2QvibpcrZbcLzVp8ngnooiTqP8i2emd+0sdCj_7Yww@mail.gmail.com>
In-Reply-To: <CAJSP0QWW2QvibpcrZbcLzVp8ngnooiTqP8i2emd+0sdCj_7Yww@mail.gmail.com>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 29 Feb 2024 15:21:09 +0800
Message-ID: <CACLfguXksa4TEb5gk2bvoeGaQrR8s5TZMJGzR0r7Y9Wo9N82UQ@mail.gmail.com>
Subject: Re: [PATCH v3] vduse: Fix off by one in vduse_dev_mmap()
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Xie Yongji <xieyongji@bytedance.com>, Maxime Coquelin <maxime.coquelin@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 3:19=E2=80=AFAM Stefan Hajnoczi <stefanha@gmail.com=
> wrote:
>
> On Wed, 28 Feb 2024 at 13:24, Dan Carpenter <dan.carpenter@linaro.org> wr=
ote:
> >
> > The dev->vqs[] array has "dev->vq_num" elements.  It's allocated in
> > vduse_dev_init_vqs().  Thus, this > comparison needs to be >=3D to avoi=
d
> > reading one element beyond the end of the array.
> >
> > Add an array_index_nospec() as well to prevent speculation issues.
> >
> > Fixes: 316ecd1346b0 ("vduse: Add file operation for mmap")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > v2: add array_index_nospec()
> > v3: I accidentally corrupted v2.  Try again.
> >
Thanks for fix this
> >  drivers/vdpa/vdpa_user/vduse_dev.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by:  Cindy Lu <lulu@redhat.com>
> > diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_use=
r/vduse_dev.c
> > index b7a1fb88c506..eb914084c650 100644
> > --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> > +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> > @@ -1532,9 +1532,10 @@ static int vduse_dev_mmap(struct file *file, str=
uct vm_area_struct *vma)
> >         if ((vma->vm_flags & VM_SHARED) =3D=3D 0)
> >                 return -EINVAL;
> >
> > -       if (index > dev->vq_num)
> > +       if (index >=3D dev->vq_num)
> >                 return -EINVAL;
> >
> > +       index =3D array_index_nospec(index, dev->vq_num);
> >         vq =3D dev->vqs[index];
> >         vaddr =3D vq->vdpa_reconnect_vaddr;
> >         if (vaddr =3D=3D 0)
> > --
> > 2.43.0
> >
> >
>

