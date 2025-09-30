Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA3E1F428F
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 12:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759235108; cv=none; b=TO63BNmCfmNQiTgoAl9dlpcH6tHIOlWK87rbAefJq+XHDU1cN0GKCj7v9wyjWFePnbgWW0MU0gla+F0uwmlLzN6OgTwI3ankW+/3aie1++R9PayzGMa0FuPI2I6GCp35nCaoK3RdlyP95uzkojEtmPf7QcZtnAMDznLcV1IZExo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759235108; c=relaxed/simple;
	bh=N3iWQBr+C6sq5xql6Cd1AX/fvpXX92N8aQvLLb5U5E8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=auNYkELgLzHGrhJE5WTTMN8yjr2GSBdKEi3GVx9x5b7cxfcI4NSUMn1RivrufDCzqiJfFUGFJCaxD8gVbzPtYh5asz5NnmQDxSabvjTFiyG0w3vTUvsrk12ID6m9zvNJTyiT1j3EoAduhQYUrfid5xPukFO5NJH12+qHInjDLl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KayxsDOP; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KayxsDOP"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso3436458f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 05:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235105; x=1759839905; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6lOcLfmjHHMwdRKIuWAlaFWrbjWxKqUiXJMf1tdzpQ=;
        b=KayxsDOPIF+Wrm+kQOBRpu9ibozip57hTC9ymTs/ic6YA3Pbm4IV40dKAMSqryYspd
         wYOS6DtGkLc2WhIJyhphMPUgTdOeGA+gdXj88PhsNyE7E5BS6YHIlYK7eXN6n7RXvKy5
         eSsT7uEhGonZxy+jDM8E2dQLHBU3uxHcabK/KgG6+e8WCJZ7EKHuvQs0cPEiCbb2jKlP
         Nwlcu6c/YZltw9iltwQRCmPej+iXAk/rqErkHoH7uGuuyvNkFNuy7I24Yy+EWl4yNpa0
         Hfd6fVPf4HkIFQyqMUm/0NpkNPHTuGHD4sEfrcPMEUtawlOtvTdc7CIvgsC7YtcVvIlx
         D1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235105; x=1759839905;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6lOcLfmjHHMwdRKIuWAlaFWrbjWxKqUiXJMf1tdzpQ=;
        b=tuAnqzmTH6xNMEGtEfWTnlLZDVTBlPBM76nK+cz2fP+uRxVSHMWbcXU2e9wI7iiU+4
         xOrI6wMolR8R+bj+J5qzkoRk8ERYc4qbxwsjHDyLaD6F2WK8sJ9DNLBqnVO2edu1U4wa
         WvY/JzQHug7JaztuNlklXNg8wij5JTp0yDtEpCcQfmPmTCLkPSKKk3HO0Pd5MEljju+h
         coQSZ29O64KFtZ100pwzLtg4BT/dqnGZ7qFcQid7NXPSvDvweLokE459MGMknQv8OyRZ
         DlZegWgcqauCjtEE3HQahRvDjmC1YkNp57U2Pyt1r1dS/Kk4m8KKxmskdr8m8FZLkGua
         0zeg==
X-Forwarded-Encrypted: i=1; AJvYcCUi/ilZjdqEGRZFGrvWj9z+gnGURe1yJ0ORzGgX+WzNR9GL41evp2Nly34olPkGGvKByrjLLe/l61XN8o6QePg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk/uqmsw8gruxzTgR9va5Ocb5xKpApCgtVuyZQrr8QqZK0/IgP
	YrBP2YZj9z/vKekPujcF/lIzsOEAMLCLpE0hpadIjESK7039DbvV9Pj0dtj4IISgLgU=
X-Gm-Gg: ASbGncu5kLmedj+6gZ7F7MDld4KwEqY/UBtMrbFIizQxlUqWLKFGf/JFKlCw0qSBbYM
	jS0pEC38pCYa32Bl9xTPaS/mhMHIlsM8ZrdH7DiQZjkNr/V8qQl2/M9nsJAVHG1pzKNKp+OJ5NT
	JarckUpg5yv0H56nMNiZXLaf6z5rLgi9R/dWUn1lP18cYOQ+OFoVtSJBWe9s7J1xGUfuw66Lt6P
	mK9fX+oa8iK3PNj3EmwmGc74j7RnAnAfll6fzK3hjcldKXzmh7TZ4Y5reHu4SEiC163a1nXsshX
	AdJKkWaFL3xQkd9ihMwF9f53wfa+fMV7+4um8/A5MQ737qg/XNBQqliTLv1FR2Var0S9jCwwgs9
	WANeAxAkD/5m2n5ZmNj1dPJexRpAX7JsYeRkarHtw4oJF9Xvkzl9Mx3Ehplav/U4=
X-Google-Smtp-Source: AGHT+IHLfXLZ95GySBe9ZuBPDMocDcdm4e3YftS67zYrym4isY22xPTXaFrasbFvqRJbXcP0Bwxl5A==
X-Received: by 2002:a5d:5888:0:b0:3ea:d634:1493 with SMTP id ffacd0b85a97d-4240f261673mr4414743f8f.3.1759235104947;
        Tue, 30 Sep 2025 05:25:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fc82f2ff6sm22407808f8f.56.2025.09.30.05.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:25:04 -0700 (PDT)
Date: Tue, 30 Sep 2025 15:25:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yan Burman <yanb@mellanox.com>
Cc: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Amir Vadai <amirv@mellanox.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] net/mlx4: prevent potential use after free in
 mlx4_en_do_uc_filter()
Message-ID: <aNvMHX4g8RksFFvV@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Print "entry->mac" before freeing "entry".  The "entry" pointer is
freed with kfree_rcu() so it's unlikely that we would trigger this
in real life, but it's safer to re-order it.

Fixes: cc5387f7346a ("net/mlx4_en: Add unicast MAC filtering")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/mellanox/mlx4/en_netdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
index d2071aff7b8f..308b4458e0d4 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
@@ -1180,9 +1180,9 @@ static void mlx4_en_do_uc_filter(struct mlx4_en_priv *priv,
 				mlx4_unregister_mac(mdev->dev, priv->port, mac);
 
 				hlist_del_rcu(&entry->hlist);
-				kfree_rcu(entry, rcu);
 				en_dbg(DRV, priv, "Removed MAC %pM on port:%d\n",
 				       entry->mac, priv->port);
+				kfree_rcu(entry, rcu);
 				++removed;
 			}
 		}
-- 
2.51.0

