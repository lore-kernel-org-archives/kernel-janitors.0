Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE8324BBFD
	for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748334261; cv=none; b=XcXPKB7zLpkOVHxlh2rhPpL4eBZK2jUws2mkKPa5S0IX8whtnIIU64i/RfSMe5iRk7jk0knwFIbkAbognD2FYMoX4Ch2HX8L7TvIIr785F+eLOKTPgx2v5uoqR/02HkZzuOAtN5PQpgeEpdtYWvEZL9UAoVC29QBGNp3VRIOBJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748334261; c=relaxed/simple;
	bh=BtGSQLVnYJCLDJniw1JTkYqWHqjtJeZ1GxxYnFA2LLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lECKSGcJymwMRJkioeNRx73Dp3jV/72RQCTPUNkVrj3qbXThgsBXZsgoR3qgc+991GNuSxBly+xqfs1IWtmen4581HK3P4rSdM1rg3YrorEtBwHVKDjaqBHYa+AfaoSaNvIcGQpwIH6vLL+ClI9+CTrlUdJnDmQzvts3RVihYNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KUT3Gjsy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KUT3Gjsy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-443a787bd14so30185965e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 01:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748334258; x=1748939058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HbFtJ+qr1BXcc/SsgBVsQ6AFPfMUXJviAmQJ/8+cydo=;
        b=KUT3GjsyaKUFFME4akDcVHtEvGiBswgDr6wP6Gf+Nb9hAel8p/Q/Wkkf+haj3VFHjL
         mQ6l2IVsrrRupgRF8xZfRuCMu5Gg2G9wl0W+oYV9UIXMgj7SnPj0JPPr+2oST4tROGJW
         odrDOu96tMnY3amkDwly0OyTW5XMUxLUCaqFE6069ySUFa/Y6h011jV1xAe3Fx3gXkjx
         G6dhr8iWOJLaHdYYmI7ZEk5dfuV5dKUDOPfDMqeMqGW7iGX7hXUEKp6LMu2Y7TwQRc+4
         V5PSsWBNkCqWDNQaL74sxzH7gBaHI9u6k6UdKWL6c9yh/yE3GeJfeRYwzhlPcv1iTouQ
         7AmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748334258; x=1748939058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbFtJ+qr1BXcc/SsgBVsQ6AFPfMUXJviAmQJ/8+cydo=;
        b=JcWNnjdaEnNFCsRNVgInEnJmS13PWZgcRnv9Wmo23RUFTmIECqyvKidD5EmKsiYpFb
         ajhylQHIvXio5Woyt6kVcBTnCmgvJEz7NcaSA09MUq8KzQ/g9YVy3hTYqHqunoMdYC2p
         AyCSuYs/FF9AAgcAGmJ8gpfVSn02Q59kMFwruDo17Fr+Dgn8Lr4w69f9ql+imcDBG6HP
         kOAAewVKt2KBapuvCAVNT2nzvxVwFD8pWLvrCboUGYmMr7mNtOJ3DS3U6JmMrx9oNeet
         0QYweX/vczwIDgOtDbOS5b5K2t7KMGR0GgGqr21mK3S9OgAcxnEKtsevAY5WCm6U0Aww
         W9Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVJqsfXirmv9x9si2rOJY3pxHMBaXS4XfpNx00dya1MhplTs8reT4m5lRKbHDB86GDxGW5LjMkBxPLjHwqQUdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6gf+Tz8EMx4oh2rdy7DshxHnhhQZw7In2Sjse2eBISNCvgAOr
	Qpb5X31tzgI+xZVVCFGNeBHVwx5b9XZbjLTa8kjMMpNRw55DWHDSBfCz8zLHBCvTx84jPdW+XbF
	gr7n7
X-Gm-Gg: ASbGncvbVhGx104aL6Fw54RncjQq3ieJsQN9PKYhcZfVuIFZqukQNNHcIQfJjqGUe0M
	1TWUYX9Q+xL8HwtF56LA5TqnQKBvHr26i4hEKvEQi3yGa20rEF0SaktNmm67dCj7hVEPvi16G6j
	RpveLA5+7E5BGpywISjgoi9Br8ktmGzLylgvqFM+QYYSqyerMbK+5t3gtQiTZkTjNa4FkCSUOun
	uf4lHzYyZgcg4bwWCjZr2qi3FEe8g5FvK/AZK3Yfgawz+ziPahgOaVMOTsNnt6gX0EInqFsbeoz
	NzSfe7V6YRW/3VHu/I0PzZVJSJ3AU5pdkF42c0GbUPvUcmTigsiru3/x
X-Google-Smtp-Source: AGHT+IFCQWy2kVkN7kjN5cGFOa/WQfCBtbWUnAWkpHSmagIYHisUu1B0x3W222r23fIQfA8BOmdYYQ==
X-Received: by 2002:a05:600c:37cd:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-44b52ee1e93mr147485495e9.10.1748334258483;
        Tue, 27 May 2025 01:24:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f6f0556bsm258744875e9.12.2025.05.27.01.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 01:24:18 -0700 (PDT)
Date: Tue, 27 May 2025 11:24:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Akshay Gupta <akshay.gupta@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [bug report] misc: amd-sbi: Add support for CPUID protocol
Message-ID: <aDV2rRM8hOC8kY34@stanley.mountain>
References: <aDVyO8ByVsceybk9@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDVyO8ByVsceybk9@stanley.mountain>

On Tue, May 27, 2025 at 11:05:15AM +0300, Dan Carpenter wrote:
> Hello Akshay Gupta,
> 
> Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
> from Apr 28, 2025 (linux-next), leads to the following Smatch static
> checker warning:
> 
> drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
                                                                     ^^
This was obviously supposed to say AND not OR...

regards,
dan carpenter
