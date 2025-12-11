Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E949526D4DE
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Dec 2025 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765442299; cv=none; b=SCnXAx9uaeirOnUvYNhvrYj1Ac4MVp/3nJ05l1sCXcHPoE1xOzJ/yStSB/WNQAabpANR4PhBXRDz4rwpWgWocNa/xdw1L1vc/xdfhcnLE0X6ADMFmKX5eR5fb1+D/9tRRz2pREFiU+3q6hz2MVw1rP9lKnyOsKz/iK/9dTrURkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765442299; c=relaxed/simple;
	bh=rqOciKOGlRMnIs2IsSG8/n7lvAuH5dsUqS/rCEgD3Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8G7O+fyAbN7pzDTy0H7IDmWe0a6G6/ITFZC90UoQPdwIUmbKspXSizab6XVN0De8fMxTpydMDTKIClwQGZzpZmUl15kdL0SdMT7aPgoJUDbEjlubn4HxreHYuN15X0ZlRHZ4A1b3yRkiQJpgqRCRuqouTf3+ZQ79ej/WrVKYG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ulqw3Hi7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ulqw3Hi7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so7157795e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Dec 2025 00:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765442295; x=1766047095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Sg8nQv6XwVOonN2RpR1c8Sf1QdNCd4fo1IwTQexW1A=;
        b=Ulqw3Hi7BLzoFD1xv/GnBP/sLeZAV+7h8oqYU7E2Uh29DdEy8B7CJkWiyo5Tg0+2bX
         AJnzxvfY9vOyUlZSViaeqypZnDZDuhic85bTHY2b1ZM8tN2l3Wthzh4worzEqd9R/N+5
         h3FcDOecBXAFBOfO5oQhzzcdB6DHtN9KcP1o4820t25MdIuMv6bdo3DTkWa2sk57nvH/
         UBRws0Dd15/SywfH1fmvDAYZoeodJdfzC6i2ZZlwbNl+dpHXs6MKNJXobr5Wb1CbpYJm
         IaYkIG38UL+nnQdhF0k7w4tYubx9aQ1HTw+XU1P3AduF6YXRP1vfoATeahCXfa6fxNNs
         VglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765442295; x=1766047095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Sg8nQv6XwVOonN2RpR1c8Sf1QdNCd4fo1IwTQexW1A=;
        b=LxbWWBvkVm7YLuNCdCWFU+xrjCfq5fhPAysA1rVfuxf7JmxeJQQg72BYIGytWrGPTc
         WB3dP5DW+xcHjCWW6PZK3l3itseqg07x49oG/0ryc3O+3/mWYl4vUqO4gYvzs/WNcMQE
         qHkddZH5tKfcbKWNMXbfd42UaGLYB1abSv6EF+UMjMHDaM/fhR8BqlZFFhK8MLvIUoZ7
         8nCp6E8c681SI2NSU/EwCLKU9a5GkFULDxrsYzCFyqiqBRiv5BrqE6+mJrgnOAJd7d4W
         kRvPo8xo/zcsn1V+EB2Bc4j5G4fQJs32GLTgeGm3N1sJqqwDFM/eECu0w+UQjIy3RlOW
         cXlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlgXAjB7JMipFoXGj6LKw3WrTT1OmQJAxibKIeZ4JO3ShvbpyONtepZJA7GBThxVZ0W33ZsC/9SQMJxndEaoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Un3bUqrc2k4LxcRezKRIFgQD620//fmiozsTV8NRz2vwELzW
	4AbzxejrX29fcUpBaqS+fxQemeiQNhIXvXxf0uTIjq7YvfDI3SS7cDnc0Z81xNOM0Mg=
X-Gm-Gg: AY/fxX4Uhu0o8FoxMdepPl/z144lygoXwU2Bb2+MNxHcfLZ3Wmsft6hluUE0P/VF/F6
	WVuVNe5cV80IV2JSmGNMMnBhTGNw48lCDCTcRKXgtZygM0Oza2iwHr4543jK+L+elqYGex5KJTV
	I4eTKagOFj0rxPVFR3Rj5OWrs3hDaJgOkD0lInq26yV/mXJeqF8jWJr0Ooks9JRzuKTSGKPXTzo
	YVF2bakCvWg7qhnWYnom7GDOh6zJjTSUQQyI6Iefi3yXhJBVqJzZLexQwa/FbhTv12mXJ4f59MK
	dI2lkLWw49nCDYsuHHtw98XvKSpz3P8ISf/Rv38NHnK2zDAZUVfJpVgLRwlFUiL7gwcnyq6TC0U
	GokeVHx7BeovT5dpB194xVocaYrImhe9pSL84GBdQQ7r/1WLV8ZAKJJdRSG0Ll631nl2+ihs5ab
	69KMFQWP3AMvh5OTMw
X-Google-Smtp-Source: AGHT+IGSsWe5a0d99Xs6fnmOMLI4LBdo2k+QjtiypzD0IVANglEDUotcgPQFMk6WXuHYX1bSUfn69A==
X-Received: by 2002:a05:600c:c165:b0:477:6e02:54a5 with SMTP id 5b1f17b1804b1-47a8378cdf5mr49788055e9.18.1765442295248;
        Thu, 11 Dec 2025 00:38:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a89f74284sm22968035e9.9.2025.12.11.00.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:38:14 -0800 (PST)
Date: Thu, 11 Dec 2025 11:38:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, virtualization@lists.linux.dev,
	kvm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] vsock/virtio: Fix error code in
 virtio_transport_recv_listen()
Message-ID: <aTqC8rhgHmxC5fAQ@stanley.mountain>
References: <aTp2q-K4xNwiDQSW@stanley.mountain>
 <xz4ukol5bvxmk2ctrjtvpyncipntjlf4bdr7kjdam2ig5gf7ho@vuuwwu7asj7i>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xz4ukol5bvxmk2ctrjtvpyncipntjlf4bdr7kjdam2ig5gf7ho@vuuwwu7asj7i>

On Thu, Dec 11, 2025 at 09:30:06AM +0100, Stefano Garzarella wrote:
> On Thu, Dec 11, 2025 at 10:45:47AM +0300, Dan Carpenter wrote:
> > Return a negative error code if the transport doesn't match.  Don't
> > return success.
> > 
> > Fixes: c0cfa2d8a788 ("vsock: add multi-transports support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > From static analysis.  Not tested.
> > 
> > net/vmw_vsock/virtio_transport_common.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> > index dcc8a1d5851e..77fbc6c541bf 100644
> > --- a/net/vmw_vsock/virtio_transport_common.c
> > +++ b/net/vmw_vsock/virtio_transport_common.c
> > @@ -1550,7 +1550,7 @@ virtio_transport_recv_listen(struct sock *sk, struct sk_buff *skb,
> > 		release_sock(child);
> > 		virtio_transport_reset_no_sock(t, skb);
> > 		sock_put(child);
> > -		return ret;
> > +		return ret ?: -EINVAL;
> 
> Thanks for this fix. I think we have a similar issue also in
> net/vmw_vsock/vmci_transport.c introduced by the same commit.
> In net/vmw_vsock/hyperv_transport.c we have a similar pattern, but the
> calling function return void, so no issue there.
> 
> Do you mind to fix also that one?

Sure.  I will resend a v2.

The check doesn't catch that one because the != comparison is
hidden inside the vmci_check_transport() call.  So I would have missed
it.  Thanks for catching it.

regards,
dan carpenter


