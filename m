Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211AF763EE
	for <kernel-janitors@vger.kernel.org>; Thu,  8 Feb 2024 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707399613; cv=none; b=doCab72UV09cCQqB1ELwPPcmiWAb/HOA+yvSo3sEVee2sXb20B8ICe26ju1oED+nrttlNM2NX2ojyLfqn+M7ioDqSAXIs1QTD3slhl2hNp5sKb7PagW5a5ff/+UDVP2FEo2qb3cSadtn7kfDqH+7BOnyBdZJyDWMY9RG/Zhe384=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707399613; c=relaxed/simple;
	bh=tdtjhu5OUzycn48SWzt6cXCTR3DvhpxDtc9LZ4VxUCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTUUay+y7zilAY30vG6bKV5Ixl0fhrnyvdllALMkzEOQjGrT4Nce94q9vQa/jeSwvPMc62gNWlaPnSjUUlXUjvBAYFkxb252iE9MC9L4Y+ZLANjEY1xTddhOINn8xke1SeZ/X1T4Tz7O9cXtJneYANOQwKwqxka4woOJP3JPM3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ClU67nOl; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ClU67nOl"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so2396068a12.2
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Feb 2024 05:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707399610; x=1708004410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rMpPbcaHJbhfuPySCuBDy0MbgTxIMiDJ4vzkIHlJDoQ=;
        b=ClU67nOlxFpVUFwk2DavZ6JwDViVmFFjjnidw/di2DqucDpZVTjqaN7Ekq8q1S38rq
         GjwbHO6Fuo2fYtHeOspKynkJV7Knpp2l9/ZvNFw8qGy8bwayRS+PyF9ps2tUVsSAgRDZ
         ecDVC+KACGt9hS4fiSLmjghKyO5wO1q7jSEhhAQaMsuH10sUPyuzD3euGsx5m0uDL9Zb
         UQKC3fjSlRO7Bgr6x74IrVWjcMfjb0adjchnp27DlWNgKuCIB//tGx/PgZd1uQNnqC3K
         Xo8NjZuZXQO4U1PZ0VvZN17vEnhNsZfLvgT6cRqK/I1jvn/EBcX9WaPG8t2tTl0qe+6X
         b8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707399610; x=1708004410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMpPbcaHJbhfuPySCuBDy0MbgTxIMiDJ4vzkIHlJDoQ=;
        b=MPLNQPtOlMg1i14ucpjdqpHROQFGkT4F1vJUjHSCg0iPv1FNaIMJQ0+9S42K9XXj9l
         sQ682/KmQ26jH0Mql3l0QeE6O8oUfC6CxxA3OcilSIFclnqCwln5SSaFtolOPdjjJk8J
         rAitONjlhkOrCT+Q2jka1sY3mc9iG72diDJzPXFe1jER4dBBHiPYFhniDHSrV93Ql3Ui
         VTIkP51hQ8VlpaKXSoD8h6Dri+Oy5IryZxNwhVKFAzsLOUQmuEvEhu3yRyAuaUE/bR1M
         hHMj1B8ZvKUjzcYC9LDnEGw0WFN+kBB0FHP1Z60N2AIrgTpT/XWJCjCnRbCWsO0KR2z9
         Jgng==
X-Forwarded-Encrypted: i=1; AJvYcCU442zPZFfOe+jIkm6frgQfqiUNlhtj4c1gKgi04Ddhc1sGP5n69bAKYSOvipZOhbPuwOTfwYKP/MxPFjC0LOISat1gSiUSXFdqOxQLK5V8
X-Gm-Message-State: AOJu0YxxjfjzA+I6MR5uaHpQMA08E/tonD1Xb784TpkRFAauvtErEY3n
	7aQVdM7S6wkXnfjreLxsYstpSfxTUDTIrAf3hpXxu8o38x8buvp6eVTkQ3x8u3bGZt2WB4i6LC8
	F
