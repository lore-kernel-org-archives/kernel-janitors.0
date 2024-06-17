Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46F31AAE22
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 13:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630840; cv=none; b=Vln7jD3f0JKVgdx3wsTQfHSLCJGtDYKficxn50Lq1cCK/0JPQC5nIuUpwQn+GGEJLCzUCf0eAxmia9LH31DadZ7mtBhjlOkay/AI1eMXtTx7nerC2m/EInmT6aZlyN6ZFHDMvJn9fYmnRuXdb+fllfVy0BshwJwUpkWFi7I5oDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630840; c=relaxed/simple;
	bh=BVnGMwoCZw7PxuD/QNYyTuQeJ5mFD9HFP2ibNF1eTeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3RHwy96q47+dxEegJ/xYpb0wznlihxzqHTIq1Jil8gsPwaHs3OACZb6UtAaR/NxsRSWJ1yTWO04yVsWi9lC6Dm03zoLNqymXGPmrESv1cPvqSPMAY5jifXvf4j7LCLC92BRR1s30fMyQtjMDZpnwgKrAVMe6Nm65QZ1rmOWCWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fVoE/9pY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fVoE/9pY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718630837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q84CXo0wUI7hBoP/Wd2wSAm0e9Fj0ilpl/ZCzDP0aQQ=;
	b=fVoE/9pYF/4QP5Y2SzVh5tCPk6w6WxxBx97pOkpPBHc7zKEJyvV/rcsH87Y/xPghD3Xmlf
	P/YW5Qt24JDxrVvGq4kIId+5hh3mUffgx6dqDRTq3ewdOAD0SyqvKY0BXNunOwqnOvzQ6n
	3eAkxw8B6Ebnog8vsWrit2h7iWVGIHM=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-FxGPvwNyNZq-29Ssw5UHHg-1; Mon, 17 Jun 2024 09:27:15 -0400
X-MC-Unique: FxGPvwNyNZq-29Ssw5UHHg-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ec2c6af13aso7425941fa.2
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 06:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718630833; x=1719235633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q84CXo0wUI7hBoP/Wd2wSAm0e9Fj0ilpl/ZCzDP0aQQ=;
        b=B71T+5+Tgym1lEymkfSURaDnSvg4tUy74fm31mf0SG1APKssKhMlc40hr/o4m5Ggpj
         dNJ/jdRPUovRE+rbExZgUtJaiYXXW2TTxV3m7bc2b4lbnZsAzxMsQ09bcwfVPadYwYQo
         wPtvww2meN8huZ6m2dFYXlzb4u1dyRc9y0fNhoEwwxYbl8fxeHhoZHnyNTcMFRl7Ji3k
         BebTvnt92KqkkktYvAffDiZey4W1/47WtK2S29yPP52m9675E/Zgf6p5QUooK5s+e3hs
         Wj/QsCqbEuihDRZuB8C3Vu27QQbEsg/Ztqagl2AEjsWvXky7IUwIjtW1ZXbKhY37bVYw
         ZEfg==
X-Forwarded-Encrypted: i=1; AJvYcCWRqkFC4hS+Vpzlsz3bvXgTZ5LavJy/2ZaPG1LjNYJ6t+7d+CHn4fLTqRf0NvIXsnEp2W1O9yJjZZltqyn4ZyyuBU+9SBgT/BiHS4vQyuP+
X-Gm-Message-State: AOJu0YyWBMrwGkxikVAB4KWqtyndC/yHsZXDX3NQa1v0sxtmKKDL64NK
	d0zotzEfus0DA50XJ+E/O0a+3AMVNdPW5r51olDXBnXxCtuSDxCU7L58VXBq4fR0QQQzk8R+2t7
	fpqJy+ymDN/6hbUeJCESx7Et6b6sDsAnyEp7HLYqxO5ibsepjpSiuKUPwMH4teuCbOTiYEKxGLg
	==
X-Received: by 2002:a05:6512:20c6:b0:52c:881b:73c0 with SMTP id 2adb3069b0e04-52ca6e64378mr6296635e87.17.1718630833651;
        Mon, 17 Jun 2024 06:27:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpnKGZZT8Zk3aPPgtEsPpln7bsKIoo+bG+Ridg0DdcuVdy5+34CRZh9UkBKQn9c7obciZzKg==
X-Received: by 2002:a05:6512:20c6:b0:52c:881b:73c0 with SMTP id 2adb3069b0e04-52ca6e64378mr6296612e87.17.1718630833121;
        Mon, 17 Jun 2024 06:27:13 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7439:b500:58cc:2220:93ce:7c4a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509348esm11832788f8f.17.2024.06.17.06.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:27:12 -0700 (PDT)
Date: Mon, 17 Jun 2024 09:27:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jason Wang <jasowang@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] vringh: add MODULE_DESCRIPTION()
Message-ID: <20240617092653-mutt-send-email-mst@kernel.org>
References: <20240516-md-vringh-v1-1-31bf37779a5a@quicinc.com>
 <7da04855-13a1-49f9-9336-424a9b6c6ad8@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7da04855-13a1-49f9-9336-424a9b6c6ad8@quicinc.com>

On Sat, Jun 15, 2024 at 02:50:11PM -0700, Jeff Johnson wrote:
> On 5/16/2024 6:57 PM, Jeff Johnson wrote:
> > Fix the allmodconfig 'make w=1' issue:
> > 
> > WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vhost/vringh.o
> > 
> > Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> > ---
> >  drivers/vhost/vringh.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
> > index 7b8fd977f71c..73e153f9b449 100644
> > --- a/drivers/vhost/vringh.c
> > +++ b/drivers/vhost/vringh.c
> > @@ -1614,4 +1614,5 @@ EXPORT_SYMBOL(vringh_need_notify_iotlb);
> >  
> >  #endif
> >  
> > +MODULE_DESCRIPTION("host side of a virtio ring");
> >  MODULE_LICENSE("GPL");
> > 
> > ---
> > base-commit: 7f094f0e3866f83ca705519b1e8f5a7d6ecce232
> > change-id: 20240516-md-vringh-c43803ae0ba4
> > 
> 
> Just following up to see if anything else is needed to pick this up.

I tagged this, will be in the next pull.

Thanks!

