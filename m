Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DCD155740
	for <kernel-janitors@vger.kernel.org>; Wed, 15 May 2024 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715785671; cv=none; b=bO8suo0qRyh8eSkQoHPvf7R771Aqga354qq7fv6RtO59B7jPk0I0XTnSv+c6rKSMLoKtVO9pjxkhK5BEqgUS8EoSFnDGAK9rZs79O8hvvj4VaVH71LvNph3gUBPzH2Rvy0h44hr0aPmfFSRiYhibVQiw3yGlT+DG1jdlq+pFRZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715785671; c=relaxed/simple;
	bh=nB/Wx+bzRLvAZM9HJrayest7/Jl5WbZCbrJZngd9CQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6rA/5AmPYuSR7/tKIh6o7ypNpu2ijMgP50AylGGFUIilTGvlH3rNrc54YQ97YhcZBGBJRlqE2TSzCoxsaPHrluxQ16lb9zVcBY1H8oKvTYCQTOiKgKWlcGuaP+G9qALe/8jqgp0i97NYRqF5V6ijSJyXMSDBe1o+3ZKGbi0pNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K2sB17cI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K2sB17cI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715785669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dbrWi8lbFLyv72mKMlVkkmYPCKHUduDQsR6vbInAIJA=;
	b=K2sB17cIX5VRSR1JNKP15k7kVHCi2lEWVhlbXJRNFONC3/YjI18ydd39hkppAxfupuZl+z
	tV0Nd2leAai9huf10IHzNVVFbBLKCvCCVk7zsbBdy3Y5Oy+zM/13FLrF3eWRJ20e2uIFY7
	tJvnOQDgyzXuIkDtcuq2lmgx3oT57tQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-65DJeqZIPiCgSggsMEyMHg-1; Wed, 15 May 2024 11:07:36 -0400
X-MC-Unique: 65DJeqZIPiCgSggsMEyMHg-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2e2035036f5so68827821fa.0
        for <kernel-janitors@vger.kernel.org>; Wed, 15 May 2024 08:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715785635; x=1716390435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbrWi8lbFLyv72mKMlVkkmYPCKHUduDQsR6vbInAIJA=;
        b=MhpS9ShyagOlglyK/HJ7huE/GKtdRdNxMSHKRi+t6SrUCGgsYaQbf2biyM0SkhEu+5
         5WakU37f2eOyiRuptDVXvrVB98txlxksPRe9RIhHApSfIVfhFBXqFXOidPEjXl3tToCN
         wRKCR4lX+CzT8yuvl/rIXluNyJI+ngaiZZe3PTsp1QPHoYjfxeMhdPpt8RDn0qOED+6y
         vRZFEkF4CQLnFhLLjzINrxRNcTAxRXfidiO2rQvddasRjzo5mQYQqnE5PhC3GW6QKllo
         EyatC416lnCoTNhSKdgZPqqaEJcsU6ZY/CEUQDdDvxmmQn/hxEnuHbNri951AYjKrKt3
         WLww==
X-Forwarded-Encrypted: i=1; AJvYcCUCECQVX8p3tzL1M8FfCxHLP4fvV/72olxQnwlledHj/l9dZaY17NZ2g86Dcd62Pp9kYcmV97GK+CFEG1cMQ3yPvLuE9HDSOyZ0i9KhSzYZ
X-Gm-Message-State: AOJu0YwTWzdYKv6HjtsAK2lunJEkc6Wq7lOcE1igJuzA1WWJ3g/3tc18
	1p1fqPRxFdfDju0/W6yzZH8+eibDfRAm8gcah48WRhZTA5sRXr47QNaZU3kccmD+YerFUyffSi5
	KqTYdnr1eDFNKeyhPTVh1jEEy24xb48Yb7TJv/Kj36ZQX3b1lm0xCxrgTYrtQzeOedg==
X-Received: by 2002:a2e:7c0d:0:b0:2e3:7121:aba6 with SMTP id 38308e7fff4ca-2e5205c61a3mr133092411fa.46.1715785635219;
        Wed, 15 May 2024 08:07:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA2MjU83PmPbl4SP+crO3lzmgqKP48+f4i5kvUwU7C8/1az1QdYe3lnvRKkMDiMLe7dIqRJw==
X-Received: by 2002:a2e:7c0d:0:b0:2e3:7121:aba6 with SMTP id 38308e7fff4ca-2e5205c61a3mr133092081fa.46.1715785634668;
        Wed, 15 May 2024 08:07:14 -0700 (PDT)
Received: from redhat.com ([2a02:14f:175:c01e:6df5:7e14:ad03:85bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bccesm16825319f8f.5.2024.05.15.08.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 08:07:13 -0700 (PDT)
Date: Wed, 15 May 2024 11:07:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jason Wang <jasowang@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] virtio_net: Fix error code in
 __virtnet_get_hw_stats()
Message-ID: <20240515110626-mutt-send-email-mst@kernel.org>
References: <3762ac53-5911-4792-b277-1f1ead2e90a3@moroto.mountain>
 <20240512115645-mutt-send-email-mst@kernel.org>
 <1682873e-eb14-48e4-9ac6-c0a69ea62959@suswa.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1682873e-eb14-48e4-9ac6-c0a69ea62959@suswa.mountain>

On Wed, May 15, 2024 at 04:50:48PM +0200, Dan Carpenter wrote:
> On Sun, May 12, 2024 at 12:01:55PM -0400, Michael S. Tsirkin wrote:
> > On Fri, May 10, 2024 at 03:50:45PM +0300, Dan Carpenter wrote:
> > > The virtnet_send_command_reply() function returns true on success or
> > > false on failure.  The "ok" variable is true/false depending on whether
> > > it succeeds or not.  It's up to the caller to translate the true/false
> > > into -EINVAL on failure or zero for success.
> > > 
> > > The bug is that __virtnet_get_hw_stats() returns false for both
> > > errors and success.  It's not a bug, but it is confusing that the caller
> > > virtnet_get_hw_stats() uses an "ok" variable to store negative error
> > > codes.
> > 
> > The bug is ... It's not a bug ....
> > 
> > I think what you are trying to say is that the error isn't
> > really handled anyway, except for printing a warning,
> > so it's not a big deal.
> > 
> > Right?
> > 
> 
> No, I'm sorry, that was confusing.  The change to __virtnet_get_hw_stats()
> is a bugfix but the change to virtnet_get_hw_stats() was not a bugfix.
> I viewed this all as really one thing, because it's cleaning up the
> error codes which happens to fix a bug.  It seems very related.  At the
> same time, I can also see how people would disagree.
> 
> I'm traveling until May 23.  I can resend this.  Probably as two patches
> for simpler review.
> 
> regards,
> dan carpenter
>  

Yea, no rush - bugfixes are fine after 23. And it's ok to combine into
one - we don't want inconsistent code - just please write a clear
commit log message.


-- 
MST

