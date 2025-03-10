Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC42B1DE885
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 20:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741636852; cv=none; b=P/6u2fWbAxt8eOD2dDi2jFfB0ZSIJOGDIs+Ipwddss1RRbXL4IMvDx8OoLcx+nt3Vl+JWNS1p3g85Ij4xHXTp1M+LzPVgXq2JWwnPPFS5JfrjPyHL5WyhMXY1qurPoJ1l/Wyr+BNqcat6RQhJf4/J/nsCbDBFckITZQBkyk3KGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741636852; c=relaxed/simple;
	bh=AGt2QKG+DtqFoUcbhQ3xw0t2YLyBDUEC2Yq67tszctM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XElxJWE4jZHqjDpCdrB8RGnpzlL4xxyvc0vLM8n4tXuChMmQrlISyjaVXd6GTGmhaZdWEypb2EOq5gawqds40CgleQdo1bzekSNTqwWy1wrHLTxeCEBUwkneH24dYcnpoJyCv5Jrsnb22cyNdI2Rxpyx1ZOGmx7jwMnoTTUKfRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qUpt515u; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qUpt515u"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf257158fso10604735e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 13:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741636849; x=1742241649; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RrH66w6hjy8vTdk3/chb+sp4rDPMHTlBdbnwkF+r5mI=;
        b=qUpt515uw5B1Ei7onMIW5ikoEsB2Anjrxe5zfh8KJBdUy3NMHETsQvkOKMhaoUbR4M
         xYnh6JDEV5K1EnsRUybnIjKk4BjbuBT8MOpoybjA0K9iKiUD+Qps2WVS8zebXHpU2kxU
         aQ2t4+0Lq9DI5R7/w4AUWoWcz+sxtFrvsjcVt7te4+VweT3AyT9EGGbEfxiuOJqkxEu5
         e3C0w+KDU2eysvhBPLOWxr5zr2b40lHtYz74Q7UIbrHgw/Or40KGcxWzhbo7Oh3Wketl
         xCSSD/LHYVeFLeEDQL3ajpb4uuErhEKz8Z4ks66FfYqgy/GfL16eJeK9FYVCdwO989nc
         yagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741636849; x=1742241649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrH66w6hjy8vTdk3/chb+sp4rDPMHTlBdbnwkF+r5mI=;
        b=AGzjZ97nI6xPvtn1ifVExskytUzVE1bLSn3ooCK/UlXzWJS3AnItOD6cqbSj7iohk+
         4bBXWwqlZEZmU8BZFEJ/hSohWrGKH+clNKZJ53YpoyPKp4cusL7lGFzchnfZvAFZP5mK
         Z47JElzONIfOr0wqGviCjcs8hsgy7HLF7gqSEpM2VD1U6sQqvNSopt+Xgxfv1oPxjEgr
         riob0xa+iUiWE7cHWvCfMuo2fdFCiGjii1fMDlsau95VmYfz5zsQsVGb2sAnpTn6lf6x
         d/WnboPZ5tORICaCmTXdT12JK9BS7sE4LS+LeRCFt/dHpqQlE83Y+XM1IvE8PTlURZX4
         OA8w==
X-Forwarded-Encrypted: i=1; AJvYcCXr0smRcLWFYDVAbfUqTr84WRk4HnxCswk/kJTt4ejA6ECl+d/4g4/XfFDfU10MQVH0ojebOfyidDjDw2HHMcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW7F33y968x5SfLt7rIC10w5Cmkv5u7oSQNBxEjE5t9t7Bkw0x
	TSI3hl2lutID6uWCfyBDrli3viFv1DKCtGXdMc+44GX1+lWklJ+pg9WlWFLQmxA=
X-Gm-Gg: ASbGncvJ5Y4DYDtEv9Ae50UTvyT0RY3WIoPwTSuS+D7sv6s5hkR7lsiUZnXs8IFn2g0
	F7e+E+QcOWZWxwrLRiDGJ4+xKiCCOG/keXVh/Qr8d4dWznUKwiqDiMwB8/vztMONkETpL3qiv9b
	ROXZC4PQRcoF8UBv6Hq1sfsbKPDAJyb8kcG/ks/DUVE5syrKW3kuZ7TpoPL8xmALILDoToGjf/Z
	cShmAbZMQxJ+jludagAvTgjQwHU6JUBai56QdPGnrHKzraBIVlhDAa6YgHZVbNPAAFDDAnMTpxL
	ebXVdJDd/O2ipk/EnJAB8sOC/I5NBp2cUyx5WYV3u2hSldP/Tg==
X-Google-Smtp-Source: AGHT+IFM0bk3L92HPL0a5ZdSUwgEKFaDtW1VyX0wWUqemrb2A9UISJTLPEdrw9TUJkHbZkhUzucD2Q==
X-Received: by 2002:a05:600c:3512:b0:43c:fded:9654 with SMTP id 5b1f17b1804b1-43cfded98b3mr28404325e9.19.1741636848948;
        Mon, 10 Mar 2025 13:00:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfb7aefsm15672875f8f.20.2025.03.10.13.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 13:00:48 -0700 (PDT)
Date: Mon, 10 Mar 2025 23:00:44 +0300
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
Message-ID: <20f34718-e60f-4361-9ad7-311d3f67e40b@stanley.mountain>
References: <eaab1b7b-b33b-458b-a89a-81391bd2e6e8@stanley.mountain>
 <Z87e75UV0Qc4oY64@localhost.localdomain>
 <aab6d5f3-7ef9-4220-8b67-ee9b09a5f168@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aab6d5f3-7ef9-4220-8b67-ee9b09a5f168@stanley.mountain>

On Mon, Mar 10, 2025 at 10:27:34PM +0300, Dan Carpenter wrote:
> On Mon, Mar 10, 2025 at 01:45:35PM +0100, Michal Kubiak wrote:
> > On Mon, Mar 10, 2025 at 01:48:27PM +0300, Dan Carpenter wrote:
> > > This was supposed to set "FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1)"
> > > but there was typo and the | operation was missing and which turned
> > > it into a no-op.
> > > 
> > > Fixes: f63959c7eec3 ("net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > > From static analysis, not tested.
> > > 
> > >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > index 922330b3f4d7..9efef0e860da 100644
> > > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > @@ -757,7 +757,7 @@ static void mtk_set_queue_speed(struct mtk_eth *eth, unsigned int idx,
> > >  		case SPEED_100:
> > >  			val |= MTK_QTX_SCH_MAX_RATE_EN |
> > >  			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 1) |
> > > -			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5);
> > > +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5) |
> > >  			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
> > >  			break;
> > >  		case SPEED_1000:
> > 
> > 
> > There's a similar bug a few lines above (line #737):
> > 
> > 	case SPEED_100:
> > 		val |= MTK_QTX_SCH_MAX_RATE_EN |
> > 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 103) |
> > 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 3);
> > 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
> > 		break;
> > 
> > I think it would be reasonable to fix that too in the same patch.
> 
> Yes.  You're of course correct.  I'm trying to figure out why my
> static checker found the one instance and not the other.  I will
> send a v2.

Oh...  Duh.  if (IS_ENABLED(CONFIG_SOC_MT7621)) is false for my config so
first line wasn't reachable.

regards,
dan carpenter

