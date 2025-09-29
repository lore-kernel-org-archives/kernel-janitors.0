Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A15236435
	for <kernel-janitors@vger.kernel.org>; Mon, 29 Sep 2025 06:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759125940; cv=none; b=bQhRyMlrCdOt6vx42j39odDSTra7TcBmN/cLO3kTJeFPNslCKdtqVM+33u/MMhiMmhfkuj4+FO70CxEKSL79jowmZ7VYY8vXBljrtxnraDm9CALeWuW9BeWbkpRj+hBQ1/8BOzqajxlBis5OMlD56T/zmEojEuth8LCUMNoXZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759125940; c=relaxed/simple;
	bh=9WPqzjmiWMki4xWlLoYtm9WlKZ743i+2Jltc2U63LGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCY+FRPLDKFH6oc3FfY/NkqgPi37wub5o7mW+gdUNfQbzCLx/L0B05VH/6dyPO9GqsZ+iGkvyCxLqxINgG3SjWIpg2zVKeLi7TiXuFeeV1DFvkAcY9zT7fUTifbjN13/i03KoFe/tJ8LS5dr5WuZtlKG7vHLYI3K0iVLqglmhfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cL048wyP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cL048wyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759125938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aEnOtbURDkBn/yuAWcxy2EnBdqVr8YnzLqFxCwWilb8=;
	b=cL048wyPGBB/q1YBW5mK9HYGu2gbx3IO7g+XdSUVl+pr25+3Ll0+z53uMmrlFaf8+TfY+K
	24ck22LhNxhRvAThxSKdIl9bgMvsjEVi42wHLMUPZgRfqjytGx2m/X9vOqXrF+s33sNk/k
	Fhx1403HdWCcfRo69BISzXCoxJ8FEz4=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-3mBYbGZDOY-xhCrEJoFVpw-1; Mon, 29 Sep 2025 02:05:36 -0400
X-MC-Unique: 3mBYbGZDOY-xhCrEJoFVpw-1
X-Mimecast-MFC-AGG-ID: 3mBYbGZDOY-xhCrEJoFVpw_1759125936
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-76c144b0706so45780857b3.2
        for <kernel-janitors@vger.kernel.org>; Sun, 28 Sep 2025 23:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759125936; x=1759730736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEnOtbURDkBn/yuAWcxy2EnBdqVr8YnzLqFxCwWilb8=;
        b=QUq6s4RUozKhg99b1ZmGaaB99xBKSAt8IwmNjqu/Y5YQtTpVwwS4lNQkjKwTKMHXkh
         aBp2zAJONY38M/T3OuoQybdPDIPZgjBueLkNYN7qK3UQtACvACPMTCgS8/dth1NVohFa
         qgJ1aqxZpoBy+wSb10nzsg/nWeQbOkhUU1GCI1K5Q9+YxZzOHqz+kruvTnV0T6MgFCGI
         8Gc0TpZ2iapyPN4cIMEWO4fgmuVlZ6HG/Bwj12SngPWxW/0Y/ZCRw6pO1irzZrJfztDL
         DVvTj8bUs+0kTptx2CIcLY2iTKpX+0YdG26TQgBHQRwSyAcIzC/Dc8KAfJMuq9u+4CDq
         fUtg==
X-Forwarded-Encrypted: i=1; AJvYcCVnVdeMAEJ2kh3DxBzA6nnQS6LadVIdBiLiYB1ZUt8Shqe1/xkBNEveVZ4ccfbhhFvllHD8QqvG1tAi7x5H8N0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYY93zy95f8YLD8Bl64Jr9kpirCr2fxaQv0W8BPcjg0sBbwMhE
	vyEdeIKS8UHVz/JjjecYBphrakfzQ06lnpz6ca+l3TvbUSgnPbMVnwl6cNYqjQUH5GoKRTu+Yax
	8zWSmnXI+Djgmr9oUWwwvk9CWZsWXMQtb6EqWtvNzUyEXn9Mwb2YvgJLCghRjxmOJ6dSg2+brf7
	0tAmx6KbVVlnNWW76J/9xMY1U3Hg6xqzqJkLOgWQFWyS3D
X-Gm-Gg: ASbGncst3cPdg8LfAXYp+28Pf8dHeyFSfPo+yyr9TMaq2XoPFz+M9WX7apYzHUMt+bq
	vNCElpUgRwiANsmiW98mMYS18eDH79k8sSjXS5FYV11BcI5rSpUPXabteqLcxftkfuSGxJCX5N3
	cEdOz1HguC/jI+gUzJ29YSKkrnvpphCKuYzeqwB0nFkhNRDjYkMEJI3JLl4OC+SsnOf7Likj9Pg
	g1mIdr2
X-Received: by 2002:a05:690e:2497:b0:62a:38ab:fc31 with SMTP id 956f58d0204a3-6361a70fbaamr12442140d50.14.1759125936015;
        Sun, 28 Sep 2025 23:05:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPkWT0XTYRzHEmtMC1RyCXLhMmcayEELVp/4odWdM3T+vaRsOTnuGwdr4KePk4Rygkx2XQiQoOU0Uftn//F5c=
X-Received: by 2002:a05:690e:2497:b0:62a:38ab:fc31 with SMTP id
 956f58d0204a3-6361a70fbaamr12442116d50.14.1759125935623; Sun, 28 Sep 2025
 23:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aNfXvrK5EWIL3avR@stanley.mountain> <20250927083043-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250927083043-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 29 Sep 2025 08:04:59 +0200
X-Gm-Features: AS18NWCNnLHKyzg0qEsFQJWCKx1nz3MigsaubwNAQ8KOkZjUMutEQnjkPj3UxJw
Message-ID: <CAJaqyWcdQbt=PUG0GKQ8euXVBZMKEURURuHDijPNpzuf2e9xWg@mail.gmail.com>
Subject: Re: [PATCH] vhost-vdpa: Set s.num in GET_VRING_GROUP
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Jason Wang <jasowang@redhat.com>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 27, 2025 at 2:32=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Sat, Sep 27, 2025 at 03:25:34PM +0300, Dan Carpenter wrote:
> > The group is supposed to be copied to the user, but it wasn't assigned
> > until after the copy_to_user().  Move the "s.num =3D group;" earlier.
> >
> > Fixes: ffc3634b6696 ("vduse: add vq group support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > This goes through the kvm tree I think.
>
>
> Thanks for the patch!
>
> IIUC this was in my tree for next, but more testing
> and review found issues (like this one) so I dropped it for now.
>

Yes, that's fixed in v5.

> >  drivers/vhost/vdpa.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> > index 6305382eacbb..25ab4d06e559 100644
> > --- a/drivers/vhost/vdpa.c
> > +++ b/drivers/vhost/vdpa.c
> > @@ -667,9 +667,9 @@ static long vhost_vdpa_vring_ioctl(struct vhost_vdp=
a *v, unsigned int cmd,
> >               group =3D ops->get_vq_group(vdpa, idx);
> >               if (group >=3D vdpa->ngroups || group > U32_MAX || group =
< 0)
> >                       return -EIO;
> > -             else if (copy_to_user(argp, &s, sizeof(s)))
> > -                     return -EFAULT;
> >               s.num =3D group;
> > +             if (copy_to_user(argp, &s, sizeof(s)))
> > +                     return -EFAULT;
> >               return 0;
> >       }
> >       case VHOST_VDPA_GET_VRING_DESC_GROUP:
> > --
> > 2.51.0
>

