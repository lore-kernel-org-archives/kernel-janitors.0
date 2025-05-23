Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE42816D4E6
	for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016019; cv=none; b=TCOOwVJkVlxWbxFXBBy7mfYbmFe3+FCFXwbTWYxFitQqudaf+SiKVvHOjqm09LP0SfV5U/jNuSA2pVq0HwLEeqWKGjgvfFw8kcxQrETfa5GrnvlnCF9AZt95s7imx784zJNtB5Y16SMShJi1kA8atx4fpvxsGnDb1CSPLgKyf74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016019; c=relaxed/simple;
	bh=LvObJJaq5KUcG5iCKLaQBZwG/bqZeEkJJz5XwOHjrLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ipURGHEUszyGecRL+2qPbPLssQkQENr159d7rlnZa50eTfnFQ7wG+3xMnDMg9VMCenFv3k0z2KqcMepJWfdtPBc3sGW0ne1YDAQ5j2JGvycSS6pRUyfxN2JQfSj67JHrZc9+YdE3ln3wRxnTE9WiiLruTJBWpITRiCdWl3EYCXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X7q6CYtP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X7q6CYtP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so103286565e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016016; x=1748620816; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WE/1otE+Iljvc13TDUh3vMrtfx4k08FjErn+ne3CuXQ=;
        b=X7q6CYtPqI8OvF+J51c5K9/EOGBOmCyl4XbBeIPf8suEdoZybYnQq88rcaBd6yLzWz
         SpH986Di/MCXTXOeDNNmbYxxZq/xqSCfIhPH/1U32dVpt4zSJaUk9/STZTiCIz8jZYe1
         DjMWD7W4+5oL6j3+Kg0F9GjOCk+NEQlF6+WIDhWb309NGShqkADItvdBL7MEBQ/EzddW
         qWrO78sF2HVToYk5XrIUP15lYCAa1ZAyrV9pBg1/lYc4q5v2v6/2MZXbP9Gp5K2dvzXD
         bw9MlMUkTiS8KbMmra6zzBmXMTGcfuJhG5ofEaXqMuhBt6mn1VdOrqJ7pmVwSF1vGg2e
         hq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016016; x=1748620816;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WE/1otE+Iljvc13TDUh3vMrtfx4k08FjErn+ne3CuXQ=;
        b=R1e4/ztcwWFNRxqVmKtJ8UEg38RuG86pHc+ITLtAbfxxw1edCYR4dGiaooQrGlFD9A
         iq3l9mj1I7qyAxhmmXBlRvA4BzQnrWb9lklAh2mqk4TkTo3Yl4RyIu1U3qR/AGjedvd0
         pfF7Sv1/77YYRDf746LF5M9sWB0dsC3XcBVvXeJ69JlyY47vgcgvcHEZCmbVFxSX+9Pd
         LIkvEN6Yjiu53o1aiGuLsOsK9zf6PZX1zqTx0z/ifrfZyDRSDXFkkYhMfLj97jXO3vdd
         ZVGXMDeCtF/JcxH9ltXX9ywybzOZSmQJbsV5dm1RZEdy6m9fOqnHbRudgtwZQCAxv0Up
         0p6g==
X-Forwarded-Encrypted: i=1; AJvYcCWc+xAm5kkMzqzq4bqHNLA3P66FQGR1/TVdlNKNo4/oGELK1etT6+22bFkd4qRbf31IS8HBKkCkCGUPBUZHtfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFvCXz3OBDtmODaSyU9U6AUBSYVX60kd7H9iihVzptlR+C1Sz3
	L1Tfy/XlqFnY8+qPt6/8v08tC7w0K9E9Wn5iyMe1PnkhJxWxCCEsxgMc551hz4C4DyA=
X-Gm-Gg: ASbGnctaaRg3nAP3zX8V+PwOJmU4g9flGWps1vsBWG5566Jud2x+xtjPX6rf0SpBxh0
	Waf6tUcaF5Pk9BiDATSkj0jNGJf2FRKDB7oQtsg7UX0Degkyk59cvP7R61AKYKBm58njHhNPOU7
	tPEy0Rsz3Niakuofm0+YQExRGED7oqqu0txD5co3cpjLwB9PeTLPEJ6oxXO+o4nZBzlk7w5pUtx
	1H9SkuP2N74vUrHWU6AzUBwchZTF5uPT6p9+VCVsi8XfcEWPoMkYuZgEzoDapb38SRTLyj+fcIv
	0wEuTb42x/tcXcXTeUkMeO0EcTY68/avzlVKVVFQThJfvLJ4qx5RMsIF
X-Google-Smtp-Source: AGHT+IEW72aM5Tiovk6+jR6x6I4k/71EWX28cSp5QWzET2iJjFe3Mzu0nM+OSh1vusRA3SRVB++pPQ==
X-Received: by 2002:a05:6000:1ac6:b0:3a4:79e8:cdee with SMTP id ffacd0b85a97d-3a479e8ce2amr9395354f8f.38.1748016015926;
        Fri, 23 May 2025 09:00:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca4d310sm27195640f8f.17.2025.05.23.09.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:00:15 -0700 (PDT)
Date: Fri, 23 May 2025 19:00:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yevgeny Kliteynik <kliteyn@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Cosmin Ratiu <cratiu@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
	Vlad Dogaru <vdogaru@nvidia.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net/mlx5: HWS, Fix an error code in
 mlx5hws_bwc_rule_create_complex()
Message-ID: <aDCbjNcquNC68Hyj@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This was intended to be negative -ENOMEM but the '-' character was left
off accidentally.  This typo doesn't affect runtime because the caller
treats all non-zero returns the same.

Fixes: 17e0accac577 ("net/mlx5: HWS, support complex matchers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c b/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c
index 5d30c5b094fc..70768953a4f6 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c
@@ -1188,7 +1188,7 @@ int mlx5hws_bwc_rule_create_complex(struct mlx5hws_bwc_rule *bwc_rule,
 			      GFP_KERNEL);
 	if (unlikely(!match_buf_2)) {
 		mlx5hws_err(ctx, "Complex rule: failed allocating match_buf\n");
-		ret = ENOMEM;
+		ret = -ENOMEM;
 		goto hash_node_put;
 	}
 
-- 
2.47.2

