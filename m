Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97001EB190
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Mar 2025 07:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740987630; cv=none; b=aaJFDdJ6ppRcae7/Vp/m0bSZSruODVNQAM8gAwsvErkwTKxk/GARI0QxbUdxjYzZN0uy6eebhrdsoLFGEchDzRszMxhxv9d4R/n8+Ay3SB2c8rK9teZQWYslqh3SU9NeWmshelwXgM9NcxpXQmBWydTfPRMGDyNVyaD+dapA/Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740987630; c=relaxed/simple;
	bh=IzeGHhNg9guS+bb6Xf/SXPSItFc/WQddL0VKXCsN+eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWX1eyYfFHcpt6mNjBqD3+tcNdvdxYOPaAKeA3yaakLSKaBFm2eA6Dg20Wvol6Yve5KgWf+PLYiv6G86LKCeezpLphnx/QbTCB1l8lMiZG45x4AXzJ7TE73F8stHtnClq1lFWDTz3jH8C5myZ+5+NTzfZDotvYU2bTNe+ldQPng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bZMpYrYq; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bZMpYrYq"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so7204929a12.1
        for <kernel-janitors@vger.kernel.org>; Sun, 02 Mar 2025 23:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740987626; x=1741592426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKqqIyx+LvtkYRdOlEQ7AImwUDeztG0/r/38CZ0Vg4Q=;
        b=bZMpYrYq8SmU+1WmTx/80imEvMa0yB74Vr6xlejw6sFZAlnT1Bl/W4GCPt63wwLOO1
         +5UJD9ENZawuRtTCHXsNJi6TL3GHu4uy71jMDTqN2S8BIc1TEfX5KVQ7+qKEiij44G3b
         osYyOTUC5h18vArHUU1ehxOIX6RYAw/hUIbFUCVzLi+c7L5tHmmq1Cyls2nczEyBcbqm
         sBrLx88Yf0w8hVri1pLA+duitT81weW+fAQBmgXGL+i7/m8fRHYEp56nY0CZZub39JXc
         r/Bbi4PfiV4YpxN4jFHBTKx/UrWqF8gMeLo2P0FwwW4Y5f6OfbsnLr1rn+/FurtpbDQj
         d5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740987626; x=1741592426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKqqIyx+LvtkYRdOlEQ7AImwUDeztG0/r/38CZ0Vg4Q=;
        b=c2ntcg+8BBTQwtCIHuFAwxvzc1fvA9KM+3aFhPomwMqYOLlCV+M/jOEse3HKleqkAf
         V69xzFgrT0Q+pq5SYNePlG/EjWu1FL/8kGSypauD0xj53YGgZIe1+4y3W1mqVVJCLsuI
         5c7UmxRHJvCmEITk2L7xXLEx92S+0nzayzN5ZdQ2KFBl7yRoTsT5hQhaFYlFftxDZOyf
         LdCnr91Ic/khHIRseXEr2pO54ez6Z/Lf6ePsTNs6tbeB9QjtMACPN5Ln0jTLHgMK4/zz
         LNKwZ5O0LQ/M+1gSFprnfgeWZwkcIQ6lA93tFEkE+gmIZt0JPtUYCoEfS2xntXM3lFye
         9SAg==
X-Forwarded-Encrypted: i=1; AJvYcCV5Nts4qaOL+dRoaT8gtUrNUg0KE8eMzlIqNIW8y9mzwX5gVERA4LbtPlERaTbnHrNso2kloo3iaA4IcPiQcfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE5KMYyAujTM499mc9K9DIUunlSv77gHzpVTcDu5yzmHLPg2sA
	/qnRxOOSEDRgVpZQUUU+whFKKa677NoU6aH2RJkqhFJ2NGt92FZ5iSKYEtxbQFE=
