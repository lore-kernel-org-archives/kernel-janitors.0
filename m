Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C571E47A3;
	Mon, 29 Dec 2025 13:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014240; cv=none; b=gRea+0ho8Ces3fJt/AlHwmyVcrdGm1er5jasDSMYobgBSRF+ZoBe8/TMTVo2eU+Deb7h2OkiPN/VST1Uf/FThSamjwIVwW9rU+V8pUUvWb/Rlddo1qnNjs53+F8/5KZuBdp4vjS0IYzpqXzqbNsLy8Ti0SFLhWTsMvDtNvUkyZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014240; c=relaxed/simple;
	bh=8Zg63aj0YYAAywxsSiG4VCs51arBxWp7TU9UZPwEC7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXE5o2fN5FAm5O7fr2aZUu6Udl7D9aruSjnMK93VRFRcB02L1bY4qw9qlbHNaxwJFpx7rsGfiUJuXVxiGTSOni+QNZ+mS52pBE6d1leCMHrgkK+dKPdhx6Y7XVOE5OP6LeMC6rQt0o9pUa3eN9/M9nUQmwtCZEkQ/Af4GW97HoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=lZMSgaxa; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="lZMSgaxa"
Received: from LAPTOP-N070L597.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ee89fa22;
	Mon, 29 Dec 2025 21:17:12 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: markus.elfring@web.de
Cc: angelogioacchino.delregno@collabora.com,
	jianhao.xu@seu.edu.cn,
	kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	zilin@seu.edu.cn
Subject: Re: [PATCH v2] soc: mediatek: svs: Fix memory leak in svs_enable_debug_write()
Date: Mon, 29 Dec 2025 13:17:12 +0000
Message-Id: <20251229131712.388207-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1d9b46ba-728e-459a-9d82-0f49e2fe08b9@web.de>
References: <1d9b46ba-728e-459a-9d82-0f49e2fe08b9@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b6a41726103a1kunmbd4a8e841222b6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHUJJVklLSEhOTEtPTkgaSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=lZMSgaxa4GXhiwucz/mhIY8jUm3fPooBzsHSv6imSruT4z691xuklvzYwZ9F3aiOK9rDmt493LL45kdxSraIslTc/N/hmv4bAguWEbFG3A6KLamWOo3GE40EUqsqk/+olp0FSq6ywz91SNm/Te8WUsJFmTW7RXu0X1WyacP8lVY=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=4OlwV+0WkrrhkAznnAMTdjGUiKt37Zz1CzIqKhw4J8E=;
	h=date:mime-version:subject:message-id:from;

On Mon, Dec 29, 2025 at 09:19:19AM +0100, Markus Elfring wrote:
> …
> > +++ b/drivers/soc/mediatek/mtk-svs.c
> > @@ -789,7 +789,7 @@ static ssize_t svs_enable_debug_write(struct file *filp,
> >  	struct svs_bank *svsb = file_inode(filp)->i_private;
> >  	struct svs_platform *svsp = dev_get_drvdata(svsb->dev);
> >  	int enabled, ret;
> > -	char *buf = NULL;
> > +	char *buf __free(kfree) = NULL;
> >  
> >  	if (count >= PAGE_SIZE)
> >  		return -EINVAL;
> …
> 
> You may reduce the scopes for involved local variables,
> don't you?

Thanks for your suggestion. I will reduce the scope of the local variables 
in v3.

> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.19-rc3#n262
> 
> Regards,
> Markus

Thanks, I will add your suggested Cc tag in v3.

Regards,
Zilin Guan
