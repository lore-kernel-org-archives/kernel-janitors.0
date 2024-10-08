Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8051C75F8;
	Tue,  8 Oct 2024 08:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375498; cv=none; b=hgmMyiMNddF5BaKKV/qG9KsFQsre8o4WQ45bE63YCHLjxgnQG8oSxNh3r05DXIHQZYEQEK9yTSTCzRhKuJMhZ6U0fF8meKT/MTapQHKl/eZCpOIkJ3ld5uO+nV6cQ/YTiWHnVMhQ80y/ZLkb6zOj5gWiWpkh55ZVx/qjSaBcIlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375498; c=relaxed/simple;
	bh=HctsgoqJDn+IuwddPANtJvOXiIBXG26hIJ1CVhcWMbs=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=WNw1HcakoZJzi1VIUNMF+GgX1FKiW1DQj0EbhL5yk8segwJ3ICRow4oYzQGHXzGFc1eejmIeQ7o0KuSagsEkDHJ4D4YU6PxaKSpjgj71I0xZu66d6CaYcsHfkjxMpiPdv5IzS4cOlIXkHYUcWxAoPaVZogRFOiNCv9yV7i4DWGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XN84z68wWz2Dcwg;
	Tue,  8 Oct 2024 16:17:07 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id AF25A14013B;
	Tue,  8 Oct 2024 16:18:11 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 16:18:10 +0800
Subject: Re: [PATCH 28/35] UBI: Reorganize kerneldoc parameter names
To: Julia Lawall <Julia.Lawall@inria.fr>, Richard Weinberger <richard@nod.at>
CC: <kernel-janitors@vger.kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
 <20240930112121.95324-29-Julia.Lawall@inria.fr>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <372fa7f2-908d-194c-e773-37ea0951238a@huawei.com>
Date: Tue, 8 Oct 2024 16:18:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240930112121.95324-29-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)

ÔÚ 2024/9/30 19:21, Julia Lawall Ð´µÀ:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> Problems identified using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>   drivers/mtd/ubi/eba.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> 
> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> index c7ba7a15c9f7..efce5bf41ef6 100644
> --- a/drivers/mtd/ubi/eba.c
> +++ b/drivers/mtd/ubi/eba.c
> @@ -731,8 +731,8 @@ int ubi_eba_read_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
>    * ubi_eba_read_leb_sg - read data into a scatter gather list.
>    * @ubi: UBI device description object
>    * @vol: volume description object
> - * @lnum: logical eraseblock number
>    * @sgl: UBI scatter gather list to store the read data
> + * @lnum: logical eraseblock number
>    * @offset: offset from where to read
>    * @len: how many bytes to read
>    * @check: data CRC check flag
> 
> .
> 

