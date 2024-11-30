Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9631537CE
	for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732960870; cv=none; b=GAlKOEkleQ40UKie3HdWaVYudYkPwAkbtXNRVNTygZABhaFO4+sRSVqyWJCdmryC6Qr86SldkT8MN/KJ0UbN62gqhruFiWNcbAofSffb7fMaKnBdHXqyCdM27kV15BqB7Ib25sDDaN9HUjMsub1r31yisfSNJg3/mKVSuiwV7kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732960870; c=relaxed/simple;
	bh=/XpaTseG/TEeisBd+wk4TWWeiStEhV6ICnH01fIZSu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ir+gjIHeLqCqI/PkQch2MrD+a+yyXGlMuX/ujoEeeFjDsuiq1qUKnxEDPFoaBssfubL7lMxofL/qFUhUmKVWJQ6i71JLd0Mu/QqUAaOvKSpNzXzxQu/MMWaD+Wdu8/Jq+WQC0kh3NJgZh2XICoRDDWhy7Za08T0KOo+PFAy63Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d1YyKLUz; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d1YyKLUz"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5cfc19065ffso2973595a12.3
        for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 02:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732960866; x=1733565666; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a67SmAxg7nZOip6zVhj4ZsmBcbeJIrKRZCIwBRUJFXg=;
        b=d1YyKLUzWuTjh2B4bEUrPOGTF5zhAiYqp3Ha8yY5Quyjso2KPJm4Yt6xEyzT99yZz2
         nFTJbNWOzGTTXjU4aPAATBmUn9maJj4zvf1B4UH2+n2o8SSGI5XRf5s0U2ynrVd5ZKuv
         YUzR+igj4Mu9a8DiHoCfEAWtSUzpMBwqOVMcG6dwxs0d8tGpWBcLnAN7x1FzwIZXFXqs
         T33rqTeCOZ/nOxYSQbL4xJI4egCBO00mku5/zd8Zpodkuw367jFtr5ktz4QjnNhR5TJ1
         9Q8N4GlOZI6BhdRzkg8HKX+AwHu4VlfYOohIYLH3AcMBeLpuR7GkjR5Ude0X1SclfK12
         OCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732960866; x=1733565666;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a67SmAxg7nZOip6zVhj4ZsmBcbeJIrKRZCIwBRUJFXg=;
        b=FnNo03sqO1JR2Eu7eMbaITYyxWXRKb90quUcdJ35mW8GG95vQcXVHllbpUqVUhbDR9
         DLuCMZA9v/cAP06ck9PExiaYUBVXFGSBZ3DmDQlE1W4VEn9OfayzTBXkNX2JP4bpyuZE
         FnZT3OrWfG7d/Nyh2OSOaL1m/DtKJkQc312IyUkadMCwwQxT0zdVYrbLcVRVwz243zgw
         /WzqmIXeKimzfI4nMB9oCChtlXI1yblEU2nI1y3sbR8dSjtI6cuJv3gAkSzIPvVlK8UT
         UyEBexprrNTVOEe40FF+3XCYCuhj2r6rgUa/UP4WoEbst8S+QHPz4DyQ1JYWE1Sl5nwO
         cw7g==
X-Forwarded-Encrypted: i=1; AJvYcCU31gVSudWbUAoqK7T0JqKEWHzWmAgoKKRSJ+Vo8FAwVXItyPwj8B7BBMRfMklA0cMpvlGFHZtpewRSz1PVmgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdhAoPkbIu6pno7s1RBC+dwcZLuhzjmEoOQHT+ccfCTnlbm+TZ
	T9Y4ujebmuXI08z5PcTMw5vvvmJ7s1/UXf1cHn99xiWkr3kIReIwDKLjHH7IutA=
X-Gm-Gg: ASbGncsur3MaRCAN01tsi+GHxVvdjE7VQALUJyFNx3+XtmdK5qVRgvNUI1DO/rk+cFY
	yap5TtbnV1Csxijntk1vAA3J2KxEkYGk80djmLnaVSRiRUFIclMHG9xxGF2izgwSfGz7xvzxyo2
	ShSrx797cxgzrRHy2vXdhRBe3H1CE4Vky+IMAaQE6wVPAepe6aJF507hwn5Xvdd9ZBXCYMI8Vm5
	nzWPCGsJrhF/74rceTgAHgzy7eGmYe/7MuS7dyMHUXtwze/q6K0YEdDw45UFZuAvqzlEekr
X-Google-Smtp-Source: AGHT+IHz6Lgpgq1CwlN5SY6GoUtJEsnuXZdZiLP/TvT694J0WqT85iYkJrByZ7WTMbPj28wc6GAvsQ==
X-Received: by 2002:a05:6402:354c:b0:5cf:e9d6:cc8a with SMTP id 4fb4d7f45d1cf-5d080bd019amr12849937a12.20.1732960865832;
        Sat, 30 Nov 2024 02:01:05 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097dd619bsm2665439a12.39.2024.11.30.02.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 02:01:05 -0800 (PST)
Date: Sat, 30 Nov 2024 13:01:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yevgeny Kliteynik <kliteyn@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Muhammad Sammar <muhammads@nvidia.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] net/mlx5: DR, prevent potential error pointer dereference
Message-ID: <aadb7736-c497-43db-a93a-4461d1426de4@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The dr_domain_add_vport_cap() function genereally returns NULL on error
but sometimes we want it to return ERR_PTR(-EBUSY) so the caller can
retry.  The problem here is that "ret" can be either -EBUSY or -ENOMEM
and if it's and -ENOMEM then the error pointer is propogated back and
eventually dereferenced in dr_ste_v0_build_src_gvmi_qpn_tag().

Fixes: 11a45def2e19 ("net/mlx5: DR, Add support for SF vports")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../net/ethernet/mellanox/mlx5/core/steering/sws/dr_domain.c    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/steering/sws/dr_domain.c b/drivers/net/ethernet/mellanox/mlx5/core/steering/sws/dr_domain.c
index 3d74109f8230..a379e8358f82 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/steering/sws/dr_domain.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/steering/sws/dr_domain.c
@@ -297,6 +297,8 @@ dr_domain_add_vport_cap(struct mlx5dr_domain *dmn, u16 vport)
 	if (ret) {
 		mlx5dr_dbg(dmn, "Couldn't insert new vport into xarray (%d)\n", ret);
 		kvfree(vport_caps);
+		if (ret != -EBUSY)
+			return NULL;
 		return ERR_PTR(ret);
 	}
 
-- 
2.45.2

