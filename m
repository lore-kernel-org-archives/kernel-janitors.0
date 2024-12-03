Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24A81E0496
	for <kernel-janitors@vger.kernel.org>; Tue,  3 Dec 2024 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733219123; cv=none; b=sZsJY07YctWi/rCg0zdO9O2K1RPYkTwy2PNrzZI7JyifVk9xB0zyCog6mzffsWfU2qvw6/lem+JZathFXgwU+zL5ZrEgmnJ4aiiLSGjvDD6MnGOWvJFqp+GdVVnC/yiCl0TF/wt01t6vqGHHhsZOplD0o96auweXaVmzgBt4XRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733219123; c=relaxed/simple;
	bh=RJ4dlBGD3salju0V5qaXj8Hlpmx2bDBn5RHAXBda2Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oDxa79fDiVZVUtPQUw8NkTnwnQYzlhSzX3PYXra2yp2eKlvUZxbZranp983ni9RISTRYTvCUR2FZolkBNtCxmmfAgFn4f2Xd+4219jAf8kLeGtOLWLj04s6WNOu3aQoGjrVOHq04c5g4fdCsWW6v0k4bhixyIjTdibQybS58oCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uV4ME+gR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uV4ME+gR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a0fd9778so48777575e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Dec 2024 01:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733219119; x=1733823919; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6I1Ptmv2KxZJwio/UIsOX+BhzfGwkhQGEzNHEKVRFKU=;
        b=uV4ME+gRVBtdJasDf2fMwONsoRGQM5JE1tp3+s+c5xfAVh5yqwY3NGe0x9w1ch8Xsk
         wQZZYyiZiqi/WOgXQiv8X8W7Y4hn13uZRQaHX0fOmwg94V+jIA4llTy5fA8LXnSFDuSw
         JKvDa0Ttcqn91PKjU6UNi8az4afbfH9bUyq0/Yw1MNUNugheMzK8Y4a3t8TCJswHZZg6
         RdRxxAZ86ILTnfJm3nhGg6nsjDAfDP1zMahUaEwnBtbGIJ78jz1WdLnGVrJIKosfsE6J
         yqDpErgO+YhsHYSaNcyuqgcTrqYuVLKvBJTHo7vLPmKkXO2weeqSnHSd9mwL+F4BqB/P
         dHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733219119; x=1733823919;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6I1Ptmv2KxZJwio/UIsOX+BhzfGwkhQGEzNHEKVRFKU=;
        b=n/U7oioejzEJpyAeRWs7tkzJP8TBfCAjqccxagzV5U4OY+bwPydZptyv9P8cHJTs7q
         2BLZ4IRNQi01qQveRM//NXyH0WRBRKTFFJwAKo1OcgtCGc6opQX8h3deTnHc7c+YRnur
         Mgavv6DdZJgUGydEYx34OwFzjHE6pjUUW0g2NeVIjCnwI2Tdb6cCc3JKXNt4wREhAkj9
         dxVVKBHrInxgeYvcGZFabbFeH9lb5ILAV+vKLSLOkM3jOE/qK690O1zFF9XwrjHvS4gl
         mcXf1OlUNeQ8pHRAIgP6RNviEkCEzn6j19itEliTuVkGCG8siRExY4k3/I//DnNk1C3b
         Y4zw==
X-Forwarded-Encrypted: i=1; AJvYcCXuhkBPTbroy4epAbfBDuXsrxRrVjTDIRuGiZR8RTWv/sqZvQRD/S2JHdL5H2xbe9qxIRggikdk+XVSjVSKOWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYMFtweOsn1H/5nxIDHQOmwrBn2tTYczh301EjGGBLKXIacsAO
	BXZK95K6S98ZgOnUui8ZUvpviHo5pU7HxNSRsDQ7RiNRpW1M+NNW8sCnex2JYIE=
X-Gm-Gg: ASbGnct7wQmpoNGjrbm8KDp+yOPIXLwi3f9X21dUymHyG3dt/I4cdq2swKVSrFEbfwu
	uqm/aXEbQ5TrFcda+8pInYmAXf/CVHYl7g7nusXQL6wNvF36fASxDJ2Paig8E41xgpEleE1ASOH
	D/fmOyVl5FLBJxFGv2/g7OGgTpk/e66V1X9u4JlmBZedvBk1So7g38BOdx1rKRGjjh7dHuC8DP/
	f0LL3yhJCEy1kmKyYLX1OmkaQ+fzOAJOY8s5NR5TuZsSsnIFk/WbLM=
X-Google-Smtp-Source: AGHT+IFdpiCjCQ4owJdmqakSIReYwoM3vo6fpku4tNVal18DsXpYtsSKHcj3Ceq2fZLtSh1NDS08JA==
X-Received: by 2002:a05:600c:19d3:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-434d0a23b36mr15900425e9.31.1733219119326;
        Tue, 03 Dec 2024 01:45:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa78007dsm211772455e9.19.2024.12.03.01.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:45:18 -0800 (PST)
Date: Tue, 3 Dec 2024 12:45:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yevgeny Kliteynik <kliteyn@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Muhammad Sammar <muhammads@nvidia.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 net] net/mlx5: DR, prevent potential error pointer
 dereference
Message-ID: <Z07TKoNepxLApF49@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The dr_domain_add_vport_cap() function generally returns NULL on error
but sometimes we want it to return ERR_PTR(-EBUSY) so the caller can
retry.  The problem here is that "ret" can be either -EBUSY or -ENOMEM
and if it's and -ENOMEM then the error pointer is propogated back and
eventually dereferenced in dr_ste_v0_build_src_gvmi_qpn_tag().

Fixes: 11a45def2e19 ("net/mlx5: DR, Add support for SF vports")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Yevgeny Kliteynik <kliteyn@nvidia.com>
---
v2: Fix a typo in the commit message.  "generally".

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
