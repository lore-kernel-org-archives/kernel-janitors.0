Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB322246778
	for <kernel-janitors@vger.kernel.org>; Wed, 28 May 2025 08:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419960; cv=none; b=ZMZlsNen4rZE/rKpALENacqmtiDb5WrPcM3UofFn8Bw7MIHr6i1t2gzI4O2zMsWiE4UIkzllzJPheKImZAXrQdBAAxMydAEcp90ygv5vGcdTljSOgxpo9AlphN6jCb2lg/bDCGm5tcebZZ3UzbPRcQhFslRsumR24M2dbdx7sP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419960; c=relaxed/simple;
	bh=zt6R3jp79fMZyuI135ZWhJCJrZHDPzn+vYfjefZ4MqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ymf5HLd4ACV+/tgf8+UFQlyMfZnkxeiwGjM8sgX+xUZZZvT+To9tx4s0H8pYh0Eg7v3R3lXkc+s+QO7y+mA7Eajmb1DjT8ENEwhrKcfMY52IAPt/KE0t4BrRirZHTIBLY1LzFafhrfaj6kOexvUvOzgeVHb0gubr+q6hU7gpedc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=daoEyNpZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="daoEyNpZ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so34676445e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 28 May 2025 01:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748419957; x=1749024757; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ha/P9I5FpO7is8f+c8Jo+hsQyuoifexQpWyES60Ve10=;
        b=daoEyNpZLx83XtbnvXn8eVB11DEDMIYpPbCFCO80tEyhTsPyvgcNSV6q+xM1414uH4
         zDtlzZuxhqLvTPp7XMvIWG3lQ4U6yWZ5zOFLVQwVL1VnG6GlKmJLF+mnilTRt2uV+gzw
         Z5kfBadnknjqMDKj2m7WN5QdWBHhWNH62yYN47LFS2r4a+50QzcIbMOrsW6y9V7VQori
         Q9lOjRgd8w0d1I+x2hm1dnztHtOtHz7rT4Ycg2e6ckceZawtOZTdCZCt7q7weh2m9Nb9
         K6uO+ejqlm7bFFw/kzDpRpkCf1GBHSuN4iOl8fag5XGW/CQC2a6lDcqpXeXgNsXxLttr
         3fIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419957; x=1749024757;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha/P9I5FpO7is8f+c8Jo+hsQyuoifexQpWyES60Ve10=;
        b=HBfpG4yBBkoM8iBKWX1YXR2ERpRSlZOpFdfbLK5XCYQePySEqY898pKOS7sLc5iQcT
         1xSN362zAlVv9jAxIKLw8kRSmzT1Ja8GWo8k77dZQqpOsYBcggUffSWAw0Sm4z1DR+ro
         qcsfkKM1tGCrTXxzQSsSyljAq9Moxt4KX6z18lvpeSNMuYJWyT4vwBJ2NuQgBll8sW3i
         6DOKNufrDdsLscR4TwwlmTGPWsFrlIq+nJI7boKNmhrNAX2NtLZGK8Kvw5GVXZYUJsnZ
         MCcNnQu0Lg9CX2Ch2tzLdN1Lvdein+VsUdQBz98gl+pfXq7hpUOXxXcmPbtpBmsXYZtV
         Gvow==
X-Forwarded-Encrypted: i=1; AJvYcCUxj7xW9dJnzWgzX9aRNtNm7dNMy0COfsxuFuCJ+ESvPAjoHnahinmRAZF/xG5YYRBmmNSaqhv23kZwVMTsecQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiXxtMJznRstYtwEj3HE9PpuxNBFrkBB+ItUQqCWTSzJsP/KsL
	wp4vHnOzvv6uKI0g3dppNuypf+Kzh/eJxaAC/KUuV2uenPlM59/XpgTGt1OuacyiAGA=
X-Gm-Gg: ASbGncvvP5ew8pHof2D87atGEgTceXUjwlBdemgcjEBjb8RAk9r0lIOkP7TM3MlTWUC
	u0/UEf3vO1Wx+SG8YEU5NCFqcr+nK2IE2ZmWTSIaqJjwQavIJ5ka6/4KmcI9TVbISJu+MmWzfzu
	PIq8KxPANi/g03Z0r3S3dCy+/4DLB12d53VXbuvoVXoXWK7JUUISuvppxC4CCOAsSoTSCJKC8tG
	JxYJop0Ff8uVoHR5WgqDMDbd1k5f8BD+S7ysDY/aQkb9Pq3JXP3huR5afIXR8D3QrCB0dDgIOfA
	LLRSPm0yHil7d6KGahu3SKLr9iuXdRGejc1bskWjmlVt9b7QwvjOp+29
X-Google-Smtp-Source: AGHT+IHds3HlT5cEKDELP4HlaQKB3QeEr6bANTntVAcGev79jh49G1GwJ0hdtMaA7ScQTs3fhrDICw==
X-Received: by 2002:a05:600c:8708:b0:441:d43d:4f68 with SMTP id 5b1f17b1804b1-45072560c18mr12730175e9.15.1748419956961;
        Wed, 28 May 2025 01:12:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4507254b988sm9800675e9.13.2025.05.28.01.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:12:36 -0700 (PDT)
Date: Wed, 28 May 2025 11:12:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yevgeny Kliteynik <kliteyn@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Mark Bloch <mbloch@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
	Vlad Dogaru <vdogaru@nvidia.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net/mlx5: HWS, Add an error check in
 hws_bwc_rule_complex_hash_node_get()
Message-ID: <aDbFcPR6U2mXYjhK@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The rhashtable_lookup_get_insert_fast() function inserts an object into
the hashtable.  If the object was already present in the table it
returns a pointer to the original object.  If the object wasn't there
it returns NULL.  If there was an allocation error or some other kind
of failure, it returns an error pointer.

This caller needs to check for error pointers to avoid an error pointer
dereference.  Add the check.

Fixes: 17e0accac577 ("net/mlx5: HWS, support complex matchers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c b/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c
index 5d30c5b094fc..6ae362fe2f36 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c
@@ -1094,6 +1094,9 @@ hws_bwc_rule_complex_hash_node_get(struct mlx5hws_bwc_rule *bwc_rule,
 	old_node = rhashtable_lookup_get_insert_fast(refcount_hash,
 						     &node->hash_node,
 						     hws_refcount_hash);
+	if (IS_ERR(old_node))
+		return PTR_ERR(old_node);
+
 	if (old_node) {
 		/* Rule with the same tag already exists - update refcount */
 		refcount_inc(&old_node->refcount);
-- 
2.47.2

