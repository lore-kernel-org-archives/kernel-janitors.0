Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B743876C6
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Feb 2026 09:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097774; cv=none; b=bAjyfibqLdwG/mu2BilJuVQi+4lXO5xsIVrF82/SzwsNikB8s4z4m1rCCGM961VVy1MVQF3ET+Jyd6ukzgpCSz8J8uGXvdHvKuJFhqAfEFEFAUkzELObnpaxNhpJrlp9cS74WOeKuvDRN5uSN7eYa5sQBbTCBBn42GJSotaLA7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097774; c=relaxed/simple;
	bh=8UXEEY78JgIJo476jNFn2ZS8ebZG6/2oNY53ZJEgYO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLjSZjHSqIoizFqsbYkRqKJbquX3nYGRkT9G/b71hYJQrXZRgl+khJH0eCCOn4my/+vgj0w/enPo03wfdCbnV+RTYTDsS9sgfB2xvfs8oL/Pk4vbVQX8Qwi1JXzdTgaFxR8eYNn2V2ZsRarx6QSTKEDYF3DSGz9msJ+g/rDDfEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xd5G+ZeI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xd5G+ZeI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48371119eacso7333715e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Feb 2026 01:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772097768; x=1772702568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Fi/8raflhbrprvHiDe2P6OVjgFKHTkfZNPmoq1Ca/k=;
        b=xd5G+ZeICfCxedsy6gsAiDxNpOcxL+xqSxryfu55OWSCdmL6bO3mV32PMO5PHriuVt
         8xNOV35qrXYOGszokOk6wzTZvRw3yoNKg+MLi4dLeNKuYQy4mEOkUTBUAaULSjTzZem9
         ZtiQSXEYfXIoGm6DIhGY/VWJ1TPxJY/Q9XFix6+HA/P01WfeqKhOvYSCj+oNs4Hx0s2V
         AjLdYsRLn/HbCbzZ2kL8+OTfKT0GFrmaKKnrKj70eOR9wnnZpxroHyWm0+vgD2YBgU/a
         X1oV7NR85AzJ9+jP7JVpF+yUf+lmVB7NLfU5aRtEG91XSAmD9lCbeeqqT41YyQkNqVUr
         oy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772097768; x=1772702568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Fi/8raflhbrprvHiDe2P6OVjgFKHTkfZNPmoq1Ca/k=;
        b=veZDUsvFVlLyzNXbaBOXfQOvgV7uDVqN0bWTRoQse3tK1pJwpyq2NJeSVN6CeySqKy
         1mU3aV5dPpXxykILt3tX0ZEf1VkzVFfZXIlfiqjAdCM1+OcS6vIvQwr+Pp2b8QbuR+8V
         ZTcBWMmOwtYc9HgpKt36gmhoeVY3b2AYXLErp48+cp7vZpzhjbyerXbKk5Inn4w4H/Ze
         KnJT6cgpwII2QyMM9q5jeTpQSB0Vya1HKlCbJeJn+ya5uTkYwRknnZQacYF0rg0u1Kl8
         YlDDREU9bC4edYJkz2x2mX53WZ+COWaKigGroXXbpobZrOybxLQYBJ3wn9qGatuYsirX
         hqpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRAn9RE/1w/gs7Udzv71BT5Xj82dJUIU/ejbt7EGBQDr/pKx288aqNubGVZ355oziN/NAl8dDurpO/tQIMyjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY89+mP8bYXAbwbbuh8oURJ++PwlxXjn/CFeSFuz3zRgMvycpS
	bR7iYuzrJSAhyGIj9DqYKo4v6JC7lWpdgsitw1uUrRVvcunBYBbnIYhv5UQLY8vd0mw=
X-Gm-Gg: ATEYQzzw6/GUfAZpyShyqT7zj+2ERIjJoL1gYIBfRC62974xkk4M/bknhmIyfuP4h25
	obopbMIJAM+vBiSyeuUmCW6PxolsJuHBKI4au+Z0XoQuEPHVP1GeUwCGh6jPXIgP2nVzT+Qin4W
	eplnf31FV1UO1zHLv4I9KtbvoRcMhUkt7hEkWTgDFj6FyKFkqb1xAmB6DAAO3PHrY/dEIFM4a9W
	yctg3H/kWo5a+C7nlID+GziQdZ1UonrAvLKX8ADW0B4zrM2TzORGu8u4Vq9dDVS08blBQrCiDG6
	b9UH+oq+wVuv/E4Ax5Bz2yuD1ynwxA9g3E+omSKS+fwfZl68DhNyfLBkS0rYBa9zuDq2hN9vd8r
	zJG/L8plbDqk4DITm79i8LXiCfIiA7UZHYDQ+rb7tpxHU5qO+gtXgjBFmRqTyCabO0pISoVKpLf
	mQqyiClxyiASYiQGw9lSEO0u3HoizL
X-Received: by 2002:a05:600c:5250:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-483c3db85b0mr23915235e9.14.1772097767976;
        Thu, 26 Feb 2026 01:22:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439934cc51csm8305010f8f.3.2026.02.26.01.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 01:22:47 -0800 (PST)
Date: Thu, 26 Feb 2026 12:22:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Cc: Sridhar Samudrala <sridhar.samudrala@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v3] net: core: failover: fix NULL pointer dereference
 in failover_slave_register()
Message-ID: <aaAQ5JrrDAVOByeb@stanley.mountain>
References: <20260226085601.11343-1-zeeshanahmad022019@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226085601.11343-1-zeeshanahmad022019@gmail.com>

On Thu, Feb 26, 2026 at 01:56:01PM +0500, Zeeshan Ahmad wrote:
> Smatch warns that 'fops' is dereferenced without a NULL check.
> While other callbacks in this function properly check 'fops', the
> rx_handler registration does not.
> 
> Consolidate the NULL check for 'fops' at the beginning of the function,
> before it is first used in slave_pre_register(). This ensures 'fops' is
> valid for the entire function scope and allows the removal of redundant
> NULL checks later in the function, as suggested by Dan Carpenter.
> 
> Fixes: 30c8bd5aa8b2 ("net: Introduce generic failover module")
> Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
> ---
> v3:
>  - Move the fops NULL check to the top of the function before any 
>    dereferences occur and remove subsequent redundant NULL checks, 
>    as suggested by Dan Carpenter.

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

