Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337D92BD582
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Dec 2025 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765441820; cv=none; b=uEQGgvK6LEiFeIGk83U6bPl5E8T4U8Ordb/sjL7t9DwFSB7JB2X/cI6NW9jRfxi98+/rbfTKwI2e8NHSkI+6ZFswldWej9P8ZxOuyNApEz8UuXz6KsOyDkhw4RxDhxXZqO7H2YoqpOOtiK/r/UhSlPnjd3nPlEgOdtreoz4Dc8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765441820; c=relaxed/simple;
	bh=vx2flSiC2ZzOI6DHmbaRJhsf8cDKzOr34NF/08N2QWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGwAa8f1JUEDJ6RLEEprsWKwrKHMhgDvYcODiKB6R488cAyc580Wu6qE/uNGXaNTgDUEOODZCh0P5pVFXYkRzXIKLIVjOgF02YfQHWLcZQMnyKF7X4usluCNZvafqEF8tKNGFeQk4N3mov3hlAYBm3G+wnunr/pyNqmRUNhs8VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gl5JuO0+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fc+tieC6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gl5JuO0+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fc+tieC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765441817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3idtZY7mSmwvuTMlPGQ2Fz6MYA6aCNvj4wJ0sTbDzCg=;
	b=Gl5JuO0+e89kPHnvrlrixYy5PrTEooa7b4mEm3Rx5kSkDI29SIkavtekYP/bevO9hR6mh0
	Xr5YldpxwaGZIJdTZmOwVTEIar/2VuLq4gi/t4VkcMWKjFBuELAmUT9Bra3BLf6+cGrFoi
	aAn7QrxP61ab5TiOwDnPfJNbPXtJUy0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-i8TYeBhwO3C_KznfwczdCg-1; Thu, 11 Dec 2025 03:30:14 -0500
X-MC-Unique: i8TYeBhwO3C_KznfwczdCg-1
X-Mimecast-MFC-AGG-ID: i8TYeBhwO3C_KznfwczdCg_1765441814
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6460725c6a9so920090a12.3
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Dec 2025 00:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765441814; x=1766046614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3idtZY7mSmwvuTMlPGQ2Fz6MYA6aCNvj4wJ0sTbDzCg=;
        b=fc+tieC6P1z/rzyYPxLlVmEYMkUXnQAMEKDI9pDDyBUSDUiGFcJQplFZupXzqtFUzE
         +Nn2BxymCc5bkjrzdHcPZURYKv11aexFu4/MIiH3at1MLvL8JeOhlyNim158q9gSNsPl
         JvzS7yUZwfwJhhf2DMd67xHHQX/zT4dZXCwtgqpLBj2B5NfYLGvQD8nxwdEsP9se8Wm7
         1BHiZyorGTdLMg1bLRkQ0hcKGDUCupXmkaqPRO3qWbNB2nHh2Qkay9H9cR+fliKY0AGs
         NAKwXyAN4/dVubSks5KGltoheIDnsZmNLvkzGknua0WFY34Ct/0zs8h3VGxx3QxX2wXt
         vd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765441814; x=1766046614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3idtZY7mSmwvuTMlPGQ2Fz6MYA6aCNvj4wJ0sTbDzCg=;
        b=MKnjiPEkIdIP+c49S+h86YLpr9glVYMGAeb7oWxcis8BAXlVmxBfX3zXgXqJfDIxJg
         1iGKeUFg5Khedr9dbiPYNHJLGE4ciJlUvDdtKKiycfL2+kUj3yrV5yYtGF+N04EbW8hm
         th14a6WGj0RrHuv9v6CWoZVCZykBzBP1EXaUFB4lJlof7E2n8/I0eRWzddCZxUo8j0S6
         IB3p7TNQccBogtcQhMXk+izR+ZeKkRqHs6G7aX79HyXxKTFmcY5QzyN28FLTnHICUgyB
         mH4Le5n+tuyeZXidCgQ3kloR9fHqQQyI+NlNuFXXvpsmH0Uqp0o4/BQqAuIEYigowO6T
         j3Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUxCqsydciTJdu8Yd01v85Z5KKHdFE9WvADMKLNMKpr3D6B5fknVkz/JAuZeQ0MGl1XnfvWBTTm4uHVJpSb5Yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHJ4QnDe7PIFo+0Yw4wySMBhVX+HxaqbnQzRRTJWk19Tal2d9S
	ZSmYgzJvQyeHMKdUWJx1dYy7TsaCqPmsp/V5rBIIBoKi42yXs3sEcgvbDHrp2Ba8a0VIfOF5gvJ
	TXAhGNgdPaZ+mnmLOagTHgo9z1DfAzR3TPD4hlS8Jn44arKJ/TFxd790Rt5RYLA450GgFKg==
