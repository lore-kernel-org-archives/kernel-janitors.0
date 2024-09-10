Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05E017BB26
	for <kernel-janitors@vger.kernel.org>; Tue, 10 Sep 2024 07:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725954130; cv=none; b=EKPP9bbLdNBaEIQqRoLfNvAxylNo6QYuMQG0FZdBQKrRizGY6P7jdIalybZvtTe5cmdlMWdxvbDIcJvdUT8sfnDeOAVGcLvhLWplwOtD9ns0A2TYB/Hkn7hwJDnZzTDr3mhO5OIgYD8YdO4ZCpipD5NILRoAMh/ymKK6kwbrTRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725954130; c=relaxed/simple;
	bh=d54RwTtfFeNkJg5jU+jy+Th4BEH9o8N6XpZ0EkXowmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZ9Q1WiZwK7l6C7FcuvFs0gQH7eEZbNXfk5ee4zha0P+bvJQfOOp5iTdcpeoB8OG+s//Lu4M2vO2hYUGjyz9Gwk+5muvXda5xaHcpiw8D9VbVXZPbcmJD3KL8rqbZJjk4nxC3ceDmT+jwtCD2oa0/XuaXgV+etFOiQrezErvKdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wUClQljO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wUClQljO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso21139545e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Sep 2024 00:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725954127; x=1726558927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PKPUL5Q68Bl8SNuRHO56MK9FQCoqmrSHhMQTIQ9sesY=;
        b=wUClQljOXnOodvopyjblTVcxOuu4tca0lyZ+gxcRN52qk4PrFZyAmD49peqArWho3/
         FOJ9HMEKqSNcGiKcNo7gzed615j34X80NWg47D/UBfO62/Zm4Ja5p6nopmrgRRztubZB
         45H2BbRShDp2fKAoTL86cNi+509NSkXKwu6WruX5tEawYcGpwDhwvZmvuHMMTwG7Xt+i
         sQ8Vebf/gGpGk5bSGmIXv+VnZ76pvCeNMUplYgAhLTHGF/ZKjkZ7IfbtSNvMHH1CKB/Z
         0U6i2bVcpuJHFQyqLDFEj+fjR/KbwQP+tz7YPH5RylAz79fw6XxAzz4GGsvV6syZJOgh
         ybXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725954127; x=1726558927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKPUL5Q68Bl8SNuRHO56MK9FQCoqmrSHhMQTIQ9sesY=;
        b=oUglddSUnOFhGi/+CPsW8/x7WjmlG5ZFsIdypMyO7Zuqj1urh8MU9zXQIDpHYbnisa
         RFVnw5tBwrkXUNMjR1Aa2Bn+kFS+qPRb1QRBuyC+rSboh65APfr/u9SPGQhCzgx+7A8I
         OfjsSVyFQGXqTKOVkHH6gNIsEztwIBVKkmCYtJNWXD6b1uV9EfLDDzo6etBGObA9UDki
         0dKsRWOhPLHsCtAnN0TKgOO6nVJLgKLyDy1OqsGXBUc9gqLuHkn36ckDJ4Kotdz+GYOy
         iG/3I6P3F6jXHCBzwR/RDquRjDOH0xaOzRvBhZS8gUNgg6rcZPePu+B/46o9F+6L8Peh
         +h0w==
X-Forwarded-Encrypted: i=1; AJvYcCUtXXERJzcUyFWHXQ0JPpRWdsP5qUfaGaXB9hJqgdRdJ1TmmcsDI2MHontnBCYJXFAJ9s8L/qyVrZncsS0Tjhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhM3yRY4VnMbS86CpoTU2ICj0WGtp1e1WGALakMyEKIJfk2x4b
	gJnK2oL6d+G0xL+29u27OrYhHlzDgE/w8/vXbKlTxgetc6qw36RNA4/ptyYe0nk=
