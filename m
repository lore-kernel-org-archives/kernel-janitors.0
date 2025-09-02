Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EAB235C01
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Sep 2025 06:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756794975; cv=none; b=t8qXasw1IUWn53sIZ0+dVrhgoM7rOQeEkLithumivxrww9dp7NZaBjz8nGGT0O7XqBgeDquvUTlxA3SIlh6PKK8+a76b93RwjtsS7l7UV37wSAPVtVvSYYn3BCY5UC8LFYugA6HyR4ZPpDweIiUootyEp6dIHGOpD/xXZN7r818=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756794975; c=relaxed/simple;
	bh=6o1HYNN/dUuD+wcTmY+l3ujIlcfH+7+khCxsWHpS13w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QRw5A6dMCUjsjKLOlijdgp6r49wLKMlZnATx/KBz9AiSeNkUQNcaHa/mk6FD440f1gb7yJmwwqjkBsq8oXHguadOJ+69AzpgywhRdqoBuyDpvLInpdGXieOWgMqzaWb4aBKGKBaqiyAfVN0pXbLQ7ftwKx5NSKFca/gyRNsy+RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vt3xR57n; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vt3xR57n"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b627ea685so42481965e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Sep 2025 23:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756794972; x=1757399772; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svG16miHK9ueNH/Jqb88BPzrj03vi8MH4xbUoVyAJ8c=;
        b=Vt3xR57nlKQHoteDwMtZF7eZj6ggB+a4zFFxQ2UZTTAU8cJ5sySmkcjA7wIPxFWZnc
         XcnuGFferDIEhbAFRyAnJfs3yxVVyrAYTcWaVHPwhUvA8CKDLx7pS6xUy6aeyD65qrDf
         beLkZzpvELIlo2YEevA/AoJ6+6IzlIsD0f/7v/s4uxyPXKHyepBEjnXfVLBw/7vR+11B
         SHD4TCXgCZ4+egQ7psSbYSxX/oROH5WEzt1eXwRrJ1VrCHBdQ+96gMBgpvsrJq6/6MZG
         Av6CSJ99i693H6CREER2dmwkGYfayVZDUpljhHX0r8w/PL3qULWOGabPSiXcf6lpJmCN
         MUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794972; x=1757399772;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svG16miHK9ueNH/Jqb88BPzrj03vi8MH4xbUoVyAJ8c=;
        b=jluj58dWskn7WSyDJyZs33+jmaJ0vZSmOUqZJFWloeT2DCqklUq74xg7HuPtNtKHwK
         VAdBKmFcOEw87Yiq99jugekvuRGelqCGE5OzQ3+1gGU88oyu6UTzUL4PtXOPzf33dMFl
         f0/qlGoasOihzrtndcfqosiuKekBWmI9sqb8LoAB7ESeLsKHj353GX5aTXhFccTl7WIy
         M0AkCufcFhxI8S0b5X7/q52vIrh2C3HvzL8fRRdWIVGQ8bHUFtkODmUa62Nysi9325mO
         H2GlKrRIaRV/V4XCydObjVxoeCg4ccmD9i2FBZXK+L7Gi0ULIpZk+dnpaj97zXuojjbD
         MoHg==
X-Forwarded-Encrypted: i=1; AJvYcCU+YCZMK2eTRKTvFHpcG0VZ9vtVifgzEWnWY85RuvpEXqJhT0uZbCbCv6qVjWe3rF6jEqGA0oEEMvLhWoIC7C0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz8aw3j+rWGi5wvi1LPnlhoXv2OUA7O51Yd3L8s6t7iKz9Xxnb
	5MT4L9L9hZUGKQ5UeQc/p7LOJvCIPYjES5rn66IthI9TN5Jql72x4p1aNQ5UHf86fes=
X-Gm-Gg: ASbGncvB5n3lZ1GDCyLbfn+izILGSHoXKUAy7hal9Gzk9l7jvJMtc8HY/Wufx3czpMp
	/TIvHN4PI1O74jHOtVzveJ/guvnqA1DLx/cagSTXjyNK4wRSQkFthCorBGo4j61F9H85uT0xWvP
	8HxrrfHXNwvENQWXtHtGyE19O0evntRzsh9YSz/QlvekJShWpn8o5ay6P1JaEQmXtn1q8s/p/9T
	j8Aay79EuFzRoyc4eXvkVMQ4LmUIYL07FoNBL2LFVbT2FmxSxeUuRvH79Vd+H9wMWnL4Lv/pJ3q
	EWgJB1IleJwOPsk7CXy6n9ceFGkyS9SL06RiMz4jw7cuJIkSOkOPYATl+30D5qlRpB7ju9dxQgv
	vR9g1lsS7ym2vWG7+bP3MnMklfoA=
X-Google-Smtp-Source: AGHT+IFb9K51S0e+oVxQPokUpc6sM1fljdvNP8zGuh2xzGHBl93SOWb5C24qmpOhtsg6GVrvALfX2Q==
X-Received: by 2002:a05:600c:4515:b0:45b:7bee:db8f with SMTP id 5b1f17b1804b1-45b855b32b1mr81893475e9.25.1756794971816;
        Mon, 01 Sep 2025 23:36:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf34494776sm18103336f8f.61.2025.09.01.23.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:36:11 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:36:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xin Long <lucien.xin@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] ipv4: Fix NULL vs error pointer check in
 inet_blackhole_dev_init()
Message-ID: <aLaQWL9NguWmeM1i@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The inetdev_init() function never returns NULL.  Check for error
pointers instead.

Fixes: 22600596b675 ("ipv4: give an IPv4 dev to blackhole_netdev")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/ipv4/devinet.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/devinet.c b/net/ipv4/devinet.c
index c47d3828d4f6..942a887bf089 100644
--- a/net/ipv4/devinet.c
+++ b/net/ipv4/devinet.c
@@ -340,14 +340,13 @@ static void inetdev_destroy(struct in_device *in_dev)
 
 static int __init inet_blackhole_dev_init(void)
 {
-	int err = 0;
+	struct in_device *in_dev;
 
 	rtnl_lock();
-	if (!inetdev_init(blackhole_netdev))
-		err = -ENOMEM;
+	in_dev = inetdev_init(blackhole_netdev);
 	rtnl_unlock();
 
-	return err;
+	return PTR_ERR_OR_ZERO(in_dev);
 }
 late_initcall(inet_blackhole_dev_init);
 
-- 
2.47.2

