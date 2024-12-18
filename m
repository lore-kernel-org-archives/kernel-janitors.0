Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528951A2395
	for <kernel-janitors@vger.kernel.org>; Wed, 18 Dec 2024 10:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734519285; cv=none; b=ZaLNzqnQ++UGetQVwpzYy5ervaSIRXdpgfWMFM8RQXmnBGESJKZlmwGrAYzntjAItALvUPFZ92J9LkT8hl5ZWgbulBySSt/RMy0gvmM0vtX5rlXpKZtQw+XdY/6pUswWuj9tKVWfc2T2mQnipVLP0GoBGC2zJon5qXMyeyyWm6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734519285; c=relaxed/simple;
	bh=31AJvFncyDZ/FXq2NhVl5iGwRm7DlmYnqi4Ssp7vJGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4Kt8D1KJNLwEx1jneAgLxBHz5JXzCz3P1WeTdQseTSIH2xokejVoX9dlHstvd8qXZyApdvmnJMZ0iKx6Kro7UmrZ4/NxDqQVrisHsxGGzsyf7+hA+06SVGZOnmn40pr4nskLkK3QvPWDn1KVQ55bmjZxdjyVNHfqMeejXqYGJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rtPXTwQO; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rtPXTwQO"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa670ffe302so1161742466b.2
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Dec 2024 02:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734519282; x=1735124082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bhTokHP9skR7jJeKPK9CVtZx11UuslYBY9BBg+qEOjA=;
        b=rtPXTwQOcdOhb9yqKuMmBbwMgp+UI8vYI/v0419zOm2xRkHD7jt1obZ6FaBLF5cive
         ZiFJDWgoogsL5UTN5CkxAZzAsjYc6ItrK5lw3MfM5tFRiipDpjxImNHXKEC0OKkstz8c
         y1C00kv0OZhwGcto8F8nAmRRiF2gbth16ndCJVdCVoEDyBL46x3qG0Q5xbBN2KvRBRBy
         9GAR7k/dBaSjOmLEuTTwQHNP70Qz/8JOGga0AVj0Xhw7E4lM9uS+4HqZAxt1kLzkbkuu
         W+OXX1lwJsdPXCgla9PT0fhZBeA/v2xY7y1qatlOGMBBzCCeE6gcfmeKRejWIbvvZmRI
         YVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734519282; x=1735124082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhTokHP9skR7jJeKPK9CVtZx11UuslYBY9BBg+qEOjA=;
        b=AGL8aeIeLbmyw/ut7ncZJGEOUKzEn+WyJmxO5fBoW/+rqakQ7snCfPABcdlzEJPyg8
         ns3WEECKcyoyWHgGLKaXTwBlAl7kIoPqLp9Psfu/KViSYKIO1e328+IJraZr1tzjI/y0
         26iiz7EdgKvWvzA3v0AwtETgXRoHTyA36Rl7w3jyvnTLoS3T1jniFW27UfKHULxE8Grz
         BluEMD31xcxukXiZNA1VePOChyLQvMkMfuiIYKdF3zpTxUWz2SfoWyrRqolLcvYZ+vkl
         S2OKc+7xa+MaP/vFVpAWRYw4TJvUW4hUcGbN9pT0uAwFVdZGe5HJ6XxN9+uy0idmyI9O
         iamw==
X-Forwarded-Encrypted: i=1; AJvYcCW5WnTUcsnuayk3X8mwqnk4ljxPFOpyAj6OaE593OenRVvu7k+80WXFQWtfpgF4CTBrVGXErLvFMXbK2BuhdTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbM4TZV5IWat9mZEWbZGg7JoeYpmh8m7xmSLZQvOdsULN4h4ly
	WTt0hfcwganM/fTq9MSTfN6mGh1Pt6yuzrcQ7RFNFKYPxyVSAfn97D++1+Z1oGs=
X-Gm-Gg: ASbGncu5Waoa3JOwFLynWqbUU4z32da+fhhXE75FbmLTixjJxcH3TXjYDx4G73ouT3g
	9OgeybMYVaWZM8oKgtBHd8D3E2Auj70CmrI74xy9auffght33HP2idf9jgmBlMJXW9al5w18R9x
	2K67LTwi/YCJxICTRQFdmcQwRF7JAkbjiJAtK3FfPVBODb/e+q5xn6nQFu5dfJwhEMBFwc9ALYO
	toD6KKtxlELo8B30W4j+qq6LbB2n3L6LRPLOr9u3NWEPCDQh+EPxHLhb1MLAg==
X-Google-Smtp-Source: AGHT+IGd9c9NZz2gvokmKM5Dng3BnFozJjkFoab/PE7l5nl8JOL6hBsbbn1h4w3R6/1qrT9lM4LqKg==
X-Received: by 2002:a17:907:3da4:b0:aa6:8fed:7c25 with SMTP id a640c23a62f3a-aabf474bb0cmr240635866b.16.1734519281678;
        Wed, 18 Dec 2024 02:54:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9606b3a0sm540413066b.81.2024.12.18.02.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 02:54:41 -0800 (PST)
Date: Wed, 18 Dec 2024 13:54:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net] xfrm: Rewrite key length conversion to avoid
 overflows
Message-ID: <cedbaec9-d149-48af-8068-182f0af5a89c@stanley.mountain>
References: <92dc4619-7598-439e-8544-4b3b2cf5e597@stanley.mountain>
 <Z2FompbNt6NBEoln@gondor.apana.org.au>
 <053456e5-56e7-478b-b73e-96b7c2098d07@stanley.mountain>
 <Z2KZC71JZ0QnrhfU@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2KZC71JZ0QnrhfU@gondor.apana.org.au>

On Wed, Dec 18, 2024 at 05:42:35PM +0800, Herbert Xu wrote:
> On Tue, Dec 17, 2024 at 03:32:31PM +0300, Dan Carpenter wrote:
> >
> > That seems like basic algebra but we have a long history of getting
> > integer overflow checks wrong so these days I like to just use
> > INT_MAX where ever I can.  I wanted to use USHRT_MAX. We aren't allowed
> > to use more than USHRT_MAX bytes, but maybe we're allowed USHRT_MAX
> > bits, so I didn't do that.
> 
> There is no reason for this to overflow if we rewrite it do do
> the division carefully.  Something like this:
> 

I like it!  So obvious in retrospect.  Kees, Justin, this is probably a
good strategy for dealing with round_up() related integer overflows
generally.

overflows to zero:	(len + 7) / 8
      no overflow:	len / 8 + !!(len & 7)

> Steffen, this raises a new question: Can normal users create socket
> policies of arbtirarily long key lengths? If so we probably should
> look into limiting the key length to a sane value.  Of course, given
> namespaces we probably should do that in any case.

The length is capped in verify_one_alg() type functions:

	if (nla_len(rt) < (int)xfrm_alg_len(algp)) {

nla_len() is a USHRT_MAX so the rounded value can't be higher than that.

The (int) cast is unnecessary and confusing.  The condition should
probably flipped around so the untrusted part is on the left.

	if (xfrm_alg_len(algp) > nla_len(rt))
		return -EINVAL;

regards,
dan carpenter

