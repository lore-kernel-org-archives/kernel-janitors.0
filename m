Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8C838DD3
	for <kernel-janitors@vger.kernel.org>; Tue, 10 Sep 2024 05:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725946301; cv=none; b=QaU3PSPOmIgkGCTXByLJFbRsc+zlECpeoEi66GcKVlj1VwcRLhYN46vYu13A3nr30rDfrHj9OfaA/E5k2X5cp0ti++ay+5YnEoOQZlVEHrcnLHAtbwa1rtJKGdzaeHVDVTicBOuuNJKkBfg+KGShx0DCYEzdSjkJ/qqnU4Q1tlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725946301; c=relaxed/simple;
	bh=0t2XN8yFeMWl2W0ikx6hr3Qwaw1PVCd6xjcL9RM30o0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkENvr1Vw2cdstAnngtHfDFAwychuB6nTuMQNoxQaZmDKqL8/oxJl2ceFs8ZUK/FwvwtblNRLXpF1FQmvKKzyzkuoIwj+KF/a1Z0s7f9uc2MnqjaRPDKvhAdmwbmpF55OjNiZ+vyUxE7CktG7jhtaP1vLz+tTmHauutlwBsYHf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SAfSCdH6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SAfSCdH6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so25059225e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 09 Sep 2024 22:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725946298; x=1726551098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NSXhvCl16DZ/rmbi3wdBfcfScBaADNaAPOPgeZq3EY0=;
        b=SAfSCdH6f9kGBMft4LO919PSCxYOf25lKir+ttwKLZwMOBEMffS1RHymDXqZ1IT/r+
         W3Lmf6PMKR1btYuNnpr/QNhPD48U5vMdgkXThkEN1F5q1lLXXq4Mu+fmMULcvf51M4zo
         A4/fZ4J4CnX+IaWSR7/k6tp4OkHDddquSVbrrjiTwvcsJbpzp7K1f8JnVZqiEs5zFE4u
         amVDrEKQg9kUmI4C2dVDxgH2XHsUUfmMIKpQ7U5DLIv0oyNMsJXEWmxAAPWs5H2RWamW
         MGP9BbpMxtOZrAivWs/TiJ9U10Z3ajWDqhtzgwna/QR8puYm1YL09K6Z3LqBGjAakZrz
         uNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725946298; x=1726551098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSXhvCl16DZ/rmbi3wdBfcfScBaADNaAPOPgeZq3EY0=;
        b=O6ljDrVuW/xkFpXvwrARslXRtHiZErRcLWjyPId01hvE9bf7+pYDkCcjWgfiAtmk5Q
         NDwIOF9PvWHoDuWmp7kdv4aJat+Ffr4aeLluQwojSTizOfmB9k7DLksp6n1iqCYnCXx8
         m5CFHkQ/2JRSomSejs/rkxcWVuKW1iErUQec2Vpa0ZD+1uyqC2gs+LjeLMJxWdXMJiOe
         qrOrrnwEbgIH2x3REcPt7ZE8MjjmPTXbDCv+66MEivp9pCMqsXdB0FJ8rYz2mNpzww8L
         h4/Ix3JXVFI0IqvmxoicWm2bARgFkAlfNkxOlqjtey9a8N7wQGnqmzxYbUQbz4OVFMyC
         QA1g==
X-Forwarded-Encrypted: i=1; AJvYcCVMgRlEojlTAEbBRhX+qJcJp+XimczoLxZXVrMEepXA1rkFFFITcoIgOhmutGkkwTqgVMyw3UaW6x36Y8CLzsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwVvP+mZP5D2st3EkD+APYucv2NxkElxUrKKVnyOUI8HA0L0Ev
	IQns5lKFMg+MQ6wj45nFQkFRJ4ACjQ+Lwq0WoUaEmXr3i22arM8exkJFmUvPsg0=
X-Google-Smtp-Source: AGHT+IGYWzwfZPnGWpfi6i3OG+ZkS7oXQpDEWRDtxtwYN1kihDAmeIPQ52fuv7lbpUI2Ko7ETdftUA==
X-Received: by 2002:a7b:ce88:0:b0:42c:b5a6:69bd with SMTP id 5b1f17b1804b1-42cb5a66a1bmr61041855e9.30.1725946297354;
        Mon, 09 Sep 2024 22:31:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb32318sm96324655e9.17.2024.09.09.22.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 22:31:36 -0700 (PDT)
Date: Tue, 10 Sep 2024 08:31:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Jacob Keller <jacob.e.keller@intel.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH net-next] net: ftgmac100: Fix potential NULL dereference
 in error handling
Message-ID: <aa2cbf22-ae6d-4adf-be5a-b3ea566d4489@stanley.mountain>
References: <3f196da5-2c1a-4f94-9ced-35d302c1a2b9@stanley.mountain>
 <SEYPR06MB51342F3EC5D457CC512937259D9E2@SEYPR06MB5134.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB51342F3EC5D457CC512937259D9E2@SEYPR06MB5134.apcprd06.prod.outlook.com>

On Fri, Sep 06, 2024 at 06:06:14AM +0000, Jacky Chou wrote:
> Hello,
> 
> > 
> > We might not have a phy so we need to check for NULL before calling
> > phy_stop(netdev->phydev) or it could lead to an Oops.
> > 
> > Fixes: e24a6c874601 ("net: ftgmac100: Get link speed and duplex for NC-SI")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/net/ethernet/faraday/ftgmac100.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> > b/drivers/net/ethernet/faraday/ftgmac100.c
> > index f3cc14cc757d..0e873e6f60d6 100644
> > --- a/drivers/net/ethernet/faraday/ftgmac100.c
> > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> > @@ -1565,7 +1565,8 @@ static int ftgmac100_open(struct net_device
> > *netdev)
> >  	return 0;
> > 
> >  err_ncsi:
> > -	phy_stop(netdev->phydev);
> > +	if (netdev->phydev)
> > +		phy_stop(netdev->phydev);
> When using " use-ncsi" property, the driver will register a fixed-link phy device and 
> bind to netdev at probe stage.
> 
> if (np && of_get_property(np, "use-ncsi", NULL)) {
> 
> 		......
> 
> 		phydev = fixed_phy_register(PHY_POLL, &ncsi_phy_status, NULL);
> 		err = phy_connect_direct(netdev, phydev, ftgmac100_adjust_link,
> 					 PHY_INTERFACE_MODE_MII);

This is another bug.  There needs to be error checking in case fixed_phy_register()
fails, other wise it crashes when we call phy_connect_direct().  For example,
if the probe() ordering is unlucky fixed_phy_register() can return -EPROBE_DEFER
so it's not even unusual error cases, which can lead to a crash but just normal
stuff.

> 		if (err) {
> 			dev_err(&pdev->dev, "Connecting PHY failed\n");
> 			goto err_phy_connect;
> 		}
> } else if (np && of_phy_is_fixed_link(np)) {
> 
> Therefore, it does not need to check if the point is NULL in this error handling.
> Thanks.

It's really unsafe to assume that we will never add more gotos to the
ftgmac100_open() function.  If you insist, I could remove the Fixes tag...  Let
me know.


regards,
dan carpenter

