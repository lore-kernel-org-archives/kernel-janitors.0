Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DB51494DF
	for <kernel-janitors@vger.kernel.org>; Thu, 16 Jan 2025 05:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737005839; cv=none; b=tPmLjUoiW/Z4g1z3Uaj7fedyCNKQhOOta6ZDf1VDlix2RguPuPtrNETqpzKpJthsmq7dT5Kuv23LjXKEmwu2mGUhA+lw1QKS+hajicxnppmCzu7WxJA/YoxpzsHpZBXDjA53uw5tSd3RtUheOP8dNaUfrjjx2I8lDvK8RXV6uTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737005839; c=relaxed/simple;
	bh=IU39ngyrwKP6c/G3j5zYL27ssQmChDhe8NrSAQasUI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oB5npohhBsNSUN+bVfPMl8dgzM5icFwks2hVnwbsOL9bF1rd1Ta5+Iphbiq6c57PsD38xqcVA86MuFM0e/rXyT+Xqb2ADbSdkBR6cAptp2KrK/mwIfAqQHugUYla8sjFpn4cLpmyzIoN0Ma0GKjF8Fa8SRnfA2dOqJ45OUoDPdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CfxnVBEx; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CfxnVBEx"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5da12190e75so1099674a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Jan 2025 21:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737005836; x=1737610636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aCF86bYhYFLbtBPCfwLdTXT1WdDkKbiC8nAFsk7JPDY=;
        b=CfxnVBExSYzkjzCtiWQvtwuokEJQE3ba59DCVop1dfzA20Eb9feRgswHCLDRkc9dKN
         /Jp380NTyN0NgFcj1E1t5a/IhTwr//smjxWd8SFp7N6Gvsy91vNRErt3rXe+RbODE7ID
         uzdjzfGi4Gf4OkhYSVwO7m+27+iYAPb0Q5vTFv7zTuEkc7OLmqVezepcj1TtED1N0ufB
         r8LJKY9SUXyVbV6ErCMFXWQMyzo03xFFKaiVjXsoFszIj5aHziMxDXcZmVA37nn0s819
         uAlFEAMpbb2lxugyMkiDpt73wkbyTBzd4nW4aHIhtu/oXk5d980Z6RqyAqIfaSzFJJt0
         RsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737005836; x=1737610636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCF86bYhYFLbtBPCfwLdTXT1WdDkKbiC8nAFsk7JPDY=;
        b=ovBXxQ6WGqLV9+kavqszE6tTe4A0DouCwe3BY+FdzIZRtyMzIvWFKlGq7ylgAkrQ+d
         ofrCTflDP9xa/NnMLnnCtd1+8OOs3YakuSxBXDTYdeQO1n8ibpR3knnYseKfNNxM442b
         xZS0vrTkGmq65Pn9LKy7IBeJbPjj54bmFUlQIfGTVwomJ4IgoPW+7iun4XnOLlhfQOjR
         UubFDtW540EcKkhdaZ7pVsfyUlKsRVqP3m0XE5EJPpLUY1WqKZUx2LL6DCehkCVSyO11
         WYI+FFpTYPp8js5GhRlUcXHcQ8Pa+9cpItkZK0YjExTuvjagh1FRTOcNtjs77nsu2VTY
         /wyg==
X-Gm-Message-State: AOJu0YxqtusHS5MDM/znheDX+a6N8f+QrhRInUPmkvu39TnUTXdFB6bE
	52RnTSeK8QXOoBO1qMMPdfID6U0jmPytsaTV/dQi2mPi5m7Cd41AkhbM+RCYy7vxhmMkmCnV4O1
	a
X-Gm-Gg: ASbGncthtrErA0+obVxuRZghxaIehM5kwFB7AKwJFa1OrJfka9svFz9A1KOnbU8fETb
	X9WnmZvYf7Kd2qajOVLt5PTfVSip77iQYBaE64NK+6WVZImtvMLaBHmhmPhG+0FP2N7F9enp/v8
	wAfW/aJQYeVVzCNSoNSEUBE/R/WEjxqQkJ8o0pVXpaleKz6Wm7T9IAUBysL1c7QmpgJkBDVgQp7
	qZb8K3JJRJEzskn+9wd2s3UQJ0UttOSTQIn6PKj8AKK6F7Hyy3OThbSU4p8kA==
X-Google-Smtp-Source: AGHT+IEk3oysxsc+4ECksHjwkZZxlu6WUP2MAtP9xTB2TtDnELbfU2FxuWRmZrNm9DQxMm6fIbvinA==
X-Received: by 2002:a05:6402:4407:b0:5cf:e894:8de9 with SMTP id 4fb4d7f45d1cf-5d972e0013emr28678222a12.3.1737005835984;
        Wed, 15 Jan 2025 21:37:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99046d7b8sm8089642a12.69.2025.01.15.21.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 21:37:15 -0800 (PST)
Date: Thu, 16 Jan 2025 08:37:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
Cc: kernel-janitors@vger.kernel.org
Subject: Re: Generic sk_buff contract documentation ?
Message-ID: <1f57a1c8-8bca-48de-93bd-8d59c2308985@stanley.mountain>
References: <51e7e935-1e0b-490f-a947-c3e71fd10439@orange.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51e7e935-1e0b-490f-a947-c3e71fd10439@orange.com>

You're better off asking this on netdev or kernel-newbies.

regards,
dan carpenter

On Wed, Jan 15, 2025 at 08:34:55PM +0100, Alexandre Ferrieux wrote:
> Hi,
> 
> Recently digging into a driver-specific issue with sk_buff->protocol, I
> discovered (with surprise) that the computation of this field (which is *always*
> necessary for protocol handlers to kick in) was somehow "delegated" to
> individual network interface drivers. This can be seen by looking for callers of
> eth_type_trans(), e.g:
> 
> - tg3: called from tg3_poll_work
> - ixgbe: called from ixgbe_clean_rx_irq
> - veth: called from veth_xmit (though indirectly via __dev_forward_skb)
> 
> This is a surprise as one would naively expect this ubiquitous behavior to be
> triggered from generic code, depending only on the L2 header structure (but not
> on the specific NIC hardware at hand). Another surprise was *not* to find any
> mention of this "contract" in Documentation/*.
> 
> So, is it an unspoken tradition for NIC driver developers, to
> "just know" that prior to emitting an skb from the rx path, they must fill
> skb->protocol (along with who knows how many other metadata items) ?
> 
> Or, is there *somewhere* some reference documentation listing (exhaustively) the
> required metadata computations that fall within a NIC driver's responsibility ?
> 
> Thanks in advance,
> 
> -Alex
