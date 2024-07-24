Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3771D15B0F9
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Jul 2024 16:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721837221; cv=none; b=CcPqw6sjL4Wd0BFd2FNNRHcT1LolVKo4VpxaMZ6BPriHPgDlnn7weVixdKe+IykpXC5xd5QLuzd+xR7AhtE9Jvis0E4bsZKx/eCNHXbB35Rz11OPlXiGNF5py/gHqzvI//h3v3WlJtJS4vEEpDAX4xfG3uQT7vyeT/g8VJT1YMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721837221; c=relaxed/simple;
	bh=CqGehawQopzO0+MqKtuM0KuKVC/NihG+re/9nwFvxcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MgHJIrJaBnxe+x69gfnlxGZ30JqaOuhxPg5U6RgvSIJbim4XH4ilbISDCO6NmYWuB51+5MXdxR9gA+6xrI8+lMKP6QxoNMlIs5/L0WmfKlFcdHvZcKChuQf03R7Lm4LvGhUgN4Yp7891aM9bNkWzIYadOqnoOWn09CWdhPREi6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F6briLkj; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F6briLkj"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-704473c0698so3081585a34.3
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jul 2024 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721837219; x=1722442019; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WL00ffx6FZOS+gjuVcqsGTl485DZxHlIKJfADzNE310=;
        b=F6briLkj4+xU0WPPF0eVPTrUO1hW2W78TDAEOH0MYXBXg4ZvKWE/J8jWaC9JzTQnQj
         1ffiUCbwm4ABKHe3CY1+pJxzfoKvPJrEy+9oM7dsnoFWm/LIlyVfidtpHRu9BoOliUj7
         MkzNClEzM6kIDMsExSY9zZbPOMriYZNEH5cThK/Z1mhDPDH98Mqr0RJS+RQbhnfwCzm7
         klxBJc7ye5C5Z22qqyRQxBTwwqPvx7u9/VtR+UBbFTcYVieLSWvdJTvDOWFNY0BhgTrk
         op4sphGUENu6UGKpG02NXsOt15hHlv5YRU6rHcHl6Xqy1G8ATqscb1GhCZXAbec/V448
         DdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721837219; x=1722442019;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WL00ffx6FZOS+gjuVcqsGTl485DZxHlIKJfADzNE310=;
        b=J75SLfx99EKF8Gj8iYe6biGTo2aI+fjMfVkySBQvp41TGSOPWIJ3JtDrOHkGwVudty
         DD2TkjDg5f3OeKWxw7sohHoai1TADeO87fQgu2Yqpav0CNIn4LK/AUKqqMcU1hZ9vcZ3
         Iqy/KE6YUQy4rczqEI0HH6FVO5VdvhsA70kOsK9VbRspP1Dryedt8uIxztNJ9TlXuzwZ
         HynA84mTh1pQObfiFCHB/JlODpjophrgoNIijoUEqrdH5EsQKS0MVPUL3gIeNwpSgYO0
         gLp/epyj5+qFWGXi6TaoYpwzEtKDvFDgda/5QyeyNxgaeqoumhVWyUZJPcfFPSgXBQ1Y
         kQgA==
X-Forwarded-Encrypted: i=1; AJvYcCUoUEBp+rflFOHQbq9IDB8wssmnSOxlR6ZIuXYxx7s0slT23g29HHaOEt8uvsL19CJyLv7z9pirQdD/VjFI8Sv8nCsNQoM4dzZf+fyp8bKZ
X-Gm-Message-State: AOJu0YxC5A68+83aRZBSJ4ThZL8D7RZWJpz6GCgJPg5CYbE3QcHzaxEL
	jqqyP8VnQJlp9HHsdcC+kATwEQIbDIqc5LAX/I+BF9dx5aE4E+O8GJUMr1JVf/A=
X-Google-Smtp-Source: AGHT+IFHDoY0NxaVxYd0I7yvfDpL/US8mbo5c+Ln+MlZ4tHFOz+j/ptFK+39Sj3ax64JA9QORrKb+w==
X-Received: by 2002:a05:6830:2782:b0:703:6341:5171 with SMTP id 46e09a7af769-7092e6f0700mr245391a34.15.1721837219146;
        Wed, 24 Jul 2024 09:06:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:23ae:46cb:84b6:1002])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d59ee0f336sm369821eaf.9.2024.07.24.09.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 09:06:58 -0700 (PDT)
Date: Wed, 24 Jul 2024 11:06:56 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Chulski <stefanc@marvell.com>
Cc: Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: mvpp2: Don't re-use loop iterator
Message-ID: <eaa8f403-7779-4d81-973d-a9ecddc0bf6f@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function has a nested loop.  The problem is that both the inside
and outside loop use the same variable as an iterator.  I found this
via static analysis so I'm not sure the impact.  It could be that it
loops forever or, more likely, the loop exits early.

Fixes: 3a616b92a9d1 ("net: mvpp2: Add TX flow control support for jumbo frames")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index 8c45ad983abc..0d62a33afa80 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -953,13 +953,13 @@ static void mvpp2_bm_pool_update_fc(struct mvpp2_port *port,
 static void mvpp2_bm_pool_update_priv_fc(struct mvpp2 *priv, bool en)
 {
 	struct mvpp2_port *port;
-	int i;
+	int i, j;
 
 	for (i = 0; i < priv->port_count; i++) {
 		port = priv->port_list[i];
 		if (port->priv->percpu_pools) {
-			for (i = 0; i < port->nrxqs; i++)
-				mvpp2_bm_pool_update_fc(port, &port->priv->bm_pools[i],
+			for (j = 0; j < port->nrxqs; j++)
+				mvpp2_bm_pool_update_fc(port, &port->priv->bm_pools[j],
 							port->tx_fc & en);
 		} else {
 			mvpp2_bm_pool_update_fc(port, port->pool_long, port->tx_fc & en);
-- 
2.43.0

