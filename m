Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6472517AF
	for <kernel-janitors@vger.kernel.org>; Tue, 21 Oct 2025 05:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761024388; cv=none; b=hF6lJDfnfw0Bc9QdbUWgh/LxucyUY1WWKO6mQUohxw0wrp6i+uz3J4QF7gOERbtUhr4WMmPOkPqn6IQfwnkdh4vTlB9G2dhyxGSCIEAcJ1fdrNDeZo6EHclMr6hmPFpgoxyLVPmFQ524+FeBw1xCeg6bFxNU5erDB2QklcFZQAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761024388; c=relaxed/simple;
	bh=Lh2hJUfWN74+RYC/v7DVT/JhYHN62QreXrlqKH1VsgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JS4aXvhnLSURVJW4gUzG//wEO4l4Sj5egTEdMoDSJkuVVD719J/paLQ+pR7Yb6UEIEhoSKFJT7DtZfcccUpJ9wInUTIp2Ccaj7RXibHFDbSoy+U1v++7ksERpU5mqPi26YQvYe99WHo6hvDO2MgibROljBsH6qlrs4TbHuxcUT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nyIWR5Fm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nyIWR5Fm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47495477241so3544935e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Oct 2025 22:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761024385; x=1761629185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LpXcdCxES8VhMciNpBuW1YUVsgbsbaaJgsQSe3LFXBs=;
        b=nyIWR5Fm2YYuBXcg++69ihYGT4RRrsj80Ek+PlUGmRYY8Olx+t1z90j9IRHrq3/b2S
         c4DIDCQREK5d6ZTUSQfnighqFR1F6XHBdCOldymbr1ZD8iCbbN2HiZtxbp7ugCLUAWbd
         nk8LZxzjb3E1SAthkoyaf0YGw69smPy9JWWxTVx08xE1Jv+iHbb1xtG4QXOrOXcPYUMa
         HQ49HztnArHLzfnmjBTplQTwikT5pipLRXcSfVaF4nSwyffIFJCu0OA3VoZ/MG4RiEXO
         tJbzM+sCaVsMANWC/qO2eWtEe/G/E0XB6G1ID9e8FK4W/ul3wMkd58saPQGUA8rb+h4h
         8Y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761024385; x=1761629185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpXcdCxES8VhMciNpBuW1YUVsgbsbaaJgsQSe3LFXBs=;
        b=QwEhiSGT+4a15egcp6yYYQA8hIH+zsbfqZ/yyiNuqQH1BuQu8o4UpA3ISpd3OVnUmV
         M4BdpEJpLULTOf4+FYFpfXcUCcyqc7fwwMEUANXMKu3D1CmsOh7EbQJVUn1lWwg7r6F2
         1pR0hJS2cF2r0MrXLRGvbXIetU3RpHhC3frjPSqnE+Vieau1y+mIIdfePsKZLKAA0l+R
         RxylVpisvPswuvOMo5yp7QY6afOsZGTBtuTDJ2KLvWSfGC3kjQ6i7fGZzwwKFbuR3N9Z
         WKH4J3afsd1PyDVVsvUjodqOF6hUPiyGdTLOJVY4FFpwV26y5vvpBqdIOvnKoKn2+OYq
         mgVg==
X-Forwarded-Encrypted: i=1; AJvYcCXccm+7PVSHv36QKraTrGTq6It8oUcz7WswShFR5QwfDLgHdiApH2XTcTGnRobU4P36sfgWWokNqlVRwGOxvY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDe1+UC97hwX0eHbONzeH52TXxHEl7V0rqqGWVCOyK77phB0qB
	uo4BpkCx5PvNa8o9umblWJ0UDNdTs/EtJSD+yr7d1STrYLAGyVvaWXxeGV0hRV3cM7o=
