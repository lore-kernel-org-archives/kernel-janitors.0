Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71273F8F1
	for <kernel-janitors@vger.kernel.org>; Sun, 12 May 2024 16:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715529730; cv=none; b=CkSsVJrNrRQrqA6dQ3TTwxFkWwHFgtmyivvbw3tTNTJ37+nS6x4O2GmBJXuOYHZgkPayv6L182sOupy6CDuh+MpjIOcUhkrR6xWmLpccVK0zsFXWT2ZkPNzfbGhT/iNQ8aNlq8k/UZfE+d7VJDxx0A4/8F0mTDHjCvgUZFY877E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715529730; c=relaxed/simple;
	bh=RxSDTegW7CO/59WWa4N5BIOvsZNO4JGLYbZ0l9O8rwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WU54ujfMROjUDzbf3FB1qin1mS/bhycLby07Fc98atapX9E/aQWlnjrRhh/jdNFwKYaBdkGYKiwe09WK40NhzbQsQK8GUMtmgcD6fbt3Vy62cIY5tKS0mgNKWjQu8fs7thnUmI98Q5GZZ5HrU+n9YtgUe8qEeKAWNh2nkqUETnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WApM9CmK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WApM9CmK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715529727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AxLpy9sLIlZS5JyNf+AGoRDlBshQGmESMZNZDTclcZQ=;
	b=WApM9CmKS2KDNzOMeUqaP4QWmuiMOv1hg93VzGU1o+ul4ng1Pa8PLIWjbyFU5mieUC7oa4
	hjPhVEJXfUFhsXoNoy50OSjSnabjjyuEo/omZgRywbiQYxqOc8pNZ3SYTAnE2rtLbBaNky
	6IK/iaioIAhAMFL7EQk9jmczZq7mPNs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-Dq6NN8daNkW-0yEHIYJr3Q-1; Sun, 12 May 2024 12:02:04 -0400
X-MC-Unique: Dq6NN8daNkW-0yEHIYJr3Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a59a0d2280cso282540066b.1
        for <kernel-janitors@vger.kernel.org>; Sun, 12 May 2024 09:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715529723; x=1716134523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxLpy9sLIlZS5JyNf+AGoRDlBshQGmESMZNZDTclcZQ=;
        b=ejm1GnrFpGMvsn7VEdkzT3pvE8tfJdZjajAwtd60lEqBGFw0z9RLC+nK3ksXraSXAP
         2dJTPlowirqD1AEHqQ3EgydkAs4FOC1KncxgYGv6srZL2C3Fop6hmImqf/ilZ8J8QQ4q
         irk297lONvRt0qn+Ll/tvq2lxFf7wfHsxOvm3w6Icn2rOdo2kUgxF7CBJUqvErN1/YDg
         yQrmS3R+GoYkYOpf719lgjzV01aNzUd6vmTi1YnaonEG62FTps2R+qkFffbwlLXeq0E5
         6Dby1krOfBJO4Rd2Wi33h7qTe4w3bouiUDRH7VXRFR/wmMyynxkAXGRv2F1IVTtkBXFC
         nYbA==
X-Forwarded-Encrypted: i=1; AJvYcCWUixEzgicVLKp3Ozigx5iCpMx5XSGqF5u0Nf0I72/cNEkof1KdZSHT2zXQ9PZgBAzaO8g5Cxu/uDkxDlWmn96kADfFArGnHZ+cOWgM4ek3
X-Gm-Message-State: AOJu0YzmMfEP3/d2vQk/BDpKRpqlSRYJZUMSqH/urC2gS36bqaGo/YFx
	AdMPKzEC2yTa1HvYGcKPCd38aFzL0uchCRQZ8H6RGQoB2ZSAIwXpD7bN7bxijt9j04txzUyfxOQ
	i1EzoL9hdDjzhtH0GQldLin1qnJcpY+dTfJ3AXj43tCddem9dQv/ZzfCmYvTINV+4EA==
X-Received: by 2002:a17:906:c405:b0:a59:c319:f1e0 with SMTP id a640c23a62f3a-a5a2d681e12mr464655966b.75.1715529723189;
        Sun, 12 May 2024 09:02:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRCDOgxb5kjSSoH51C64l7LHObzt/SMo/s+DeV5DWeoHqnDcKMdPA3OGfhMkwQa5PjbfnFNQ==
X-Received: by 2002:a17:906:c405:b0:a59:c319:f1e0 with SMTP id a640c23a62f3a-a5a2d681e12mr464653366b.75.1715529722576;
        Sun, 12 May 2024 09:02:02 -0700 (PDT)
Received: from redhat.com ([31.187.78.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1b602b39sm455227466b.50.2024.05.12.09.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 09:02:01 -0700 (PDT)
Date: Sun, 12 May 2024 12:01:55 -0400
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
Message-ID: <20240512115645-mutt-send-email-mst@kernel.org>
References: <3762ac53-5911-4792-b277-1f1ead2e90a3@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3762ac53-5911-4792-b277-1f1ead2e90a3@moroto.mountain>

On Fri, May 10, 2024 at 03:50:45PM +0300, Dan Carpenter wrote:
> The virtnet_send_command_reply() function returns true on success or
> false on failure.  The "ok" variable is true/false depending on whether
> it succeeds or not.  It's up to the caller to translate the true/false
> into -EINVAL on failure or zero for success.
> 
> The bug is that __virtnet_get_hw_stats() returns false for both
> errors and success.  It's not a bug, but it is confusing that the caller
> virtnet_get_hw_stats() uses an "ok" variable to store negative error
> codes.

The bug is ... It's not a bug ....

I think what you are trying to say is that the error isn't
really handled anyway, except for printing a warning,
so it's not a big deal.

Right?

I don't know why can't get_ethtool_stats fail - we should
probably fix that.


> Fix the bug and clean things up so that it's clear that
> __virtnet_get_hw_stats() returns zero on success or negative error codes
> on failure.
> 
> Fixes: 941168f8b40e ("virtio_net: support device stats")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/virtio_net.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 218a446c4c27..4fc0fcdad259 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -4016,7 +4016,7 @@ static int __virtnet_get_hw_stats(struct virtnet_info *vi,
>  					&sgs_out, &sgs_in);
>  
>  	if (!ok)
> -		return ok;
> +		return -EINVAL;
>  
>  	for (p = reply; p - reply < res_size; p += le16_to_cpu(hdr->size)) {
>  		hdr = p;
> @@ -4053,7 +4053,7 @@ static int virtnet_get_hw_stats(struct virtnet_info *vi,
>  	struct virtio_net_ctrl_queue_stats *req;
>  	bool enable_cvq;
>  	void *reply;
> -	int ok;
> +	int err;
>  
>  	if (!virtio_has_feature(vi->vdev, VIRTIO_NET_F_DEVICE_STATS))
>  		return 0;
> @@ -4100,12 +4100,12 @@ static int virtnet_get_hw_stats(struct virtnet_info *vi,
>  	if (enable_cvq)
>  		virtnet_make_stat_req(vi, ctx, req, vi->max_queue_pairs * 2, &j);
>  
> -	ok = __virtnet_get_hw_stats(vi, ctx, req, sizeof(*req) * j, reply, res_size);
> +	err = __virtnet_get_hw_stats(vi, ctx, req, sizeof(*req) * j, reply, res_size);
>  
>  	kfree(req);
>  	kfree(reply);
>  
> -	return ok;
> +	return err;
>  }
>  
>  static void virtnet_get_strings(struct net_device *dev, u32 stringset, u8 *data)

