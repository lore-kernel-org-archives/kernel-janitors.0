Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC544198A34
	for <kernel-janitors@vger.kernel.org>; Tue, 27 Aug 2024 11:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724757659; cv=none; b=hCMjbkn6wQK6AiT1ucsMqg+dinaQmYcVk1QbA/WzA1PUzPvAyMgjT0jZ2udtRkZVPLxKwpD3G0HBU+dd1LFy/aNRxGZoqtUyycwhEw9Gdn8SxZoj0+o2DA1XxN8FMpjvHNFtch2D8kpD0VQh/Lvy98S4zlyMwELqBJtr6o6hXGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724757659; c=relaxed/simple;
	bh=8pia1feesvxBJZi9aGcp2gCAqGRHsGlwJB0apfaP3tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UcBcyWZRpCjhG6M3YH+TSwO40pUYOiqJ+hVhgeTRynWDlriRWGPQ+FvMyOSbZhijcfH2TRS8kglfxRDRKZb0yrvBfg2/lKeC7cxdFwO5a1fUtQmppyQHH5CVMC3YWpQR5I4V5m9MTjHq5PglpRlyRnfkRXfgFAqYIW5wOjVi6dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WtQ680zThz1xwK2;
	Tue, 27 Aug 2024 19:18:56 +0800 (CST)
Received: from dggpemf100008.china.huawei.com (unknown [7.185.36.138])
	by mail.maildlp.com (Postfix) with ESMTPS id 59F7418002B;
	Tue, 27 Aug 2024 19:20:53 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemf100008.china.huawei.com (7.185.36.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 27 Aug 2024 19:20:52 +0800
Message-ID: <00af1fd2-a4ef-4a8f-b196-3ac5f3e9b44c@huawei.com>
Date: Tue, 27 Aug 2024 19:20:52 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/memory-failure: small white space tweak
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Miaohe Lin
	<linmiaohe@huawei.com>
CC: Naoya Horiguchi <nao.horiguchi@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<kernel-janitors@vger.kernel.org>
References: <acb3b809-7ef7-42cb-a98b-7654d00e5e54@stanley.mountain>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <acb3b809-7ef7-42cb-a98b-7654d00e5e54@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf100008.china.huawei.com (7.185.36.138)

Hi Dan，

On 2024/8/27 18:22, Dan Carpenter wrote:
> This uses 7 space to indent instead of a tab.

Thanks you for catching this. Since David and Miaohe give some more
comments about v2, I will resend  the whole patchset to handle all the
comments and issue, also will fix this, thanks.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> This should likely be folded into commit 4e3a04695e25
> ("mm-migrate-add-isolate_folio_to_list-fix").
> 
>   mm/memory-failure.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index 3438595d0a43..1213649c088b 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -2711,7 +2711,7 @@ static int soft_offline_in_use_page(struct page *page)
>   		return 0;
>   	}
>   
> -       isolated = isolate_folio_to_list(folio, &pagelist);
> +	isolated = isolate_folio_to_list(folio, &pagelist);
>   
>   	/*
>   	 * If we succeed to isolate the folio, we grabbed another refcount on