X-Google-Smtp-Source: AGHT+IF42sMvvm2fVBRopIbTQEP9EYypKLLs6A/OCGF16U5E44206VN6O4b+KPZQOnRLy+i+BX1WKA==
X-Received: by 2002:a05:6402:1acc:b0:55f:fe4e:9cff with SMTP id ba12-20020a0564021acc00b0055ffe4e9cffmr6456099edb.32.1707399610400;
        Thu, 08 Feb 2024 05:40:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVV9uetxIHH91qoKcZ75DzSamDWKmrGYLt6ElrWIM3OMrjWUZZRZlXBYKoBnPdPXI1/5u0515bONx4HcuggJTEGblEprdXFO10X1PgtfXTbOwuevasT7nqkPaDPuQVLTxeB+4OI52aP9MsXRyNVNvaU/vX9WrhMsittHBWGZ1k7G+2DJB2RaWV9TDrhy4HAavFyqK/CYw8vC82BBXpSg7SJRPjykwsvKRPwETwJiC8XK+R40g+B6R52/Um6zz9c3lH8dt/DUcuSbcQg4cBktePu5vYIR5NC87e+ShLzCxysDmU6pv1DEwCWKQFgcCOJr8YpQsj3Po861+eIKyNgNjxLwCTpv2F6NFRde/D+HBJyGIq7hSf2375KNckO9jEUk8Kw8hQ6hDzxsNarnRkr5oWYsPEe3kzIxFmzsh0fVF+EUd9sRD0l4OqZ
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id q17-20020a056402249100b005598ec568dbsm819294eda.59.2024.02.08.05.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:40:10 -0800 (PST)
Date: Thu, 8 Feb 2024 16:40:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drivers: net: xgene: remove redundant assignment
 to variable offset
Message-ID: <4e0d27a6-37be-4b6e-a60e-508bcb0884cb@moroto.mountain>
References: <20240208122012.2597561-1-colin.i.king@gmail.com>
 <f39d8e56-9ac1-42b4-bb2c-1bc97a0f43b3@linux.dev>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f39d8e56-9ac1-42b4-bb2c-1bc97a0f43b3@linux.dev>

On Thu, Feb 08, 2024 at 12:39:24PM +0000, Vadim Fedorenko wrote:
> On 08.02.2024 12:20, Colin Ian King wrote:
> > The variable offset is being initialized with a value that is never
> > read, it is being re-assigned later on in either path of an if
> > statement before being used. The initialization is redundant and
> > can be removed.
> > 
> > Cleans up clang scan build warning:
> > drivers/net/ethernet/apm/xgene/xgene_enet_cle.c:736:2: warning: Value
> > stored to 'offset' is never read [deadcode.DeadStores]
> > 
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> >   drivers/net/ethernet/apm/xgene/xgene_enet_cle.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_cle.c b/drivers/net/ethernet/apm/xgene/xgene_enet_cle.c
> > index de5464322311..8f104642897b 100644
> > --- a/drivers/net/ethernet/apm/xgene/xgene_enet_cle.c
> > +++ b/drivers/net/ethernet/apm/xgene/xgene_enet_cle.c
> > @@ -733,7 +733,6 @@ static int xgene_cle_setup_rss(struct xgene_enet_pdata *pdata)
> >   	u32 offset, val = 0;
> >   	int i, ret = 0;
> > -	offset = CLE_PORT_OFFSET;
> >   	for (i = 0; i < cle->parsers; i++) {
> >   		if (cle->active_parser != PARSER_ALL)
> >   			offset = cle->active_parser * CLE_PORT_OFFSET;
> 
> It looks like more refactoring can be done here.
> "if (cle->active_parser != PARSER_ALL)" is static, no need to check it inside
> the loop.
>

You still need to check...  I don't really think it's an improvement.

regards,
dan carpenter

diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_cle.c b/drivers/net/ethernet/apm/xgene/xgene_enet_cle.c
index de5464322311..61e31cc55771 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_cle.c
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_cle.c
@@ -733,11 +733,11 @@ static int xgene_cle_setup_rss(struct xgene_enet_pdata *pdata)
 	u32 offset, val = 0;
 	int i, ret = 0;
 
-	offset = CLE_PORT_OFFSET;
+	if (cle->active_parser != PARSER_ALL)
+		offset = cle->active_parser * CLE_PORT_OFFSET;
+
 	for (i = 0; i < cle->parsers; i++) {
-		if (cle->active_parser != PARSER_ALL)
-			offset = cle->active_parser * CLE_PORT_OFFSET;
-		else
+		if (cle->active_parser == PARSER_ALL)
 			offset = i * CLE_PORT_OFFSET;
 
 		/* enable RSS */
