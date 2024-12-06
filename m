Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB14020E30F
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Dec 2024 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733488379; cv=none; b=k8koF9GFKUBgVPVSBlxHEtNnh3NFZrbbvac5bbxKsVwU/ZOCLuJW7FUl/ldhgzlRtMPR7oqyS29YyBSxJbYh2NPzs41atY42nLePFiUgdvIYvQ6NIgnkWjzf3AcNSARQx46v2qjH6yXbcRMXBcM51oJbobC+Xa1DJdX/eXnmQn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733488379; c=relaxed/simple;
	bh=iupB6znwg2GMb//vGp4ZNrsZGW2q9LnmvRCao1OKqvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uUx8x6rGmjkNcleoBR7ADwkINRzKeKXanVylLqQJZoxEl33G60GoW2hKUmnn0phlXD/bQ43btRSua50ZZnQJ3PIc9ETvFa8KCnwLWQ877vfwn6s4lUBLbeUgM3HpBX3rSe+4T3sn1jGwOAZYi2+q8Q0fBodyFDFLgudqJHvg5IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rd9xsiQA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rd9xsiQA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so13647705e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Dec 2024 04:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733488376; x=1734093176; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WRXlI0fr3FagIbalUHKd5lGtIrqnXoTSjk0ZGwUPm9o=;
        b=Rd9xsiQAzLJJB+wUCirmS8EvEwhnfHNrcxzZqWjW5CQeezmm1nDFDGWv/b1csRf0Xn
         0UKr21RTxSa1527SmbXdL3IDflgDyYy7zWXvPDtSp37OEX0bZraX4qaLpzlDFulPH7Qz
         peYn05s8YGWd6T22M8ScmnNbmRQE2WgFXJctPAgvsmrBM5w2UUi6wf8a1iHU6eJjF8S6
         ps2RlNI03qIwdXjBrCQfywoWw9PCyfYgaL7eJ5DP//844Va+Q43SLBYBbXTZvevbQNdn
         PeBMIEnG3z54drimEAvLEQ+0tqlXau1z6kJJrV9N5Wj4/3nuHtgWIAXzLfTk5fpWRHlP
         tSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733488376; x=1734093176;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WRXlI0fr3FagIbalUHKd5lGtIrqnXoTSjk0ZGwUPm9o=;
        b=gMxTYtkPiQ98sCRsftxZmegFrZ2taPkdqkrluL9+KfGbay0Udrc6qst6TsY4aEwvUr
         2g0VL53Iff3JeuzT2tOQCBueCtkUd1Zzim8Q45ke4gfsfAqtGM2k55dHQmwn23UmnYKt
         s50Ssyy/XQLNn4xgyg4GUWiMZPKm7b4qf7g0xbH9I7Konuz08PYT9Do01ms0bLTaN+k1
         x4RF+p1uSEYKTBRxTP/MG3KulouHNY8qpWTpuEckjX4dwfruKpazqrRlNyqNaEkiPgbs
         7cTdIcUFLPf+UOVPRfbelZ9HPzM0JDKjl1joe4o2KGbKkO74vDQcqKkUjdPIs9wD82dn
         zylQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvfQPM9IrzB9w/qx/DUvGqq4dNcYZg/0KjHf1qKTFjLWaZquEiaIVoui8KYmITGRMkumbkHM8qrJsEFJAeGNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY0FUrKhmMLLObxEPeV4/5fjMf8VNDqcypd6ywD9evMPJeYFbG
	EZKeuT2vI13mp8cD7+2Yi4zNgllAWHhZ9HeMja46Zv6YKpjFsRQGghyBDeMBjv0=
X-Gm-Gg: ASbGnct0SP58SPsK7TKo4PQ2WX35hegb/IVexDVKF+3orq5VZSFIRwemYoG/aJ43rwF
	6okGJBHf9odiJB4DJ+0tggS3n9RKvqRj4eDXiWIkgsL1xCJfpol0j70f84xYxHnIoCEJxsnV19q
	YdVc9OYERON8slMR3MmMokLBrleG2FtggCgZdlOLLZqzx3mAp6zMu/DR4boXKG3vRdY2n4yZoq/
	RnBWmVh/k/ZCf7qg12nw7sBh0xxU70RkO8wbHGuob4sdZmBombbOlw=
X-Google-Smtp-Source: AGHT+IGt3cBWemTT8wkdLb8l5IGKh+d2z1IsEeUgaL58GtEPpeejLYUCDHYE+XO/2Y0fbIUyObvsZw==
X-Received: by 2002:a05:600c:4f87:b0:434:a805:1939 with SMTP id 5b1f17b1804b1-434dded6738mr21714595e9.33.1733488376086;
        Fri, 06 Dec 2024 04:32:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0dc152sm55588575e9.25.2024.12.06.04.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 04:32:55 -0800 (PST)
Date: Fri, 6 Dec 2024 15:32:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cong Wang <cong.wang@bytedance.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Ido Schimmel <idosch@nvidia.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] rtnetlink: fix error code in rtnl_newlink()
Message-ID: <a2d20cd4-387a-4475-887c-bb7d0e88e25a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If rtnl_get_peer_net() fails, then propagate the error code.  Don't
return success.

Fixes: 48327566769a ("rtnetlink: fix double call of rtnl_link_get_net_ifla()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/core/rtnetlink.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index ab5f201bf0ab..ebcfc2debf1a 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3972,8 +3972,10 @@ static int rtnl_newlink(struct sk_buff *skb, struct nlmsghdr *nlh,
 
 		if (ops->peer_type) {
 			peer_net = rtnl_get_peer_net(ops, data, extack);
-			if (IS_ERR(peer_net))
+			if (IS_ERR(peer_net)) {
+				ret = PTR_ERR(peer_net);
 				goto put_ops;
+			}
 			if (peer_net)
 				rtnl_nets_add(&rtnl_nets, peer_net);
 		}
-- 
2.45.2

