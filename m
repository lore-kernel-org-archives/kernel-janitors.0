Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9643127A47F
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 07:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758699150; cv=none; b=ZvfYkyKtjeVB3duFa7jFAY2+zUWlBGEh3VybkBAzT4nlwLgchxPi9RiTQt3adUv6ozaGqkf3pWdpaQuPgCm+330Cl/cDQr/y/IhxLKqUsMZGHAQAnsngxI+HsiSelbqW7pUJ+iwae1SsTsshPAehSzXgF5/qiXZDpbvh8kDGONE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758699150; c=relaxed/simple;
	bh=Qtcg7xfRMukim04mCLFrhu+F9aHnN0Lfki5K4xrpcBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdsjRiuULS1qDm1/NPRrb1otLuU/O7p6dZ67Xxd4dAdaSMrHm6xpHakU/TbLciP80CCZiiLa8IrgCG4MiSoSdO83hOBs4w8NhEUH78NtfyZVTSXkGIV8uqdscwj8mwQAo+AGYByOLhID9oL92miE/wtLkKEqMXxSsSpUYdpP1lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQNWhEJu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQNWhEJu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so5751125e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 00:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758699147; x=1759303947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UXwsP//vM56W40KjvtwrX9R47nj/UueUere/kbOGRCo=;
        b=DQNWhEJu5F+DOfFYFGZfdn4c4l3IygqC9ojelnexiXvg3/ZkgeUj9X4LfP2t+MDAvA
         pTsHTuqTW06Ebj5iO/a3p6E1ffZoz7/TxT7bZzX2o22lTVmuYo102axgTzKVD6F/rTLu
         JPY/0evv5W499IWc44ywAGi9J/2rF5f60Hdb/geNpZuvLK64p2QcEZxHKPNFxfk9IZYN
         8VnKUF+DUK2+/wF7Ax408jf8Iki7UqOx/hKt/VBvVYe7k6d4QG0VbRq0Ydg7EzTE4T9h
         4u/ctbhVUU+KjI4swOF4ZrHiGYQpC1dj+bvEDp0509LFZRGxstVcHWK9vTs7x2xGKYUh
         wMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758699147; x=1759303947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXwsP//vM56W40KjvtwrX9R47nj/UueUere/kbOGRCo=;
        b=BjKbLonGfXmQZTTjGtlmrkq7PiIF+tDEisVbZQE3Sa+tpitlgzSxdHjLEgS8Chz68K
         SzdM8HzxEkwo8VeGhpwOUjg1nwVwhglip0JPZ21cqpnENJkLHtgtoNvU9G9oHnYAJHQw
         JAicVX/FJt0VvRWrnhTof1FyeTmxlTptQC6trO7ekezRGPzePn4ddiIB8n2CCimz2319
         KP0ymvSiANLK7pZH+zTincLMOImfBt4CNHOFJYc3qPU4Ag4sWFQZtGwSsCvLYn5mn4hM
         lLWePOmD76JUQRgDt4PnxfCsHZPGItM9k01Q1a3WFDcMAXxY8zHa5+6dbQdAnTpnseiI
         L6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVwBvSOczQlfa9KtyFKWNGo2Yv5H2LAG+wwVP80AJMXteBtgfETK2b4+Bn6UXVRnG6dXnVawhgxfV2vpAyA9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrEH0PdMJdQH/u4MXYps2z/3ZgkGCqUFOaexi0e08+EBn7NfcI
	1KBtxVFQGxmjocQyf/IofFTy8izfxZamXuBwFQugXQugBys2js3oqYciQIxwhWkzQoo=
X-Gm-Gg: ASbGncsxvLqqbR6lfgXsiGM5nxq4IR6NkWwIxq/g8RScZ5KkF+EaYoYeVLEdii162pz
	c1z5NxsSKy9n9DA6ZHuZ4uqsZ1hKAM/J6diQXR6YZA1u/r88CLRxnnGG9rk40/1jPiKWU5ndOre
	T4CcY7zBsJZcxdWiG/bdAsSVlHvQeihaixXWXKSv8YEYoZoGzPwhOb8PpCIS2BiPJc4eTDSNSov
	OjzCXEOEJZYwx17gE/yctmwR+fCVrz5ihgmnJVK5P57uwSXj3wIFXC9I0vEaq0grMhfwlzpDJns
	OTnphUvmi0pHbGyGqJqiqMARJO2PxjOax2IFHIHzi7svodLEpsVjZu1SBrgftKdkqjQdBDVcTMg
	tG0L8kNb7w5tATHYfI4NITP8YyWSsQlK+T1lEp40=
X-Google-Smtp-Source: AGHT+IFqcDjqsGKdmcV1EsOoO1DT4mayZkZcsrnoULvEIG2jDOzlj2gp/jdzhPJLQtRPGd1AKwtYvQ==
X-Received: by 2002:a05:600c:4f09:b0:45d:d5df:ab39 with SMTP id 5b1f17b1804b1-46e1dabe432mr51516895e9.26.1758699146691;
        Wed, 24 Sep 2025 00:32:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e2f13764dsm3026115e9.1.2025.09.24.00.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 00:32:26 -0700 (PDT)
Date: Wed, 24 Sep 2025 10:32:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] tee: qcom: prevent potential off by one read
Message-ID: <aNOehr6hxdb2OypO@stanley.mountain>
References: <aMvV4kK386Sni10i@stanley.mountain>
 <adbccfc0-0f9c-4b71-9fb5-5582c8180ac7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adbccfc0-0f9c-4b71-9fb5-5582c8180ac7@oss.qualcomm.com>

On Wed, Sep 24, 2025 at 08:48:29AM +1000, Amirreza Zarrabi wrote:
> On 9/18/2025 7:50 PM, Dan Carpenter wrote:
> > Re-order these checks to check if "i" is a valid array index before using
> > it.  This prevents a potential off by one read access.
> > 
> > Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/tee/qcomtee/call.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> > index cc17a48d0ab7..ac134452cc9c 100644
> > --- a/drivers/tee/qcomtee/call.c
> > +++ b/drivers/tee/qcomtee/call.c
> > @@ -308,7 +308,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
> >  	}
> >  
> >  	/* Release any IO and OO objects not processed. */
> > -	for (; u[i].type && i < num_params; i++) {
> > +	for (; i < num_params && u[i].type; i++) {
> >  		if (u[i].type == QCOMTEE_ARG_TYPE_OO ||
> >  		    u[i].type == QCOMTEE_ARG_TYPE_IO)
> >  			qcomtee_object_put(u[i].o);
> 
> This is not required, considering the sequence of clean up, this
> would never happen. `i` at least have been accessed once in the
> switch above.

Only the first iteration has been accessed.  The rest no.

regards,
dan carpenter

