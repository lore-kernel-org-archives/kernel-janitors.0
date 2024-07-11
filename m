Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2FD1EA85
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jul 2024 19:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720725792; cv=none; b=YNbJSmA1AozrffCl6IUUnWLVMu+L/GJ+grgLWJt8ooJ/3yUkXAO9VK6gp0bG9pVCxL4yVXO26pGI2rYu44bNb7zC4RSzjpeJALPi3T02RyTv7Uti46dg9jWl3wvLb8zDFy/euiiOio81LBJO2hkpQH/f17D8kWlBLqahd9LqqB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720725792; c=relaxed/simple;
	bh=qd4JfM9C7XhNkDZ9MKhcRdWS74czpvCBniJo+nnNLbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcLAVU6x/z5NcMyPnPL09qqNrGtz/9Z1JZIQT19fIHPWvk6FVjiAA8ieaxvjFJ9RaBmmuu4oXzRFQHRopZAnGWpGuglfbiZKRvsFhjCZ2G/vlfVQXXwYp0+oDnH7fGsroI3umklyrD0zUjhQO9yptHbLVPp0XOxocP8wBQUkCVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OxIT3Nic; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OxIT3Nic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720725789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qHMyJXBeRkRSNluth1L1mz9hL7fSL3Kwm56sBWnC+jg=;
	b=OxIT3NicQ11pWpwjOECkC9H/zFtI8FFKbsySh2j5odh1H798IbPjpKKTpIrBuI7PxaGH2r
	gUVAUCA/Vj2i99uX70oZTR8TDsvNy4955zU+HALgGQC7Nf/2LbuHAS2R7xlsgHgl0On3ZS
	qBr2Bh79hwLYw1EGhEKVzzwOLhop3aw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-E26O1PoWPR-CjNsUZ_0rPA-1; Thu, 11 Jul 2024 15:23:06 -0400
X-MC-Unique: E26O1PoWPR-CjNsUZ_0rPA-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ee9260658cso10897711fa.0
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jul 2024 12:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720725785; x=1721330585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHMyJXBeRkRSNluth1L1mz9hL7fSL3Kwm56sBWnC+jg=;
        b=faRy5m8BiaLiNMFIWtdbzAecnZRWfkoL83vBjNOAIRnUJbRj2ie6lM0Mto1BSMbGb7
         d2Xx1l/a1q1Fuetk65tLtH0L7il0HsDPvVCWWskJh11xnTXLLn+13lBPvpYsDK9DTEux
         +xVDmi2UN1J22vhwoJ8ywm3AyVsgnJBg1SqYsV9FAnZuGs/7rWoxgN90vt2Lzc0z0mtU
         NGH8xtS8dUrCz96GQGPT9MOS69jG/uN++unZ2qGARZV9Au5RRurzXVN0XIdqbDiLMFsq
         hIx46FSIG6RkUusg7v+vE41Ct8HVzIzmomBd0VnZVL4lpqyIbim1TLhskKdDmuTwJ5/b
         ZTXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn9CEMszkyIyvYOtM7ThD/AXpA1LGsXJHzfskdN+K1glEqfX+c+yX37ylfketQ+tyjQVuHzn1P56xnm14g6C4ZC6g/boe4Ke08U3DFMvTH
X-Gm-Message-State: AOJu0YxR2/bIkdSy+W4t4qTJUzFOYUuTy/WMfUvC0Qfllnclu30FY7xY
	2VytQE4rnSrJaoy+VxVBkNuXl+n5alpZCbApetNdl3aZH83CxHz1iGCWlQbhrLS68i5011OnVZ6
	euAhyN0Bt+TAYh4GJjr5KuEWtxIF/w4G6GLwB483LJxn+VL+woHsvDvG1LkHh5hb9RQ==
X-Received: by 2002:a2e:8691:0:b0:2ee:6a72:f006 with SMTP id 38308e7fff4ca-2eeb30e3ademr61595791fa.21.1720725784995;
        Thu, 11 Jul 2024 12:23:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlcdhPzF+B/x+wWIA8iNp5tqQGZgR9yQ+XfTnwuaunKMFe59pESZv2NmWVtBCYCvMz/J6DmQ==
X-Received: by 2002:a2e:8691:0:b0:2ee:6a72:f006 with SMTP id 38308e7fff4ca-2eeb30e3ademr61595591fa.21.1720725784330;
        Thu, 11 Jul 2024 12:23:04 -0700 (PDT)
Received: from redhat.com ([2a02:14f:173:2166:83a4:d566:a055:a5a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f7362d9sm125253225e9.30.2024.07.11.12.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 12:23:03 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:22:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] virtio: add missing MODULE_DESCRIPTION() macro
Message-ID: <20240711152235-mutt-send-email-mst@kernel.org>
References: <20240602-md-virtio_dma_buf-v1-1-ce602d47e257@quicinc.com>
 <ef8f00f2-210c-454e-a7f8-ab724a18bf96@quicinc.com>
 <b8b23dc1-7df6-489d-9638-db64a89c8a83@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8b23dc1-7df6-489d-9638-db64a89c8a83@quicinc.com>

On Thu, Jul 11, 2024 at 11:43:18AM -0700, Jeff Johnson wrote:
> On 6/23/24 10:36, Jeff Johnson wrote:
> > On 6/2/2024 1:25 PM, Jeff Johnson wrote:
> > > make allmodconfig && make W=1 C=1 reports:
> > > WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio_dma_buf.o
> > > 
> > > Add the missing invocation of the MODULE_DESCRIPTION() macro.
> > > 
> > > Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> > > ---
> > >   drivers/virtio/virtio_dma_buf.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> > > index 2521a75009c3..3034a2f605c8 100644
> > > --- a/drivers/virtio/virtio_dma_buf.c
> > > +++ b/drivers/virtio/virtio_dma_buf.c
> > > @@ -85,5 +85,6 @@ int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf,
> > >   }
> > >   EXPORT_SYMBOL(virtio_dma_buf_get_uuid);
> > > +MODULE_DESCRIPTION("dma-bufs for virtio exported objects");
> > >   MODULE_LICENSE("GPL");
> > >   MODULE_IMPORT_NS(DMA_BUF);
> > > 
> > > ---
> > > base-commit: 83814698cf48ce3aadc5d88a3f577f04482ff92a
> > > change-id: 20240602-md-virtio_dma_buf-b3552ca6c5d5
> > > 
> > 
> > Following up to see if anything else is needed from me.
> > Hoping to see this in linux-next :)
> 
> I still don't see this in linux-next so following up to see if anything else
> is needed to get this merged. Adding Greg KH since he's signed off on this
> file before and he's taken quite a few of my cleanups through his trees.
> 
> I'm hoping to have all of these warnings fixed tree-wide in 6.11.
> 
> /jeff

not sure why I tag it and it gets cleared again.
tagged again hope it holds now.

-- 
MST

