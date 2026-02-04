Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E483B95FA;
	Wed,  4 Feb 2026 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770198805; cv=none; b=mZG1Y3QQa1kKtJYDYRY39R5/OY1KaSdzUXwlwR2Q3GEyL+nWFI0r7EezQhoekqFTAUOCNiBGelHHbfk5lmqInhLX+yOjOu398LB8kRmxDcmSaqU3gL1xerbr/GG0HGirEpSpiEYBGzlTWlpOwWn2GyhRAydxliTuijHYl/50V7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770198805; c=relaxed/simple;
	bh=ufkb+PjrlIrZfAhDzFroGDfrwEGQ02pjsWucuzebQIE=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tko20GsQdnL9SXRrjRCz9IhBWILuB93IRhnJ46mkPioHS+V+8hZzCZzY/aNnzwJjzw9jcx60kdufwWVn1gmILA21ggNelcD6aNgyys1AKfUP6m+4tZwqNtlUfnA8CMgvGImQBo181UDwKWq1BzH/dDycwQZbF4d5BklMlFZeAUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f5bHk6JbkzJ46l1;
	Wed,  4 Feb 2026 17:52:34 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 766D640572;
	Wed,  4 Feb 2026 17:53:23 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Feb
 2026 09:53:22 +0000
Date: Wed, 4 Feb 2026 09:53:21 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Colin Ian King <colin.i.king@gmail.com>
CC: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] irqchip/gic-v5: Fix spelling mistake "ouside" ->
 "outside"
Message-ID: <20260204095321.00006324@huawei.com>
In-Reply-To: <20260203210735.5036-1-colin.i.king@gmail.com>
References: <20260203210735.5036-1-colin.i.king@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml500005.china.huawei.com (7.214.145.207)

On Tue,  3 Feb 2026 21:07:35 +0000
Colin Ian King <colin.i.king@gmail.com> wrote:

> There is a spelling mistake in a pr_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
FWIW - obviously correct.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/irqchip/irq-gic-v5-its.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index e24ce3d9fb62..8c4cf8430871 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -902,7 +902,7 @@ static int gicv5_its_alloc_eventid(struct gicv5_its_dev *its_dev, msi_alloc_info
>  		event_id_base = info->hwirq;
>  
>  		if (event_id_base >= its_dev->num_events) {
> -			pr_err("EventID ouside of ITT range; cannot allocate an ITT entry!\n");
> +			pr_err("EventID outside of ITT range; cannot allocate an ITT entry!\n");
>  
>  			return -EINVAL;
>  		}

