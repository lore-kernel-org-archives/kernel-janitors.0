Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EBE19BAD
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 12:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SwU6NKsT"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E5791
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 05:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698754523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoR9dw6L/vKtUpLEuCDInEx5ZPoBrI/+MTbYlj10org=;
	b=SwU6NKsTeR+L4rvVo6p8sveANguol7GMTrNLKl/SIFAalVOkzJl3fL7PhrcPn/SrH9NEaB
	bYyTk8dTV0DFCOveFoV7rES5OOySwgIQfaryClrsIVsCIblSUr16OXaFYAMt6NUhPvi/+m
	3oL9ca+R4ephdnk2WGPP1NifncXV2vw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-rGNmuBYHN0WC0wJGL0xwGA-1; Tue, 31 Oct 2023 08:15:11 -0400
X-MC-Unique: rGNmuBYHN0WC0wJGL0xwGA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9bfacbcabb1so40446166b.0
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 05:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698754510; x=1699359310;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SoR9dw6L/vKtUpLEuCDInEx5ZPoBrI/+MTbYlj10org=;
        b=c4hApvwcsaJ/jvPnS1ULJRIBXzVlAasGd9YiuI93DkiAJeiU99MeSyuCP3eu00115S
         aLbmKCTBaJna8xwTJNCP1wK3A7R2i3q9I/O6Dv0W8T5rEAOT/9WVsAG8JyAWrsCf/nCK
         DcqDiFQ9GE2jBH5DhAjIEqsCESyq41BO+AAPi6LqHiCpRxN+iGgI8SFcEMSxst8jfwww
         O5Vv07OibyE1FEvKNkt+5Ao1j1OaXXz2ZwPEo3xte5P4Id/Y3pgBisQnO5yggblMaUSD
         h2aiPvwl/d0aixop1sM7KFt4PkhxBgxBoWDb1kiFVo8wy24xln2hQeOEtVwJ+4aauarn
         Kp+w==
X-Gm-Message-State: AOJu0Yx50Bjhpqv81+dXjsOBkD/82lrgkTelO/rhaTSVrzu4tZAMvBr7
	layBOOfLOj8uy3OpxTqhUP56F4D8QxUdqM3YXOkfyBoq0EqPV49TtlvIClCGkA7CtBexCWwLDD5
	UBDzXC/NZRApowA1yI10hw3NhU8Ea
X-Received: by 2002:a17:907:9405:b0:9be:4cf4:d62e with SMTP id dk5-20020a170907940500b009be4cf4d62emr9516795ejc.5.1698754510603;
        Tue, 31 Oct 2023 05:15:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBvwB67W/f+yVP3Dv0iKy2fv/66/hwvd3EiFBACxC0Tx3iEplTHKVNimG9IJ+puWZAXtyhRA==
X-Received: by 2002:a17:907:9405:b0:9be:4cf4:d62e with SMTP id dk5-20020a170907940500b009be4cf4d62emr9516777ejc.5.1698754510287;
        Tue, 31 Oct 2023 05:15:10 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-227-179.dyn.eolo.it. [146.241.227.179])
        by smtp.gmail.com with ESMTPSA id ha19-20020a170906a89300b0099c53c44083sm881336ejb.79.2023.10.31.05.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 05:15:09 -0700 (PDT)
Message-ID: <75d2f17bd349e220e8095730ef878c358385ae6f.camel@redhat.com>
Subject: Re: [PATCH net] hsr: Prevent use after free in
 prp_create_tagged_frame()
From: Paolo Abeni <pabeni@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Murali Karicheri
	 <m-karicheri2@ti.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>,  YueHaibing <yuehaibing@huawei.com>,
 Ziyang Xuan <william.xuanziyang@huawei.com>, netdev@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
Date: Tue, 31 Oct 2023 13:15:08 +0100
In-Reply-To: <57af1f28-7f57-4a96-bcd3-b7a0f2340845@moroto.mountain>
References: <57af1f28-7f57-4a96-bcd3-b7a0f2340845@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2023-10-27 at 15:19 +0300, Dan Carpenter wrote:
> The prp_fill_rct() function can fail.  In that situation, it frees the
> skb and returns NULL.  Meanwhile on the success path, it returns the
> original skb.  So it's straight forward to fix bug by using the returned
> value.
>=20
> Fixes: 451d8123f897 ("net: prp: add packet handling support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  net/hsr/hsr_forward.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
> index b71dab630a87..80cdc6f6b34c 100644
> --- a/net/hsr/hsr_forward.c
> +++ b/net/hsr/hsr_forward.c
> @@ -342,9 +342,7 @@ struct sk_buff *prp_create_tagged_frame(struct hsr_fr=
ame_info *frame,
>  	skb =3D skb_copy_expand(frame->skb_std, 0,
>  			      skb_tailroom(frame->skb_std) + HSR_HLEN,
>  			      GFP_ATOMIC);
> -	prp_fill_rct(skb, frame, port);
> -
> -	return skb;
> +	return prp_fill_rct(skb, frame, port);
>  }
> =20
>  static void hsr_deliver_master(struct sk_buff *skb, struct net_device *d=
ev,

Acked-by: Paolo Abeni <pabeni@redhat.com>

(note both trees are currently locked now due to the pending PR; this
tag is intended to speed-up the merge after the PR itself)

