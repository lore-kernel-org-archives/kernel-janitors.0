Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7512AEE7
	for <kernel-janitors@vger.kernel.org>; Tue, 10 Dec 2024 09:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822297; cv=none; b=TwP9xQ80FJhZDs37Dp/PX32U4JzPTrAX7xLhuOv0LGmeOjTETjiNeycdMWWVnCCzhlKVg/2r/FLGXhFCxb+Lj6qX29ikHF0ImpiNZ63dBBpveHBmokYWWrxn1sH35l8hPO5AmWrB2TWbT0cXcm3guLZkUPe1KxElJ8MjHtYJz8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822297; c=relaxed/simple;
	bh=omI4H5wEH8JLhRjGKGKPftUxFGeyKl21rA8XVcXsT0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTZxhrwM8svO762WAD3SC1aFgWJ9Z9JqzUY788OFgtT+iZ9V7H6ReWX1rM5lwGvxTojDH+OAK0d8PEf79icQ7EwmP4j/Exks1CiiZJUabKQhAO1HX6QVnPems1qQ72ebl4eC7SPEiM7Z09lDBJJSy/LVYw6ZVSf5P3oezYBbyIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TH2IE2kT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TH2IE2kT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4350398046fso3035915e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Dec 2024 01:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733822295; x=1734427095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k5TYm2lhOjGpM9NhFrWhlK4D413vHYrOoe381gQTxjI=;
        b=TH2IE2kT6sebE/0jSvj43+KaXeTWtdwQhzBuicR0II+TZru6ddlEDwGCwKywhjLNI6
         yC/f478J8hKEESXp7bpySMqCJk++iIfbjfaMtUeE2gyU4RHJPCRiKXnHvsqDKjO2QwAD
         +8x5HSZToyvAlDI7qs4w51KcGTQOHwjSKrMwyf66q1WZcF41yOT3PJYTGjM6+EcOL4/G
         WKksOu2iUXIgM+NiJG6mKCE7axkTz+wWQCIDXJ0W6HlI5EYJNio5j8xrz5Z9P+pr0u2i
         3FIGy7N+VsHpaGryyx0/OVrWAq8EsaGBCw0cMS7dpM4K9N6w43hl4KB1jld+zTtIWV1f
         xjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822295; x=1734427095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5TYm2lhOjGpM9NhFrWhlK4D413vHYrOoe381gQTxjI=;
        b=VToajh6bT79JyxF1iEDtg/DHPbMpBqIuKsKZY5cpfmD2mdVB9+z5MpgI9jTZzNffD0
         r6PeWjyJ3rTWl2FzGGddBT9YBjmmQgJWz7PY3mmjAv+QlgYAJSYxJuGL3RVvJq4TGaU3
         rUBFG3fn+1Ff3ow9NNrlLLIAmE3v/XVGCagMvWMuRg9IzEGbf77maX9VT21SPHrNzKHI
         ctPHpxmcMbCGejHlcstUGtanSL+nZ283zwt2ORA0H6a241oyM3rL0drS/zBZ97bSK0vD
         yOtaEnjbyrXU6xtwOwprZNWrK1NIE8BEp/mKVKHKKHiCE3eq5v0JPgut9uT36wz4SstR
         BzoA==
X-Forwarded-Encrypted: i=1; AJvYcCU4EtcXcmEPJLLBU57aiOHfjIsVNBG0Fi5NLY0SREubC/2vPB9T199HCaIG3FTpW8ZcpdKe7kLFd2I5cb4dnIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOHGa3fkIuzSI1zI+UXstV+FavlMOe7h/2uqg6DaKk1r9N85Kp
	rMw8DniW92KO8gz+bEnDJeXpWUOiXTB6e+1KCWaSDo4qCnLMht9OPG2hDv+dDwE=
X-Gm-Gg: ASbGnctpSBaW+3L/WGIOXG/ZNq6oyxn9o3fi552f4waUYL/ASmqiRwZDWGxwKSIdbLL
	3eEqA11FArEu1A4oyDrLo4kR5dX04o7HoYO1eVRdLswKby06wNiE6wiP0CGT/qcF7Q3ydWbCjuR
	0kbt42pnDfVeF1rDGPZ3y6yirMzjgm7k2PIhWAqkRGlLysQSa6rv0h5BrEW6bdRfKpi6dp8Zkai
	uo+HFUPhWu9ePoG8vWE+IBKqorF26bgYEMMmxgPrkO0QFrHe6gk5MKUYKw=
X-Google-Smtp-Source: AGHT+IFjWDG/W2QUiJNWkvXL0j3HEL2mML/EEgKgjQFUReAFpFCpCXM9Ksl+aVXTWX9RQ6O6ancsng==
X-Received: by 2002:a05:6000:1acf:b0:385:f409:b42 with SMTP id ffacd0b85a97d-386453fe4d2mr2869941f8f.53.1733822294723;
        Tue, 10 Dec 2024 01:18:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f4a8758sm15221326f8f.27.2024.12.10.01.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:18:14 -0800 (PST)
Date: Tue, 10 Dec 2024 12:18:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Atul Gupta <atul.gupta@chelsio.com>,
	Potnuri Bharat Teja <bharat@chelsio.com>,
	Leon Romanovsky <leon@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Casey Leedom <leedom@chelsio.com>,
	Michael Werner <werner@chelsio.com>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] cxgb4: prevent potential integer overflow on 32bit
Message-ID: <65603cba-eeaa-41ef-8d62-3453f3d19c7b@stanley.mountain>
References: <86b404e1-4a75-4a35-a34e-e3054fa554c7@stanley.mountain>
 <20241209185556.GA2367494@nvidia.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209185556.GA2367494@nvidia.com>

On Mon, Dec 09, 2024 at 02:55:56PM -0400, Jason Gunthorpe wrote:
> On Sat, Nov 30, 2024 at 01:01:37PM +0300, Dan Carpenter wrote:
> > The "gl->tot_len" variable is controlled by the user.  It comes from
> > process_responses().  On 32bit systems, the "gl->tot_len +
> > sizeof(struct cpl_pass_accept_req) + sizeof(struct rss_header)" addition
> > could have an integer wrapping bug.  Use size_add() to prevent this.
> > 
> > Fixes: a08943947873 ("crypto: chtls - Register chtls with net tls")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > This is from static analysis.  I've spent some time reviewing this code
> > but I might be wrong.
> 
> Applied to for-next
> 
> I fixed the Fixes line:
> 
>     Fixes: 1cab775c3e75 ("RDMA/cxgb4: Fix LE hash collision bug for passive open connection")

Aw crud.  There are two implementations of copy_gl_to_skb_pkt() and I
only patched one.  It's pretty weird how I mixed up the Fixes tags.
Anyway, I'll patch drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_main.c
as well.

regards,
dan carpenter

