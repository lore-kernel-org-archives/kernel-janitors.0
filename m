Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B23C46444
	for <kernel-janitors@vger.kernel.org>; Fri, 10 May 2024 00:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715300355; cv=none; b=XgJmN5TRZh+5sC3wsTXQH4k5Walllrhi2QKwNYwZbEnig78tIL2vQ7TYwJJRahQIpYQ22lwtGey6EZ/FQQzk0sQJYI1P9jpXRxAefcGmSH0zdxDddzcnHE3CxdgP/+S7zIjrMHkpvoSESOkR5EFXptG+NlxvXqJvkEPVXtv+Dok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715300355; c=relaxed/simple;
	bh=0XTehdgnUAu0DffyW0Hg/Nc8qFCKbP9Br4UL88WMW8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4+XnG9xGc6IDUia7bwhiJvVyr6X98RMyyGxFqpfBHbWji5NHUUrUNBKQtp4D7pp14V2/uLZtwpuUj8oVyUpSmE1NMjrQZnwkkNvohL5U/WMwNsKFZ7nHIWvKnLWzKJoVf7JVyuM/2mPXXY/TeMEu4kU7RHof8R+FzgZwUAQsDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=38gz8D87; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="38gz8D87"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41fe54cb0e3so5839305e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 09 May 2024 17:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715300352; x=1715905152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDkg740tjVRPA7muszLKzifx+lB1m07et3SmwF5+y0o=;
        b=38gz8D87AKgDP25titIU0RdCBhX5qbc9/dtCMMNs0YHRdy9f7XQwahJ4mqJwTr0ilx
         QoVW4Idwe9XkVXtNDRsuMWNLXWvgkCdZemQDVL0ZJqlAkce2DTieFpT5mkyxGwMFsQOZ
         QmlvEtcJrAf/c4JL/2Qn3Z4bFRfoPojF6GZmqmHq5VnkykdPqWKnH/KuM1JliGfMypo/
         J8PK66W0AB+NANa9IJw5vbchEslM4SSHlRxxb9Ug81uhdEui5ESadoP3EM8xBTMoSzAQ
         QBsiebr37SFDVxW75PFUa8o2TRsyS+5KhR82VDbt5n+bYcKNm0ivkUMMm9YssMH6XS2f
         50OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715300352; x=1715905152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDkg740tjVRPA7muszLKzifx+lB1m07et3SmwF5+y0o=;
        b=e57355wQa//kSTKUOPO8aH8ftPdh61rvWsTi6LQ0F6JvJIMFpuRqra40GSflzu7dRF
         PoJPVJ+KozJJDomx5zCYoaZMHdFrrKZTPcAu5PE4687Qlj4IEOz+Yd5twmd1gtxPwQ5E
         JKDRsPtWQ1B3WQik/2g6BYYS7FckxQCclkxRFEgESaWYvUfkXQvWSxRo9oxZAOTUZMze
         +BT1YEwFlioeWLqhPB1oQc1oL7uf7zfn9qW0V+1hcPzsMv4+pHyY37kiSwwXUahjs+R/
         /btQ9+3cauzL21gQbR03fpSsNC5W6j844oo139iQ4TMxDt6LdNFbf6G4buJSUMqLvwru
         7MDg==
X-Forwarded-Encrypted: i=1; AJvYcCWO7IyUKjUL1waeLwNweSYjKt3rR754sGM+jj7uEHsYrQf+gGeUgxj1cDdoGqubDPLwXcB9Bfy2T088LJhLpxRU3mBEjo0EImkCONb5H/7l
X-Gm-Message-State: AOJu0YzlcCtVu7UMC7nIfbHez61JAAhV1nEpu+0Sz03njZrhGjVlvoA2
	/DJI/WcU1y6zXC0Shqk0+6Q+bkY1YFnwjMxidH6YtOM9CgL3elqFUmLoSVX8o3zzurByEEfruOS
	PRPkwyscxpFDLPDzkP1qMJGXabgN8+gkBrmDN
X-Google-Smtp-Source: AGHT+IHoymcx9p+FVAYDd+bxTKN3u67a8ICRxPdR9lToM+b7TuJWleoDYOV7HKWLMYCbcEXS6FL9j7W1pp3wwxvc5ms=
X-Received: by 2002:a05:600c:4f42:b0:41e:8894:3f48 with SMTP id
 5b1f17b1804b1-41feac59d64mr8641395e9.27.1715300352187; Thu, 09 May 2024
 17:19:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507225945.1408516-6-ziweixiao@google.com> <3e10ff86-902d-45ed-8671-6544ac4b3930@web.de>
In-Reply-To: <3e10ff86-902d-45ed-8671-6544ac4b3930@web.de>
From: Ziwei Xiao <ziweixiao@google.com>
Date: Thu, 9 May 2024 17:19:00 -0700
Message-ID: <CAG-FcCNGsP3FnB6HzrcQxX4kKEHzimYaQnFcBK63z_kFTEQKgw@mail.gmail.com>
Subject: Re: [PATCH net-next 5/5] gve: Add flow steering ethtool support
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Jeroen de Borst <jeroendb@google.com>, netdev@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Willem de Bruijn <willemb@google.com>, LKML <linux-kernel@vger.kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, John Fraker <jfraker@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Shailend Chand <shailend@google.com>, rushilg@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 7:09=E2=80=AFAM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
>
> =E2=80=A6
> > +++ b/drivers/net/ethernet/google/gve/gve_ethtool.c
> =E2=80=A6
> > +static int gve_get_rxnfc(struct net_device *netdev, struct ethtool_rxn=
fc *cmd, u32 *rule_locs)
> > +{
> > +     struct gve_priv *priv =3D netdev_priv(netdev);
> > +     int err =3D 0;
> > +
> > +     dev_hold(netdev);
> > +     rtnl_unlock();
> =E2=80=A6
> > +out:
> > +     rtnl_lock();
> > +     dev_put(netdev);
> > +     return err;
> > +}
> =E2=80=A6
>
> How do you think about to increase the application of scope-based resourc=
e management
> at such source code places?
>
Is the suggestion to combine dev_hold(netdev) together with
rtnl_unlock()? If so, I think there might be different usages for
using rtnl_unlock. For example, some drivers will call rtnl_unlock
after dev_close(netdev). Please correct me if I'm wrong. Thank you!

> Regards,
> Markus
