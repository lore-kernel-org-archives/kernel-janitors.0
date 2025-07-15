Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048612BF3DB
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 23:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620494; cv=none; b=Yycd6EVtNGhmeauzWtbp2msY7hMdmZoJc/hE1GndVFWySIRLj8TtxAd0fymXdwfGMgdvmsyvik5R5XQsJQsW22oNu1keCobo+btnsFQ7QLRSt2XBb1TzC8gLxj2iB+fhVM0wTJZA7C7SkLCTyF4Kf4rFkHQGqWRL5gTLu5zi0Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620494; c=relaxed/simple;
	bh=C0yIBGjgQuUwh2cILUg4KfKwRH5Zo3VTXMZAiLB5IzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y37FgSlzqjkBUYLyc+Bq9oHdl7taZ9jG0AZ1khBEZQMydroaJ/kAaJmcTEH0s0pBswqGFHNWh86nByl9eocs3UiHoDiWBXaATYwdX6g0dRPsxTw9/bc5VrxX7wT/rFTqnM/An/YDymL0TaOH7pcD3D1WsK2p1LHtHlikxRcjB3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Aq0P36/V; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Aq0P36/V"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-73e5f3b5067so476140a34.3
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 16:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620492; x=1753225292; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B4SWITf8rdF2+7Tku3l2OCdj3WOMyrXJ2wvElW7xvwI=;
        b=Aq0P36/Vw14ZTOSZP7VIoVXi0jFTCXxSroHDH9b1wV7v8QYZs64zqWi1W1JNVwADNZ
         tzJKbkbCaG2wczXIw7esS3v9YoRn1c+XrXrH578lawGjfqxViYMUlqv8aTuVmctyw0pN
         3hbX7LBqwQ2sXTiX3HiqKDQjOZIOS5I1q5+EgdKDizdV0HnM6Te5jiiw0ouhUAXT16bM
         uJT0EUXj8I9LkO+6k6KTxe/2eo3WHRSloo37tZ7qUyVwzUmmPDR/ekiERhxn8nUF46BA
         ix5d3m0XAx8s7bqczDZ/0AlMX9oe4NZxfO4ph1bRKC8GkeDPG6M1hXLP1ECisprPC/hP
         xR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620492; x=1753225292;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B4SWITf8rdF2+7Tku3l2OCdj3WOMyrXJ2wvElW7xvwI=;
        b=D7o5ECBKm4dBcRuIUrDdrZ3KbRpaQSR7VJym8Rk3qSYUoXZq7mlz599q1SDqOBrtkI
         CS2UOUzz4/p/uq8QsSksU5UUa51iip8De6GMQoVN8bhFwUwmaKVdxxBMs89adkl7KH72
         87/Fl18RIfCixss2cXvE4aLVX2c8EL7aDC9uLozsC8gE4r9myxPo+nLGyIgGoThF0cu8
         X+KZplz5LxHxNZdkywFzKlnK6oY3Yr+t2sGBx81O0ILvrbu+UjNls2u7N5HawLP0K8VZ
         4nZTSuX6W9ZleTFEAGwJ/oGRT4fWjQMq+aRu+5REHYFG0D+aSwUJdrMzmsyd84uJHcHf
         Vdcw==
X-Forwarded-Encrypted: i=1; AJvYcCUmQkb8fE+qxFHnNJ2OiMYVUVpEJX0QQM4OZ8gIgX0murs4HZpRO35F9JYybATzZwywVhebw1U5MK0uTLJmpiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjPxAgW5H5uQDlBjngKJkum2nMyfVX3Fn8Si27GjrUtXyI26ut
	KCflMHrywo37gLymEPazOCGZPuUPaQMt1UbSF+4a1w1hC+8PRGf8QELcuRM9WUR6mq0=
X-Gm-Gg: ASbGncsSZy7NTFc6HlBbmRRUJ1Lu6UvXyg3QUMNnnHJmV1F3Tjpc2+xiOvNdtULnKVo
	M0qr3vLp0dHmd2Y1ckT8YTEj4oCMO7JF4rurGTK2W3qXfvindZv+gkRp+DdooR8aC6VceflFFYQ
	B8e4sYByJGkRWQEQHwDG6oLrGPv0FAkmxDIZEskvgHKSb8g+fRlVXdkWa7hatew2VDpjPq6J1TQ
	Yu19Loq0canThRIdjbcVQSHkz8su50gWX2pPkU8hhk6d76OeL3WI69nWa+vt2VFeaVlVgZUJ2Rg
	BETYISkc98ofmB0MEv9bSSqlL2GBtIMljkZwGC+BsV0RxaBioHMdvOny9C7pin/zygFkXqMZv+2
	XrEWS0O+IyzgoxgwrZAkIg81Ym0tYewuon+E3iS8=
X-Google-Smtp-Source: AGHT+IE8Nfeo8scY90CqHg5efo6nAkc64loFfqqe2YK8azM++ugsfehXsqpsTS6+ghhEcDe7uWrOaQ==
X-Received: by 2002:a05:6808:3c49:b0:401:e721:8b48 with SMTP id 5614622812f47-41d031f1f01mr437628b6e.8.1752620492132;
        Tue, 15 Jul 2025 16:01:32 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41c267defd7sm558510b6e.11.2025.07.15.16.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:01:31 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:01:30 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Carolina Jubran <cjubran@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Cosmin Ratiu <cratiu@nvidia.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net/mlx5: Fix an IS_ERR() vs NULL bug in
 esw_qos_move_node()
Message-ID: <0ce4ec2a-2b5d-4652-9638-e715a99902a7@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The __esw_qos_alloc_node() function returns NULL on error.  It doesn't
return error pointers.  Update the error checking to match.

Fixes: 96619c485fa6 ("net/mlx5: Add support for setting tc-bw on nodes")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c b/drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c
index e1cef8dd3b4d..91d863c8c152 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c
@@ -1405,9 +1405,10 @@ esw_qos_move_node(struct mlx5_esw_sched_node *curr_node)
 
 	new_node = __esw_qos_alloc_node(curr_node->esw, curr_node->ix,
 					curr_node->type, NULL);
-	if (!IS_ERR(new_node))
-		esw_qos_nodes_set_parent(&curr_node->children, new_node);
+	if (!new_node)
+		return ERR_PTR(-ENOMEM);
 
+	esw_qos_nodes_set_parent(&curr_node->children, new_node);
 	return new_node;
 }
 
-- 
2.47.2

