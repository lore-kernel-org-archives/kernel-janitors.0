Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432E028CF56
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Dec 2025 07:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765439457; cv=none; b=FVObtkEH9NP2xy1ytZVAj70zGZ/NynUdEMVfA1nZVhgybjEvXLyHVZA8eG5SzjKzOOkWO53I6wercdfELuaAc2KghIIDaPa0ZBU3fnlvhynUD0rEmvaQyt7peaIKftb49YrTeWwW8F0qk3uRZoChY1T5ShGEB3jmJ97x810LR14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765439457; c=relaxed/simple;
	bh=Tdaj27oj3uUmgl9B6hjdaVnC0Z/17Xx96phCTkl90B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUILovlTAitabRO4fy6rHMMPZ0vcxG4kY4D+OrHU1bj1aAEds9w9ehCmIgJexe00UMCb5BkttZrd/eAbhVgn3eDpQnZv0DJR2mFTzu38qqb07EqbPyOd/4t6QwmDaYKpxecaewUTqx/BqBNV2jrfuzVT22dxRR8azbWg5YZcmKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GVitsYzR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=smI0YqLN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GVitsYzR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="smI0YqLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765439455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1julX6+lHM93SRmQtBaRqoKkJXlGzuQZ/nqcTrNS9W8=;
	b=GVitsYzRRkOluXQJQFd6zxkmyLxs38X1qvXm2hvQph0GGDq7rnc8k3ZrRTwieRh5/UQDTj
	Ld0NvuMzbOeic7uKdzZIrUP7ZZ1BzyiQyz/xiTjlT69zQ8z/gfntqTnA9Lnrbr72nHCegc
	y1C1VpviDrwiUuXxh+O5CTQlPb6JWFo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-V17B_y69NZm-DmLg1h99bw-1; Thu, 11 Dec 2025 02:50:53 -0500
X-MC-Unique: V17B_y69NZm-DmLg1h99bw-1
X-Mimecast-MFC-AGG-ID: V17B_y69NZm-DmLg1h99bw_1765439452
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-477964c22e0so3606145e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Dec 2025 23:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765439452; x=1766044252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1julX6+lHM93SRmQtBaRqoKkJXlGzuQZ/nqcTrNS9W8=;
        b=smI0YqLN0caaqEi8xK7wSUiFiGk2rr/IGovPcOkVd9MuiGJCbEYiTlohjSNhhI1Nki
         bNs24xixCkHqeeHZL9hTzuaE1oS+pn92lek342phV8TnjQh1O6FIptxR8VpfmvB0Llmd
         i7kvl1S4Xbly2xrwXv8MPQNN/cAP1IZYhFnOhdlrJBc9syjktwXRJw8yRMULuvE9bCWN
         zGNAyO94iC30BeH2ggNmj5iVMdIqt155Uj4kw4AvxW45WWK7AGUTfXSDd37OoFdiC277
         I0z1kguWE9x5jSl1QNgLKx4mUXGKTITEO2qj+Lq/Ca9GGA0qAu1RIkqMCWm+khPlrQxg
         IpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765439452; x=1766044252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1julX6+lHM93SRmQtBaRqoKkJXlGzuQZ/nqcTrNS9W8=;
        b=nHGtZoT5p8/Q+JHtvZz5nEc0iRgVHLa+Vnn2Mq/qEZ8y8IyS7QuhgQPRhKY5U/jDoN
         9q9I+5f8wVq2BKWxiKUp2YsSvnpXE0j8DfDv4BsBgjFzgGzkx1WeFMKLUPOFAViD5B5X
         EuX5uurDEtFP8KDX0eokR3FQ4VaQENvE76xSn9hWBh3wgRq+akJX6NWhqMKMJ9kqfLlq
         4YFnbQsElZiC65DlpaYSj8o0Uy9QZkG+YJSqC4QDg+PkSdhfERKkbNSc5SpJlLzvkxl5
         Prc9Qo8ttW2h3VWX+FMZzgtPBj+RNHZWL5nq9EO898J8NOCgD8cCfp+oQniGriXMmq4C
         OYsg==
