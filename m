Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C203C2374C
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Mar 2024 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710748981; cv=none; b=U5DKfZdsBH1qn6zkQwIR5sAtg6hoaFcgC6ILm3HrNClkbh6/+lhGhJ3e6ZE99pKxPTf8mKz7eEiu5ZflfjfS2PXT/QIE9leKpYN5Zdj6C9yvY0QDCsTM6H3wa2jBQnXEgzwH2KPWfoNgmxccLfdY+EPp3ndUHoBTTKq3GgXmi2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710748981; c=relaxed/simple;
	bh=XqaEr8+5PbPTo9cFExJMuDm6EYQQTHY+jja90dnLCDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsQwHa4wjaD7bLlEf9Ny7xQlEQdFXVjw15b1ilOGOzsbgiIOLNoEPxYl3JFm5EzHYAZAfIrV1k+ErW0Zq4/NyRA01BwSQ3GGEbyP3MD1z5A+R/xFc8GPrM3VKONPmR3XXmFTab+x2PyrcAQIoxbLfeplaUDJWcLK0xu4bZCHMLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=t0Et7gEh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="t0Et7gEh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4140a259a54so8780535e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Mar 2024 01:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1710748978; x=1711353778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xWOqW0YebhNynLRnswRT+iDOKo43sLSNLgQuiEyKwZk=;
        b=t0Et7gEhTCw5IKP6p97Ixw9v2Voosz/NUSTnlffg8a4R+3Ju6HQTzjHY48mEu6Tm29
         xQrfTGimSNdBN02F9rQpNzuACS7w3RnQ5SQdZxI0EpqRQ+dKS69trtHMwTk0w987blie
         7oL6FEXIWbER93zVucakITLIYgz4WnnI8Yn8SHFd5uY9v6IkhtMzJqlhXaiYlXbNXGCk
         SdJW9WNrSXKwrKNgAjGwhpsZaMXZDc6Z48+r5LeQBZo0zOyWMmYDKiFZ4TnI3O6wR1Bf
         KKXFO6YTtbQDzdWj+yoXuq4R3XsbMnb0MKNq/nQtZ44PJp8Utyu453hz9LPjFD/ZXCR7
         0VIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710748978; x=1711353778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWOqW0YebhNynLRnswRT+iDOKo43sLSNLgQuiEyKwZk=;
        b=R1/JmGmjE6I7XU108mCb2ASy8g32E/fVWUo/+Yati4mufX7UrHC3W98tt9fd8O/j6V
         qI2Xmc84yb20fbapxpyga9cL/IAOJRzKlDvJo26Z9CHk+KjQrk90Tv69cjC1DDedHOg+
         xtq5Zm5RskKNkDSJdNkmwqsLhPmy2vp94WGf4/yZpVn0ef+0d1ClYAh4Wcw7BCR3HQzp
         yAcKA5SAZq7G+RPz58oo4ZASE2FQB66XIvq1X+2sOj52EOZ/SJX3iLrthmfvA5WvtEFX
         plla4mSrTzV3mhoyeMx3JLz867wwG5jOuQ68PkriuVefNM0VXcx52/0OeWkkhq6BFiBQ
         XhFg==
X-Forwarded-Encrypted: i=1; AJvYcCXJWmxnGB5jB4S1X2InioiW2LV7fHosmzQrSidStw9EYsuqCUcU6KxWdpMkKFIoX2ah04M+6CM3z3g67TULacRbMBwhwL/Kg4xwpLwfCk3m
X-Gm-Message-State: AOJu0Yz+gzWucDHYRAS0qfK+74G8R/bbWmMG6+YswErym35IYYJyOgAN
	vU2PGt8lTS4gk+iNTwAIdwogFEeTLI9xazUA5eIgdQecIRLDPffKibSaVOBXtns=
X-Google-Smtp-Source: AGHT+IELaoCPUiTYZCUp5adT9hoE5Zvai+v/TXPvdYYIzf6YUyfkJyj5svseORCTf+1fmlB5N5IEiA==
X-Received: by 2002:a05:600c:1c84:b0:412:e70a:ab8a with SMTP id k4-20020a05600c1c8400b00412e70aab8amr8103345wms.25.1710748977943;
        Mon, 18 Mar 2024 01:02:57 -0700 (PDT)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id by1-20020a056000098100b0033e18421618sm5582669wrb.17.2024.03.18.01.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 01:02:57 -0700 (PDT)
Date: Mon, 18 Mar 2024 09:02:54 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ido Schimmel <idosch@nvidia.com>, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Petr Machata <petrm@nvidia.com>, Kees Cook <keescook@chromium.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] nexthop: fix uninitialized variable in
 nla_put_nh_group_stats()
Message-ID: <Zff1Liloe7DwW7Fh@nanopsycho>
References: <b2578acd-9838-45b6-a50d-96a86171b20e@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2578acd-9838-45b6-a50d-96a86171b20e@moroto.mountain>

Sat, Mar 16, 2024 at 10:46:03AM CET, dan.carpenter@linaro.org wrote:
>The nh_grp_hw_stats_update() function doesn't always set "hw_stats_used"
>so it could be used without being initialized.  Set it to false.
>
>Fixes: 5072ae00aea4 ("net: nexthop: Expose nexthop group HW stats to user space")
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>---
> net/ipv4/nexthop.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
>index 74928a9d1aa4..c25bfdf4e25f 100644
>--- a/net/ipv4/nexthop.c
>+++ b/net/ipv4/nexthop.c
>@@ -824,8 +824,8 @@ static int nla_put_nh_group_stats(struct sk_buff *skb, struct nexthop *nh,
> 				  u32 op_flags)
> {
> 	struct nh_group *nhg = rtnl_dereference(nh->nh_grp);
>+	bool hw_stats_used = false;
> 	struct nlattr *nest;
>-	bool hw_stats_used;


Probably better to set this in one place and have:
       if (nexthop_notifiers_is_empty(net)) {
	       *hw_stats_used = false;
               return 0;
       }
in nh_grp_hw_stats_update().




> 	int err;
> 	int i;
> 
>-- 
>2.43.0
>
>
