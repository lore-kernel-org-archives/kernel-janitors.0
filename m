Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ADC1DF72C
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Nov 2025 10:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772398; cv=none; b=JrjEoRZCrGxmIf40CnDYVx2b0VQZ28iZt2X4HX5m46NC3a+pxD3mZPHH2PCteglAiQDGLlT9NgorNgRCJ/lFIUq02gmcPi6dbXG+fzsbJdaHpRmJDUxaw+12T01Wq/GsyAxl+hNrPkxmrgAosQVPsllpTDRLO2Qw+F75tC0Hkx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772398; c=relaxed/simple;
	bh=/RkwG1Ql3VTAYtVR6idPBVDTmkxhywXUjbK9QMaWqeA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGppLzcxHBgtUnXzmFqMq2uXMgAGWNme5Hc2W84yKyQQq8v4o0bD5mpBKI6ZRO9K2JZGbwXbJ9lNqv3/QqNb5hwkwf99XacFnNU5581KmUTCx80DRLMgfBnYY5b1QDEzh1Bpn8+vYCHlwj1vFw5FP56VAkzz0/WR5XX8sNfv9e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dxINvSuE; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dxINvSuE"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6419b7b4b80so949603a12.2
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Nov 2025 02:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762772395; x=1763377195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uLL+o2ddXR0TPFnq9B2zMEQjE2hgpIlNUB+IRgnm7eM=;
        b=dxINvSuEqMXFzha9r3R1LDCvNadmLuL1scyZHP+8SSebLjytDnttTzd5A9iF7P/q5w
         ILqGL4E72d4NcXVSh2IlacnZQwdDw4vlw9m2LsFZ/eKklR3/7vbYHClwSL40TnRYUw6x
         UEh3/3dkhpPA2uR9eeb6h+rOMQToqCBkOo5MeFbBL973+QHYNIYFIqk5c2sMWat95HED
         TVa8hc2k/zHbtjISAwrcS9eQl2R4cP6xmB9H3PcsOnvt/hn4ZJleEvJ5gnNTfYYNHjpi
         lIjXYbHz4+/w+Z53W2OEp2pGNrNjOxVG1KpRlNDqiK/eOXUzNnOq3NS2YDb/WN3GHKIR
         NBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772395; x=1763377195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLL+o2ddXR0TPFnq9B2zMEQjE2hgpIlNUB+IRgnm7eM=;
        b=gNlPBGAiCbtJbVteokCz41RACwWaRTmpNfWcK3N1UwEY71ytA7g/bobOv/SZVfUSCQ
         t76ehXVdgIoVPE2hgCWgeVnGsfm2bWs3gfCIXDgVrBJfDpHQlwKoZ0bUS0svvvna+ZtZ
         OdeWDcB1hiuaxCGW6Id+0P+7jAP6sPvZhzMq+nXkneEuTU1iX22YOZctuA5VbshoXkRF
         I79xfzTXbJkqnwbWtwE/zXCLDp0KxWReVZPWf+jqMlupJjo8np+c+Mwz6JYPq+sHbhfV
         isML2KKBKLF0b9qnDz4XFyp6VcwBZ4b3i/eqEbbPFVQVtrVeuFqeQeRShHrvYrcHX6Wy
         vhFg==
X-Forwarded-Encrypted: i=1; AJvYcCU5aLNAvkJbrVWGkLS/8s1HnPDbL0FQrntb+TRbTfTzSlSDvSMF++kWAxV4OYKowEcY5dzFgwPYt/PsyCfvlPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnFnlPGdCFDUGglDE8heV99RLz3O01BEA06h0Q156Y6W7UeiQ2
	QHxE6LfrNtpCLiKmi9zd4kdEeb/shHdnT0Jc/UGSnfVzTkfHNapSKjg/cCaXgbl2KEY=
