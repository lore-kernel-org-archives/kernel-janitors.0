Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7724B12E5D
	for <kernel-janitors@vger.kernel.org>; Sat, 14 Sep 2024 09:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726307820; cv=none; b=jPMUu9w6wHbHHPzZmSAAVbRF1Pnwvv8sHSsN85aHo6VJ50bgVI3hVmncHhFoXxW/9gzuEebXLaxEfeV/2TptME8di8jUDlq7mHndRzsHjgrbm9HkvDLKvAX55m94w200S+SMnNxMXt6CToFV/gzHu4JL/dP7Y+Ihs9oUWidIpz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726307820; c=relaxed/simple;
	bh=5/7xNgVMM5znzPlTwRdQPzrcGDt5NrLxOnLVL5Ox/kE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BO7WWaxTHkrxgP86UclG42XiOIyILW0lk3/QI1RYwEZ7qdeIwW5C8p8gqQfU5seG9MaZvRy6jDcmgffEW1cqbTtWg9Qx67k6/KpTc64IJtH6pKyMErsL3xcT9RhqXWkfGD2fAq9s/YQkqKR4TH5p8W09dNJxQkJwwhOS9dZtUSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R8cWZ7F+; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R8cWZ7F+"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c42bda005eso434044a12.0
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Sep 2024 02:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726307816; x=1726912616; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZkttiUwbZSAhIQr2HB1QpBV3Ynk91TOIcc4nZQ4D7J4=;
        b=R8cWZ7F+VkvG5LxQGnbvRBxjNNGZwgSTiNCot7EAtRn3NT/CSfYnsNtRFDVthzLLXN
         yL7OCrKefDQJUmXORQqDJjhS/v4pPiKFNQ6neWpCVfDa1eOPTMilUtPMGJi8EzWyMMpN
         lkm355sn2DXTtYM0eTOcFraoP6Pw0a9597NreMz4Ea1B5qPqkHJzrLCW0Jb14ehbWeOO
         LDG8l2sZtlyWPpqGVw9JhLdjzVug944wE6EywV1Uc4Jjxv/FdaBDt5Yin+Bh1damXJcV
         AZ0cb22/ssFmhWTx018g1ByrGaaFYWcXm2SKRUOC6dwayKqrNVnhlsetb9k8b4PDZJUR
         iU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726307816; x=1726912616;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkttiUwbZSAhIQr2HB1QpBV3Ynk91TOIcc4nZQ4D7J4=;
        b=aSKGRJBYGvZMO40qEX3AgyPzfQtZqxYVApGGREc3NFcq5RKzFbEUBXlfZESlwdMsJC
         g/2a/chLGAxgA6JcVM78omz6+XZUWiFIiE82mbp/qIMv/ZDji/z0IfxGpW5jaN6eRfYw
         cfcPUwmmYj15aCU8tOLa6c6RYNyve9kRA1s1WvTf2PGX9jOy8mMHKoHToa06VB9y00lZ
         iWqhul+Kbpv25z+QgG/IpjZzuWK8+GghWaxanX7WPtrUiwg0Pgf3DFNAhs7U77Cn8HEb
         s7yS0fVYiNZddATcOBQwPGh4xyugwLFVIBbBKhsjl1VIZw2vXJeK7cwOGcO8sQBgQhrZ
         VEEA==
X-Forwarded-Encrypted: i=1; AJvYcCW0JRjNsMuSAHBd+plxywOG7qOxbCPzbFVG9s/AjNUZtqrAKcv4Jg03v1QDCKRawX0dRoEHMpIinVXCcXFGYfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOwf+koRNoHpUINV4d6gagpjF9BH3LsrfPl5QPwXzZTIaJhZaj
	enDK6BogXxKFx9CTHpinQ7HfofIVzIg5wF12ewTgnnhp5bWF9zf5dWYrBbS8Ncc=
X-Google-Smtp-Source: AGHT+IHW72oX7a7JyqQYEvWLyhwpREGh2KNn57UUT6JYrRYTabD7lJwM/On03q66LCo0gYCNv4awyg==
X-Received: by 2002:a05:6402:5108:b0:5c3:2440:856f with SMTP id 4fb4d7f45d1cf-5c413e4bd3fmr6660928a12.27.1726307815533;
        Sat, 14 Sep 2024 02:56:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bc88d82sm497729a12.81.2024.09.14.02.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 02:56:54 -0700 (PDT)
Date: Sat, 14 Sep 2024 12:56:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] netfilter: nft_socket: Fix a NULL vs IS_ERR() bug in
 nft_socket_cgroup_subtree_level()
Message-ID: <bbc0c4e0-05cc-4f44-8797-2f4b3920a820@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The cgroup_get_from_path() function never returns NULL, it returns error
pointers.  Update the error handling to match.

Fixes: 7f3287db6543 ("netfilter: nft_socket: make cgroupsv2 matching work with namespaces")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/netfilter/nft_socket.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/nft_socket.c b/net/netfilter/nft_socket.c
index ac3c9e9cf0f3..f5da0c1775f2 100644
--- a/net/netfilter/nft_socket.c
+++ b/net/netfilter/nft_socket.c
@@ -61,8 +61,8 @@ static noinline int nft_socket_cgroup_subtree_level(void)
 	struct cgroup *cgrp = cgroup_get_from_path("/");
 	int level;
 
-	if (!cgrp)
-		return -ENOENT;
+	if (IS_ERR(cgrp))
+		return PTR_ERR(cgrp);
 
 	level = cgrp->level;
 
-- 
2.45.2

