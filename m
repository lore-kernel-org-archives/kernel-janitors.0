Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C8115383A
	for <kernel-janitors@vger.kernel.org>; Sat,  2 Aug 2025 07:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754119928; cv=none; b=T2IvI3Yg9nDQ9eZTeLPh9ZuvPGel0NvlwU9qFi46O7AQwdkfr+4xhVhJ2H9rP968mPGHHR1c+JGbZfxDdQ7+v+lMyWd0lJjvKrHrNTnhW25K13wf4vWbGpFAcMPNx0LViwx+sHv89D8cYqcqNGuXTZa5H9knoH2tl65+eHF1Mxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754119928; c=relaxed/simple;
	bh=X8HRyQFPoOlzxmLgSDnwmZXBUKycsDjwrurq5e80avE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOAf6MY3tnWXYB9XcB1cNfC0N008aOhdTngGfoq8kAat5+xRKh2v6F0uYp/Px0sz/ReNFwUYQECQVP9Pq3wxCJ247QqShJoegGr7rLy0B+M6Aejvt7hKiC8U4gQT4z21TLVjqKQL95k3/9Oyy8SFYU8j1zIvAeAELnaj7zkEEOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpHOlXZy; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpHOlXZy"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b786421e36so1617955f8f.3
        for <kernel-janitors@vger.kernel.org>; Sat, 02 Aug 2025 00:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754119925; x=1754724725; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Pft35+3lXQVnWPsUsq5tpsncZSpCehFTU7fpA7XTkY=;
        b=TpHOlXZyl9li11KqxDewgxvlH9mchzRQW2GbTWz/j5xg/4kBizJ1C9JQp8u78bFwSi
         rWSxvFlO5FAlMeLN4V2oDcpaun2L7o6ARP/eUGucA9kDD70I1UofgEtvpnVpWScPQA7/
         xgR4pJagtxI2x/UloEh6VvdUHnjAeIlXmSUzNBySbWPkM3wEfBjHok/FhmegN8atKF99
         GIjLM+2rMibyZKF4kdzkP6yzJpxiNCMY5wZ/GveygM3SI+pwzRP53+tYAxxrH7Er7HKw
         XS3WCaytqx+Fb2gvZg2HkYGutNBjrvJ1cilwEFMs0m47vDZlmLsmTnYuFNH5Mt/BsNza
         X3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754119925; x=1754724725;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Pft35+3lXQVnWPsUsq5tpsncZSpCehFTU7fpA7XTkY=;
        b=a9Q+DIIJi0HcW+TXhL1MX0IfKPXuTTvuXgRf9NqPviKikwZydkz84ovg9KMnjKSwi8
         jUGRIPeBppaL62Y6o5ak+4TFRT/4GW5WNoqQI/2vmushxkdsdXTWWnOp7X4caDNjhYb/
         wgZ1cYRPECyDxTlHd6irlsap10sPtf8yoM6zjXIpdpmKNVHZh0U5Lzaqn0DOW2SS00HE
         h4geixFDyqUTobopEGBoA+oNZQz79NcY0grR7L8i7SGgQ+i6Gi3dHEpUVWOPCbBFuIDt
         4n9kmFsR4s7Q9tw7/O4GdhqpQoIrnp9jMSZxUl32sPbW2N/DPqfWJvzqKDdGldbQVFBp
         XmgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXmwGyMvSlHybZeYEfODtBg9NIC4T/qx+zwEHCHkd8da6hZvPbC31kInUiDNRW+sLVMesFcEW0/glwGfdb7Xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZEkEcdqJcqaDpoDZYnnnwK2MtOjTli9aceHTheG2x5BI9Wea
	ICxw7dk3uCe6Cd2v+kdzOnbiX4TF3axjYw6q6vV6LhL0ULBqI2fhlP2q8cETVIsy54g=
X-Gm-Gg: ASbGnctckb4rJFFgaYN/wYW3g+Jewt4Ionac48w5xT4v4gFGulpT3bHRh1Y+Xf2XKdJ
	j9Yla+YaYDJ0v2eTtzOB8IydFWfFziLpoTOnJjXptEhjU3fCUpc9KM64NdkogNlyHxkdmvT9wN2
	1QH9Jxj9LOJfgQBDezlXZS1wAyR1f4pX+Xw4cT9ZKMjLfBlLhNKgY4yalu8ztbIvd/xGeUxnWa4
	2/YOKBhH1w7mSXeQS8jzk1D7abTgbjsGfVzrTCnJG8Am6gPHqhpPpTFmMVC/P90x0Tafnn2a770
	EAMxrVY/RJXx+NF5boH73o/2Dq71Aoq0ZFh53yHCCLmvUgUHb6aPLjUw+oknDChIX2XNkU+f3dJ
	PZpWTz7vrlTj1+PlCwQkESJsArWY=
X-Google-Smtp-Source: AGHT+IEncAhoLdtPekt1mG/QjBbcpjITQUAV/Ke+Zpd3fYn54X7RELoK7NrhYvkBeCEbn5j1iK8FgA==
X-Received: by 2002:a05:6000:2481:b0:3b5:f93a:bcc with SMTP id ffacd0b85a97d-3b8d94c1ceamr2065362f8f.35.1754119924640;
        Sat, 02 Aug 2025 00:32:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589536acc9sm133848185e9.6.2025.08.02.00.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 00:32:04 -0700 (PDT)
Date: Sat, 2 Aug 2025 10:32:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: atomisp: Fix incorrect snprintf format
 specifiers for signed integers
Message-ID: <10626b28-9619-47ea-abad-db823c01bb96@suswa.mountain>
References: <20250801160023.2434130-1-colin.i.king@gmail.com>
 <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com>

On Fri, Aug 01, 2025 at 11:57:43PM +0200, Andy Shevchenko wrote:
> On Fri, Aug 1, 2025 at 6:01 PM Colin Ian King <colin.i.king@gmail.com> wrote:
> >
> > There are incorrect %u format specifiers being used to for signed integers,
> > fix this by using %d instead.
> 
> Both of them sound to me like the fix of the symptom and not the
> cause. Can we simply make types of the iterators to be unsigned
> instead?

Making iterator unsigned by default only increases the rate of bugs.

(Although, my stats might be biased because I'm only looking at bugs I
can detect through static analysis).

regards,
dan carpenter

