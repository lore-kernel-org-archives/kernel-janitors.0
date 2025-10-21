Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A4C244677
	for <kernel-janitors@vger.kernel.org>; Tue, 21 Oct 2025 12:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761050767; cv=none; b=KwCpAq3fTNyTf+ctryO23Kr5ONEAMw2tMH+YoP6JOh8loBpGHGHV58X8g1sZxGoloiDdJVNfJ+fvlyrmA9wN6TlIxNTSmHsxhXJkt1k9Z8KV7022yNYMl0SeJ1nddGDmkoFS/0keJHYzU/kzE+02fKGb+8JrIryxFQgr0ZXZt1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761050767; c=relaxed/simple;
	bh=QIFsKITDeO14f22yjRcsI1tvABH66DujhBaXrZO3X1s=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWsR6D3JpI/e0MjNsGcIPQNKywqOopoRBRmKscldFxrSNMmLkOxa4FyM17IH7PAr/12Nq+EAqVr++nGcPZm1i4F3oVJkaQEhO2txqFCr32PIE18hE5jsnT8m5OMBBFz6VnnMLqi/YgbM8tEplBIE2ovbPWudfCIvD5NZl52QETY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aysCUjlf; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aysCUjlf"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b50206773adso1142978966b.0
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Oct 2025 05:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761050762; x=1761655562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gPEA5AJ6rJJ5XwW1iyN0mjNhsPIcrDuB2VtGOFvKXMA=;
        b=aysCUjlf8yuGqOGBAkgYTutoyUmepx89wGm46yCulA5CSmPb3qMrnsChi++mfdvfO/
         8CpZfvYsPToVCpaW+U2FpGP5Nqt8jslgDryRrDKYfqUB+UQqdV2+qJzkvQuIMuQYQAzn
         wG1YSfMzHUygBs7GD4BfiO3dpZnMOiYsxulvjB3ps+jcH2ruV9++q8QvVHAXfG4D70RF
         ah50snwzx0ysqSpGFDls8bEo+O9yYpg2AElOHTR7J3mvLYNxC/OshhdxjcngF9RNTCGX
         z0QwRCq/pbhKP0zxF2Zkl/1L5sPRjdhE+4cbOSuoe+o3KMlwH8w11lRIcjDR385fFiWf
         4RTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761050762; x=1761655562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPEA5AJ6rJJ5XwW1iyN0mjNhsPIcrDuB2VtGOFvKXMA=;
        b=V1R0gpMBV/SPkamA8Dkvd6J5X5jypiBvFjsxeVmmwkziOL5UL3qRnRInKJy9OFCmHj
         RK8zilRP1ia5/+SQEK270AbVB0budllpZQCDI1TxSLJk1nEW1fu0osfQDkFbhRbjUnPs
         +b9qnhislMpCM4ZcWLjUrtWvRq0Iu/OhVGrhLUzUgsoUbL38b9srr6tKEVd46klHJeAO
         p3oBHlGi25kTq5RmyofWQ+iQr91RIwtLMZs8s9iby+z70ZqPuDnssbROTOTzpyfl3MCo
         77oPNkiiBV6GlfNr7Oq6y7lpcJ20yMuY4iXSQ+ZXQg4mr0j9hJ9NrrVN5w3YF6t6Nj9N
         vykQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7SeqihTf1TuP4//0hV6BdFIV/DaNLvlBITF3zdMmdUET+GhRo0zFpnhwRk14g8qdjeEwrdkOmtsB3dzm2MRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFqNUDTewMHVDgM1qI3+bZMDzRcyoUCFVSv/9+EHRPsP4ff49+
	jWsTISjxK5Yc7uaxWoTdeMh4U7gVn9W827Jbw+eVMVfg/Enzw3KP1pAHrzn7BtHy9HE=
X-Gm-Gg: ASbGncsGWiCfYc8PjxtzyNsp6F91uA3Bg5Fu0fnXQnPDA08x3kGFKxwtBDug1ZgVDHQ
	daeYNJ7pUyyYyZC/X+DQZb3wQyEhOkFi1YDYWffiGCLYnnyljCbrDmgW1W5JZt55/10hStrQNd6
	BA/vo7/TYVRb96MhPYHiAN8t8CB1XBmoWCdC+OCyfGN+S46gVgiYzMjECl2BD1QLd2XPQQay0Gb
	vDiAOfJbFHhXQQ9bBXntRSUmuFJD5UasmbRqiqbXI4E3dQBrHbO7XcWS7fPLAUKUiAMHicpqs3f
	e1raUtjis9c9YYAzi8rLwrMzq9sxPvZS7lbBlyd6kOzo5XOF4tnwqonKyH53sBjxLj46fvm+0UB
	23WAycMmZDomZMTtlz3DdbdVFeOZFdxzO8UMRvP9lFUxWknJreodOdEBTz7JMKKGOXWJQfuqvlU
	0iDzBd6AE8LODyZIyXya17ausFtkRA701XsmQvSbft
X-Google-Smtp-Source: AGHT+IErY7EU44w5k9OeH3Q13um8hP0cnU0hb65JCssR27vMTstr7rVqdpDS7r8Zy3EePCbIn+wClw==
X-Received: by 2002:a17:907:6d0d:b0:b40:bdc3:ca04 with SMTP id a640c23a62f3a-b6459d3039bmr2269518066b.0.1761050762288;
        Tue, 21 Oct 2025 05:46:02 -0700 (PDT)
Received: from localhost (host-87-9-62-200.retail.telecomitalia.it. [87.9.62.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e83914d0sm1052945566b.21.2025.10.21.05.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 05:46:01 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 21 Oct 2025 14:48:14 +0200
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
Message-ID: <aPeBDmeBGWDEKp05@apocalypse>
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

Hi Christophe,

On 21:11 Mon 20 Oct     , Christophe JAILLET wrote:
> Error handling in the probe and the clean-up path in the remove function
> should be adjusted depending on if data is taken from DT or from overlay at
> runtime.
> 
> of_overlay_remove() should not be called when of_overlay_remove() was not
> called.

on the second occurence:
s/of_overlay_remove/of_overlay_fdt_apply/

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

can we initialize ovcs_id and use that instead of skip_ovl? This
would save one flag.

Many thanks,
Andrea

>  	bool level_triggered_irq[RP1_INT_END];
>  };
>  
> @@ -289,10 +291,14 @@ static int rp1_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		goto err_unload_overlay;
>  	}
>  
> +	rp1->skip_ovl = skip_ovl;
> +	rp1->rp1_node = rp1_node;
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
> +	if (!rp1->skip_ovl)
> +		of_overlay_remove(&rp1->ovcs_id);
>  	rp1_unregister_interrupts(pdev);
> +
> +	if (rp1->skip_ovl)
> +		of_node_put(rp1->rp1_node);
>  }
>  
>  static const struct pci_device_id dev_id_table[] = {
> -- 
> 2.51.0
> 
