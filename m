Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1851C2580ED
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 17:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741800080; cv=none; b=nXNs42EarK8usj5UmKYeh623atqbPE06v2QKdBGtqsY5OJklqQfuLtitaugVBt9W0JM1Wl7CAZn88wtMD31RqF7LW0EmsmsIE1IYDMMwpa2vbjMKpRmDps+MDszQvWQ6qs3O5WVRj3Opj2WR4L6zmGxMikyFdIrz4psZZDeF6y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741800080; c=relaxed/simple;
	bh=wjnq/u21AuKdRgrNZm75J0lF8ufWmfGo4o4NzXDo8ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ehKXuxJzICwvAlHujRTpzRJq/399TQTfdx0sFcaNqL4uD4rjmpDiwIIfFnBVOvQLNbbbn2W46P5nNaQL+TxMXp4qaRvBOs4tc+9xYafFiMTySPkjFL4bQUJxv8fc/jQmxS58hCMssKoMxDxyGIz1GKy4pKDALmeGoUDfoTVyKAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=troX6rnO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="troX6rnO"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912baafc58so82190f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 10:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741800077; x=1742404877; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HB9xS8FxfigF4WYPPRbbcyxASGClaI6fGW/tpj8nUVs=;
        b=troX6rnO482hE4d2rEQdQiinHkcPuf3jS4eVdVQqoSyMj84BMwyxpA8uIxZF9E9ic2
         Qk/dvynGMlLj16cBYY70WyHusatcx2/362aLln3GnrnYlvdWRxckWs53pMKIcdYFH435
         l4qJT7p6ytgpdWwlN+CcU8VFUHHl935bxRlbJos2BRmL4jPdqLZylrk0VoSNwCbUiAFo
         03N4zhciH9p+DB9oRUXcSKtsu0t+7iIPWsW7YE+zrg1+JYsczy6JUaUrbsL6FY3ip3q3
         OxY7FtYamqGi8HmskmjwY8lK/Nm+A+Ylrb6d217HixvV3OCYCZjyfJsb93IF7vtN+MiP
         INvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741800077; x=1742404877;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HB9xS8FxfigF4WYPPRbbcyxASGClaI6fGW/tpj8nUVs=;
        b=KZ2SgruOmuXDomIGFHNsJwmwavGHkOPv+LrVmIiHga/LMnCXBGOAxnYhaD8+nJW/4M
         +TlGxqpmbz4HgC8wv7f71glDOKVUFhtomHhenKT48GE3mHglm1pJBZJ+c+OZcuoaRmaf
         Hi9opjGf0d/pahhPG3sBoJVvv8QurBUoivzXpa1rbmJs0la82dHE0WIeh388uPBsHu/4
         Jg+eySjbwWXEEBRk0WiLtnOTx2oYDvt3A+rrXHxUFS61SDIwLukw4CglfQlsWK7hFl16
         j03vdbbBffQQpl3VswwRxpFASlSo9npzh9uQ85XGSfbw+d9i9KHSV0n084cL4aTgKVyl
         Ivow==
X-Forwarded-Encrypted: i=1; AJvYcCWsUJ4t/r5we5HMIXC8Gq7YR21+DHP/Mq2hyO1Pz2M26mPSbnX6cXWNsAu/yG8H0qtDW8ATZBQMtvcezsYOOAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBaov2ndTO5qaZZBXP11ppSlrO4qh8YeG8utVBG/LsyWlpjSKq
	lExaRPp0lUQQqwP1f2lFZCKJGfELZ/oPuevUhr80Fam11qf+wsT03YA0YWiEz/o=
X-Gm-Gg: ASbGncvqpE4+A/+xMAzlk9/zPGEPe1RqoKatpgeMouIXrS2DvkyAENTgJqNVtMc3esU
	DuWr79OskgY4Iml73TpotXaOMtwa6JfMYHdZH5lIAza5dTiYhRkj+Myy6yaIUGbXVumnyEPEDdy
	qutX9NChTzJ9N1xT7rBAWdDJ1bzRxnxjuZce3ZY0bK5ubmnfJwz2o0xjZU8UcVGKbUrFdQvzUiW
	QUUzwKMsMtPRmMdBDQbjHFiruxyrcvPkXosjY5crcqEC6oY9asWjMDsMFTK9kg4RHS4W9Bv0+pp
	n5PMkFN7VpMY3trbkzFIMu7iZA/ZEPE03B3l8rn3LZmWEsEhHA==
X-Google-Smtp-Source: AGHT+IHj/Sj6ykxoYXb50k6xZbXFvzcbHYh/wf0blrf/4M8wSJId+CUZ1HfJtS6QVZFmpy/JDyUI5Q==
X-Received: by 2002:a05:6000:1448:b0:391:487f:280b with SMTP id ffacd0b85a97d-391487f29camr12619009f8f.10.1741800077411;
        Wed, 12 Mar 2025 10:21:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e2bb7sm21940643f8f.63.2025.03.12.10.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 10:21:17 -0700 (PDT)
Date: Wed, 12 Mar 2025 20:21:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] xfrm: Remove unnecessary NULL check in
 xfrm_lookup_with_ifid()
Message-ID: <2eebea1e-5258-4bcb-9127-ca4d7c59e0e2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This NULL check is unnecessary and can be removed.  It confuses
Smatch static analysis tool because it makes Smatch think that
xfrm_lookup_with_ifid() can return a mix of NULL pointers and errors so
it creates a lot of false positives.  Remove it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I have wanted to remove this NULL check for a long time.  Someone
said it could be done safely.  But please, please, review this
carefully.

 net/xfrm/xfrm_policy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index 6551e588fe52..30970d40a454 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -3294,7 +3294,7 @@ struct dst_entry *xfrm_lookup_with_ifid(struct net *net,
 
 ok:
 	xfrm_pols_put(pols, drop_pols);
-	if (dst && dst->xfrm &&
+	if (dst->xfrm &&
 	    (dst->xfrm->props.mode == XFRM_MODE_TUNNEL ||
 	     dst->xfrm->props.mode == XFRM_MODE_IPTFS))
 		dst->flags |= DST_XFRM_TUNNEL;
-- 
2.47.2

