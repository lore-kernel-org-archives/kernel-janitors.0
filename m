Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB13D1F30C3
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 10:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947064; cv=none; b=Ymzk80bEsvYCFPUA6CltrINRGrOetEis10bahMvzcw/iKC23GUfp1rqILxuH0xc2DFdgjhxVGMJncTLOTeOvKdUBa5j5WbBVzeuXty5Chj5XBt14FoOfgIvbKU7GsVl0OaurOYEIgPQmR7iPIaqwwlDt3SfN3JeUcWlMC+di4ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947064; c=relaxed/simple;
	bh=Ha/KS+ElT7WtLbHsW5QrAN3KE92/i3cgTDDDhR21CLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ScsgP44Us6OadogCiApsaAi+yS5OVqY/6SSLiu8vH89hDyiv644kR4UkfDPLL0k71BigSt3KoaIuBad/P3XUZNmMHJpZlWidLhj9ZXCcsu23e06J4wKkQbd1131OF5cgDTMIbLqYx34CB0AwNfBTwNLtcCIY+f7aX1vPIAN47w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KwvWjLAk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KwvWjLAk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so12672565e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 03:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741947061; x=1742551861; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fgud6hXh4dOzT1nJ8XNwGdjcgEPK4Gm9tj6MEJh365U=;
        b=KwvWjLAkJF2owAbDh6RxStqsWNxAWm4zXCtDa/+eAte1WJWGZ0wWbzWh0IZNw9gADV
         X9V3ykoqf/7sVGAidnQtRcDcYQJ2Yp9YR4utvqaR/6gXQyX+FlunGGbYluf/uG+/ejOr
         h1hF8P7C5YSz0x52hVeJf45czACkFuINm103b9LyJo75GOeKW1Z9eU7cpyRrpQMbRSFh
         Mi0g3kTdGDZSISHFawFuhqBXy4l1yyXgcHx3X5dZjYxpeefbHIz2NQq898Q30OjSBlkG
         0V1zNCXDPH3yxJpjnGI4B+J+1Au1+Q97BnEL5dKgJ+IqtkmvcgwGgDaSD21pxF9jNSY/
         DeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741947061; x=1742551861;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fgud6hXh4dOzT1nJ8XNwGdjcgEPK4Gm9tj6MEJh365U=;
        b=DY2XU+11Mt65IpaqWoVWnnQspwo0DsPWp+Gelt3dYHdD3Dz21pD54vgLviXd++BbXq
         pga9A6udxmTU1jv2T9viwi0qp9p/jx11csoiLpduZPrUprEPKdld1WbF6bSa4rSkYKeM
         /a7Pz7fiufxmNCqOZsGmJandfd/zS3FscljotJ/uh1LlKP2HPDsqmEJcL4jicbcv1aQt
         8uvlNgMPtRCgXZwL3vlwuiyiU21+Z1Tmiymy7uOkEvErMMFq+oefayZVJQGynAgnYAh1
         ktiaxw7ivotO8GYyI0gWze0F1kWJvqtzcaq/j8KJ5VkTJPyfcPTQfVWS9Sc29J6QfGkh
         SS/w==
X-Forwarded-Encrypted: i=1; AJvYcCVIwPkatLf06D6h8DwFvZsMV3R+tHrsBv6SWzg87yS2kAhyK6wmmkY3T7rYMYRGd/xe6O3/WrqcvOq33sRRhu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV9raTR4D85HJ9X27s/PieO96jc0gMn0v5emjo43zgOoJtkMaw
	tTPa326OB2GOQL5qZrY3v2Cs8pacwiH6VdSn0MapR6UM1ekkiFvhACSfqZEfN1g=
X-Gm-Gg: ASbGnct3XDFa9CfjqKvrV4jKcZJgYlSXYkZFoZSrJDlhZFW3JV+UTrlLQSbcH67mTMF
	GBV0/DS/peh3H5JwGtfL9f0Dy6HmfeNi18L6xJQH9a4rCTHsphb2k2EhzDsd3eDyqdcxGOsBrJo
	ym9Hc0lRr50S1oCnFNS6eppdTiSdgbzOn5jG8dHIp639kqGTJyVBNbps3LOk/wFelBVJaVi0DVA
	BVjaoe2Jw4gyt4bKIV4ndZrPnmCHaUUMf1FVmnZTvudaQfOYbhAD2a2lNm/ozjqdM5oIQVn3Imd
	MUBRMrH+gPpk45qCQN8C3sZg1r9lJQWDCv2I1vR9vBTmVgYV8Q==
X-Google-Smtp-Source: AGHT+IGrqsA9/IFFX+VNcSF8RCUcUm/rFalF5L0nX24Ys1wiCIc0uaBlGoiwZeDMhGOrmCUK6wBs1A==
X-Received: by 2002:a05:600c:4fcc:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43d1ec80ebcmr26365605e9.16.1741947061151;
        Fri, 14 Mar 2025 03:11:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d200fae4asm12118455e9.27.2025.03.14.03.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:11:00 -0700 (PDT)
Date: Fri, 14 Mar 2025 13:10:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: atm: fix use after free in lec_send()
Message-ID: <c751531d-4af4-42fe-affe-6104b34b791d@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ->send() operation frees skb so save the length before calling
->send() to avoid a use after free.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/atm/lec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/atm/lec.c b/net/atm/lec.c
index ffef658862db..a948dd47c3f3 100644
--- a/net/atm/lec.c
+++ b/net/atm/lec.c
@@ -181,6 +181,7 @@ static void
 lec_send(struct atm_vcc *vcc, struct sk_buff *skb)
 {
 	struct net_device *dev = skb->dev;
+	unsigned int len = skb->len;
 
 	ATM_SKB(skb)->vcc = vcc;
 	atm_account_tx(vcc, skb);
@@ -191,7 +192,7 @@ lec_send(struct atm_vcc *vcc, struct sk_buff *skb)
 	}
 
 	dev->stats.tx_packets++;
-	dev->stats.tx_bytes += skb->len;
+	dev->stats.tx_bytes += len;
 }
 
 static void lec_tx_timeout(struct net_device *dev, unsigned int txqueue)
-- 
2.47.2

