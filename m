Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CDB1BE251
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 04:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741582557; cv=none; b=BbYxHSic+IJLKv1ItB3OYOBv4JsbUCwityxbEFPiXAlvfWPjqbNiTiUQgtt8VjlJmquhCdrS/Sg8UxpwZUnKQmm92yNFQR4XG5GuKJdJbVzRcnAe4mD2dVwMum3OVrpX/kvRmbRCfzES1W3urV8BJst5ruSwMH0GoOkEjRp5ueU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741582557; c=relaxed/simple;
	bh=s8/EMeFEWEYah/ToEcdcQneRc/EsdPCJPwOwk2JfRWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=la58Mok+dGyiEJggh68HXwzsxpDfW3ZfZ+wR9/NmfIWJfKW47AcrITxSOjh7ohfqvuoWFcwx63sjVhmp+0Ewv77lcorRySpjVNMZD97IoojFEdH8/+C1VhWQxm7KtPoAoa03VZHjYFh6xxvz60xnwvYkc4hQoTbysekyLBPA/ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vc1eJfto; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vc1eJfto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741582554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AGNHJW4HHjvj/4hx7d09Bc4jJVzUfVQWIWoaRlJrRIo=;
	b=Vc1eJfto8PJKm8+DlR0CXyekLXCjfbcUksSe/OUwaJii9RT5kHvfvRwlPAIYxhQ091IxRh
	V/+DSz6hAadZGcL5NHMikOEiwECtpeUT9SoUGLtW3XwJZdT7cKo5xoY1xPj5lGYg0DDaqp
	m7cfG743vwe9ySIzAjuEdFiui/X17O8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-y-K_10KRN1qCL-vOzpBdbQ-1; Mon, 10 Mar 2025 00:55:51 -0400
X-MC-Unique: y-K_10KRN1qCL-vOzpBdbQ-1
X-Mimecast-MFC-AGG-ID: y-K_10KRN1qCL-vOzpBdbQ_1741582550
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff798e8c93so5413909a91.2
        for <kernel-janitors@vger.kernel.org>; Sun, 09 Mar 2025 21:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582550; x=1742187350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGNHJW4HHjvj/4hx7d09Bc4jJVzUfVQWIWoaRlJrRIo=;
        b=P/sI6QxKsMLtsywCU6zRb4gLxUX92/tu34QjtfxHSxkGXeNRNVBVkU7x1GmN+6+fMI
         8sUgCFACrCipDhDTHatlYmJteivlkeIFKdsn+W5RM8nP7RWt5ioyzfeJ+7uCrqdp179r
         EYHJDhstUtzwHHtputjRnfmqLXF3Y59Slqg4kpK3EKi2kOmJGH8wIfxtNMrNGMJNC55x
         oXvlHgocHPw2UUqdDh+dWSMUfessa95QgJ8gdnvIQ55FUZLNXwy3yZUE+KJL4guO4ib0
         Dr8Vv6rnGPHGwi5VoUo19fosTzho0NKc5TtQ2hVKdg5JBncXl/sgQgEu/Rsl665XKL5x
         w9ug==
X-Forwarded-Encrypted: i=1; AJvYcCUHROrOzCe1tQaXZ7OMQzycV5LtkRx4Bit34OKZ7nHUTwsOmtb1Jl5lTjR1X746EA1zP+BnKvzhGxCAILMmVvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUEoegl/ljjP+6U1DOB6N0v4QQINXlnCDMafVkRwn+RR6SkRWw
	IgfQ5rHE9M8l0oyz44CXtllVB7pV09MheJ9VbuyYvkfF1+/BQpc+Uh1eU+w4pCR/respE6sLTr2
	cqARLBMApjYFY1uTnRTm7JjdvXzpn2EkdZrsdTqy/QEHmMWaFZPdry82lKzgqfynT4zTsrHBPIp
	O9Ftkmw4XDHCVjA18PN/XQDTWexsgJm1g+pzjmKAqc
X-Gm-Gg: ASbGncsfre4hLVy/LGey1yFe7+TfrEBzIwyRhAlEnvUO9UC0ZZcVss+RquOg2hVupSw
	HLOHm1Q4RTiGez+Otk9aaukG45f6vyaekW6PZNtVpop5DFjMEN+I5H3yBEDigK93dMCGWbBW4zA
	==
X-Received: by 2002:a17:90b:1dca:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-2ff7ce63264mr18532336a91.4.1741582550418;
        Sun, 09 Mar 2025 21:55:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9Xo0gpzEFD/TRddMKMUNDMbauhJ46adEgdxNBxtmb8EtkPrUSIh1rFd5iEsD5Yp2BE7jzIDOi/82H1hGyNkU=
X-Received: by 2002:a17:90b:1dca:b0:2fc:a3b7:108e with SMTP id
 98e67ed59e1d1-2ff7ce63264mr18532310a91.4.1741582550025; Sun, 09 Mar 2025
 21:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a18fc6cf356bc338c69b3cc44d7be8bd35c6d7d0.1741028854.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <a18fc6cf356bc338c69b3cc44d7be8bd35c6d7d0.1741028854.git.christophe.jaillet@wanadoo.fr>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 10 Mar 2025 12:55:38 +0800
X-Gm-Features: AQ5f1JpXzBv8TIF6oxVj41FiZlnmi8yR2xYeZ4UVuxEvdCcbm3NW-Nyvl6onBwo
Message-ID: <CACGkMEtRFtzb-hbt6N8YJo8nfOOvaPcaw4dLkfs5CWN+ypkLeg@mail.gmail.com>
Subject: Re: [PATCH] crypto: virtio - Erase some sensitive memory when it is freed
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Gonglei <arei.gonglei@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 3:08=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> virtcrypto_clear_request() does the same as the code here, but uses
> kfree_sensitive() for one of the free operation.
>
> So, better safe than sorry, use virtcrypto_clear_request() directly to
> save a few lines of code and cleanly free the memory.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> I've no idea if this is needed or not, but it looks not consistent to me.
>
> If safe as-is, maybe the kfree_sensitive() in virtcrypto_clear_request()
> should be removed instead.
> ---
>  drivers/crypto/virtio/virtio_crypto_core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/crypto/virtio/virtio_crypto_core.c b/drivers/crypto/=
virtio/virtio_crypto_core.c
> index d0278eb568b9..0d522049f595 100644
> --- a/drivers/crypto/virtio/virtio_crypto_core.c
> +++ b/drivers/crypto/virtio/virtio_crypto_core.c
> @@ -480,10 +480,8 @@ static void virtcrypto_free_unused_reqs(struct virti=
o_crypto *vcrypto)
>
>         for (i =3D 0; i < vcrypto->max_data_queues; i++) {
>                 vq =3D vcrypto->data_vq[i].vq;
> -               while ((vc_req =3D virtqueue_detach_unused_buf(vq)) !=3D =
NULL) {
> -                       kfree(vc_req->req_data);
> -                       kfree(vc_req->sgs);
> -               }
> +               while ((vc_req =3D virtqueue_detach_unused_buf(vq)) !=3D =
NULL)
> +                       virtcrypto_clear_request(vc_req);
>                 cond_resched();
>         }
>  }
> --
> 2.48.1
>
>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

