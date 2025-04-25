Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D437121638E
	for <kernel-janitors@vger.kernel.org>; Fri, 25 Apr 2025 13:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745586295; cv=none; b=T1flJ4gLb+DekjuFtyhZpPsRhfYkrQg7c220c9wVNDjsdox/T5sDzF60c6aWqMlCbn54u1yiSsnRftDjwXK9SbTmtP5+2d1pvKV0Ca29a2xQnJ6cLNl/mYVfbmK+mVIzV3kv8LECgY5SW3hjDrcQDSwhtTLm5kv7RTWvKL0T0AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745586295; c=relaxed/simple;
	bh=Zj97Ex1RSi1g+9gUZ/Tcp04w18dKEFAHI9+Rpiyg+So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAii5LNcR6pEVjCX/i8nlzOxTXa3TxMLWbPbIkOQFlKHKBxeDsW2jltblzoh+kwrUzzCzpIQHXRS/FUMizCNq61ZXFxlKnZIp8oziYD8aBV8lscHGUhozQIkERR6BQhpMaeZnos+SYjEf9sQ2NVU1SYpEOfrVs/m4FQs67h/o7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ok96HLrN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ok96HLrN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so1698086f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Apr 2025 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745586292; x=1746191092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r3J3GqbcEJHK4SoFItL9fayn3ipBLH7O0WRijmWDcMA=;
        b=Ok96HLrNCxIYbo8MHrqW9hIoOfMacx6NX8an+nX/bPIE5zCna84JnOdVS8976z1cRb
         TcOyu5dAuG/eSu0uCIAhVD9fGuKs+MbjpFlDFKULdmFZsApXIjyVt0X1k4Who6hLtc0a
         1wynf2X8i8pWfInNEUY22/Z8anep8YZc3Oiy4R9EjxDuFu7hgSm602Z7a9Rwm2j6iZLo
         smXJG8IMWUHZ0oJ7OSG6OhjZPK9QqAdB3p+kUhtWVHmc0cHWJj6dNgQI+zMmiTp/eTy6
         yrX1ultimLgU52BnmaT3409f5t1/dOtsuCR7H69lisnO/9bM1PoWJbGgZi4nh6QKGjpq
         SLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745586292; x=1746191092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3J3GqbcEJHK4SoFItL9fayn3ipBLH7O0WRijmWDcMA=;
        b=ONoLaNnz+HktdT7JX+OMXJwABMCPNb+MP3MMp7Zr4jHx1E7uQ8ITbedbXvlFabo97f
         wCVBm86ga5WGB9hlrkNxZoir3xkA92yuOis/np7Ok3O4pR2MIicVlIKQCW21NwpQwIby
         GX+fPy9B8QZoU7gsxt/fZZY2aR5uKAXuJMWChpKryNDkc4LG8IFJyYrNpU7t3T5DIXQM
         uwHdVNMEx26dzX88ILTKtfhew6rMfZeeabtALY9AI+hqGZ/cWD3Av9sMAhEuvAsKCI3a
         1iCVbm25FCQvFI182CDq0Bb+bKXA3CXFU25dBYVkY+g0wJaZzVcpz3nCSCK3a+3aiN7s
         rcAw==
X-Forwarded-Encrypted: i=1; AJvYcCX4ts/0K8Dad64bSZQ8oNQ3f0zTXiUTwFCiETctEgovsNpyorpW0B5e27KpgS/Oz77u6BlaqRwUcodA0l89vK8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9HUnIQ1FQUvPpKrzNiW00f757WvF12BnCgqm4PSs+7ji7yKpp
	RSSHzge0592nY9o+K0RVXim2uqQESf/Zoh26hTHS4Wed92HGQOGxVrPLdSEDN/miYQn9nSAVFR/
	E
X-Gm-Gg: ASbGncsD8jhYhhqhLpHrZB5JzIgwsCR88/eO2S3FQhNVUX4aub92lZyF744xhTlegho
	Xjv1/0fTa0elEvwTAh027tl6Tm3JBKgfcEcSmGmeHsB3tOQ8WV0qT8I5MO/CgEVTpnI/RwacMdy
	dARZpqLLij5qlppdMx0XCjxMAfGQsIndrhTbOXThCXeUVnXGOBwsgonMQKQaWvOI3VS75Q4w8hg
	8HL2/Bx4kCWo2qrq+XQF/vYBCw30Bk2+DQcZfUU0wJPbqKm6BCPfolAVVkhKPECzkobkIByC49A
	uE+E9bh6MuQjeXuxxuzpKhtzXmy42F8BKjqanOrCd+XWBQ==
X-Google-Smtp-Source: AGHT+IHxVgPrxzsyigbQs+XS+4aY9YzDl52Yt9wjdLrlTN9Cnijbn8pi0uqCi9dQ7/1RBszsnzma0A==
X-Received: by 2002:a05:6000:400d:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-3a074f47161mr1713472f8f.49.1745586292037;
        Fri, 25 Apr 2025 06:04:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073ca56d5sm2350498f8f.32.2025.04.25.06.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:04:51 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:04:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: jstultz@google.com, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 3/3] alarmtimer: switch spin_{lock,unlock}_irqsave() to
 guard()
Message-ID: <1ec38ba3-000f-4e26-b18f-95ffb3583836@stanley.mountain>
References: <20250424144819.24884-1-suhui@nfschina.com>
 <20250424144819.24884-4-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424144819.24884-4-suhui@nfschina.com>

On Thu, Apr 24, 2025 at 10:48:20PM +0800, Su Hui wrote:
> @@ -230,15 +226,15 @@ static int alarmtimer_suspend(struct device *dev)
>  	ktime_t min, now, expires;
>  	int i, ret, type;
>  	struct rtc_device *rtc;
> -	unsigned long flags;
>  	struct rtc_time tm;
>  
> -	spin_lock_irqsave(&freezer_delta_lock, flags);
> -	min = freezer_delta;
> -	expires = freezer_expires;
> -	type = freezer_alarmtype;
> -	freezer_delta = 0;
> -	spin_unlock_irqrestore(&freezer_delta_lock, flags);
> +	scoped_guard(spinlock_irqsave, &freezer_delta_lock) {
> +		min = freezer_delta;
> +		expires = freezer_expires;
> +		type = freezer_alarmtype;
> +		freezer_delta = 0;
> +	}
> +
>  

Don't add the extra blank line here.

>  	rtc = alarmtimer_get_rtcdev();
>  	/* If we have no rtcdev, just return */

regards,
dan carpenter