X-Gm-Gg: ASbGnct0D8EywFPKQJy/+8vEcQgCiq7vdUB6GCY8WURm1vki2mo7/eOxN7l6THrgsGj
	RjjIBNDEjjjCsEyNtcyiaYFwj64aDBm6hLWvIiRIN8bgWlzDerESXLqnIxnvoGRFffWVhs3zQSY
	/YUOsg8nZhEr97lMc0w6oslug9BytV53yu9+/sKuRma80KxpRtlUzfP8HpqetokSrjTGpnrwnmX
	j+UBfRdhESEDSJlz4m0AaRsfYOK6eKuntLJ0SRQK0oU4hNU0kFPKpKqSKm/3ze9WTbkNUczMq/D
	+rArQf0qt1Wogl1UQFTqLwijyqP8VMiPKP2d0bZmHMbh6G3GNTAR0ut+PSgCbFDc3+NkC0x+GXe
	OjhsF5qeGaXTABdNTP3b1IgCNKyVbf31GRngxNmhmJ4wGKAQ+C/9Z8KX1C7NT80rks3LCV8WX3l
	UFfNBC1H5DSg/StNDj
X-Google-Smtp-Source: AGHT+IHIHSrtW3GijTRXt2IgYi51Hm0oWtBpCtSEWan639ujy1pKF9l/ZU8kFQADnPAQNheJfCrd6Q==
X-Received: by 2002:a05:600c:8185:b0:46f:b43a:aeed with SMTP id 5b1f17b1804b1-4711792cc0cmr108057125e9.40.1761024384730;
        Mon, 20 Oct 2025 22:26:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5a0f88sm17811180f8f.7.2025.10.20.22.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 22:26:24 -0700 (PDT)
Date: Tue, 21 Oct 2025 08:26:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] misc: rp1: Fix some error handling paths
Message-ID: <aPcZfI4qePMNuil8@stanley.mountain>
References: <4e92a271fdb98560c4e659556a1f3e99e7d0d38e.1760987458.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e92a271fdb98560c4e659556a1f3e99e7d0d38e.1760987458.git.christophe.jaillet@wanadoo.fr>

On Mon, Oct 20, 2025 at 09:11:16PM +0200, Christophe JAILLET wrote:
> Error handling in the probe and the clean-up path in the remove function
> should be adjusted depending on if data is taken from DT or from overlay at
> runtime.
> 
> of_overlay_remove() should not be called when of_overlay_remove() was not
> called.
> 
> of_node_put() should be called in the remove function to avoid a potential
> reference leak.
> 
> Fixes: 49d63971f963 ("misc: rp1: RaspberryPi RP1 misc driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is compile tested only.
> 
> I think (hope...) that a cleaner solution is possible. So feel free to
> improve it or completely change it if needed.
> ---
>  drivers/misc/rp1/rp1_pci.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> index 803832006ec8..9105269488a9 100644
> --- a/drivers/misc/rp1/rp1_pci.c
> +++ b/drivers/misc/rp1/rp1_pci.c
> @@ -44,6 +44,8 @@ struct rp1_dev {
>  	struct irq_data *pcie_irqds[64];
>  	void __iomem *bar1;
>  	int ovcs_id;	/* overlay changeset id */
> +	struct device_node *rp1_node;	/* useful only if skip_ovl == true */
> +	bool skip_ovl;
>  	bool level_triggered_irq[RP1_INT_END];
>  };
>  
> @@ -289,10 +291,14 @@ static int rp1_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		goto err_unload_overlay;
>  	}
>  
> +	rp1->skip_ovl = skip_ovl;
> +	rp1->rp1_node = rp1_node;

This is a reference to the device tree node.  We normally drop the
refcount when we're done reading what we want from it.  So we can
call of_node_put(rp1->rp1_node) here on the success path.

We could just declare it with __free(device_node) and use cleanup.h.

> +
>  	return 0;
>  
>  err_unload_overlay:
> -	of_overlay_remove(&rp1->ovcs_id);
> +	if (!skip_ovl)
> +		of_overlay_remove(&rp1->ovcs_id);
>  err_unregister_interrupts:
>  	rp1_unregister_interrupts(pdev);
>  err_put_node:
> @@ -308,8 +314,12 @@ static void rp1_remove(struct pci_dev *pdev)
>  	struct device *dev = &pdev->dev;
>  
>  	of_platform_depopulate(dev);
> -	of_overlay_remove(&rp1->ovcs_id);

It might be nice if of_overlay_remove() ignored when rp1->ovcs_id is
set to zero.  Then we could call it unconditionally.

regards,
dan carpenter

