Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A701024A19
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Mar 2024 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710749498; cv=none; b=fFREsasAOSr8Pn1hIitSv6sZzcrCji9GDRfBB40plD6MMELgfKxVCLg/jH1OxLaDMNq8hQr96gMiv3u6DxKWJ7BebiSQgZqA4pb+plx+kJZhrS9uGMG5eufVawMvvV6pXe5FBKwioMdSXMcYqETcWGhciBICXAMJrNtAqZHf/U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710749498; c=relaxed/simple;
	bh=V6znXjGGU3aPA57dEwTHJMwuGwRXM9LRRb2ZgBPhwS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKuErq9fuDNbKFNz53N80pge5WYRZke4wIFkgnZ2oanL2Wzz0iMLxpyql0uIuhf2PYppW4dtz6RYcXGjnp8Pky8EHVw3fI1K33NCp+GZgqUy83AQKa3FvZLXDDN34gzET/YLHFVm3GBFtRkTSV/9Q/tlAOrVj38LTxZk8/2nhg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=elJf6qzf; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="elJf6qzf"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56845954ffeso5313780a12.2
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Mar 2024 01:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710749495; x=1711354295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EgbdSr9trKys7K2fBJUdtpCVbBrhRbc/oyBwbkqocGU=;
        b=elJf6qzf49ZTc9Fft4MO6UfLcFsdwJBB7VUlD4bXUsbTkqMYJv7OyRK1HUQaYWhMhy
         odcqZK6X1ynIu4dfXYBvh1EVzs6HzWIvCF1jZ40t94sMQaN1EbOAPTmBLB4rCkGyH6t7
         jdDhrSzTwcWApEQ2WNWTwgVdgXP+LrytuY5J1jzttZznFj+o5OQj8Yc5P4tgSTd/x3qW
         f6vWDQdSxqgxpEYZPO1WuO/s7AmXyP5ScPItqMWeM7mC+JD5yKaPcSNEvnsEPJ+mRC5j
         uCJO7ys08wwBvnXkJRJp3zsc5Spkc1asbO2hgay9GzdmVwHokJK7SEb326Ca8X6bGC+p
         1pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710749495; x=1711354295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgbdSr9trKys7K2fBJUdtpCVbBrhRbc/oyBwbkqocGU=;
        b=tlZkLcSQWE3xtG1ZYZhiEYd4/RcOIsZsfpTshwqIzATqBdHi1FtkyGWWGGXi2l6hPr
         Hh7SfVlUegm8nEwJzVD+m/F9LsWBeOdU9i/f9SL2S5obk9s266AOOW2WYvs/780I8sQ/
         9xr+jwOI5XmkFtJOd5eqPI1zoK86eZnhULHWdIejmoorZyqZyf0HnscYFBiFp5WUL85Q
         4YxT9T5Q7DVrJHcGeMo0OPXiopdH6stdykqcfQv5tHUfKJTcI1YwHWa4CEU3X83UpmXz
         kWUEklSZab8cUbLUwrHtQ7u5kC6NFyNI5Gt3kbGJPRhYkgGSDsa/i9T0Bhe/QRr3XZ4R
         yLzA==
X-Forwarded-Encrypted: i=1; AJvYcCVgLlgB2fEb2tLBuwgRu+i52WUYyTGZujHOnyGbnr/ZhVN2+QcBtAET71bhVrtX6LBU0qDbHEr/zA9edIYGvNtVzMHZQTytokl0StzLzmbA
X-Gm-Message-State: AOJu0YwuW0qtNI6IeAkbUqAOqnq8zjyojsiLQd0C/ioXDCJ8/VfHH5y1
	f7vNMNbxa7jiAVTobFsL8Z3OZrJKVlukjYJ7q/Ucn4BcOTLf+fmGPIwUmkDMd20=
X-Google-Smtp-Source: AGHT+IGuDGy4t5OiJnBrpwrYM4srMjBbY92AEY8Y70IH4ld6vGw0bs5SmOoET7R+xihO3L1Kpj90ug==
X-Received: by 2002:a05:6402:2486:b0:566:4dc1:522c with SMTP id q6-20020a056402248600b005664dc1522cmr8574512eda.15.1710749494896;
        Mon, 18 Mar 2024 01:11:34 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id i33-20020a0564020f2100b005687bb9816csm4370279eda.69.2024.03.18.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 01:11:34 -0700 (PDT)
Date: Mon, 18 Mar 2024 11:11:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Ido Schimmel <idosch@nvidia.com>, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Petr Machata <petrm@nvidia.com>, Kees Cook <keescook@chromium.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] nexthop: fix uninitialized variable in
 nla_put_nh_group_stats()
Message-ID: <1e3c6bcb-a0af-4800-92e2-1cab10545572@moroto.mountain>
References: <b2578acd-9838-45b6-a50d-96a86171b20e@moroto.mountain>
 <Zff1Liloe7DwW7Fh@nanopsycho>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zff1Liloe7DwW7Fh@nanopsycho>

On Mon, Mar 18, 2024 at 09:02:54AM +0100, Jiri Pirko wrote:
> Sat, Mar 16, 2024 at 10:46:03AM CET, dan.carpenter@linaro.org wrote:
> >The nh_grp_hw_stats_update() function doesn't always set "hw_stats_used"
> >so it could be used without being initialized.  Set it to false.
> >
> >Fixes: 5072ae00aea4 ("net: nexthop: Expose nexthop group HW stats to user space")
> >Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> >---
> > net/ipv4/nexthop.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
> >index 74928a9d1aa4..c25bfdf4e25f 100644
> >--- a/net/ipv4/nexthop.c
> >+++ b/net/ipv4/nexthop.c
> >@@ -824,8 +824,8 @@ static int nla_put_nh_group_stats(struct sk_buff *skb, struct nexthop *nh,
> > 				  u32 op_flags)
> > {
> > 	struct nh_group *nhg = rtnl_dereference(nh->nh_grp);
> >+	bool hw_stats_used = false;
> > 	struct nlattr *nest;
> >-	bool hw_stats_used;
> 
> 
> Probably better to set this in one place and have:
>        if (nexthop_notifiers_is_empty(net)) {
> 	       *hw_stats_used = false;
>                return 0;
>        }
> in nh_grp_hw_stats_update().
> 

Sure.  Will do.

regards,
dan carpenter