X-Google-Smtp-Source: AGHT+IE7VEncjIx90M7Bzh+D29GxBN/2k5kfHNyWOXmc2gAslakLyWI7koaXZpLtyUu6E/zV8dPZGg==
X-Received: by 2002:a05:600c:3516:b0:426:5e32:4857 with SMTP id 5b1f17b1804b1-42cbdb83f4cmr11126245e9.0.1725954126882;
        Tue, 10 Sep 2024 00:42:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789567609esm8069143f8f.59.2024.09.10.00.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 00:42:06 -0700 (PDT)
Date: Tue, 10 Sep 2024 10:42:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Jacob Keller <jacob.e.keller@intel.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue6KaGOiDlm57opoY6IFtQQVRD?=
 =?utf-8?Q?H_net-next=5D_net?= =?utf-8?Q?=3A?= ftgmac100: Fix potential NULL
 dereference in error handling
Message-ID: <81e35682-ee80-4ac7-8b6b-07ebb2a68e3f@stanley.mountain>
References: <3f196da5-2c1a-4f94-9ced-35d302c1a2b9@stanley.mountain>
 <SEYPR06MB51342F3EC5D457CC512937259D9E2@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <6c60860b-dd3c-4d1c-945b-edb8ef6a8618@lunn.ch>
 <SEYPR06MB513433B0DBD9E8008F094CE39D992@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <6261c529-0a15-4395-a8e9-3840ae4dddd6@lunn.ch>
 <a2dba28a-6ac4-4770-b618-acfdd59cbbf4@stanley.mountain>
 <SEYPR06MB5134C7E0E578CB8AB92AA76F9D9A2@SEYPR06MB5134.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134C7E0E578CB8AB92AA76F9D9A2@SEYPR06MB5134.apcprd06.prod.outlook.com>

On Tue, Sep 10, 2024 at 06:19:54AM +0000, Jacky Chou wrote:
> Hello, Dan
> 
> > On Mon, Sep 09, 2024 at 02:03:32PM +0200, Andrew Lunn wrote:
> > > > > Are you actually saying:
> > > > >
> > > > >         if (netdev->phydev) {
> > > > >                 /* If we have a PHY, start polling */
> > > > >                 phy_start(netdev->phydev);
> > > > >         }
> > > > >
> > > > > is wrong, it is guaranteed there is always a phydev?
> > > > >
> > > > This patch is focus on error handling when using NC-SI at open stage.
> > > >
> > > >          if (netdev->phydev) {
> > > >                  /* If we have a PHY, start polling */
> > > >                  phy_start(netdev->phydev);
> > > >          }
> > > >
> > > > This code is used to check the other cases.
> > > > Perhaps, phy-handle or fixed-link property are not added in DTS.
> > >
> > > I'm guessing, but i think the static analysers see this condition, and
> > > deducing that phydev might be a NULL. Hence when phy_stop() is called,
> > > it needs the check.
> > >
> > > You say the static analyser is wrong, probably because it cannot check
> > > the bigger context. It can be NULL for phy_start() but not for
> > > phy_stop(). Maybe you can give it some more hints?
> > >
> > > Dan, is this Smatch? Is it possible to dump the paths through the code
> > > where it thinks it might be NULL?
> > 
> > Adding a check here is the correct thing.  The current code works because we
> > only have the one goto after the call to phy_start(netdev->phydev), but as soon
> > as we add a second goto then it will crash.
> 
> Could you share more detail about the crash is happening when you add a second goto?
> I'm wondering if there are other things I missed.

I'm saying if we add a feature in the future.  Something like this.

regards,
dan carpenter

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index f3cc14cc757d..417c7f4dd471 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1562,10 +1562,22 @@ static int ftgmac100_open(struct net_device *netdev)
 			goto err_ncsi;
 	}
 
+	ret = some_new_feature();
+	if (ret)
+		goto err_free_ncsi;
+
 	return 0;
 
+err_free_ncsi:
+	if (priv->use_ncsi)
+		ncsi_stop_dev(priv->ndev);
 err_ncsi:
 	phy_stop(netdev->phydev);
                 ^^^^^^^^^^^^^^
Crash.

 	napi_disable(&priv->napi);
 	netif_stop_queue(netdev);
 err_alloc:
