Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4080D376BCC
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Apr 2026 08:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776847333; cv=none; b=oi6g5wKZm3v7z+t7yvTnIXAfX2st3ZivSiE+Jrdd5au/0FWUCE6TLdnruK3coPn3JmmalXmgfK9NbVeGRlEmWpQScgVz8WMhIMcZlt3w3as2ZsbQH1G9YMB9PTEH2N49OqDtErg4yWh6RQBlX0r4R7Us6s7kO+0kKOKf/FPVmLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776847333; c=relaxed/simple;
	bh=d1YGxQHxFz8oO27XTBzMvRQkzYc2VrFWcRQaOXzn8RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=jqoH7qUefmVyZGKfyS7ahMm9icsA8M4t5EKSLE7LRhYH/SwloEpd/ro8+TUkYvTLCNMKgdGRTNNrf/u/sm3ik4BEWE8IrP8MXebDiJg5bTu9NR48DqPde9xnWXIvJb6A1KJEYrKKY59AAixcLM0JTlyTVV7iCPbQdGbgP4IWJAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ut+6VcWq; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ut+6VcWq"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260422084208euoutp0162db553796007e4c9ea4fb6d0ee6d407~ooTsrqd9o2442224422euoutp01l
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Apr 2026 08:42:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260422084208euoutp0162db553796007e4c9ea4fb6d0ee6d407~ooTsrqd9o2442224422euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1776847328;
	bh=YrPgAfVKB+qxDc2CcSoeSAb6iAceV4edZfrbKmtZrQI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ut+6VcWqnwBTF9NoOJ1778Dtgk6DwTujz0tNMOrl+XSJhLEP753HmZgb0RiD177Af
	 3tHjIWF/a3W1ndJLEnZhsb+IOdv83NH3l7BlOD21/sJaqph4ovi7EeuzvSeAMa6pCv
	 PWNQqT3fo2/oACq2NycAnD+2AeaJCJYUyg0M0/1k=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260422084208eucas1p137123bfccf5ca996ba7f0c56ecf1c1e9~ooTsZ4yvQ0209102091eucas1p1-;
	Wed, 22 Apr 2026 08:42:08 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260422084207eusmtip283f6f1250b08ee1a384856d03b43da69~ooTr9v0DZ1239612396eusmtip2K;
	Wed, 22 Apr 2026 08:42:07 +0000 (GMT)
Date: Wed, 22 Apr 2026 10:42:07 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
	davem@davemloft.net, andrew+netdev@lunn.ch, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] net/stmmac: Fix typos: 'tx_undeflow_irq' ->
 'tx_underflow_irq'
Message-ID: <aeiJ3zr4WJAm1UCk@AMDC4622.eu.corp.samsungelectronics.net>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <7eb9e4d4-909c-4203-833d-bd8b664fdfbc@lunn.ch>
X-CMS-MailID: 20260422084208eucas1p137123bfccf5ca996ba7f0c56ecf1c1e9
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----LmDszmo.tbCNUa4xLp9F.eTPx2S9.ufKTU9pfAqIN0sGcyaX=_213c8_"
X-RootMTR: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
X-EPHeader: CA
X-CMS-RootMailID: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
References: <CGME20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6@eucas1p1.samsung.com>
	<20260421115008.2690541-1-j.raczynski@samsung.com>
	<7eb9e4d4-909c-4203-833d-bd8b664fdfbc@lunn.ch>

------LmDszmo.tbCNUa4xLp9F.eTPx2S9.ufKTU9pfAqIN0sGcyaX=_213c8_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Apr 21, 2026 at 02:39:15PM +0200, Andrew Lunn wrote:
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > @@ -78,7 +78,7 @@ static const struct stmmac_stats stmmac_gstrings_stats[] = {
> >  	STMMAC_STAT(rx_vlan),
> >  	STMMAC_STAT(rx_split_hdr_pkt_n),
> >  	/* Tx/Rx IRQ error info */
> > -	STMMAC_STAT(tx_undeflow_irq),
> > +	STMMAC_STAT(tx_underflow_irq),
> 
> Please take another look at this one and think about it.
> 
>     Andrew
> 
> ---
> pw-bot: cr
>

I don't see anything wrong with it?
- naming is correct, same as stmmac_extra_stats from common.h, as it
  wouldn't compile otherwise
- string length is ok, as max name length is ETH_GSTRING_LEN=32 and it is
  not close
- ethtool just polls data from driver and in my tests it is ok
- all instances of 'undeflow' are changed
- 'underflow' semantic is ok, 'undeflow' is just not correct

Please correct me if I am wrong, but imo no issues with this patch.

Regards
Jakub Raczynski

------LmDszmo.tbCNUa4xLp9F.eTPx2S9.ufKTU9pfAqIN0sGcyaX=_213c8_
Content-Type: text/plain; charset="utf-8"


------LmDszmo.tbCNUa4xLp9F.eTPx2S9.ufKTU9pfAqIN0sGcyaX=_213c8_--
