Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93188F44
	for <kernel-janitors@vger.kernel.org>; Wed, 20 Dec 2023 03:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qbe9WYQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703044379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vIn5APMs5q/H2mkbVIU64Mx79XhFiyV1fy9ppFrUsQ0=;
	b=Qbe9WYQVvKZsvb9ts2k2tf3a5aNhVgfH4JJSnmb3t+ljzR7Y7wE/GG8e0qydiuUTrO2NWz
	pIW2Z7X8GzJeNyZ87xQflhObIAlPuEhmUBjXWZhqPmb3vrPyMmPEjF/7lh1Fn8buqPutlm
	Io8MzpIpvAw3B8HjruIEYmdChb2pRko=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-lgTH8LwKPgqimAjDWS9jTw-1; Tue, 19 Dec 2023 22:52:57 -0500
X-MC-Unique: lgTH8LwKPgqimAjDWS9jTw-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6d0908565f8so6335741b3a.1
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Dec 2023 19:52:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703044377; x=1703649177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIn5APMs5q/H2mkbVIU64Mx79XhFiyV1fy9ppFrUsQ0=;
        b=TEODwMroI7CEBCrGFHSIh2MNZqMn4TrVQbeHA6MzcYqdg492nFz6rynQzY8MJ6CDeo
         a5lXTU2WEcoPU3PMqi2QufI5+7bH5CMu6mRGCZ5aEJ2ippLxC7HAbJIIs+bch5S0+ewm
         JH0YplomFoklWTi0T4Z+iyVjO6b88Un3VWU/NeTB1RRmrt91q9JkZoxPVBYxnt+tLr8Q
         35BglZeVkLMVHcgxxfR2us/wzQnspcdlEpaujo6duxJdhb77TTrNFTEUbqgeYpZG0/Or
         4I8jo4tqsqxNOzvyvv8nYF+a5GztFNvS2QmYsV8mLBesmLz0gUqcliIOvDLywRuJBOyC
         nRow==
X-Gm-Message-State: AOJu0YzdhX56wS5MeCKGjamwcZgt7q1W7k89hsJEUwLIkL9qPEq1KjHz
	O5LNdXQ1YjQrEXKMZwY7PJpwBSJpjZjJ9vG8QMYzMBcIWpyct3f5bniFV8TWL7RgpaTH6vhCPP2
	mPqHxLKAWxsLWPX1o8GiK7d4ChmCtULMjhkNbjhcKm9mH
X-Received: by 2002:a05:6a20:9225:b0:194:cb44:b0b4 with SMTP id i37-20020a056a20922500b00194cb44b0b4mr526125pzf.2.1703044376843;
        Tue, 19 Dec 2023 19:52:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnMr21VcQdQT+Lk5xChXSsBuDnDzHafReZLcU6LBc8taYyagaiLau7y0wRNSCh7k4SnAF95Kz+VAAjOKYBcWA=
X-Received: by 2002:a05:6a20:9225:b0:194:cb44:b0b4 with SMTP id
 i37-20020a056a20922500b00194cb44b0b4mr526122pzf.2.1703044376631; Tue, 19 Dec
 2023 19:52:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d7534cc4caf4ff9d6b072744352c1b69487779ea.1702230703.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <d7534cc4caf4ff9d6b072744352c1b69487779ea.1702230703.git.christophe.jaillet@wanadoo.fr>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 20 Dec 2023 11:52:45 +0800
Message-ID: <CACGkMEuE5a29uXXWfy1Ma+ZqSzWKhS1J1b2XHvhyC90wDFP02g@mail.gmail.com>
Subject: Re: [PATCH] vdpa: Remove usage of the deprecated ida_simple_xx() API
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 1:52=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
>
> This is less verbose.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  drivers/vdpa/vdpa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
> index a7612e0783b3..d0695680b282 100644
> --- a/drivers/vdpa/vdpa.c
> +++ b/drivers/vdpa/vdpa.c
> @@ -131,7 +131,7 @@ static void vdpa_release_dev(struct device *d)
>         if (ops->free)
>                 ops->free(vdev);
>
> -       ida_simple_remove(&vdpa_index_ida, vdev->index);
> +       ida_free(&vdpa_index_ida, vdev->index);
>         kfree(vdev->driver_override);
>         kfree(vdev);
>  }
> @@ -205,7 +205,7 @@ struct vdpa_device *__vdpa_alloc_device(struct device=
 *parent,
>         return vdev;
>
>  err_name:
> -       ida_simple_remove(&vdpa_index_ida, vdev->index);
> +       ida_free(&vdpa_index_ida, vdev->index);
>  err_ida:
>         kfree(vdev);
>  err:
> --
> 2.34.1
>

