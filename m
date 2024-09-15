Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E050C1C6F6A
	for <kernel-janitors@vger.kernel.org>; Sun, 15 Sep 2024 12:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726405101; cv=none; b=r+RpCwmVb0WJGRpeGcztOdwGE3d12UU1jLHEG8KLwSuQenK7A/H/AzljwWkKYxilM0j20NrqnYww4qHgAgegf/aTOWJ/Di35MheBlZAavCHE6Nw+iHxqslljccTdretuEtRIdYzHdw9USwHODIY7Pc6wwrREBt2/dwj9ldL44vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726405101; c=relaxed/simple;
	bh=Zo0i9LCWm9pWXBCYWV30JJSumaO6Rc3f6TyU79jwDX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxlqY1NAL0gzQSyYXAG8Y3p5o/pyKHikZAGce8aVe4xX4MPXHhwqO63hESTY8VRf+bgA4ux/dOPmV3kRy4poaTKhP4PM+RRjnkbEmPBTuv1X2OPa63wPOHqdKLqBrcItNMO1NVcOPcW3at/zBps6pvMzM6Mm6ABLZ1lyPArBZtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ZeC2L5Vu; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ZeC2L5Vu"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id pooHsbcfYOCyZpooHsQ3e6; Sun, 15 Sep 2024 14:57:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1726405023;
	bh=p1KHFbFn3yM7elOd8STGzD4T8dWI9H2ZO0ztDzDVFD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ZeC2L5VuTVJGzhlF/v+mxrm5L++hnfcftsMdM08XGGDRdIZClebn+m0s+Ap0if+dy
	 aLCOqrjXQNRVfI8TznZyUfVD7/MGnRNoloLvwGMhLBlC0KLEuuhRpg7cyo202RZkM9
	 luu0vMBUGzNRNjKnuMmAB0k2IeGFut4EfPtUUcSfOVqeCMWHqB+eMlRfemQxpoxLsT
	 7Mbw0hdK+ECJyqcTlwWxdviReU0hlVTB/iMO09shwmW+HRRRn/xQQIDsjBgjEbk7bK
	 sPZB7DBtM6sH22iYpTQ7HRLly+ev2IBUyh7ZjWMa3fjuAUFZaJSMNYlmx050TWjfkf
	 KzxbCIlWbNJMw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 15 Sep 2024 14:57:03 +0200
X-ME-IP: 90.11.132.44
Message-ID: <1a997ce3-1060-45c8-88cc-c75d49745fd4@wanadoo.fr>
Date: Sun, 15 Sep 2024 14:56:59 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ethernet: chelsio: fix a typo
To: Andrew Kreimer <algonell@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
References: <20240915125204.107241-1-algonell@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240915125204.107241-1-algonell@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 15/09/2024 à 14:52, Andrew Kreimer a écrit :
> Fix a typo in comments.
> 
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>
> ---
>   drivers/net/ethernet/chelsio/cxgb/suni1x10gexp_regs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/chelsio/cxgb/suni1x10gexp_regs.h b/drivers/net/ethernet/chelsio/cxgb/suni1x10gexp_regs.h
> index 4c883170683b..ad82119db20b 100644
> --- a/drivers/net/ethernet/chelsio/cxgb/suni1x10gexp_regs.h
> +++ b/drivers/net/ethernet/chelsio/cxgb/suni1x10gexp_regs.h
> @@ -49,7 +49,7 @@
>   /******************************************************************************/
>   /** S/UNI-1x10GE-XP REGISTER ADDRESS MAP                                     **/
>   /******************************************************************************/
> -/* Refer to the Register Bit Masks bellow for the naming of each register and */
> +/* Refer to the Register Bit Masks below for the naming of each register and */
>   /* to the S/UNI-1x10GE-XP Data Sheet for the signification of each bit        */
>   /******************************************************************************/
>   

Hi,

Nitpick: a space should be added between "and" and "*/" to keep a nice 
layout.

CJ
