Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C4A22FDE8
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 19:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741634862; cv=none; b=K32H5JlDYsmF/D8Z8WvK1wnJG5C+1uGdrOr7EeGgJWX+41h+8l//GXi8spb3UK+fUdhLt21vNosa7bPPWG6eF4K1A146nlyhERv6FTwESjBPhurgeyZeuzUbOpBlHvt4ev8/Rd/TZG80tuZjsn4Tbamo/oKO5LT8yrDXBPt1CRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741634862; c=relaxed/simple;
	bh=7LKU0kJ16VYxkK8s6lY89w1ydzFDPQufI2P154/QRQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6/lK1+YpueCvyILWWSvtc2sxJyY5/rjM0imocqYydeW07nO8Mm8PpxmvorJeNFvHwHkRImjQyMBG+LsKmlk+ErLEsX1l9o5uSnM9Hz+/G+9CfUDQcJZJVjEd5s5X/pcwkeNnC8WX+R6tdhejPMBe5l2Z+4J+Dj5O9b/fa9LiYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kA2Is0vS; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kA2Is0vS"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso3740717f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 12:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741634859; x=1742239659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dlpjAiSLLJUkqO0ugcAgjSoBJydtUnexkUj1lX29pb0=;
        b=kA2Is0vSvEtEPMa4VzDtsTjsEwf1cGF/C+S99rJuyzaZnwshhszWpvdhdcY/HFi1Xs
         Ihahol53XNJpJST2KySGRVUi6DdEmLpovx8Fpl+v3oX5q/LHH+OeQ75RQEuihjxObmEJ
         jAm72NfS2w3qMOfAQQYVImyyKcC0hsEJFLgtcAYBGCTaofIM+C918SeTm8IqeTHyZQEx
         dmcam9mACH19eLFszBQrYptTxjT3I0tejkgYw3IJzOetZmkUoYX26ov1Worh/ga4GGQq
         meP6rmuWlKS+7mEKkcm9/wZPNnp7tDhAZHOWNzZ5a5JzRvKCv/sGW39fMvN2Whtzoh4m
         SodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741634859; x=1742239659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlpjAiSLLJUkqO0ugcAgjSoBJydtUnexkUj1lX29pb0=;
        b=Zcq2DrGGbLslryUqeYodlXaCnUFEaB1PqLewt2aQTMPLlnSW8Jy3iH8JXzxWUaiIQc
         rSAjfM3JMkZDWxXEgtEPYYpGtxGuuD5e4T98VqDrnVeSexOLB6hcG9Z6S7j5U4l3Vj/Q
         m4kb+eH47uoZ58frWJKMY+Df4IQ638M7vtlcQxXHbC3wFxe+lK25W+Z0Fi6m5/3SBro9
         No42Dmo0db0pADuIZDp8Q8pQbl6nxT7FCwYztYxcJcz48+po7wqFBtT/dCrVskMLejfp
         3alkXPhWdRMKyzopPnrfDcydhyn2pUo1ugimMBQExo659vGEfO0blslQKWq1rKYwZiEJ
         0M7w==
X-Forwarded-Encrypted: i=1; AJvYcCXuQIjp5kpn0WospABbsXGj3IBq5eia7Dwv14aiLGsiChD4uhgj0Lw3B8l/kDkjVOTZzGexEiIVLMmgMxy+osc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwffBZ2lRNNQ0CHZ9G6mNDVWW2BeZf7kBRRoR9TlFqSmyseBpvi
	gknAAM06uq1Aa0IDZvdfHVFTdlpPpLNjHc3h1tjQHYMEI7RksUy0cMiu5faEajk=
X-Gm-Gg: ASbGncuIufIuqsINoXJkNNviA7QUBX5QWJyHBaL3nxVsQO6MvzO1KweBM78RAhELdwU
	M65Ti/cSt1iQCfkEKXzAE8Fk8wRgvFQQtEujBVF31D3ja74/ILzyGXISqAManXtOHJ9UdYJwqLf
	9TtsqeKLINKe0WHLnUi685UjiEHu+kf/8lagTtghAPeLPp546dmQgzbYqBZkZxfE7sKdPQaAv/D
	azlpAasRoK9WipEnza9KgePQVMO/lFBVpuEDqSMSbO3JOxfo8YTvZPE9MwONHJtfbBtjj22kHMg
	uYG28nIZcO0AI8eolnlXZneAfymXkO486KEPyChiwQGtf4y5eQ==
X-Google-Smtp-Source: AGHT+IHyKkXj7bFHamDlhb852Q/c2KxdopTfCVoENlr9lgDt39iEHp5/omYhrGf0mlW3wl80G2nrEA==
X-Received: by 2002:a5d:59a2:0:b0:391:1218:d5f4 with SMTP id ffacd0b85a97d-3926d218075mr917718f8f.23.1741634858689;
        Mon, 10 Mar 2025 12:27:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfdfdc5sm15554352f8f.25.2025.03.10.12.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 12:27:38 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:27:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: mediatek: Fix bit field in
 mtk_set_queue_speed()
Message-ID: <aab6d5f3-7ef9-4220-8b67-ee9b09a5f168@stanley.mountain>
References: <eaab1b7b-b33b-458b-a89a-81391bd2e6e8@stanley.mountain>
 <Z87e75UV0Qc4oY64@localhost.localdomain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z87e75UV0Qc4oY64@localhost.localdomain>

On Mon, Mar 10, 2025 at 01:45:35PM +0100, Michal Kubiak wrote:
> On Mon, Mar 10, 2025 at 01:48:27PM +0300, Dan Carpenter wrote:
> > This was supposed to set "FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1)"
> > but there was typo and the | operation was missing and which turned
> > it into a no-op.
> > 
> > Fixes: f63959c7eec3 ("net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > From static analysis, not tested.
> > 
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > index 922330b3f4d7..9efef0e860da 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > @@ -757,7 +757,7 @@ static void mtk_set_queue_speed(struct mtk_eth *eth, unsigned int idx,
> >  		case SPEED_100:
> >  			val |= MTK_QTX_SCH_MAX_RATE_EN |
> >  			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 1) |
> > -			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5);
> > +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5) |
> >  			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
> >  			break;
> >  		case SPEED_1000:
> 
> 
> There's a similar bug a few lines above (line #737):
> 
> 	case SPEED_100:
> 		val |= MTK_QTX_SCH_MAX_RATE_EN |
> 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 103) |
> 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 3);
> 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
> 		break;
> 
> I think it would be reasonable to fix that too in the same patch.

Yes.  You're of course correct.  I'm trying to figure out why my
static checker found the one instance and not the other.  I will
send a v2.

regards,
dan carpenter