X-Gm-Gg: ASbGncuH5L6/iasDvc1JzI4qWpSxWM0FStj0ACQnOuMyQmwKJEo1TItfyTfQXuBBz/c
	ds+bvDMxGvIXe8qserw9sRrXUCGlSzpjLZgrJTtK8UYPvilpm/hVmJfCv3uKtGpvdGTsqYCH/ZR
	wq7hP6TqhZYT/nMEDyl5Uu/o10kB+8Gp1/iHVJPFXK7KhrDX0ZQo8HlZkweL69BYOPZhMZTtxCS
	sKpeFxaMWRwUxaukVRNyu4BQcIhHvGgARQwqTMIBm20jLRzImY8wWcTX7pKvH6AVHdMDuV/rt7p
	86qaxDFN2B616JDSHGbh9B5ydMEvnzFlwNWhMyQJoviIZjqjjrFIwFZyLcCfhs7QAkgzh++V3jT
	ccAvGllbPHahqQTvRwMWIe5Gf5T987Mei5P4QGqbquwSWlFd5BuGpQQGzg7VBCIAH/D9Kb8R8uj
	mGnyXBLkFH36TPZc/GJ4QZWCgFqBEb3pDv/MgJ7Yu5YBq373BL1fbkGpl7
X-Google-Smtp-Source: AGHT+IHq6Cg/2Pr69od09UgjpQr6E9O4VSuRIGgxZsxV2bJVtphFoWeH2tAZDlid93n9OSo1+PN47g==
X-Received: by 2002:a05:6402:26c1:b0:63c:2d72:56e3 with SMTP id 4fb4d7f45d1cf-6415e6f1b65mr5888820a12.23.1762772395062;
        Mon, 10 Nov 2025 02:59:55 -0800 (PST)
Received: from localhost (host-79-49-235-115.retail.telecomitalia.it. [79.49.235.115])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713a68sm11057384a12.2.2025.11.10.02.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:59:54 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 10 Nov 2025 12:02:14 +0100
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: krzk@kernel.org, Andrea della Porta <andrea.porta@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] misc: rp1: Fix an error handling path in rp1_probe()
Message-ID: <aRHGNrth4GEu5J-_@apocalypse>
References: <9bc1206de787fa86384f3e5ba0a8027947bc00ff.1762585959.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bc1206de787fa86384f3e5ba0a8027947bc00ff.1762585959.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

On 08:14 Sat 08 Nov     , Christophe JAILLET wrote:
> When DT is used to get the reference of 'rp1_node', it should be released
> when not needed anymore, otherwise it is leaking.
> 
> In such a case, add the missing of_node_put() call at the end of the probe,
> as already done in the error handling path.
> 
> Fixes: 49d63971f963 ("misc: rp1: RaspberryPi RP1 misc driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is compile tested only.
> 
> Changes in v3:
>    - Don't use cleanup.h in this case   [Krzysztof Kozlowski]
> 
> Changes in v2:
>   - implement Dan's suggestions   [Dan Carpenter]
> v2: https://lore.kernel.org/lkml/8f55f8866a6680830c9d318201a29293ac50a591.1761334487.git.christophe.jaillet@wanadoo.fr/
> 
> v1: https://lore.kernel.org/lkml/4e92a271fdb98560c4e659556a1f3e99e7d0d38e.1760987458.git.christophe.jaillet@wanadoo.fr/
> ---
>  drivers/misc/rp1/rp1_pci.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> index 803832006ec8..a342bcc6164b 100644
> --- a/drivers/misc/rp1/rp1_pci.c
> +++ b/drivers/misc/rp1/rp1_pci.c
> @@ -289,6 +289,9 @@ static int rp1_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		goto err_unload_overlay;
>  	}
>  
> +	if (skip_ovl)
> +		of_node_put(rp1_node);
> +
>  	return 0;
>  
>  err_unload_overlay:
> -- 
> 2.51.1
> 

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Thanks!
Andrea
