Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527691B3930
	for <kernel-janitors@vger.kernel.org>; Fri, 13 Dec 2024 09:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734083254; cv=none; b=jKdEaTt1OaKxLm2tT+Xrlg0xtdkqVfmDE0xTG9tu0FeGKFCaSj/TpDOUosYJLjhCsXCfWF3Lx1KE3+F6Qs12BDOH3PXW0lFZxdwyV1ULMf8vnOcdvMWLKBJpVO6d0tb4ldlkSUJjZbVIs2b8cnTqRaFaFAGxiGkPynLV+5VPr1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734083254; c=relaxed/simple;
	bh=QftEkgPw/0GI0tdyO/fV+/Wq6wLc69fz7Mk4V7VnBf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFCIz3WJ9LIxqv9WbZXeQmFcXX8budc5RIdXTm/+HF8vDGLtnM4UzE0Rez1VOrLzZf6kozzEKDSEDx2DuDry3YuXxiYaVsbmCHhlKnxRFa+eNw5ZRP3/sda5abDZGpOSY3RxHLnNgDPACCKpEsvdM5YFEL3YBNpOjkAi/DV+VGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wqX9myFf; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wqX9myFf"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso1854140a12.0
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Dec 2024 01:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734083251; x=1734688051; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rdxFYaYZsFwA6EnsM4K6iSZW6gjULgohyiFusWzHRuE=;
        b=wqX9myFfGq1RC5tbQJD7JL0OKd4Xbtx3irGbR2FR7CjeHh5YUUoLRZf/3G4Igx7EgD
         YS2F7+bDyBoAbimKmbco76d1K03ooFDYvVO4rsUvZZhlpnnQgA/L4CX+IGC7UsZCvGuP
         B6uOLcit1bxqK47Np9dp3jYtJQJ+B5FbeNwmOGmconQjCwWjxcRidQSSq+6titNrHvF/
         tGGmITnkGYO2RN06J6vJZfdJywPzv/6jFNlL6lgnicWJghJ1A1AlcFS+gSVcN+4YeeIZ
         Q7gbXzQgaMBhB7eHhO7Ye6n8YWq8zpxG0lfwui74XS1IxZs4epXQwwhQvIjTrLg3EhuQ
         g70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734083251; x=1734688051;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rdxFYaYZsFwA6EnsM4K6iSZW6gjULgohyiFusWzHRuE=;
        b=f1l3w2xR2fuQhdwGYgosN2PS11T6WwMMahowSzs20X4cC9i52UDORtIB7pQda3CXIl
         nJgyM98nQRQVuBbOHzPdQT4FtNo+xfGji/CoFUxOSJSTJuQOm0EmH8572avu19T0L8wL
         5GdZqtbE6G4QZR6el3klK9oOzJRBw36qxCkdS3TOUUnRq7CVBknhB9p6Gp70Z8sLuGYD
         j6G6sfelpCCMNq2kxAEFJBtx9maYz6sEUMoQJ3ONIQCL1/3n5c/saSc1fjf/bOJdas7l
         3fGD+JfnfJwUYaWO7/WFG42vKNClWFmVM3l/m3wMxVLc45yYe5YgEeyDFNMkcjV8wgj7
         iBBg==
X-Forwarded-Encrypted: i=1; AJvYcCWW7bSoWGm8r+isUr0z6ubwHxqOm2vqmNeidmHKvUyifVBJ1J5oe+d1kjXCzk1MDGw6aQcAwjz/qokpj9GxURo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX8KVy12H9ChqvOZyGg1kv4Bnr/C+YGmPHmm4hmI6uxBRcmNbX
	tY/G9mQt+Ufe/wo7Rl4Xlfu494zGS9bf4PhWzcjJSPjfnnqcBuqUwuM3w1z+jKY=
X-Gm-Gg: ASbGncvxq3EKW7UbaqshZeJaeFCld5l8ujMTMcOGCsQvcWhj2jbpoO49iK9ytj/uCtz
	rMyNlTX42XlKwPyPBGXkPx8wQZI1DqfKZViBPgKsXdvzDStxayPKiv11JbtgXiZm/cyWF+7XBV6
	Ul9G9ltfCef3+SrI1FidmdMjh6h6tNfcZNO44Kn3tBGawLg/ObESB8DFPHH8fmbFfDBfsoCuXmm
	taxSGJdZZiKYV5PRwSDXJkqTv1Z9FY094QY2SLrDoww6zUuDC9UAXEdkgK6ow==
X-Google-Smtp-Source: AGHT+IGltlAdrz0s/05wujMEiapProTMuSaTetpEvSQ5pgYx7uxayECdPRY4Y4KRwu3RO0NYkPh3qg==
X-Received: by 2002:a05:6402:390a:b0:5d4:2ef7:1c with SMTP id 4fb4d7f45d1cf-5d63c3db8d9mr4114411a12.24.1734083250584;
        Fri, 13 Dec 2024 01:47:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa671136c3esm814037566b.7.2024.12.13.01.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 01:47:30 -0800 (PST)
Date: Fri, 13 Dec 2024 12:47:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Atul Gupta <atul.gupta@chelsio.com>
Cc: Ayush Sawal <ayush.sawal@chelsio.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexander Zubkov <green@qrator.net>,
	Simon Horman <horms@kernel.org>,
	Michael Werner <werner@chelsio.com>,
	Casey Leedom <leedom@chelsio.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH net] chelsio/chtls: prevent potential integer overflow on
 32bit
Message-ID: <c6bfb23c-2db2-4e1b-b8ab-ba3925c82ef5@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "gl->tot_len" variable is controlled by the user.  It comes from
process_responses().  On 32bit systems, the "gl->tot_len +
sizeof(struct cpl_pass_accept_req) + sizeof(struct rss_header)" addition
could have an integer wrapping bug.  Use size_add() to prevent this.

Fixes: a08943947873 ("crypto: chtls - Register chtls with net tls")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I fixed a similar bug earlier:
https://lore.kernel.org/all/86b404e1-4a75-4a35-a34e-e3054fa554c7@stanley.mountain

 .../net/ethernet/chelsio/inline_crypto/chtls/chtls_main.c    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_main.c b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_main.c
index 96fd31d75dfd..daa1ebaef511 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_main.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_main.c
@@ -346,8 +346,9 @@ static struct sk_buff *copy_gl_to_skb_pkt(const struct pkt_gl *gl,
 	 * driver. Once driver synthesizes cpl_pass_accept_req the skb will go
 	 * through the regular cpl_pass_accept_req processing in TOM.
 	 */
-	skb = alloc_skb(gl->tot_len + sizeof(struct cpl_pass_accept_req)
-			- pktshift, GFP_ATOMIC);
+	skb = alloc_skb(size_add(gl->tot_len,
+				 sizeof(struct cpl_pass_accept_req)) -
+			pktshift, GFP_ATOMIC);
 	if (unlikely(!skb))
 		return NULL;
 	__skb_put(skb, gl->tot_len + sizeof(struct cpl_pass_accept_req)
-- 
2.45.2

