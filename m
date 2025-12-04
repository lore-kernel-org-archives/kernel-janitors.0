Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BF1313530
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Dec 2025 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764835227; cv=none; b=CRwCAp3+9qpCIWbfDu8eNAHFIxUR5LrkYFzur1AKcOm0qvp096JfpU5J1LUurjnf4dkxON0G+hMuGHOsaWUKerZfI1MRCpPzM2hmQXCRZ3sRA5SsxP8XDw6rwDM9SAuPcD6pT0tmxOzE7b0X0/v5B7NL+8kznRKZhb8vSgacwg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764835227; c=relaxed/simple;
	bh=mpXehTimxHuWE6mnLV4ozTZQoHXKjbajrye4tph+rFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0cJm1o+yCBS8TG84/Q+o5XSeCyXg3TCt83fN1Sso8hZwJp9Pd7fztZhZ7NZUFIPisQGnQ8vYglcC9xvDP4RzhrkRurTetVpCY21gac/nU/IputXbj7wqK/pF5+zqqn8h/hE60Ko0Ed6/mcslaM/2lNemCNw6B+hbOGsibydzGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jkdW+wqi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jkdW+wqi"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so4480275e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Dec 2025 00:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764835214; x=1765440014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6QEa29b69GI0rC02Aibnushx1/FXePKSOU65F2tmdXo=;
        b=jkdW+wqijDvQqXLEQBBnu7maV3vpgMya06CWTb9+JL8j7WGZ/KnDsx+Y7XqrJZldUH
         iLiAVBgHzS5vhEPbX3qtQ9So69FWdQQ5ZNEIWX5XF64/SRD9v18rGsTLsDEjrctH71PP
         nk+Q+a/xRL2TLfpn4br4sAv1UERU2QhLa1MCcCPANYNUF8AWtJxsnmwitYdqbRMaJYq2
         3zoidnLxc9l3a5QibWpvOzTOqkehg6GeXLcCjJqJxcu73qaNjvNHAl9r43Oa0H4qEay/
         l/+6C1hAspMnM9PwyYqZhhEyhrcHXfZQx68iPkOpVQ+G3N439+VhkDheAnbPr8n+KF0+
         xB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764835215; x=1765440015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QEa29b69GI0rC02Aibnushx1/FXePKSOU65F2tmdXo=;
        b=Im+eGEMi0aHrobDKovxgG0yyfGBnlPfLlWLmYjp4Ju/15YA7nHpPhiQcJmHcpEY0Hk
         Z93TFARoL+nfmEfscN0CaLONuunxdkWpTOWWqCNHA8hxy5oX/sdENnm2T7T9gtqD8SSY
         0ZGnVccfzq1aRUBXtPpyt/TWlig+QkkoCyDf4JwGVGG6YLQ2/f+BjMFAJ9CMn+FIc1KU
         P1Hcqvu+NFCNDXxoJHLFhIPgaaqOG83Tu/dHa8yB+r0xahftVzDZLIjsmEYFFvvTW8uz
         IJWUueByPXPU20l7h156ITlYYnWgAhssXLWaFLt6niyKvuwinSrlRlNgahCLM1Nrdjhc
         eAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi2kPZiJaGqgekMMt5xRcYtWmn8AU5X+1rRdmoLHhEI7N1bZgxrBT7dQRO9WCOD5kPITlAQBorC1YeF0pxkdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzspW860yHYOxD85trsCOsAkDxbEoPgVuN3biyMqSoZPTJww/8l
	MwzIGwDEwq0oiggqEDecCVkH5vkyUng33dMQZJY2YKxjRoEvFkDjrc4z3q8fnFPN0U7AHwmxvQg
	KV6Uk
X-Gm-Gg: ASbGncvSoBcSpAo1qvSIY/A1d/Ckw0xrlS6B5tU4dAzSjYMC3E5SKyrHd/xZb4/lx0C
	uNeBZ//gC9ndL7lMEhHj3J42tPsA6u99nvNGVuDxqjScBPCxgceLZO2gtrmYUFzfmKBr/qDXlst
	zjeDv6P/+rY8VTjZ0nnsBCScdxV7+pahc048XLU4ZMdRNGEr0Kg/ETghEJPbu6TYqs0uJChFtiR
	uOvPBpUF5Wh5qpIbySJf4CrT/Zw15tAiXAnA0uIc+BIqCGRGCQou+BP4WMLefp6/02UQV9XIJ2i
	wSZX9JqbD04jqlUYAkFuChogR2hBSxtfkzL3XgB/kQ07DtFhQGVXl9IDZ0rIr+I8Q5DjJ/W3S5b
	AR7Q3mbgVM6lj++BOmgJ5Yol36RRZlJxPGfuUHcLDZJ2UdBxtbYXeTuHgWG35jUK69gy3DMn04a
	Y0xq8Z0JN4ujxD6HyD
X-Google-Smtp-Source: AGHT+IGx5G8xtyphAgFt4tRJbC9NrnKU8miK7j8D7kDLQyGFN6stlYrbqZkU/BhypULqvMfdR89/XQ==
X-Received: by 2002:a05:600c:4fc5:b0:477:a977:b8c5 with SMTP id 5b1f17b1804b1-4792af505ffmr62760335e9.31.1764835214446;
        Thu, 04 Dec 2025 00:00:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7cbe9065sm1740877f8f.8.2025.12.04.00.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 00:00:13 -0800 (PST)
Date: Thu, 4 Dec 2025 11:00:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rolf Reintjes <rolf.reintjes@web.de>
Cc: qgeniecore@qualcomm.com, Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] wifi: cfg80211: sme: store capped length in
 __cfg80211_connect_result()
Message-ID: <aTE_iu1lAA7ww4g0@stanley.mountain>
References: <aTAbp5RleyH_lnZE@stanley.mountain>
 <3204ebc0-4432-467c-81fe-9f09427b1671@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3204ebc0-4432-467c-81fe-9f09427b1671@web.de>

On Wed, Dec 03, 2025 at 06:57:42PM +0100, Rolf Reintjes wrote:
> Hello Dan,
> 
> Am 03.12.2025 um 12:14 schrieb Dan Carpenter:
> > The QGenie AI code review tool
> 
> Could you tell us more about this tool? Is there a web page of this tool,
> how do you use this tool?
> 
> I found https://qgenie.ai/ but this is not a code review tool.
> 

No idea.  To be honest, I think it CC'd me by mistake.

regards,
dan carpenter

