Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1FE1F9F7C
	for <kernel-janitors@vger.kernel.org>; Mon,  5 May 2025 16:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461356; cv=none; b=IzbiV7FFkgrsiGiLrITm8swWWfRJ28SzAIMS2gYhW+gMu/IIo3rpSTcROhHkbpIjalFak1EJO9NkR/g6PWJ8uelIAHeuBFR2juOWWEydU+g2B6GSvv5NSaetpTTDR302zEuncYSULGFkCQ1gTHaQj9vx6DsBPQjygHSuXNTE9OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461356; c=relaxed/simple;
	bh=iJ5SpkhBGvECSaWeBIwDeP6OMBAoZ/IKXxgtjOCQoC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFUvXW8dzuVciPmYc+tWIv/mZIlz0IRJZTpALlcOVud7JkkChhElaSKX1aA+gk2o/vxj3TUDyB508vE8trsXsDqCszT0k1CSuVDu2Lg9cF2FCqEx2xLhiXL4TVFP4c6JQyNAQK+0dOJpC36Q8JZHJzqXrd4LJzLd7J4Vw/UV/lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=EoAWB5EY; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="EoAWB5EY"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72a4793d4e2so3040424a34.2
        for <kernel-janitors@vger.kernel.org>; Mon, 05 May 2025 09:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1746461353; x=1747066153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqEKM/OjnSYzN6ZOnaif2KiyQ/v82RpALfNylkwGH+w=;
        b=EoAWB5EYvT30S76DZArRG6e7DrGJ0pKQuJL3m6zCN4mwuUR4zbS/uvG2r0+SVHcSYt
         ZqgQkM0rabsNyzZTvndEbugVkPFWL6qeOyy+XXMg0vQgUzdEUCjhc5USRKlQb+ojbaHZ
         mjCF3UgQNwq8QIUfFixT8/fMGAKI2JNqKOR/IbFKoz9jhcXCFPdBKHrYi9jjjVmXwJ+7
         5D6fjTxZeKCoQ5g3p0hyXJCFJJXWaXN4sOuTaEbYC+3FkBoXIEe7lkBoLNjuHijjrrHN
         tf0Smay/AFd5vk8Hz6QxlgCzKkoKKVJg9EySebhn6RRytHSLPakIjB7T7czZ4axC2kLC
         ahLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461353; x=1747066153;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqEKM/OjnSYzN6ZOnaif2KiyQ/v82RpALfNylkwGH+w=;
        b=RHUipQi5RV6g1zwMaauDmAcisNVbcs5StwHGXP/unPtjRJVct/PwM7WcNMQXSmU0xq
         0OVem0z17enEbm5m+XsruZYWFngsE5UmxJozqlMnYxKDE5gnP9LKP6Zx9k2du8t7V/wL
         3yI+NmIlko61QcV5+NuokGBIxKCVzgHznVD73ZZSLd9nsfRUECCGVwnaNzjh4gIckcim
         1DtiQ6ex4oLbQdw/fFilkpEfwmWD5PrE9ehiKBAOi7HSukksuHMyV89zWckSA9MoJFC4
         SF+F+lrUwfNK8EhZR8NDnCycKZsbukAMM/7TSgIgp4D0E6jRCk/LAA0KvmzrVcgpy6ms
         ds1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfpumEpGsvypA253KjNza/wwf3fnldANHjt7zFFncmT5x1ZmgjN/tsFQ77ayX3QMHNPpQKjvcCY/zGKYPiYSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVk85cZ9a2Wo3/ixOC65RZ+rNlJ5/AvQ0nQEt85/7tmBSkMqHB
	8Rxl1tBOqtwH1U//P5Hg8oLe/7PsvUIdZqeCKfQNLEwdVNwyLuGE157Yi10rbEM=
X-Gm-Gg: ASbGncuga6X5QpDccejhBDX+NjtD/xdZCaf3CFF6m+JD8b2pYscdggFBPEKMVUO8DLE
	3NpEiiccvNpYPJxc1Z9ZJwPWD5Jdg04pIzvbcQmDlQC0VUkbgRSahpNlsaalOEC1+nRod1E99Or
	jeXL/qJht4T9QME0uipeAououDByEGYsaGCR8z/Rp49yGaZFZ86MZZEpeUsG5t4ga7Wou+tC4Ze
	VK5OgDna4spbZZsabx0Jxqh9qAmHlsBHr1NORE2iBV4ZD4QTuRGmzXSGecbpDM5Voi5Vej9kWPI
	SEmhYr94SOQKvJ6gldJQSYh59pOaHcT8CLaejlU7Gc1n
X-Google-Smtp-Source: AGHT+IGJHBe1tE73+gCUVJrtdihmneKyQqRpzUdV8C0iHKB/EZurcAQuVHRzs5jeBKVkgUEGi5SiuA==
X-Received: by 2002:a05:6870:8990:b0:2d5:246d:4b67 with SMTP id 586e51a60fabf-2dab331fea1mr7891413fac.24.1746461353628;
        Mon, 05 May 2025 09:09:13 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:ec53:8290:86a1:aa7c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2daa0e59e30sm2058124fac.3.2025.05.05.09.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:09:12 -0700 (PDT)
Date: Mon, 5 May 2025 11:09:07 -0500
From: Corey Minyard <corey@minyard.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Corey Minyard <cminyard@mvista.com>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ipmi:msghandler: Fix potential memory corruption in
 ipmi_create_user()
Message-ID: <aBjioyOkty40OVd5@mail.minyard.net>
Reply-To: corey@minyard.net
References: <aBjMZ8RYrOt6NOgi@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBjMZ8RYrOt6NOgi@stanley.mountain>

On Mon, May 05, 2025 at 05:34:15PM +0300, Dan Carpenter wrote:
> The "intf" list iterator is an invalid pointer if the correct
> "intf->intf_num" is not found.  Calling atomic_dec(&intf->nr_users) on
> and invalid pointer will lead to memory corruption.
> 
> We don't really need to call atomic_dec() if we haven't called
> atomic_add_return() so update the if (intf->in_shutdown) path as well.

Thanks, this is in my tree now.

-corey

> 
> Fixes: 8e76741c3d8b ("ipmi: Add a limit on the number of users that may use IPMI")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index 8b2c3fca9c4c..064944ae9fdc 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -1240,12 +1240,12 @@ int ipmi_create_user(unsigned int          if_num,
>  	}
>  	/* Not found, return an error */
>  	rv = -EINVAL;
> -	goto out_kfree;
> +	goto out_unlock;
>  
>   found:
>  	if (intf->in_shutdown) {
>  		rv = -ENODEV;
> -		goto out_kfree;
> +		goto out_unlock;
>  	}
>  
>  	if (atomic_add_return(1, &intf->nr_users) > max_users) {
> @@ -1293,6 +1293,7 @@ int ipmi_create_user(unsigned int          if_num,
>  	} else {
>  		*user = new_user;
>  	}
> +out_unlock:
>  	mutex_unlock(&ipmi_interfaces_mutex);
>  	return rv;
>  }
> -- 
> 2.47.2
> 
