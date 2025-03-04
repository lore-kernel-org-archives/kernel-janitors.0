Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4708C15747D
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Mar 2025 02:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741053620; cv=none; b=VRtg/rQUjNwPrU80McaphPVBbTV8WjsE1ExSvI+O2dMzYDX1/j2sMkTtTL3p05N1Pe7UyAdRgTbVIVH8+6Phl7MMnOMbhLD/ooeMROkqra3snzo7bd3eASnQMVWIas3xNmvWzyPkgKlorJe1bwwl++GKCIigc8HGs1vsTZT9uj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741053620; c=relaxed/simple;
	bh=JHk4X3vZ8MFvsUzR7DvpEVGisQVp8HYBRZBRGMOySDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NpD8IwjVANKLcr/4lymLAdmRHmFAHTyANin+H1pLE84vu1H1GJL4UVfh5tK6RKnd1k3RZWw29t3pmyEgjhLtOdKG9iYL6aoQTVlm5z+Ek1kduEvFou7AtfkyNPzLHIVmKNP3hgpmm4IBbUf+yBTJ17ALdcvlHIP8LqmUzudgaJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XcxxmSdh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XcxxmSdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741053618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m6ne55QwhftFYTm3pAMElTqpEZ/LORaNN0Mq/z5tJ9c=;
	b=XcxxmSdhYA+QsDzP8BKPqM+WnyNGQTSnQJvZ10UjR9X/3AAHuTBbnLsv7+VcHmhPPWp1gZ
	2bii9VAs6d9u41lsRHqglYvB72kTPm9haJ/IUagA7N16oaNW0SaI8vkga0nTvXvkr226mY
	DMZFdmJlM4SdTwK7bX5Wd9mA3YVH1jQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-qE6Atf4APR-QA0ySdX8C_g-1; Mon, 03 Mar 2025 21:00:11 -0500
X-MC-Unique: qE6Atf4APR-QA0ySdX8C_g-1
X-Mimecast-MFC-AGG-ID: qE6Atf4APR-QA0ySdX8C_g_1741053611
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5da15447991so5626758a12.3
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Mar 2025 18:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741053610; x=1741658410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6ne55QwhftFYTm3pAMElTqpEZ/LORaNN0Mq/z5tJ9c=;
        b=rthb55AWngIfb+jZ9rQ5J1KrHf4Be5fmXHKEJuEB60VumsTiybc7V4rONsm/8nQXlp
         v3sGahKhUui/ocZoZs0tS4zypd4Ms3pzGuf3i5XXt6/ftrqkw2rFMbP7uD0D6luLGcmK
         N4EGf9TP4ps6O7v5/lNRdWJoxgNE6N0ENKTDGv33ZVLLmMGGoWcgZk1OwVLpt+Yap+XV
         duw87c4NrQkXp5TFQmC+8dzxuAKyD7eJ96ABwCRnlQjjVxu9aLQ8xnb0rD9euaUnudTg
         QiI/iagTtRtLwIFA7TkICyl1ZShkyzcMiFY0gQTO5+oFJjDhAMoNgpwVzbKKbHRvZkB/
         nUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkEXT5UzLzL7j21FElx0QFSzWl8DyTcD2ut6Ezo6jgkegChyrntcYGm+eK8HtzWDwrehio+OkuW9Lxl6yam64=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKpqz9MmUoo9q8MpdPOP0qpqaESlZtPi3873sY2JKAnjmPkjNJ
	P3yuBeEwfpLXb6Pv+jAiAoh+CYt0SyQfo78QMXKkjdXHVBmnqf1hsHE3CuDSeuw2aVSoOGUUy4N
	ANndluSHx7kLBCi4O21J/Az/oerdn2BtjlMae0CJNzElc3XHqBDzojMqImJL2vy7A+cUFYAItSp
	lEjBwxPqiWdgtW56eXIDrqM96eMKDlnnGZXvDvK/c8
X-Gm-Gg: ASbGncu82kPGjHNZ35bFgSyP7dl9D8RSVIx8AfOtdFji9ADGTB95W3ihYCHdjBBIyFo
	oIeK+xwoo/yN+d3qDFCFmjBRHr57kbEil08IShIHEF+lzep9ksEX+JFlW4Ez3SWO6/EXlBaKjfw
	==
X-Received: by 2002:a05:6402:2714:b0:5e0:922e:527a with SMTP id 4fb4d7f45d1cf-5e4d6908f02mr43147295a12.0.1741053610613;
        Mon, 03 Mar 2025 18:00:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGotofsTvb2AxtGxiUYRTOJP55UijhwSHRdhPuwJsFglP+Wr3zMaapIUvoTk6CdgEnWdU6MOBQ50VkHbyyuLfo=
X-Received: by 2002:a05:6402:2714:b0:5e0:922e:527a with SMTP id
 4fb4d7f45d1cf-5e4d6908f02mr43147246a12.0.1741053610281; Mon, 03 Mar 2025
 18:00:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a18fc6cf356bc338c69b3cc44d7be8bd35c6d7d0.1741028854.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <a18fc6cf356bc338c69b3cc44d7be8bd35c6d7d0.1741028854.git.christophe.jaillet@wanadoo.fr>
From: Lei Yang <leiyang@redhat.com>
Date: Tue, 4 Mar 2025 09:59:33 +0800
X-Gm-Features: AQ5f1Jqo2O4hK3oJkjenR9LxQveC5GRpuyXs2Lm3CfD0L_mhdi24D2upTktGsNA
Message-ID: <CAPpAL=wW6szqfPm8goUfM=c2cat9-tyuB-UgwRdtx7s23xe81g@mail.gmail.com>
Subject: Re: [PATCH] crypto: virtio - Erase some sensitive memory when it is freed
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Gonglei <arei.gonglei@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

QE tested this patch with virtio-net regression tests, everything works fin=
e.

Tested-by: Lei Yang <leiyang@redhat.com>

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

