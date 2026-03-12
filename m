Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F23A1DD9AC
	for <kernel-janitors@vger.kernel.org>; Fri, 13 Mar 2026 00:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773360047; cv=none; b=FRJWZ+0paLODNGzrN/GVgreh+6L671F4wcwBy31gJb9Coljrh2Nsi4M8VcVwlResH5OEwPwaCsvIw+xdKPvQ+dPYiytWwoJA6dHAFcvuaYgYNqmlQ7wD3SLJDw0vH1nmROQ1Mh9688Hfuk23LbC8gxC8AovXdcGRqoQ9Cz+nrms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773360047; c=relaxed/simple;
	bh=unpDN0xSFAqZ7nYTSSNREqnY5W0AVi5GlC1hx8dlYz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lR2zpx0K7oVUyDYJQLginjE9gMdMME8h4iTDGbyNDIGsl7dc/kYGwoUIu5tmvM4hWQdbZW/gEx63deEe4aUP5zoZa3tGC+xIOBTZRD/2cJh5hBy934KxUXhGFj2tStlgz0NdsmAcxRfpGOouLj12USRmH71HqYtmFM4O0r312Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrtCVVKc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrtCVVKc"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso14016585e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Mar 2026 17:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773360044; x=1773964844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AyEWphJeNnvkPez3fZUAj2xNcAS8g8xQPq60zu8rPdc=;
        b=GrtCVVKctQjp4izWByIE1F8s/PkFOBazUIbH1vh9k6gqf82lIpl0n/xRqqESjMp1yx
         Od45g93ByURWI760PRyjkod9nd5MSQur4LJf2x0ORaAAmdM1GbWjkfgU1kYSvAGVVVPQ
         lLxjJMPTyCQZ2T45ESymWc3NmEsQgIGm/2VdbJEhnpq0SpMJDTzhw5LnPABs8DpS9x3m
         dqWkK9JLYjHrUXU/9ZiZ4f8ozfkXgM63WulPJ27ECqGCUJ0nhCLeSfdE6QUSBSlCx6xF
         wMddfWEXj5q+pSKEeRrpRhX9yqyOGmIyySVwI34vuGn/UA/cTowJn5Eou5orOYKef+ss
         7RNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773360044; x=1773964844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyEWphJeNnvkPez3fZUAj2xNcAS8g8xQPq60zu8rPdc=;
        b=gJqJMLon2p+2J7ndIshRyEQUx9xEJkv79tG5GvQE3BiRMZigET3KNSGe3BrS+5cycR
         j6uM57+ZkB2iHAdR/6yH0HM2KUbbCf6Kp/+DrhK28bBLMEY8i5Ly92FXCIIII1UGkc0U
         KtisEBefxDP87LQgHsqpYpkkrSxHAjOqkmlrMe5QPK3ES1SGwK53Zt3YD9bCge2PsLHZ
         d9VirD6rHzEpAdoRdqtUnpSsPa5YRdDAguEWrxj6dr0H2bL5rPIc6jFV9TjIXFNvB2cc
         uWSNSdOlWoZHfUb7qJvs2K7Ne/HwNU4HLgu7H4bZPxe21eCH8dQ7Gls2hJ146W/af/q+
         cPeg==
X-Gm-Message-State: AOJu0YxQ06h8mDE8j6C3f+wPr6ZlewhTjeV73O1fuSgIh+z0G4s6BHWO
	d9tSaHDph4Bm+HwoaCf+9Z4UqpI4JvRTH+7HvPC+kfWx3sjCcrylurRr
X-Gm-Gg: ATEYQzxKz3yZ7LKWAPEhjQ+E5MxNJcJrQS2TIU1Xvj5DL8bmvSxQcaFwr7Yh97sWi/B
	cPpe7JeHhYQ7t0Nsg+ORNnlDxVyfTpiHzYdekEpH029mnTOhZEOJyUt9xheq52lcVJH8CoL3WfO
	htTtgcIsdzBULlG6gYFBDXsHZlhVJySMXXf7pg1R9yVDtCBCeph/h+pmV/EF9/LgE3aw6PiHIjN
	gV+0irV5ybyjeNzRxDSRYUPdTcwSPlkSzP+JF02BB9WmuaIYePe+e42JMMl/XZoF4M+U2JptQsv
	cs7JzOM8PNOtnTNYbb0PYx9FEpD6ibF0t9gDcvzbtKDBrbQgC0lGb8v5ohekYsbgp4ugFQD1hfG
	AJem0kekRfFHFcvSdIBDTsd5E22mKGmxMxJ+xJqhRe07pxR16HTWfss/NUouZz30UnxjB1HnChv
	65v/fO4X0vFGByFJ0t7lAhfA==
X-Received: by 2002:a05:600c:354b:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-485567071a0mr18402125e9.24.1773360043742;
        Thu, 12 Mar 2026 17:00:43 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm14641861f8f.27.2026.03.12.17.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 17:00:42 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Fan Gong <gongfan1@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] hinic3: Fix spelling mistake "capbility" -> "capability"
Date: Thu, 12 Mar 2026 23:59:22 +0000
Message-ID: <20260312235922.3442120-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/ethernet/huawei/hinic3/hinic3_hw_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_hw_cfg.c b/drivers/net/ethernet/huawei/hinic3/hinic3_hw_cfg.c
index 2dfa4fb39627..c5dd53a8fa96 100644
--- a/drivers/net/ethernet/huawei/hinic3/hinic3_hw_cfg.c
+++ b/drivers/net/ethernet/huawei/hinic3/hinic3_hw_cfg.c
@@ -44,7 +44,7 @@ static void hinic3_parse_l2nic_res_cap(struct hinic3_hwdev *hwdev,
 				   HINIC3_CFG_MAX_QP);
 	nic_svc_cap->default_num_queues = dev_cap->nic_default_num_queues;
 
-	dev_dbg(hwdev->dev, "L2nic resource capbility, max_sqs: 0x%x, max_rqs: 0x%x\n",
+	dev_dbg(hwdev->dev, "L2nic resource capability, max_sqs: 0x%x, max_rqs: 0x%x\n",
 		nic_svc_cap->max_sqs, nic_svc_cap->max_rqs);
 }
 
-- 
2.53.0

