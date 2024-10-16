Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C82620C00E
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729089712; cv=none; b=b4yMTS4H4ZpWf8K4Gio3sK3TZItbnfgQ1D+Agyszq1/jFx2CrSx751Lz/971+YONLP/82e3YvNlDmJ5fub6Zs87odLk9rVK80xFpRjTegy1AMcZP/KVldJhMS5KrrcdmV/db89t+QMNNBMmRUxzob8zKUqYDUuCWCKF2WrQcknM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729089712; c=relaxed/simple;
	bh=Xm89ZQTxOiruJJc2c626as0TSbAz4qE0b9K3bd8RCaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VoKboZbVTHZEBLi+9w+2Xb/rgR6i7Z7v9aNf+q9EANBFq0axQi7DDu/aOA7QdzCk39tSWnzSyzfT9gWiKIIK6Fm5C6t1wktyuWPLziw+13GtWz8fcOdXFaWOKjEmUiZR84pppkMnCIIiQx7cp/PFdSeIJ38YeuFdTZ8pgRk35B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o6VnULHa; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o6VnULHa"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f1292a9bso4727504e87.2
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 07:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729089709; x=1729694509; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yZJgMAiThnKM9DCESXpeGrJ3grxtNNbWoomMwPV4xGU=;
        b=o6VnULHanMtG7+dCzRcGgocskm9o/gmsp+galBAsKkrCr5Gy1gY9wqefvB6+/wIyX3
         7cJ8alqUKZW0TxWhDdzqee+HklgqkawQ8IysYinTiWnrvgYpdKiBXLAN9ounWmTdO/28
         dEBvFrZ2C3OWisam3IQuA3ojln+9G/oUU6xFS+f/8Khts32Lu2AVayP9GG3VzE93m058
         j3H0hJfT0zG5G3iX9tN3qWEPCq3NuidhRHkbCgociedQgil+JFA5s7sWWFaxDQQh6MSv
         bZVJScVhmQz/pQ39jekVzabRjeG2gZA8fmLkTFVCW70rhx1dBgBUTeciIli14J5WfOFS
         cEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729089709; x=1729694509;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZJgMAiThnKM9DCESXpeGrJ3grxtNNbWoomMwPV4xGU=;
        b=spFryv6dlm2DcYgXguGbQydlObwgbsi/KdIL6qdp/FxF3SdRUBt9i/Vg260fDF5RW8
         znKl6vDb/HqDXfs7esGS3Bj+Ii8FmoIgY2WbnfmljbchBOWegT67B3xtE3wJPTO3MfyA
         0XtpQ5VIvdc5P1b6nRldU8Foy/UQKuTGPcTKCXdV5WW1Odnc1fLqxRMA1u/tB3AV9Wx0
         OgsFtR7tE0XSznCwPFRnv9qnVjK4McweVcx3TXbPRK1/izYRRGBAPG3w87YE2EAJhAB7
         tZ2BHVih2cjdOlL7ZLiRUsYK/o74S0qioT6XhaOzpAsS7ZfPmSP4FBcWGLL5sg8u6UMF
         qqww==
X-Forwarded-Encrypted: i=1; AJvYcCXwfHVTDvaZXSMvnsWSttWmvsDkrTSxGt5gB1hxhaZoavY+h/8vg7kb9GqkRhce0P7chryi0nAc2jj0sFYAGhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLRsX/byQrZXjMF1nFynDoK7pI6x5Td3HU9t04TGBIIXAm575u
	8bnNiYWMbKOAHlP69ZZDigrMXQxBbFqnZK4I1oTB2aR8CncKpLaweFlY6KlLbUs=
X-Google-Smtp-Source: AGHT+IEO8z3y3HtXlHNDMzb5tA37caZtOPrnQTurgO1vgyFjMMIuObM//raNXXBa8cL3Rrh3e6nZ6Q==
X-Received: by 2002:a05:6512:e85:b0:539:ec29:1cc3 with SMTP id 2adb3069b0e04-53a03f2da18mr2766237e87.30.1729089708648;
        Wed, 16 Oct 2024 07:41:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2987c700sm190328866b.189.2024.10.16.07.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 07:41:48 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:41:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Roger Quadros <rogerq@kernel.org>,
	Julien Panis <jpanis@baylibre.com>,
	Chintan Vankar <c-vankar@ti.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: ethernet: ti: am65-cpsw: Fix uninitialized
 variable
Message-ID: <b168d5c7-704b-4452-84f9-1c1762b1f4ce@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The *ndev pointer needs to be set or it leads to an uninitialized variable
bug in the caller.

Fixes: 4a7b2ba94a59 ("net: ethernet: ti: am65-cpsw: Use tstats instead of open coded version")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 1 +
 1 files changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index cda7ddfe6845..fe1f2fa0ff9c 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -1341,6 +1341,7 @@ am65_cpsw_nuss_tx_compl_packet_xdp(struct am65_cpsw_common *common,
 
 	port = am65_common_get_port(common, port_id);
 	dev_sw_netstats_tx_add(port->ndev, 1, xdpf->len);
+	*ndev = port->ndev;
 
 	return xdpf;
 }
