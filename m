Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48C52E92D2;
	Wed, 18 Feb 2026 22:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771453860; cv=none; b=ALHZ5patnb6HJuSLpUiJd87kTvFgr/9zqfKnHcm81lqVkQRyLEZAbGcGsiZ9672QXuF9es9k/xFnT79mJxuycDtq3yKE1TIrT1/NBdnzFOsIwCirqp80JKxs5mR/m0zrq/Scbuvsh9Sskn1KOakE06yjz99dPZTP1LXghFiU2Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771453860; c=relaxed/simple;
	bh=SEtxAIZBK1ZNAqcAaqFeEObbh69jDw16/IoYHK/Wkg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3A36pKLSPAYX8LZLUPa6ia48mBpNAukDwKFkYeFRYFlqlWyoe73W1MJ34Fq4FEYldgDIEE73SSK2dvV70AYCv1HeONIC2Dv6rUAjybI7bFkeQ082/V0SKsrQJUmVwQZZeBsZHut8Nkd7gDRvfbTqWwM9y3BR8OVGm3252tOc+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eu2tr76q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eu2tr76q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A217C116D0;
	Wed, 18 Feb 2026 22:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771453859;
	bh=SEtxAIZBK1ZNAqcAaqFeEObbh69jDw16/IoYHK/Wkg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eu2tr76q8Z5u046aZaBOiikEvjkZc9V0JROXAU7kYd1t+8AZQl8MbbbzWSLkYUqyE
	 CHQ2M84K8o6P6U87lwvTc55wBlbY41T5YPQqoXBVrXHApwhz91nK0gApjMafsWWnk/
	 iRWDZiKj/yf1tycdrWwc4S6TGFNWcYN0/L26CylHtyEkulMIjmaB2XlBRcXpPJ1qn5
	 Z/iC5jz5Os3CU3IhPNbTxQMedLldWKFROmK5Uu/DI8Inz0qbUvvJtzID+iKAqx0F04
	 e+pZj6QmcF1wP5wdBXxiNFijDmOIPeUklsE3aQ1jGtn4DcRS8fvzqNiIF0F6bo3A3N
	 5+77axPDCZeuA==
Date: Wed, 18 Feb 2026 16:30:58 -0600
From: Rob Herring <robh@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Frank Li <Frank.Li@nxp.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] accel: ethosu: Fix shift overflow in cmd_to_addr()
Message-ID: <20260218223058.GA935020-robh@kernel.org>
References: <aQGmY64tWcwOGFP4@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQGmY64tWcwOGFP4@stanley.mountain>

On Wed, Oct 29, 2025 at 08:30:11AM +0300, Dan Carpenter wrote:
> The "((cmd[0] & 0xff0000) << 16)" shift is zero.  This was intended
> to be (((u64)cmd[0] & 0xff0000) << 16).  Move the cast to the correct
> location.
> 
> Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> >From static analysis.  Not tested.
> 
>  drivers/accel/ethosu/ethosu_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Missed this one. Now applied.

Rob
