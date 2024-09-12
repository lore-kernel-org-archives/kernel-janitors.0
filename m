Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6182C80
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 21:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726177148; cv=none; b=hMH3OaGFZ3XZ2ljI/F69kzsPamWckTGgN4Vmkm8sUok9kJnKQkTtMPWXh7WAg/YaHR+qySb0hPJ0vpTcy4pf/8EQZ2xrUq8dllKO+XE+ZQnxDD6qI5jdWrElPRz96+B6eBCKlZ2QkLG8IAiGVBW5/hPHy8UE9GOdXUl7+RPp1u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726177148; c=relaxed/simple;
	bh=4Z3y2ExjN+sfTTdyRG0DobCkSSROnQTal3/BbxZMT9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/7kRLZCJ/D1JOKrbZVjx0nhElnSWUmiRxOJm1hs0/NmosJZqOt7tDOJCOMhz8kdy370yHoq5/tvrgtcgBZBjlnDHnW324QF7vKFh820h3XoVAFKlgUALRiu6owXhpTuKNPSy6gKUmYrvrk4gfDZdMjsovjnteT2PeCcdC4I98M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vfs2330D; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vfs2330D"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-49bd221ef66so515052137.2
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 14:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726177145; x=1726781945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnUGUKViCW+3BbsFSQi1k9zreDMxoTLJCm+OUAY9KGo=;
        b=Vfs2330DNJLq5xxxuyFZxGs3WNFutnpK40tzMZWQmWVEW3SlXjEoNQY+83ncFFP8AL
         VtPIKa5W+jTlDZivm4/B01taHcY1psLA7U2zgECcxQlqDyODTD2Nt0N1JweEyDnfXeyu
         Du1prOVsF2+tpJevfSU3nXj9tJwO98i2Er+9mqXFNCieK2TWFB3kc4u3eMsbeBXdaafw
         nrrgVayxzf9c7Srfzdb4WX1FViw7Ic1a3lJPvui3PxtnOPi8nh5fkddMtCpAvMhFveTC
         RAqsXdPu7Tv5vkjxBWH9t7VRAiKw4d/PMuWi0+/2ylsNun4Ig8+7dadL7FmDKJ80Q1tE
         bDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726177145; x=1726781945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnUGUKViCW+3BbsFSQi1k9zreDMxoTLJCm+OUAY9KGo=;
        b=V9DbcndKDAk6F5vDH44MG9K8VKS+Nks/TeaUSqtICUIVZp/7HE99Yxg9p9suVQn/Lw
         +uPtEtNrqS1zyBjtZG/6W/fa2Nnoa6piMpLN1wVid78BodPpP+ZR8dgKSLQw2qaXQARK
         jwURoEWpCoUZ6G1wbHtLiYfR83ZBy9P11zCdbkdO91dSXXDWE4SvZa+OOqhSwhFoZ+hP
         LeMnZ+1WeRY4IIA+tsVoAoe9rbl/hMpmv4Iero/2Pn9MzdpMRU5L8L/8h7zxa2BrlKud
         O+D7YbsWHK/+w0J6H6t6HoX79P2cO/lky24lEH4QLgo1U5Si71JVK1OjS2Lx3oQXHx17
         as8A==
X-Forwarded-Encrypted: i=1; AJvYcCXa5bm37Upm1wGjm5+NyGmtFt0oAhZLWzThTgS3wmssX01KG/yTFwlWlge/cxgMld22hqRfmAK50VO2q4nQS9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC3GwbNy7jQcHucwjb0rBg4XH7QGRxEzT/aLTTdyVqDEn2sAMS
	3FNhaS6aH+ZJQQsWf9cU1h6ndeX2VkCaGOjSpcSCkFGwVqlPE3FiZAXAWzPzZyMX6/dDrXCOTlV
	CeD4n7/fae1w5bIa3CdsXKVpPlM7WFrs5MjbG
X-Google-Smtp-Source: AGHT+IE9lzQsVM3OtKM1DDO5bp6YhBv9ztTqMYR0Z4axeHZ0pxVhuPDcMiTJqM5GQZoQwIGD5+xxoKWGH0xp0FCEwsY=
X-Received: by 2002:a05:6102:3750:b0:494:3a01:e340 with SMTP id
 ada2fe7eead31-49d4147e662mr4516160137.6.1726177144959; Thu, 12 Sep 2024
 14:39:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912110119.2025503-1-suhui@nfschina.com>
In-Reply-To: <20240912110119.2025503-1-suhui@nfschina.com>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 12 Sep 2024 14:38:53 -0700
Message-ID: <CAFhGd8ruRrZM0Q2Z0UJdf98gKvtP64H2k08gvB_=97pWs4p8cA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: tipc: avoid possible garbage value
To: Su Hui <suhui@nfschina.com>
Cc: jmaloy@redhat.com, ying.xue@windriver.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, tuong.t.lien@dektech.com.au, 
	netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 12, 2024 at 4:01=E2=80=AFAM Su Hui <suhui@nfschina.com> wrote:
>
> Clang static checker (scan-build) warning:
> net/tipc/bcast.c:305:4:
> The expression is an uninitialized value. The computed value will also
> be garbage [core.uninitialized.Assign]
>   305 |                         (*cong_link_cnt)++;
>       |                         ^~~~~~~~~~~~~~~~~~
>
> tipc_rcast_xmit() will increase cong_link_cnt's value, but cong_link_cnt
> is uninitialized. Although it won't really cause a problem, it's better
> to fix it.

Agreed.

Reviewed-by: Justin Stitt <justinstitt@google.com>
>
> Fixes: dca4a17d24ee ("tipc: fix potential hanging after b/rcast changing"=
)
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  net/tipc/bcast.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/tipc/bcast.c b/net/tipc/bcast.c
> index 593846d25214..a3699be6a634 100644
> --- a/net/tipc/bcast.c
> +++ b/net/tipc/bcast.c
> @@ -321,7 +321,7 @@ static int tipc_mcast_send_sync(struct net *net, stru=
ct sk_buff *skb,
>         struct tipc_msg *hdr, *_hdr;
>         struct sk_buff_head tmpq;
>         struct sk_buff *_skb;
> -       u16 cong_link_cnt;
> +       u16 cong_link_cnt =3D 0;
>         int rc =3D 0;
>
>         /* Is a cluster supporting with new capabilities ? */
> --
> 2.30.2
>

Thanks
Justin
