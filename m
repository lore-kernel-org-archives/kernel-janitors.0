Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA2312D777
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Apr 2024 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713873320; cv=none; b=Hjg22zTfz4UUG3QeBHZC97WVlZskIuj8PweByM54w9wGy6ErLLCw9vLxljjq7wLYJS7WjkGZSDtmtrnDW70f3YB0zE1cmHRFU5vU6W4wbJ7B2YCbCrvEWEFytbYs5bMhl6NQWqgCzFlF8dsFKvNmsms/PBd+oI5KB26iBVZ+YIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713873320; c=relaxed/simple;
	bh=naRCsBSPKOwXtsBWSD0Z3M0ggK9Ecnz+DijdexeNtJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1uW0/McoZtvuAmBn+f/FdtLUNzdlpIyibC2tpbAM4uZ/BC5g0XHFCU3hl4Lfp0GBo7IK1vQYcgV7b33k1NAK/1CtQCWMOOmxtf8ctXcwvQcC9gNlTqbuN29aJftubqrc+qsKM3bBOHTDQeFSelm/UT6tFtGwpWsmszKRsO/j7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iDX2fZDm; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iDX2fZDm"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a55bf737cecso194494266b.0
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Apr 2024 04:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713873316; x=1714478116; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OLs2w5Mb2TuW5IEF0yGhInk4y//qTnl8Y3J8SN796zY=;
        b=iDX2fZDmoCqJnTihACafsRkXvpGsjirWwQndLp/JCcwaB+k9v/L8SdsHsHEgren86l
         p8/Tb263UwpreD5ExLsH08JAAd9Z0RbCbtVV931cuI9R8pHMTY+7ytH5HufD13ida8nL
         n2XaKxXP9yLJmDCs1DG9ICymjay9lM3TU39DMpvOKSXMZLk8l2S/UK++mU/p9eka2QYA
         97NHG8hkw6uvxMt9/23yj2iqh13vCHBpDM4Fa4LIHK2ZMZ4iazLVTjB9P1QqFnN9/k7L
         N1cjxIWMYHR9YGZ6MDvnLrST6ifl9CHHiR5kpqWfs6N5HCwIXUnY8WYkJ1EnKuUPMSR5
         dPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713873316; x=1714478116;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLs2w5Mb2TuW5IEF0yGhInk4y//qTnl8Y3J8SN796zY=;
        b=XhT4b+zz1pz/lxJ1xPHqJLiKVb49YE7uZty1PvgMAPh0wC3xKq44cM39vd97VEkl7Y
         5CGq5dUVu8d12IqsA7LAzpxKppzApBaYYCiipjYAMOQTgvadX+P/BHysTP8BaJk0x/6h
         1r+zMmR3Vefw8BENh5GfHlUIT8ahz/lMuKtw6VT6EnOYDlAJMIs6A12ckmzFHCnNVr6l
         JNyVW+jxekrMbig1+AYIZ5nayC+gRLLruC2I8XoeyLjVIjqC5jwNdCG5Kf0FnE6qN5Sv
         fj3CV4HOqm3u9dDdYQDhx7RJvo/Y8pFvaEHg0l1BjGEWDr9CNgTkpka3ZVYEm1XV3xXf
         +hGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3SH372Ek3BiBZfhN1lTMn3jTJ0to6h68/a+J8i0D5Tts0+6M5au+3bWYNVvrokjsgwY7w3E1hJ+MaN9QHUc84dNb4xrszBxaXOK8yLTw1
X-Gm-Message-State: AOJu0Yxo2JNohjdo23asAsgfnVjTFHJqLblyXirPMUNHos2m4u8Bjwp3
	fAe6RLWrODgxMj/MwhEd3GwMz6AKObZhienmg/o/qkK/k6fWJKcQWLiCoaRsOjk=
X-Google-Smtp-Source: AGHT+IFZ405qdGxDMkW1+5YC21CzN8lvjF3c9LLGQSea/WcHK3KI0QcB69sFb36UHpXXURv+h98QNQ==
X-Received: by 2002:a17:906:3791:b0:a55:554b:1f5d with SMTP id n17-20020a170906379100b00a55554b1f5dmr7343452ejc.41.1713873316016;
        Tue, 23 Apr 2024 04:55:16 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qy7-20020a170907688700b00a5887279b8dsm57534ejc.179.2024.04.23.04.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 04:55:15 -0700 (PDT)
Date: Tue, 23 Apr 2024 14:55:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ibmvnic: Use -EBUSY in __ibmvnic_reset()
Message-ID: <da19d324-3c66-4bb1-8fa2-dc26dbea622b@moroto.mountain>
References: <4cff158d-b5ac-4dca-9fbb-626237c1eafe@web.de>
 <f493e39063ee52a3d263de27bfd240149d910a88.camel@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f493e39063ee52a3d263de27bfd240149d910a88.camel@redhat.com>

On Tue, Apr 23, 2024 at 12:54:55PM +0200, Paolo Abeni wrote:
> On Fri, 2024-04-19 at 16:08 +0200, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Fri, 19 Apr 2024 15:46:17 +0200
> > 
> > Add a minus sign before the error code “EBUSY”
> > so that a negative value will be used as in other cases.
> > 
> > This issue was transformed by using the Coccinelle software.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/net/ethernet/ibm/ibmvnic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> > index 5e9a93bdb518..737ae83a836a 100644
> > --- a/drivers/net/ethernet/ibm/ibmvnic.c
> > +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> > @@ -3212,7 +3212,7 @@ static void __ibmvnic_reset(struct work_struct *work)
> >  		    adapter->state == VNIC_REMOVED) {
> >  			spin_unlock_irqrestore(&adapter->state_lock, flags);
> >  			kfree(rwi);
> > -			rc = EBUSY;
> > +			rc = -EBUSY;
> >  			break;
> > 
> 
> AFAICS the error is always used as bool, so this will not change any
> behavior in practice. I tend to think we should not merge this kind of
> change outside some larger work in the same area, but I'd love a second
> opinion from the driver owners.

I missed the original patch due to my procmail filters...

You're right that it doesn't affect the behavior of the driver except
for the debug output when we do:

	netdev_dbg(adapter->netdev, "Reset failed, rc=%d\n", rc);

But the - was left off uninitentionally so I think we should apply it.

I have been trying to look for similar bugs where the - is left off.
It's a bit challenging because there places where we use positive
error codes deliberately.  But in this case a static checker could
easily detect the bug with a low false positive ratio by saying, "We're
mixing normal negative error codes with positive EBUSY".

regards,
dan carpenter
