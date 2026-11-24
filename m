Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551644;
	b=p1C7fosw+Y07iKXlLN0VMamhikExZ/YNc6ahgyyh46ZOUL+Q90uZrnPVhLvKHitCQV85
	 l8Yh4De7accv3d9eQzYeG6lEc0rKroMoRDOvti/wrl7ERAiR4/8nh0uxGWWgL06m2yncj
	 ht9/ZoajqfOUYT6RNrEiaAnicQ+v7lmkKl4WEdTEpFrbpEicC2hfpKCQ9fzxmUR7B8Z3Q
	 8JeYGKGcxTzkKMTEDuGD3CyamSFpbBgvTvkUNhUmxbk4GopeHH+oOw7q8wtAtJN8asZ9U
	 TO49fqEX9F4cnvKL1s1IxUG/tnv0yQy+adXnLmrU9Uc+anxqssEwb1nQkJDcBf0JHtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551644;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=qkXaKmmAVOhQr2g4orska9dlj0WjNY9RM/qCFfgSyvg=;
	b=aqC1tqqtdVNmWwtHfU0TRW4Rd0czw1GaVDb8dQiiC6ElfC8MGaUxddUyqso2xZu8BtPA
	 B5o5U8r9ZN5orOUvLW7uJfbsgNPMJ9CDlDE/B5m4lXs3LXx0zqzTtUm3eOzO5jF/aAEUQ
	 Fpas4htWAJaQhNr0Wbt66dFAEoJRIA0PZTh8Iy8zBJFrqz5WdPR6hlQ8FtujPhEQDzPOq
	 MoqGscA8Z0KR7OnfXTwfWVbI171TFr4FkftivMFtGk8yA3ZeTmVRONUBPXoQWlfb1bq8E
	 tBnPfVPDvnegF9/M1sY+uWne8PhCDXveNVJrTNGVanZzLueJRSHak7rq+nRVSqtswCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FhNwRThx;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576D1606A336;
	Tue, 24 Nov 2026 20:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 576D1606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FhNwRThx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795551644; x=1827087644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n0/unQN2QfWE43v2jSOHpgxMY8DJbz2drA0lcwMpXHQ=;
  b=FhNwRThxtzDppPAcHWBKnAkaPTZLKxz71MRAThEofQvijE4bwHhPnrH1
   1/bu04DnH7vVLHZU9UzvPWrPYnlati6sbisPWKBkT/BPhV+7o465hft7l
   lSjyhpeLoOzA6DzcDjwiz7jbW1hnz5dwVrTdEhAMpgb5ZnOquSkoQFo30
   15F4qrMYGJDCHa1ZD87DbzxjrJP13fNYjgObBFhjMihr7iocLtAo6IGJV
   M8GkxqSnh1+BzUWDjFASu4TjOEiy4q5kfAjb+IAVO1DdEjNgVg/tiBFq1
   cSEwk6Jk4jV5rRrJuOS5ybv4Nbhrmdd/mhdyqMlLkfkaNKplEVEt1EfiM
   g==;
X-CSE-ConnectionGUID: /2J3stdFRZeg3ZDZfryhUw==
X-CSE-MsgGUID: l5WQxYFmTKqJXxAVSNr47w==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4323471"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4323471"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 12:20:43 -0800
X-CSE-ConnectionGUID: 2gus1Nc1SHOMN4voXBBCKg==
X-CSE-MsgGUID: 1L9Hih7/SMqwvijjmCJU/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11647179"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 12:20:40 -0800
Date: Tue, 24 Nov 2026 22:20:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH net-next] bcm63xx_enet: Use devm_clk_get_enabled() in two
 probe functions
Message-ID: <awXxloPuhUUw8ISZ@ashevche-desk.local>
References: <d293609b-c8cd-4993-a243-89c6d1ace4a0@web.de>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d293609b-c8cd-4993-a243-89c6d1ace4a0@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 24, 2026 at 08:23:24PM +0100, Markus Elfring wrote:
> 
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>   keeping duplicate source code.
> 
> * Omit a clk_disable_unprepare() call on error handling paths
>   and in the implementation of two remove functions.
> 
> * Omit two labels.
> 
> This issue was detected by using the Coccinelle software.

...

> -out_disable_clk_mac:
> -	clk_disable_unprepare(priv->mac_clk);
>  out:
>  	free_netdev(dev);
>  	return ret;

Does this have side effects due to order changes? Same Q for the remove stage.

...

> -	/* disable hw block clocks */

Why drop this comment?

>  	clk_disable_unprepare(priv->phy_clk);
> -	clk_disable_unprepare(priv->mac_clk);

-- 
With Best Regards,
Andy Shevchenko


