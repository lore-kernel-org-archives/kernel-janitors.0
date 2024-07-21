Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C2E8F70
	for <kernel-janitors@vger.kernel.org>; Sun, 21 Jul 2024 08:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721550346; cv=none; b=Jvr5I+cIwQdGRZeKdBiyx8VFzNmMhYLicY0Z7xfWo1nX87GFdi1WOpKhIPBHahZLQudu9RaIgB5j7G4vOcTGc3EcFXpmIciO4jPx2MCICiRkcQ32ikGOo4m7Y6NWUeoQzHrF7/WjMNejVZIp7cPLeO2MKvWFD+XKg4Aw8Q/M4sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721550346; c=relaxed/simple;
	bh=7mxFT5RPH8uPGTLPA8mWVIBU6Y10+Ss+XorW4DoWPXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJ9/ZmynEUJHdVOrf4QMZF09MkAPu5XBsYpyoVWLd7gdSfHrEKcAH1A0qepZhcjlTmPYU0hYtRG2apkpGtHf3HlYHjVvQO/KRpvT2ToNCo206A8DR2xt8vOyv4uKmqM0EFclf0Kkk8PCRJBOvB1NM2r5vqjIIy+CTu39ZeTR26I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E7MSQaig; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E7MSQaig"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7fe8d029fbeso130577239f.3
        for <kernel-janitors@vger.kernel.org>; Sun, 21 Jul 2024 01:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721550344; x=1722155144; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NRb+ts4NCAeHX8eVfGlmxAo56K5zTcMk9tYd2zxfBD4=;
        b=E7MSQaigRkHuYFTzfZguchHmWDfl38MTAvzA1bBXWjboL9vM4geV0sBW/0wMDGsPAK
         7gOu7XGjd+MMClbuRkv1a9BkLZn+E15gFpydxBG66WhpZ39ogUMKe7DjvwNlCCj8qsjE
         7UX4/IFX4wiSFe/wm7+fJQKuTwFjz7o2zvHk1MJsznkjRkfGDkr8VLakVzDc6EuevZEn
         3C+0axVDs0TMxJ1BLOhu8CUDlrBhfRTtHbSb3yrhYNzXfnhWqBrjlI5lHdVphAC5I6b4
         czRjxY/KLPBb0hUMQjs6qLITWUpNuA8g1Ptmr0GctEjFvwtsb0GoHTchIdjXKk6UMYSP
         NURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721550344; x=1722155144;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRb+ts4NCAeHX8eVfGlmxAo56K5zTcMk9tYd2zxfBD4=;
        b=O/JiUQttKaIm9a06z1VL13HrUE2RDrQvm1JLEn41OwAzcWjyqokZ/5jM2vz7mNR2OC
         wGCuzy0YQAOzTtS2nSeh1ZJrubMQZiAim2R+XKAf/Cn0Q9wvVbHX7TUuBnmiT6QHebZh
         3AzhfxUvNQi/VF1BtM57Q9nz+HHBnOkbTiMXJ51GfGIAs72bqPrDYqYkVQCQwN4z+G1V
         kqgr2tAKXs6Wo/uplAPFAiQ1YY06tNoknHUpzxxbW4Io2CMzG3gwkDTfwU84c7Q2Xia8
         1ithCK6fsvhZetXC7fet+D29LxvMwqKr4iUr1lC4emgv0rmRN2Z6NVbYoQfMqwDDedFa
         u1oA==
X-Forwarded-Encrypted: i=1; AJvYcCWAnmFMnWWMCzUlSJUFzZThAIgGU6qDtuIuJPKZnD67etSL6gP5QBu/LNJgchA4nXwXfUXXqREwASYsF/KJgAJ4vize8VGWMNzp3W84MWW7
X-Gm-Message-State: AOJu0YzhEfKN60FMAYBU4GvdxsdJQQviBqDoAQvKDxhC+pCzyO5A+jjw
	oj+ZnaS+FUzxBuB8/4p6CVA+C8+XjdBXOWkSZ7cCcS+ntA0wV0Y4i4dj7xNdwg==
X-Google-Smtp-Source: AGHT+IElTOoJolfiF+bmMtTVVaiVVtUT1Qy014HteDsgb6L5kUnlFT0MfSAqpaqrfJx8vtSHjSru8g==
X-Received: by 2002:a05:6602:601b:b0:805:e2bf:f303 with SMTP id ca18e2360f4ac-81aa9cc3f73mr572267839f.8.1721550344194;
        Sun, 21 Jul 2024 01:25:44 -0700 (PDT)
Received: from thinkpad ([120.56.206.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f319789sm32845225ad.137.2024.07.21.01.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 01:25:43 -0700 (PDT)
Date: Sun, 21 Jul 2024 13:55:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Niklas Cassel <cassel@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Aleksandr Mishin <amishin@t-argos.ru>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jan Kiszka <jan.kiszka@siemens.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] PCI: keystone: Fix && vs || typo
Message-ID: <20240721082538.GH1908@thinkpad>
References: <1b762a93-e1b2-4af3-8c04-c8843905c279@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b762a93-e1b2-4af3-8c04-c8843905c279@stanley.mountain>

On Fri, Jul 19, 2024 at 06:53:26PM -0500, Dan Carpenter wrote:
> This code accidentally uses && where || was intended.  It potentially
> results in a NULL dereference.
> 
> Fixes: 86f271f22bbb ("PCI: keystone: Add workaround for Errata #i2037 (AM65x SR 1.0)")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-keystone.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 52c6420ae200..95a471d6a586 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -577,7 +577,7 @@ static void ks_pcie_quirk(struct pci_dev *dev)
>  	 */
>  	if (pci_match_id(am6_pci_devids, bridge)) {
>  		bridge_dev = pci_get_host_bridge_device(dev);
> -		if (!bridge_dev && !bridge_dev->parent)
> +		if (!bridge_dev || !bridge_dev->parent)
>  			return;
>  
>  		ks_pcie = dev_get_drvdata(bridge_dev->parent);
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்
