Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04657156C8
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Nov 2023 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KW7S0eWo"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6101199;
	Tue, 14 Nov 2023 05:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699967200; x=1731503200;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CHp8Hsk51sMQHL/7IfJH8nobg1wb9SdOZ4TtzrZFzDI=;
  b=KW7S0eWovb1nWsPPnHGWZoHkEClSI8CXLdhULJx8oVG/5j1na5Re0d2S
   mYW3iX790A32OtBB7lZDGtd1CAX1ku5HyqaDwUShrTf0anItRpKQbnw3L
   faM0TyIQPy2Om2B3ShkV44tv5lc8ii1CZgTDbqy/EYe3vPHAFnkDnmcCs
   2lXJCwUGj02oLgkUlw5BmrRlV+OFYGhCfQPj6/rLtAlUK8RuS8JKpCgeO
   o1JI5ITkdJBx2KJuaHFQrtuw+hPQq7HzM22SXxB42zoAJXrvmZRMUOCsV
   KEz/f8hL6P8GRoSQeQMzgxhYD5ca3JqraRwi2zKnnBZ+79aNUzvHMyK/h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375692640"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="375692640"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 05:06:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="799519063"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="799519063"
Received: from rauhjoha-mobl2.ger.corp.intel.com ([10.251.217.194])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 05:06:34 -0800
Date: Tue, 14 Nov 2023 15:06:31 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc: Xiaowei Song <songxiaowei@hisilicon.com>, 
    Binghui Wang <wangbinghui@hisilicon.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
    LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
    linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI: kirin: Use devm_kasprintf()
In-Reply-To: <085fc5ac70fc8d73d5da197967e76d18f2ab5208.1699774592.git.christophe.jaillet@wanadoo.fr>
Message-ID: <fa6eb291-1dfc-1f18-aef1-bf8e91d0fd64@linux.intel.com>
References: <085fc5ac70fc8d73d5da197967e76d18f2ab5208.1699774592.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-58973192-1699967196=:1748"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-58973192-1699967196=:1748
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Sun, 12 Nov 2023, Christophe JAILLET wrote:

> Use devm_kasprintf() instead of hand writing it.
> This saves the need of an intermediate buffer.
> 
> There was also no reason to use the _const() version of devm_kstrdup().
> The string was known be not constant.

was known be -> is known to be

With that fixed, 

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.


> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/pci/controller/dwc/pcie-kirin.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
> index 2ee146767971..d9e3514de0a0 100644
> --- a/drivers/pci/controller/dwc/pcie-kirin.c
> +++ b/drivers/pci/controller/dwc/pcie-kirin.c
> @@ -366,7 +366,6 @@ static int kirin_pcie_get_gpio_enable(struct kirin_pcie *pcie,
>  				      struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	char name[32];
>  	int ret, i;
>  
>  	/* This is an optional property */
> @@ -387,9 +386,8 @@ static int kirin_pcie_get_gpio_enable(struct kirin_pcie *pcie,
>  		if (pcie->gpio_id_clkreq[i] < 0)
>  			return pcie->gpio_id_clkreq[i];
>  
> -		sprintf(name, "pcie_clkreq_%d", i);
> -		pcie->clkreq_names[i] = devm_kstrdup_const(dev, name,
> -							    GFP_KERNEL);
> +		pcie->clkreq_names[i] = devm_kasprintf(dev, GFP_KERNEL,
> +						       "pcie_clkreq_%d", i);
>  		if (!pcie->clkreq_names[i])
>  			return -ENOMEM;
>  	}
> 
--8323329-58973192-1699967196=:1748--
