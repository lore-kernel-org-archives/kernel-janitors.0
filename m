Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02E01547E7
	for <kernel-janitors@vger.kernel.org>; Fri, 25 Apr 2025 02:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745547257; cv=none; b=PRIIq/PNZoRfqEtZWgHDDgeuHT5360ZJBwsTvtBuYe3XiiarRPl531AAL0LcQI3oma2aQDUw5eSaegv7dR4jl8atseCHUhraneGuFbwUY4vDgQKyO9WlsdEVxuDPhPUMHv4ZLD0tlksyXbhrobC48MwxCditRWaO4Lisc8H9RBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745547257; c=relaxed/simple;
	bh=I3A/zHwAYSwnjgk+xe7X/mxwoo6oP41oVPwo+1vnug4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbTQ608raYzDIvHutEGMMzHgYg8hquC1jKPXk+9DhDfQK3kRFbAzRm3pas9oEHT3ZQ2cEgsLCHiO2xyh0/sKzv+BdSjjKH5lyS7537GxCrmsvcylHVibTj1D3yFa6iNfy99EzWnfEs/vOVKRHd6UWr1W5Gma2gEOPyU0Sc2bdRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=GKTHmmYg; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="GKTHmmYg"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22401f4d35aso21297265ad.2
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Apr 2025 19:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745547254; x=1746152054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09kVEaqIXaUD+GEpgwr5iE/SxGZwllT1KTlsw5VQ7Mo=;
        b=GKTHmmYg2VRFiafJKBcyjLO6aIcxwnOzkMSmlxg0VqLTiGhOatT+Wf9nvSn0vY7MPp
         hsj3zcECz7pFBP0jyd3H4vTs1jbjdGnehSPOyjgeD4TgPPiQ/LUuWNGJSBU5iQE+qnBH
         0brq5LLbinQBOxGHhE7a0y7wZvRAXjEJYRyXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745547254; x=1746152054;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09kVEaqIXaUD+GEpgwr5iE/SxGZwllT1KTlsw5VQ7Mo=;
        b=LTQ/xkULpwm1suLPb7TPXS6obnyzjCpOU0S0kU2xiMxMM2CHIYvjQrh9q/npLJHTqP
         ErRNSaiMWdS9sr0MPd3nt/CVrYAb6QHfJJvX0a9i4/WTI/AAkp2O8tchaArlNgK6tX83
         qOr4/Shljsz9tl0FRIuFoorYks7P2HvO2K39UEmRWzbjWXzHMqBW4REbHTkKWHL8KoCp
         2rvOQT6OqEItRjQ3fNa3Ileb2FvxVWY7yyVsm2GslptZeYRNBsFTwzsXAAZ2tn3cRxlG
         d3ixBXmIjcx4GfiopNmF8CsSq796JbhPTUIEOA61YL/U1Oq8n7gTBrXQWnbqRv0qDWjI
         xCBg==
X-Forwarded-Encrypted: i=1; AJvYcCUVkOZBrIsfsLPeJ6pueREpMCG3Rqoue4PVPjZjmdA3igTebuD/8DrL/dW9aV9wPi/DE3mgv9wuGu3y7G/Qw+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqrfhmTcZykf/T8NusL8DJPbdSlgvbFMpz4UIv4/8TnLoBF93W
	h30c9y41gSQu+jrv8z/+2RyK8QdTqTAshRESvlnZNQUtlYibe4QPw7GAx5vfpHY=
X-Gm-Gg: ASbGncsZo7qBLGSyNkBnRRbynTo/1xOFgLJrBNmzu5AKBhK2EKOcnixH6nzXYCb61Q7
	h6gXHB7ymOG1WqmAuNxBIbVeVWw/SVv9neL5SSuCbcqRoW6gv7yUZcKJIvpJWP3Bp0I9UBwsCW4
	XJv57iZOUJxmpKWXM3NBSl7HbOaSdKnNiDiqiXz+Rb9eDn0Ayau7DMk+SVtDEYueeIFPofxVRtK
	0AWJoz5Lvzj8tcV4Ya4ROwsuLknt+NB5A7QJQXrkbh9IOD4YbEiJtIlchaeiq4aFXq79S3nRD0Q
	ITJY2uD4pXj5dpxdu+DbfL7WwZaFJMcQOpblHTcjB0PVEderPmGFVDe9zZcMl0LBRgrI/eJbTpL
	zcmZCY7o=
X-Google-Smtp-Source: AGHT+IH/PkabTYLPdtMjI7iYWLibevj3DXs51yGrnj7JIYtqi5YhGlW6R52IDmzjr567SoWgTnJEdA==
X-Received: by 2002:a17:903:1b6e:b0:223:3bf6:7e6a with SMTP id d9443c01a7336-22dbf5e8fc9mr10072345ad.12.1745547254181;
        Thu, 24 Apr 2025 19:14:14 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm20934285ad.76.2025.04.24.19.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 19:14:13 -0700 (PDT)
Date: Thu, 24 Apr 2025 19:14:11 -0700
From: Joe Damato <jdamato@fastly.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] net: ip_gre: Fix spelling mistake "demultiplexor"
 -> "demultiplexer"
Message-ID: <aArv84C4NDwv2aCa@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250423113719.173539-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423113719.173539-1-colin.i.king@gmail.com>

On Wed, Apr 23, 2025 at 12:37:19PM +0100, Colin Ian King wrote:
> There is a spelling mistake in a pr_info message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  net/ipv4/gre_demux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Joe Damato <jdamato@fastly.com>
