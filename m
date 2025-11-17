Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2F6324B30;
	Mon, 17 Nov 2025 12:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763381206; cv=none; b=Klf+Y37WotsKHEDEgW2Y0g/8OyAiQ3IBa34Kp1o//W5Kd0t2WxhfkPOuS3AatQjRHjsG7uZ1AsXsbMsc5Qcyu3BI9j9q82zhwsNMoQuWUIBanYU80ARE5xjDooLvTt0AUX11qng5QDX4HilZnjEjUG2DJOJMb+YqjLPnuCv/BaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763381206; c=relaxed/simple;
	bh=Xesqli3HhuvDfdiUjHR6MaQRzHvvRoTp8xLI+pgUd6Y=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ND3j60hOwIrGUO8aL0hobjZ4TQfVMDgWsP6jqL+Sn8kZGkoeELk985tgExzm2QiA+DrUrc85QRCPjLhlUMt+e1iQMUdQVAYQ7RShplKZXQ9GqKl4BEKFpWlf+8wPbp+gQ59lcd4LSaK4dFgJ4cYnKMWtt8gShMhGbBftWBhKiUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d960N4vdlzHnH8x;
	Mon, 17 Nov 2025 20:06:12 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 7DD8A140159;
	Mon, 17 Nov 2025 20:06:41 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 17 Nov
 2025 12:06:40 +0000
Date: Mon, 17 Nov 2025 12:06:39 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>, <kernel-janitors@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, <linux-kernel@vger.kernel.org>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: refer to intended file in STANDALONE CACHE
 CONTROLLER DRIVERS
Message-ID: <20251117120639.00000a44@huawei.com>
In-Reply-To: <20251117105311.293508-1-lukas.bulwahn@redhat.com>
References: <20251117105311.293508-1-lukas.bulwahn@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Mon, 17 Nov 2025 11:53:11 +0100
Lukas Bulwahn <lbulwahn@redhat.com> wrote:

> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 23db6eed72bd ("MAINTAINERS: Add Jonathan Cameron to drivers/cache
> and add lib/cache_maint.c + header") intends to add a file entry pointing
> to the cache_coherency.h file, but messes up to name the right path.
> 
> Update the entry to the intended file.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
Thanks. Just missed my v6 (some changes in Kconfig requested by Arnd).
Conor would you mind picking this up on top if you take that series?

Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 320045a6bad9..30eaeb3675d6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24725,7 +24725,7 @@ S:	Maintained
>  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
>  F:	Documentation/devicetree/bindings/cache/
>  F:	drivers/cache
> -F:	include/cache_coherency.h
> +F:	include/linux/cache_coherency.h
>  F:	lib/cache_maint.c
>  
>  STARFIRE/DURALAN NETWORK DRIVER

