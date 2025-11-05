Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1C03064B5
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Nov 2025 14:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762354465; cv=none; b=ismbPEoOtuNgfYYIZNOfZuMyf0dbSjj+Z43F7zyQltqG3MO73dxF/as8M3ExZCPtDt4+AXu25MlomVswxpBT6r6zZVX8FAKes/XWMtreyUYErKSIwEB56EtD7aXhWkNQLUJu5jCLfCwkX22HNz5NIWyVNyfR7nSvaeZp808tYUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762354465; c=relaxed/simple;
	bh=9PR9Ui8ToTKXxDFeyWEbNhS/TV+0W0qENUAbZTNpHkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIhRBHID9MI+xpOt2YTDb+18K9KEU/dNftzm35YOhZ78aZiId2v4WhpjRIML0CrjNQppJDApzS1RHdkOP8Gtx8OuR4d/LLvf5//7YD2/XRKeMC/0hRcPtoYLPcdx0e3En9NgCK3v3NBssY1B4NwjYwlhWy8NMH9EzXEI0a0bx+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mtPOEdY5; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mtPOEdY5"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso11384127a12.0
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Nov 2025 06:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762354462; x=1762959262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rso48ZLUTdUYb/Ey0UMY/9I863vsAkEssUt/OOSP5Kw=;
        b=mtPOEdY5WrA+l6F9pJVWZLxJYaYdcKJmW7ejXOLSsbQKdEZ8b8MvBZacDazpIREqn7
         eeAEJf0+kDBo08qmJD+dnw6ogkc4U8pph8GkPHwzRQj/CLbFyXn11p7RfgH5aBxTDUlu
         vEXp8VvGGQ+sa30j5uvkB5MtMMRUXhjU5EuLn+IE6NOCtw8JApJLfML6Zkp93rfyupiv
         Uo4h+bQE+qBcUFpTwChc3hTvp2KWT2OLtJklrV6n0TVvopS0F/hw2VwsvPNZU2U2drj/
         V5UUD9NPuN/1p/jFQHiwbRAXhR7mhcKSOPIEne+cbzmDZ9Ei8W2e0sUyL8kjjM3cJAkY
         L50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762354462; x=1762959262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rso48ZLUTdUYb/Ey0UMY/9I863vsAkEssUt/OOSP5Kw=;
        b=sUPL/tvLe4RT6DBV+9SwJTTtPdxfnECxpUJtz64bcUUcf2fWEfcpEXMRjjSuZSmKUw
         Q5ShIRYtNN9iDtcG2ny2HtF3vapwhOkcvV3adtQvXc0ZQIJgezsHidv1HxpXhHYIYZbF
         nxjbNfzCU670j38DDdb3iB0Q9+3FrUmMyCx9WAtHrBnUIahNhNaQJzsbbjwywRFAWonW
         f/zxm/sk1rsBXlTZ/HJiJJpKOK3giwyoVLMxJAMm7OTmsgeCySaG6MgVkst8rF/RaWWb
         pNhPyEk0q7LTl0c+rZW+9NM0bHEJVhIgp7NNNCM2K0hQ3sRgqYLZZaxhIO5bBjodqlHU
         bKIg==
X-Forwarded-Encrypted: i=1; AJvYcCV8KMImNI+TtZi9RY0y9UyhR4H051nrx1SuikvPZYjZHw8+S0xviXNCmWugZUGh3sB4NL1ryEecmq2ts9KG96Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YygPeXzQz8zSxj0bQbHV6Q1OTP6fEKigDVyPaYkLKEXb+e/9Tnk
	C7hVFVZSH8tb0dKj7WtxP8m+yUpJxvrAwZhDReIcRys4Gh4CbGjH25kucVHhFyHdrxY=
X-Gm-Gg: ASbGncu/phhNCiMU/FNA6JZWYSx7Wro0pXfTk1BgIj4lJ0px4zljjdyiriH7a7VwurO
	zsZamRz2CaOxjtnp89dOu0BhqkT14YP5X6i2XherrWM+uR1f8n03HrdCd5OofhjPjQuTmHhYZeQ
	GGGFb0scW4Ds+blOxSLV0qVVk2t//QhhTlp3WniHTbNe9goBUNWFdiUTIHkhGrCaW2MLIoIhZWk
	8muCdyCK6n9BpI455DL+PDmIl9nyd8JEjKZRPKeiq2h7WPd7NkX018MFcabkNAugXUS201TjE9m
	ecDg3OFq3I5xU2WKjPyNuW+NSxPY4AlNLGtu9dC2Sh9xskgPq4FfGeebXaKkRN7kF0OhAPUFD1h
	LNp2kddelz9/JJA5H2kUK7Nh93wpUI2xmpT1Z+Up7lK72b4qjxS3wtiJ7w5vFCFzhPwXSe5/6hV
	9e8/YWXP/HqIdFdqaiaTyCHG8=
X-Google-Smtp-Source: AGHT+IE9D6VKvyalRSJfPC3AIpQXjSXQIzyul0MgV+vBwHPjqR1hb6Z5sp0y8RViBXTUBYLh7S3xVw==
X-Received: by 2002:a17:907:d649:b0:b71:5079:9702 with SMTP id a640c23a62f3a-b7265298431mr364006466b.21.1762354462083;
        Wed, 05 Nov 2025 06:54:22 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b724034ade7sm507488066b.69.2025.11.05.06.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 06:54:21 -0800 (PST)
Date: Wed, 5 Nov 2025 17:54:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] rtlwifi: rtl8188ee: remove an accidental '-' character
Message-ID: <5c992936-4e7b-4c0a-abfc-0ec0fb9ef9fd@suswa.mountain>
References: <aQSz3KnK4wFIJoe3@stanley.mountain>
 <8d6962531a9545fd8279fbc7cd04340c@realtek.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d6962531a9545fd8279fbc7cd04340c@realtek.com>

On Mon, Nov 03, 2025 at 01:17:07AM +0000, Ping-Ke Shih wrote:
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > Sent: Friday, October 31, 2025 9:04 PM
> > The "->allstasleep" variable is a 1 bit bitfield.  It can only be
> > 0 or 1.  This "= -1" assignement was supposed to be "= 1".  This
> > doesn't change how the code works, it's just a cleanup.
> 
> Yes, this patch doesn't change logic at all. However, it looks like existing
> code is wrong, since other places in the same pattern in this driver set to 0.
> More, I check vendor driver which also sets this value to 0.
> 

Ah.  Good.  Thanks.

Could you send that patch and give me a Reported-by tag?

regards,
dan carpenter