X-Gm-Gg: ASbGncsUTax7FBMJxvBlswm7r/zokgO5plG6m9PpDNqrlq2cyH49X+uGLLXEJIjMg9z
	3jANNcJQcdekvYkMP8IqZD+MC9MMPGZqLz3QXBe1DujuaF5U3tPtuOVzseEPPL8zc+2/W84LrM+
	1XguZecXZt7IOpv5p+AB4GY5mIYR/bGWKcPoIDFibE/qqS2Tco0FwhTd2tKg3poKT1Rn+bUiK5J
	2GbTq3CE5ApNLaXkr70s2f2LiH2iMPPjkFO/WVUJJV9Grx6+v6hjFadotVPj5q+NfUnFQloYHsx
	rcZGFHlcTQOJE7slWyD0s1KgOHF4BEHVsSsFSkmvUGIoppJlfw==
X-Google-Smtp-Source: AGHT+IENHB++EW6cxUTVldIAQkOiV9MmVqFnw5XQy2hy0OzVOdph9rtPPbQGZ/IPOrVxn3HuLojH1Q==
X-Received: by 2002:a17:907:7f27:b0:abf:7406:d375 with SMTP id a640c23a62f3a-abf7406d6aamr378845466b.0.1740987626156;
        Sun, 02 Mar 2025 23:40:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c75bfe2sm758421366b.151.2025.03.02.23.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 23:40:25 -0800 (PST)
Date: Mon, 3 Mar 2025 10:40:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
	netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	Ariel Elior <aelior@marvell.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Manish Chopra <manishc@marvell.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Ram Amrani <Ram.Amrani@caviumnetworks.com>,
	Yuval Mintz <Yuval.Mintz@caviumnetworks.com>, cocci@inria.fr,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] qed: Move a variable assignment behind a null
 pointer check in two functions
Message-ID: <325e67fc-48df-4571-a87e-5660a3d3968f@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <f7967bee-f3f1-54c4-7352-40c39dd7fead@web.de>
 <6958583a-77c0-41ca-8f80-7ff647b385bb@web.de>
 <Z8VKaGm1YqkxK4GM@mev-dev.igk.intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8VKaGm1YqkxK4GM@mev-dev.igk.intel.com>

On Mon, Mar 03, 2025 at 07:21:28AM +0100, Michal Swiatkowski wrote:
> > @@ -523,7 +524,7 @@ qed_ll2_rxq_handle_completion(struct qed_hwfn *p_hwfn,
> >  static int qed_ll2_rxq_completion(struct qed_hwfn *p_hwfn, void *cookie)
> >  {
> >  	struct qed_ll2_info *p_ll2_conn = (struct qed_ll2_info *)cookie;
> > -	struct qed_ll2_rx_queue *p_rx = &p_ll2_conn->rx_queue;
> > +	struct qed_ll2_rx_queue *p_rx;
> >  	union core_rx_cqe_union *cqe = NULL;
> >  	u16 cq_new_idx = 0, cq_old_idx = 0;
> >  	unsigned long flags = 0;
> > @@ -532,6 +533,7 @@ static int qed_ll2_rxq_completion(struct qed_hwfn *p_hwfn, void *cookie)
> >  	if (!p_ll2_conn)
> >  		return rc;
> > 
> > +	p_rx = &p_ll2_conn->rx_queue;
> >  	spin_lock_irqsave(&p_rx->lock, flags);
> > 
> >  	if (!QED_LL2_RX_REGISTERED(p_ll2_conn)) {
> 
> For future submission plase specify the target kernel
> [PATCH net] for fixes, [PATCH net-next] for other.
> 
> Looking at the code callback is always set together with cookie (which
> is pointing to p_ll2_conn. I am not sure if this is fixing real issue,
> but maybe there are a cases when callback is still connected and cookie
> is NULL.

The assignment:

	p_rx = &p_ll2_conn->rx_queue;

does not dereference "p_ll2_conn".  It just does pointer math.  So the
original code works fine.

The question is, did the original author write it that way intentionally?
I've had this conversation with people before and they eventually are
convinced that "Okay, the code works, but only by sheer chance."  In my
experiences, most of the time, the authors of this type of code are so
used to weirdnesses of C that they write code like this without even
thinking about it.  It never even occurs to them how it could be
confusing.

This commit message is misleading and there should not be a Fixes tag.

regards,
dan carpenter


