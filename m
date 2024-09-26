Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA8417CA0A
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Sep 2024 20:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727381656; cv=none; b=Ug0ygnyfh/9KodQaUUatgxlUdb8hPT0SHjCrDG7n1GRGNvKsb611aL3nwXzDXY1/QV+9lJyoDYXgHvINUhWXLJTM6nETE+jWwDbB+M8SUQk/zOz0+1weCThXd9BYYzgYrC/ucGFMywplZ7kCS3ZufG5irtPKaGjpF8RPrdJY2cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727381656; c=relaxed/simple;
	bh=SywJ6IY4/ZKra54DmIZi64FJeAqVuZ29u2cS0EvQAT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuxTCZOSfc3QMXDFDENzKitGtAPoKDE0rdamj40mz4O9cp2gOSv5wLRu6hcpmeK2rZClQbuQYg7ymO7lJkZXEWStmgdTqMQyACSf69onpPyZVyIFHvLfFZVPsYbO1s3jyrwWmd4Wa6J47nVoMngmW7c3/2vPLnXCWToA0ZUeg/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/6Ib0Zv; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/6Ib0Zv"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cbc22e1c4so11673685e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Sep 2024 13:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727381652; x=1727986452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=adNp+ex0aTTFAqiWEedrw/mOZftL/ye5N6g7vAI0S0g=;
        b=h/6Ib0Zv1Qywp9YTBqrFaOk7L2Qcd9IMpfc5FotB22f+1oRgnYJ/j/DtPcdlSqup+3
         ygN71C1KgfZtMLp6bLNIlYG1Pb/Ds0gsGjyHKgCbxQj7d/Z+JgK+Uz0+FAE8OHpwm/p6
         sMojjiOsU+XvfNC7NLr2b/9ZudJVMTxUQ+ZqIeQUigo2f1jSpY4AanF7oyo69Bj+Q6tX
         cOBZoqzbXEl7FALaQ0MQn60KmdDenZMb+NggDpQuHmjKjLFGPkWY7/DchaYRJ9x+AgkL
         JOuTTiQ8pq+8EHhkO5lfGmSVtyNAx+W853wtoJm78bqELph437Kigw0N7uu2WHOHCV7a
         p00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727381652; x=1727986452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adNp+ex0aTTFAqiWEedrw/mOZftL/ye5N6g7vAI0S0g=;
        b=Dt78UhgB/hMbkzqgWXqZe7QFG2YGhvQGdMzaZpYRfpNCNhxVgR315mSs/Beqxj6K/F
         nNC6/7ryjwVdBabpDB+8jeH9M1CJGcIdf5+Be2vEw946CXuRmjZ9U/dxwBOlMF9LVg0S
         OpBg2KyLbmw9PdUqKmwYgMvQLfK8IJleQduVaiOnjnSRrnui2a+0XvTkZmV3JdkfWrS4
         9AjOOz5+A996coAO6BQVAJbdL7KaeCff33Az/H3ULY3rxcwrdaZ87YMx+O+xvtAaeaxy
         UuHec+BF9wNofNRiDo8qNDRu+i28AqymrvfMNQWvQMQh4pwXyMK76r/4rEo1rWS22BlB
         f5+w==
X-Forwarded-Encrypted: i=1; AJvYcCVCAqxtdDbxiNiwAqttcpsTtZNyMcKUC3RDbdRI7TK84NY7vXqxwi3hZb5m1KERDQ9PO97MybJZI34COfqjQyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRJVXnCT9bbCi8uIyYjFEmz+PyWHeLnJnoVmBlRS5b3QLa6jSX
	7XV3P/BN9V2T+E9x39lIt4MLgh4LWWMptaNLRBan01Ei6Qg5qRBew4Vn61hUqO4=
X-Google-Smtp-Source: AGHT+IHAVUKzMTH3MGv+LwYbAamyJU3xln7iWwZfpcoO7AqGhQqz3MkJaGIrNcTuk0zibF2YaiT2bw==
X-Received: by 2002:a05:600c:3b04:b0:425:5ec3:570b with SMTP id 5b1f17b1804b1-42f58497da0mr3800515e9.35.1727381652444;
        Thu, 26 Sep 2024 13:14:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57dec19bsm8350185e9.26.2024.09.26.13.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 13:14:11 -0700 (PDT)
Date: Thu, 26 Sep 2024 23:14:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: Roger Quadros <rogerq@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Julien Panis <jpanis@baylibre.com>,
	Chintan Vankar <c-vankar@ti.com>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: ti: am65-cpsw: Fix forever loop in
 cleanup code
Message-ID: <5ed2cd4e-cb50-4a21-93e2-8ba8d627f20a@stanley.mountain>
References: <ae659b4e-a306-48ca-ac3c-110d64af5981@stanley.mountain>
 <20240926155139.GG4029621@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926155139.GG4029621@kernel.org>

On Thu, Sep 26, 2024 at 04:51:39PM +0100, Simon Horman wrote:
> On Thu, Sep 26, 2024 at 12:50:45PM +0300, Dan Carpenter wrote:
> > This error handling has a typo.  It should i++ instead of i--.  In the
> > original code the error handling will loop until it crashes.
> > 
> > Fixes: da70d184a8c3 ("net: ethernet: ti: am65-cpsw: Introduce multi queue Rx")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Hi Dan,
> 
> Unfortunately this patch didn't apply cleanly to net
> which throws our CI off. So, unfortunately, I think it needs to
> be rebased and reposted (after the 24h grace period).

It's not a matter of rebasing...  I guess I accidentally deleted a space
character at the start of the first line of the diff?  Weird.

Anyway, I'll resend.

regards,
dan carpenter

