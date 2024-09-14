Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2971CE6F6
	for <kernel-janitors@vger.kernel.org>; Sat, 14 Sep 2024 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726307949; cv=none; b=QwaX7ggQmP+kO7+RiFIaYWUWo/8dWrD3eRfx+uy2gbfColQXdAWWUdypnoIm9e+KwLiaF4Zy5QfUlEkSezfOyXGuS/Q7h5Svdb7KhiWJ/RX5bKqj0dhPJqMnU5M5Ir5iwNMb42bckVN+mXFeEbNON0fqSjIc7jbMolYOXT9y+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726307949; c=relaxed/simple;
	bh=H+3JuBd9mljp5tywseAzvY42o3nzP65j7tN8PSllVis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i9GC+nvhiSIBYIoaqW/uDFQ9qUoxCq4w/d/MCflA9TtXdFmN8kW/WHGi02CKZzbrXoL1HnpSldvScdhqj4Jzjay827v91m171uZL3R8UQ8FLzMxmm2Ql95+nmF5x+O5D5Xd+Yv5OgZN1r9I/A1oBFePiJkOPKr7OVxY6Mcd2bcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eUdgDJ+j; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eUdgDJ+j"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c3d2f9f896so2153332a12.1
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Sep 2024 02:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726307946; x=1726912746; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sLR1LdrdWoek5k6vcLJ4wJbjv1o0UlgVrCVA4EoYNzA=;
        b=eUdgDJ+jjHs0JwobXKXxKC167YOwJHo9MiORf13/GB2yHaJrawFu+jon7eb/Jaw3OM
         8BLQn2aSym2tFiEotYsgyP089kaZy1glZQfy8WKo2gfUxWt+Vty1Qa1S/MAOa1xFRd+7
         S1YZ/yf2e4W5dRss25LEjN2GirPupbT2tPcZdE/kC6ySKz5eeqByC3ZS2cFo0fiB1UAn
         R4eDqRtp2YCsUV1vuRmpoWY4he6YUlQ3PDEchnAzkK6WzTnTfptFQe5+BCv2QbQyET4T
         UOXyJHyAaB15cs3s378yrRC6ky1VhKZOSr8DM6qWUMeem9C8HmR2qcAy1mIYmykHo8/O
         734A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726307946; x=1726912746;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sLR1LdrdWoek5k6vcLJ4wJbjv1o0UlgVrCVA4EoYNzA=;
        b=p0W79wIyHbuhZVZ8PPQBeXb8+ci0e7uhrC0bpoUJ+bttpr5iUnUedrnrkvVbuPboSM
         fsVGgSEDTz8zJSPgcxrlvExlpDjZAu3BCL5r7YmeTmnbt6CCtZ9P2+MTMEouqQW7Tv7e
         vk6lT1G1w6MKUvZh7vio1gsdY7QWLgW3fVZrgXvIOQloyuX1ExqNEBSiFL6T+NLMJtVj
         quwtWyTKpO27sSyzRXs6+1HBT5KG+ueA2NB80T21w6+RWmZsmtfCeSwl4HtZhdRMVwGP
         3pES/7Z7au2GOKzlDny+VPIibdLFxa2ajURDY9uET8CNOK0quUR6rD49Y1Ciy36lr1bu
         K6zA==
X-Forwarded-Encrypted: i=1; AJvYcCUTD8ruGR51hj+K7ECIUDMKMCNw5RmO7Mw37ksyLJ7I8+f4osGEmj8f9bqyzcGdAorMyty8LBd22MTr5PrqMTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YykWGg+xfThJvRlEV+2QcW1H4BcW0D1/ueoDBFe0edcy9/w2MKx
	S6AczPVaCMzpipg/dlC5/XBQgHFdFb0Eo3nsG1qn1CFYWgBCZdG6L3dXb88y1Es=
X-Google-Smtp-Source: AGHT+IEmamaFtiQks6EQA/58DDUZK1tAOjmtLmuXTiDcTiIt0u2Q9COe7kNjD2a0VxyS3xWdA0xvRg==
X-Received: by 2002:a05:6402:1d53:b0:5c2:6e51:9d11 with SMTP id 4fb4d7f45d1cf-5c41e1ace3bmr4559018a12.27.1726307945688;
        Sat, 14 Sep 2024 02:59:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb53620sm506170a12.27.2024.09.14.02.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 02:59:05 -0700 (PDT)
Date: Sat, 14 Sep 2024 12:59:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bryan Whitehead <bryan.whitehead@microchip.com>,
	Raju Lakkaraju <Raju.Lakkaraju@microchip.com>
Cc: UNGLinuxDriver@microchip.com, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: lan743x: clean up a check in
 lan743x_netdev_open()
Message-ID: <f2483839-687f-4f30-b5fa-20eac90c1885@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "adapter->netdev->phydev" and "netdev->phydev" pointers are different
names for the same thing.  Use them consistently.  It makes the code more
clear to humans and static checkers alike.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I noticed a different static checker warning that I never reported because it
was too old.  However, I think it's a valid issue.
drivers/net/ethernet/microchip/lan743x_main.c:109 lan743x_pci_init() warn: missing error code 'ret'
I think we should set an error code on that path.  It disables the PCI device
and then we continue to do PCI stuff even though the device is disabled.

 drivers/net/ethernet/microchip/lan743x_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 4dc5adcda6a3..0b8c82ff5e8e 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -3262,7 +3262,7 @@ static int lan743x_netdev_open(struct net_device *netdev)
 		phy_support_eee(netdev->phydev);
 
 #ifdef CONFIG_PM
-	if (adapter->netdev->phydev) {
+	if (netdev->phydev) {
 		struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
 
 		phy_ethtool_get_wol(netdev->phydev, &wol);
-- 
2.45.2