X-Gm-Gg: AY/fxX4ezzU1bQn1vsv8v34GL1+/49j/a9DCTlEm/yaMH9oOB9zQrOMk7ox49FgY/gF
	5Ud9bijFKx3rzWh5kixlaAN1+zsBbI0yOK6ZxIW1XWRllGa+T+W6cV70GMD3k4FwRoK0WIFsZhv
	S026D9P/b1UNGXBMFS7WKh907px27eQH4rxx3kFH51vu55/UbsC53qn9dJ33FoNk4VxFPEJ630P
	p7WSmG+InKd7vNpoTETsH5A23bIiQhCA8KZ6c5+c0bpx5CrI9Mh9QXOcwW4y1paKi0GqLscw0t6
	8tsC4YSXzNEPHPYse2Rx7S4O1IC8eeitNJL0ZrGMoFaFM2Zc1ax5d5xwk/GtTweL644fbN+hCC2
	wQAEBHVddZZfzbbQ/CH2HwmEkhjVOgXDkOZP+/HsmODHcye3fBX6bWs6vpb2e5Q==
X-Received: by 2002:a05:6402:2786:b0:645:1078:22aa with SMTP id 4fb4d7f45d1cf-6496cbbc23cmr4596715a12.19.1765441813616;
        Thu, 11 Dec 2025 00:30:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuwQjT4UHTBmwDXqoTBxPbsneTQexl6Aw6I9Srmcye45B0nUYzXfaqL0GoFMZfWMLEuTvP7A==
X-Received: by 2002:a05:6402:2786:b0:645:1078:22aa with SMTP id 4fb4d7f45d1cf-6496cbbc23cmr4596676a12.19.1765441813080;
        Thu, 11 Dec 2025 00:30:13 -0800 (PST)
Received: from sgarzare-redhat (host-87-12-139-91.business.telecomitalia.it. [87.12.139.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498204fbb3sm1831786a12.8.2025.12.11.00.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:30:12 -0800 (PST)
Date: Thu, 11 Dec 2025 09:30:06 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] vsock/virtio: Fix error code in
 virtio_transport_recv_listen()
Message-ID: <xz4ukol5bvxmk2ctrjtvpyncipntjlf4bdr7kjdam2ig5gf7ho@vuuwwu7asj7i>
References: <aTp2q-K4xNwiDQSW@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aTp2q-K4xNwiDQSW@stanley.mountain>

On Thu, Dec 11, 2025 at 10:45:47AM +0300, Dan Carpenter wrote:
>Return a negative error code if the transport doesn't match.  Don't
>return success.
>
>Fixes: c0cfa2d8a788 ("vsock: add multi-transports support")
>Cc: stable@vger.kernel.org
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>---
>From static analysis.  Not tested.
>
> net/vmw_vsock/virtio_transport_common.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index dcc8a1d5851e..77fbc6c541bf 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -1550,7 +1550,7 @@ virtio_transport_recv_listen(struct sock *sk, struct sk_buff *skb,
> 		release_sock(child);
> 		virtio_transport_reset_no_sock(t, skb);
> 		sock_put(child);
>-		return ret;
>+		return ret ?: -EINVAL;

Thanks for this fix. I think we have a similar issue also in 
net/vmw_vsock/vmci_transport.c introduced by the same commit.
In net/vmw_vsock/hyperv_transport.c we have a similar pattern, but the 
calling function return void, so no issue there.

Do you mind to fix also that one?

Sending a v2 to fix both or another patch just for that it's fine by me,
so:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

