Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D76D2CCC9
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745402760; cv=none; b=psAHSmFnW1seMojO26hh+VOp/L9sEG96feS6vCoI/Rh7dJSDliujay/Mc25byyDUlMM0+ZqPk/7iOptIqNtb5DuaH6LeKejdW9xKUBid+LU8yI2VGZQ4l63I45O/RNV3ROvY4yueIvMYo/PXe0DIw8BDshxwWAC5VEGBS9e4jz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745402760; c=relaxed/simple;
	bh=kw3oA6g0L/J+SJt52KtP3qj/6ZRBvYA/Jj7aRmbJo2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfFXq/f1H/QcXIjNMAuanbo0Uh+tHjW8fedCk22YPBrnYF2SjQsrmo5IiucODNwDZF50ofJ4wG9E+wmRMZ6Kiufx3iskVOpUZMi85uk46635nnGT+k7xWI0hkIYN7NDqtgH9qQk7unpakQlnJyQ/Hek1hcGOobRGsxZDl9cwGkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZZaUwGUI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZZaUwGUI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so5673095e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745402757; x=1746007557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUbJaI9VUAIMhFIIcaT0OkYeQfgO+gViGfE+fCTNZxE=;
        b=ZZaUwGUIG0lRs1GV/UbImRtSvwp/uFdK7NO3fZYZ0z+6H+c9MyhLXH8+IKLfniBS+V
         A9HWCIxeGh9rWikmPYY3Ve5DlZNn5Irpg+mq30lP/SLRsWn2Y5U8VCRTna5j1uEZpiLi
         VcDUcXv8rRG3hXTN03WJbmXK554J6TYjxUZKLUsFiUDmviB6c6iBA7vG/iN1UIA6ZRo7
         u7wZh14U3H3wP35O+4vAUcWxxHS4DMWNE46FZu4d9pFEEWrEftL6XGgupMG+FifOg67P
         QAl60cj0Ifx9fV82ndMHkVvG71VZ/KxeSJN5E5KQHkOBXxFl6d/m7/ja3TsoeE6aqG6d
         Dfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745402757; x=1746007557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUbJaI9VUAIMhFIIcaT0OkYeQfgO+gViGfE+fCTNZxE=;
        b=gFc1cii/5FXfX9H0RF3Ao7P87xZNy1i1YbT1UaEYpdHvy4OKjYp6xDy2T7+oLWjaFw
         8uh99K6nxZtffmjn5AlaLFPa7ZilA6ix5rSryEZlf2M4SvXjdGAqU96P6TyeKtZSYyDt
         pnA707ugOcUO0LD8YNHIZxEYsdGb2HLs6VpZ47I25ZbcdEsC/2do7lfi6Wxw9nvMYqPk
         9hPfdLHpyU8i+ol6/3UlaquInakapSys4NdR/Ha8H9CAq1QqOd2FdcvIQ1iCm0ZgYXwD
         SNpngWn1UVjkHCI1bL8NqJMG1ZxYrMXxMGEWLCO1alSZzcgIoYKckTTHAwLe+0MNfR/W
         0JJA==
X-Forwarded-Encrypted: i=1; AJvYcCXsZEVzD+99vyFj4P3nlla/MR5uTx/PAjoYevBjg5HrmN1KlFbEAFUJJCidphrAd4sXU+t3chlw5l8S2CM6WLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzFPZBsKb+a3DWnZAtSr6OmrBeX5jxgl4ll/mJKvCCZ0WoAnhL
	HMinS88HqjuFxDihCc2GS6Tfi7nnnyhx4/a3lU84/ipqe0A+2ObNoOL/+IHzkHk=
X-Gm-Gg: ASbGncsHHn0AdhjJc+Ufg5rHd2rgr9JqpKKFbF5dyBuk6+9OVDhnUjQPxmg3nBhH7PJ
	f0IApEHxr8XctSoXeHnivAaAoiun4A7fNP0v7ymUUZK7J1BqGkMekUkPmqshMQ6jEYOG7IMhfez
	+/b6KRkGUuNMT4CfAVSZu/ncvZpOEGBJrBo2LExIw2k8Y10NbZMV8WMTZO9s8+c4wca5magGz99
	wOmdcMN0MZYo5b1n2/LRRAAyuX6x+EF9krMMm4mwamQtxMY31znBCnw+n0CFCwr6wZOEXTSV6Re
	/OTVLhQXE/svhOnN4w4AxzgP0F3If38UhNNG5CeilGkMoQ==
X-Google-Smtp-Source: AGHT+IFPFttObT8wggvieeFV9lBPKhqslxXbFCmW0/ya4RhTdPNGx6jYRFvipkYVNlPNySJfBOYuEA==
X-Received: by 2002:a05:600c:3b24:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-4409386c438mr17536985e9.11.1745402757553;
        Wed, 23 Apr 2025 03:05:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092dbfac7sm20079765e9.37.2025.04.23.03.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:05:57 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:05:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] driver core: auxiliary bus: Fix IS_ERR() vs NULL
 check in __devm_auxiliary_device_create()
Message-ID: <0354481c-c6a3-4573-a138-56449b55034c@stanley.mountain>
References: <aAiiLzqVulfGDPsl@stanley.mountain>
 <1jzfg7nrzn.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jzfg7nrzn.fsf@starbuckisacylon.baylibre.com>

On Wed, Apr 23, 2025 at 11:31:56AM +0200, Jerome Brunet wrote:
> On Wed 23 Apr 2025 at 11:17, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > The auxiliary_device_create() function returns NULL.  It doesn't return
> > error pointers.  Update the checking to match.
> >
> > Fixes: eaa0d30216c1 ("driver core: auxiliary bus: add device creation helpers")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Thanks for catching this mistake Dan.
> 
> The thing was initially setup to return error code. Greg asked to
> simply return NULL on error and I forgot to re-align the devm variant.
> 
> So I think the fix should be to check for NULL as you did but return
> NULL too so it is aligned with non-devm variant.
> 
> If you wish, I can handle a v2.

Of course, it's hard to resist an offer like that but I can send a v2.

regards,
dan carpenter

