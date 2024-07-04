Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949E81AED55
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Jul 2024 15:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720106391; cv=none; b=s/qkEBHw+ViOzpC5i+G2t1USAzSbtKujZahgFrU/BxyZllci+vtbjQOkN0+LV+BKU+S6PwTP8BRDivtN7c1CsyMxx7NpBSqQb7vzATR1oFbod8TQJKJce89NlBYV/HHPkDSEu0dO6IViw9fR7ew9Hlho95lXUJH/krEFnFcsBhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720106391; c=relaxed/simple;
	bh=rTi+HSfP+CDmR9Y8iR5mkNNK7g6n1NJse0dPKt9usAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJczhAaXDgaCvbWfj3yHvEoDaeiZumEDW2xSa80xfakCSjKNzltCY8xya9g6wEufVz1U0Qziwz1owcoqza/QclxYlQa3DhVLgD5wjJ+BypUYSTKzp4GMJwN0YluMVQFNM9WbPCdeIc1G3X8CKpatxaix4RMDAcKQNNW/2kJzAwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UXzjIbhW; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UXzjIbhW"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3d850109679so433781b6e.0
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jul 2024 08:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720106388; x=1720711188; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V+zXDUJM7lfgygxbXYWjttEkeiLpdqmsPDn2aj5otxo=;
        b=UXzjIbhWdbJVnmk8NcCSyTsGxcyvFq8rI2NHjlztAfFJvEFpFRzOIQBo9zbc++1grb
         +DMep5I7UP2shvYsgBq93mwvK8m41NT4PRKNMKTgUUSGV72r0fJrvQBDSOGxMsbHAyqM
         LqsxqSi2LlYXNf7r9I9adPOcbmoiMACmUrKQ8sJJOJTNdGAU+XMsi/0pLqydeNoXYlh3
         8FfTL8yr8Bt20+yggYZHdOTppE6hH/p2bulYSMFKOSqNYy2/a17ed1YvDDjF5tDaP26h
         XhnzzoFx5Tpmawfqn8DHYGEqVxJMoHCNG6azd70OWOsB6XAyKSnYRLCM9SPLR6Gvg1rW
         iCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720106388; x=1720711188;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+zXDUJM7lfgygxbXYWjttEkeiLpdqmsPDn2aj5otxo=;
        b=YPXY0YJoQwSGd5EBAQp3f2kkNe5JBxEmFtXemvAgXb4xu7rgQwT2JCA8p/WAd3xhUQ
         jRHbIlK1M9oHhYCreoUecqyLlEW6hzqLdsiS05ODii0WorjEMtKiX5YNduOG1xCJJkLJ
         KGOUg0L4m+zeuRp2TShMQI+UQgCMqZf+Wxn9VZ/HFfv3CXosausrYltTUlxhwi7trCXT
         DovSDMdOukqtNFVcsgrm0oBM1jQfKukog4+RfY0AQ6DpZhWYVf9L5EwzruEBTTgRzE6s
         kngPhD3z9Xzr3MbYheTmIfjA6NhBqu26klA7LrrNPM42xz7bJeJHEWUw8l5+IMc80mG6
         GFyA==
X-Forwarded-Encrypted: i=1; AJvYcCW3E2YTg5FwMrpzaqzvwbi/n5zruiqS0hn3ghMkchKvUCo1SlaFcZseE7DuMsJD/faRhXTKGCaVUwUf6Hgov2GPcgBKQrxRzDYd5l9IPlV4
X-Gm-Message-State: AOJu0YxXvQ5+rAMBphyYgIP0ck7xS6VM69eWTS5FZwMyF8iZFUZrKS/d
	4uZB6XlgYqHoIQ9Lag7y97HO+UjycXTKCehshC8OOKbaYNnMY/JF8KyzC+25TLpffAWVbP2wDvD
	6
X-Google-Smtp-Source: AGHT+IHAWyWPp3t/3hLm3p6DC0AvvzzmljGLCooD0y9pIZ4rkXDGF9k2VyEEwC6Rp+KB4ThglvcN9A==
X-Received: by 2002:a05:6808:1b14:b0:3d5:1f50:1860 with SMTP id 5614622812f47-3d915d2d73amr612153b6e.27.1720106387688;
        Thu, 04 Jul 2024 08:19:47 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:96a0:e6e9:112e:f4c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62f9c7c51sm2442474b6e.18.2024.07.04.08.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:19:47 -0700 (PDT)
Date: Thu, 4 Jul 2024 10:19:44 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Justin Chen <justin.chen@broadcom.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: bcmasp: Fix error code in probe()
Message-ID: <ZoWKBkHH9D1fqV4r@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return an error code if bcmasp_interface_create() fails.  Don't return
success.

Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/broadcom/asp2/bcmasp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
index a806dadc4196..20c6529ec135 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
@@ -1380,6 +1380,7 @@ static int bcmasp_probe(struct platform_device *pdev)
 			dev_err(dev, "Cannot create eth interface %d\n", i);
 			bcmasp_remove_intfs(priv);
 			of_node_put(intf_node);
+			ret = -ENOMEM;
 			goto of_put_exit;
 		}
 		list_add_tail(&intf->list, &priv->intfs);
-- 
2.43.0