X-Forwarded-Encrypted: i=1; AJvYcCUhKMPX86R99Yx6QMGmy88iHsJmM+T/kE/AKbm99mNnJkqHIuR3QAXbbpShKxavJzcztSXBcPnS/DXvliKQ0Iw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgOotUM8wKohrjaJ6+9WWcdBhRmkRch5W4TSVw/MCUK8B6LRT1
	jaMvCucF32ox1ovLHL9eWBr/0SdAlSBbztQc1/hkehMNLTCp131jPo5E4eJW2/4iQuGFKgxwsM1
	pFabl4a/NZIVT3iaQZXEl1XekkHC7JximQT1tmd6yQCCWH1sZW8/KYHo2wzOHeE3wQxkQLQ==
X-Gm-Gg: AY/fxX7OdwEhM6/bCh25p85QTty/0wXmUVxnHwNum+/5eVh0MVg/ZVwR7jkVtPtex5c
	FB1tbRvCyr3vtvhxmMgP5h9PCFPTn6M4kygfNEdw4JijMmOP0vrjupNdKJT9W9UOSTDEXU+arit
	nMBot7jM7xHdSM+3F7KEQh6Q9IV373QJf2AGe7xCA+8VKyTAiOOgxw/7TN7K32djW9U61cRZib3
	pXUCyhrTAhaaqSHS6kxm4kF2v7vgEaQ35l30Deb3CdIcJ7Pm4hRUZLvoSV4V3gAZGnnsjs43eB7
	EJOhOIwp294xCsrTx2zbPnZ0DGOlKuvTIiLHn7HczoZ6AwMr54EufMojYjeYjOtnpKUtu5wO++Q
	tFW6Z3APkMzUuk8ZYfj33bug25Yp0VAg=
X-Received: by 2002:a05:600c:c101:b0:477:7588:c8cc with SMTP id 5b1f17b1804b1-47a89da461emr8884075e9.7.1765439452369;
        Wed, 10 Dec 2025 23:50:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqSjcn3rTA9O8e0vbxus6mZdzQZ1RPlwK+jJom7NtOKCUAyJXsaTZy7V9armCUnMlhTK9Uqw==
X-Received: by 2002:a05:600c:c101:b0:477:7588:c8cc with SMTP id 5b1f17b1804b1-47a89da461emr8883815e9.7.1765439451922;
        Wed, 10 Dec 2025 23:50:51 -0800 (PST)
Received: from redhat.com (IGLD-80-230-32-59.inter.net.il. [80.230.32.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b96c70sm3927469f8f.37.2025.12.10.23.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 23:50:51 -0800 (PST)
Date: Thu, 11 Dec 2025 02:50:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
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
Message-ID: <20251211025034-mutt-send-email-mst@kernel.org>
References: <aTp2q-K4xNwiDQSW@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTp2q-K4xNwiDQSW@stanley.mountain>

On Thu, Dec 11, 2025 at 10:45:47AM +0300, Dan Carpenter wrote:
> Return a negative error code if the transport doesn't match.  Don't
> return success.
> 
> Fixes: c0cfa2d8a788 ("vsock: add multi-transports support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>


Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> >From static analysis.  Not tested.
> 
>  net/vmw_vsock/virtio_transport_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index dcc8a1d5851e..77fbc6c541bf 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -1550,7 +1550,7 @@ virtio_transport_recv_listen(struct sock *sk, struct sk_buff *skb,
>  		release_sock(child);
>  		virtio_transport_reset_no_sock(t, skb);
>  		sock_put(child);
> -		return ret;
> +		return ret ?: -EINVAL;
>  	}
>  
>  	if (virtio_transport_space_update(child, skb))
> -- 
> 2.51.0

