Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795149260;
	b=KmINOiarpNJ6fAj54gIOKh3IEmKvkPa/o2oijN8G+1GOjRq0saQk5AfNaKpivHqSR+V3
	 9cW3T51IiqWMEWkGHH1AKPc8edqO9WK+2p8/I0/jbP+mVRyMHtgVM7/eLrasSQovBk3wx
	 Fkk1H3kJxYNVTKzPGdR/LckAKeiCpJCPTh2fhWp0/AWDXENDhkF2Sf3UofuqqrmVUEPNa
	 B+9JSvkV2K06jSjHBkd96+5YoZh6y1Nka2M6xSDiz9WMbT5PDbDVDs9HYBJ8ubURbcW+T
	 681bJJMmcZ5kvjTc2aq57OtW1AoFsO8pbDHBRjOa/i631FMdBQnzWoAw3Lxhy++KLTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795149260;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=0hjQbHxWG/lTgkVrAV1u77tKtlUOF66VVlXv6a9ao2k=;
	b=Vq0R88jLbvXzxnvzS/cldFmlg2wOpAkgJf50mLEX9k+/TPLX0lMiyLwnh24d0JCYZf2C
	 tyVC6bhSropvB6ku2QyRJJc0c9NBymU+zcKPgyqbOL1QOoTypgm5vIc9Ov815Z17QfOGV
	 8zOxwi3wMCCYHpHqHucLiwg/FiIu9Kk30xJuiOdz+x+wixggUD/OutOfVbYvsZ5Kteo1z
	 Xfezeit1rHX8b8ftyXeo3zJ8XP1TK8TNEOHwEQGbNkgj2M8PXIaG5KfC/ClOPRVMl2Sor
	 FJ5xsRVKLfshQHfYUNU7UT3XrKK6Zha+KMrLCpdrKmrjyM6x5ptSCbrhJ/2FmvMFLqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=piKJXvvT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA9A606A320;
	Fri, 20 Nov 2026 04:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=piKJXvvT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BB91F000C6;
	Fri, 20 Nov 2026 04:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795149260;
	bh=0hjQbHxWG/lTgkVrAV1u77tKtlUOF66VVlXv6a9ao2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=piKJXvvT/i4qol7V5AbY9w9MI0MWvQSSTfKYlZt2BjSQA4ug2gjUj+/ExhNoDXXvF
	 KlMgqMsFAwrfluk5gDtj01fiaezEEYFjSm1r81j7poRgZ9do1vobpFMbWN+SxZOaai
	 xQvQ86+Bx81DoRnQwuAi9m60MtfxSwOCIM18AEww=
Date: Fri, 20 Nov 2026 05:34:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-usb@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	Al Cooper <alcooperx@gmail.com>,
	Justin Chen <justin.chen@broadcom.com>,
	Neill Kapron <nkapron@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: bdc: Use devm_clk_get_optional_enabled() in
 bdc_probe()
Message-ID: <2026112005-shadiness-prism-c312@gregkh>
References: <07112f96-430c-4109-9aca-e5d17e333d67@web.de>
 <111e6c03-017f-47f2-a941-cba45697c1e4@wanadoo.fr>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <111e6c03-017f-47f2-a941-cba45697c1e4@wanadoo.fr>

On Thu, Nov 19, 2026 at 09:19:16PM +0100, Christophe JAILLET wrote:
> Le 19/11/2026 à 20:06, Markus Elfring a écrit :
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 19 Nov 2026 20:00:07 +0100
> > 
> > Reuse existing functionality from devm_clk_get_optional_enabled()
> > instead of keeping duplicate source code.
> > 
> > The source code was transformed by using the Coccinelle software.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >   drivers/usb/gadget/udc/bdc/bdc_core.c | 8 +-------
> >   1 file changed, 1 insertion(+), 7 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > index 5149c98bf9bf..ce09327250f4 100644
> > --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> > +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > @@ -530,16 +530,10 @@ static int bdc_probe(struct platform_device *pdev)
> >   		}
> >   	}
> > -	bdc->clk = devm_clk_get_optional(dev, "sw_usbd");
> > +	bdc->clk = devm_clk_get_optional_enabled(dev, "sw_usbd");
> >   	if (IS_ERR(bdc->clk))
> >   		return PTR_ERR(bdc->clk);
> > -	ret = clk_prepare_enable(bdc->clk);
> > -	if (ret) {
> > -		dev_err(dev, "could not enable clock\n");
> > -		return ret;
> > -	}
> > -
> >   	ret = bdc_phy_init(bdc);
> >   	if (ret) {
> >   		dev_err(bdc->dev, "BDC phy init failure:%d\n", ret);
> 
> Hi,
> 
> this patch is wrong because the remove function and the error handling path
> of the probe need to be updated.

Don't worry, we don't apply patches from this bot :)
