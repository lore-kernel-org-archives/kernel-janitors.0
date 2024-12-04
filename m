Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501321AB53A
	for <kernel-janitors@vger.kernel.org>; Wed,  4 Dec 2024 12:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733314009; cv=none; b=rhtKAdyq9pfyCDWMBcpzWZg219QMiMGgeMp7zRt9kKf5PcLTyQsuuxMcJbGNbb5lNxb18Ll+aGf6+wpgV5HHWqNdJ6WpdczBSZMxB8Acqh37UE72d7ETNPAUJWz2QEsLUUaAqC2cjc5WceH8g4O6JfCkZIiPNx10R8PeV4GazeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733314009; c=relaxed/simple;
	bh=JDuHv6uKQbsHmnfZl4eZomwStWLbB2P9XNr61tQtoTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oAsuqXJjjQTiuhPhQCmk1N9PfTunIevWrwVcainwn1xGn6YvugFYRgH829eGpEbAuWqwZArLFZnmhOkd5o6rgrWG634Umfjx4VBmWpUU3+azBo4ge0FMzaxa/0wwGkVnMsaPPueWiOYzR4nTUZAHQXUhjX5qBKKhWUlWqEIEbo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ljZNXT52; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ljZNXT52"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e06af753so2803989f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Dec 2024 04:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733314006; x=1733918806; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ywma13jqMEAR0GKd8Er2i+hQcM6w7VPqBl5YrMVzLNg=;
        b=ljZNXT527HsCuXDN04ftSTOa7EdLqkLaJgxqyahBN/Hy3l0O+uPycEaB5EmEKsdMxe
         kV7ey+bTmpyZV6esyDa3I5Br6Pmw77su4JefNShB474nT3N9vmjSh79QBlWEo4y7UNUl
         XOAH6Ioxsx6Dpk94+vGwVOHQXCYsFUXRhU+5JxbfuhF/sTw2CFWpQn1vQhP4NOuH6fwB
         4/MTZgWGcwrt3XDaFjKwYS9Q3voxeby96NcSmTjWllX8xAjFq6/INHXwPVsuRUWdqo2Q
         sWEvU1nRomKubzL6/hzh/o4DUxrFDJjzPB7kNhTI66RxbAYXJFLdp94NK8pCESdn/b8f
         XQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733314006; x=1733918806;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ywma13jqMEAR0GKd8Er2i+hQcM6w7VPqBl5YrMVzLNg=;
        b=hkEFP2GGYicxQHTpg0raZqr57OA3M/TuJy937qnBTCSHvg7jr6F/DbJ8jjKxb7ApU1
         KyyoqJWWfD84QH9U0eehhfEo146j2jk0ggY87084ppdU0s+Gmp2qHH8l8+2IuqxIvLS/
         IaiY3xCOuX0hvjbjgKo/zecK0KZvAYCn6fnw59en5Bd4SakrppJ8SEgYKPVfUbqBop7G
         62Tsq2rxlGKFq2jXfDwuuy/zYEcVsIhVupUvq7ySNiLTibv/ysFB+bIZYlXkV2RQdZ4z
         lTMzW6U/QicyboyH2RODmjs8OFedo0GInAtHgXoXZ4vtgOBFORr3oKzPFP61mLogC/sX
         YFlg==
X-Forwarded-Encrypted: i=1; AJvYcCVkbcwuL/q2Rnf8SypCg9dJ60yqVFdOMhcVy5djO3/e1QKh/sj8ly1EA3yXhXLu24lOUFIQOelKIB91GxhVGeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYy0+Il+InwF5hARQBeGA2s4RjMy3o8prtQ2eJzD4vFcg1Zfmr
	W49OVHL/pOwvQG5eX3QXrrg4BcvCfpttEtipRGea6WDQ90q3m//4B4N/1nfn/Tg=
X-Gm-Gg: ASbGncuw9lm9UioV+xOT4OTAvHWnzaDhqm6Orn2onj+XpPhL0fcBH5/SaQ3HuWcbset
	bg4LGktJsp4qK/VMZvrPMz0Nt8kv4+IPN8+XVhizKkW4nibEHhyrBwlA3wmTL/j7yK+bqg8INXq
	IuqLC64EG7U8eJwEmmha3847fh+dl2NPTG9Kc7iJIT1tPXZG9EDjAmua38iIYAUkxkXnRv3YaIf
	qyFn/wXJKt+l4azAIG+o41hJfXRJzoTYjhZVZAlpYpE22xb9pM5RH4=
X-Google-Smtp-Source: AGHT+IGJUj6d/zYcZD5M/Et3lJs2ShDAAV/RYF8yEIzq3ilyWBo8QUqo+ERoO6DKk5D16w9J5pmwRQ==
X-Received: by 2002:a5d:5f83:0:b0:385:df4e:3691 with SMTP id ffacd0b85a97d-385fd418da7mr4972574f8f.42.1733314005639;
        Wed, 04 Dec 2024 04:06:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385fd599b31sm4473289f8f.21.2024.12.04.04.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 04:06:45 -0800 (PST)
Date: Wed, 4 Dec 2024 15:06:41 +0300
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
Subject: [PATCH v3 net] net/mlx5: DR, prevent potential error pointer
 dereference
Message-ID: <07477254-e179-43e2-b1b3-3b9db4674195@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The dr_domain_add_vport_cap() function generally returns NULL on error
but sometimes we want it to return ERR_PTR(-EBUSY) so the caller can
retry.  The problem here is that "ret" can be either -EBUSY or -ENOMEM
and if it's and -ENOMEM then the error pointer is propogated back and
eventually dereferenced in dr_ste_v0_build_src_gvmi_qpn_tag().

Fixes: 11a45def2e19 ("net/mlx5: DR, Add support for SF vports")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: fix typo in commit message
v3: better style

 .../net/ethernet/mellanox/mlx5/core/steering/sws/dr_domain.c  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/steering/sws/dr_domain.c b/drivers/net/ethernet/mellanox/mlx5/core/steering/sws/dr_domain.c
index 3d74109f8230..49f22cad92bf 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/steering/sws/dr_domain.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/steering/sws/dr_domain.c
@@ -297,7 +297,9 @@ dr_domain_add_vport_cap(struct mlx5dr_domain *dmn, u16 vport)
 	if (ret) {
 		mlx5dr_dbg(dmn, "Couldn't insert new vport into xarray (%d)\n", ret);
 		kvfree(vport_caps);
-		return ERR_PTR(ret);
+		if (ret == -EBUSY)
+			return ERR_PTR(-EBUSY);
+		return NULL;
 	}
 
 	return vport_caps;
-- 
2.45.2

