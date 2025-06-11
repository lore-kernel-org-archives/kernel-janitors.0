Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAAF2853E7
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Jun 2025 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647679; cv=none; b=a0Jp6kSINf49s9BdyxtajonOxNTXmv/VP4m4dIFZURv+2gl9gZ1NttdpVj9NgcjObV5l8/+A+k5yuFWqJ/zCISJhJoS/3FwZnWVhn8uUoXT5s+/F+buF88P5zawWy25jc3LZqkGFwTyvjQVoyHmQaWel6MZOinK/Lt5sFqR8uYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647679; c=relaxed/simple;
	bh=ZbBHn47dMGWJ53QUL91wDWCBgtkYk1bF33LwhgsK/8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NM4ooWYqurDDr+qN9Pb39eX7ITkhlEmB8/BidfWU61x/PL95XGiru8frwAZrelec4qAj37VRRSj+oZdiAH9rau4OlSNoTKxpy/zKDTyGHn9lVh3nQphsjOME0ym5OGLDujR4X2Wb5SU7msbuFsEYmkIAkVrRLuoRBja3njXEoTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WX6O2unF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WX6O2unF"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a3798794d3so5774006f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Jun 2025 06:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749647676; x=1750252476; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1wi9vi2VZkar6XQ2+UOcqg15dLLnETew3y6pYXACG3U=;
        b=WX6O2unFfTmUoeV2HPmWQJaWIfIlmS31kfMa3AA+NI/GcftSDAetnmLVj9Zk+JPDvO
         zediAdwvckV4FWVeK0A0rgV7wLcEKqzEo3sF7YBlWK7F5L0KrF9dLyx2FGg5NgA47RoZ
         0cYvEABurjOHFF/O6/QPiYUdcF1IjHZ0oUnnYZ5WdUc7V5InhXeHYi2S9PRDgMdLs+d1
         3thsURD/QRIEU5QyRsa2H9/yWmYQu3TBiID5QNDtKD+T2MmybXFVl4JDzw06G/zsnc9v
         h2OCvYUerxC7CWuxWKRv5QIiszpK9eDl9o7xh0aXXEc+OG5gAlueMTYHrhAJbviy+XFm
         LCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647676; x=1750252476;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1wi9vi2VZkar6XQ2+UOcqg15dLLnETew3y6pYXACG3U=;
        b=xEYTQDQMw/kkHSMpqaccX/DnySB1ucsP6InYNaS3XZ6PjSZXG98ftjbQCJicXI18Fw
         3e64Vol0rys4tJ1tz9qvbgcBsZt+7bHYSEuYC+nKJI9jfOF1T9IG4wuQY6HZxyLeRpP4
         ZcPAor+sEfhvW6n8z9kLTX8K6jVL0UJ4o7+Qio0qyJ5jKuR92fON2yypSKH0EbEk0qfb
         B+n0DzQ8mRfZ+PefUCPYf3H4rqFuqp8BQvSb3HyNQK6m1m7/GXXSsL3a6pSDjaPLzof2
         g1rUCsMGwQ1vM2zOzDU84Fktdvxtw3mP3KLjvPvxZ4rvXn3y4dqujyUJ3TpIakUQtVC2
         mLLQ==
X-Forwarded-Encrypted: i=1; AJvYcCViMA9kNHXSbbk5AcmDwN8zTDa7JkuXq+X5JXZ30ZUfTgIZOKT9BNltXinJaNOk+NOPF5cVTq7Rh5ZdiEJtwdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfYlJgzeDyg8+5SXp4OTWZBGpaI/lfZnapTZofGc2jEWV1EjAr
	zMc0wUTqE2+It9AD+TrQuCumrA0av3575m+TXfzSszkEfdmQ32r4JmUjIEN8w6LgOcg=
X-Gm-Gg: ASbGncurbcADqHRsIoYuGu2meb/OqA8Db+FS3qHZo8XmX86djbw7K9qHlACy9VjJyV5
	AkN6id4jQ4EG7z9GOkCj4u8BFPu+OdtwlbKAl94bcPG2TbJ8d5u/Ab0IgivknmtDUVUsyIRWEOg
	Z80NnCawO1C40ngD4pccuokDO5E+9uUGvFnMWva6LlvvpMWpaQTB0mody3Iek13QaynbnyCoe7V
	vPYtozpQBbEOd2vROViImMz/yCuqOzNBLE/YV6OvQijTWBVgs/Y5ZWl2drmCgMF3zCcxVXpZ6T6
	YoIbJqxfWdzPdAseZR5QRGNffVtrpdbF2bLLn2Wu7gS5Zgc1as6cj1wcN/MKlJ2IM4P8c4fdKOh
	73Q==
X-Google-Smtp-Source: AGHT+IEZYxPPB8go7zapmJs8ZEVjldo61z1jUHfLZWjVjqXCaiPBg1do2SuJ9+yFiiv/enBgtuPakQ==
X-Received: by 2002:a05:6000:2010:b0:3a5:4b67:5a70 with SMTP id ffacd0b85a97d-3a5586c9eb3mr2584527f8f.18.1749647676139;
        Wed, 11 Jun 2025 06:14:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a5324520e7sm15326874f8f.84.2025.06.11.06.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:14:35 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:14:32 +0300
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
Subject: [PATCH v2 net] net/mlx5: HWS, Add error checking to
 hws_bwc_rule_complex_hash_node_get()
Message-ID: <aEmBONjyiF6z5yCV@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Check for if ida_alloc() or rhashtable_lookup_get_insert_fast() fails.

Fixes: 17e0accac577 ("net/mlx5: HWS, support complex matchers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Add error checking for ida_alloc() and add cleanup.

 .../mlx5/core/steering/hws/bwc_complex.c      | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c b/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c
index 70768953a4f6..ca7501c57468 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c
@@ -1070,7 +1070,7 @@ hws_bwc_rule_complex_hash_node_get(struct mlx5hws_bwc_rule *bwc_rule,
 	struct mlx5hws_bwc_matcher *bwc_matcher = bwc_rule->bwc_matcher;
 	struct mlx5hws_bwc_complex_rule_hash_node *node, *old_node;
 	struct rhashtable *refcount_hash;
-	int i;
+	int ret, i;
 
 	bwc_rule->complex_hash_node = NULL;
 
@@ -1078,7 +1078,11 @@ hws_bwc_rule_complex_hash_node_get(struct mlx5hws_bwc_rule *bwc_rule,
 	if (unlikely(!node))
 		return -ENOMEM;
 
-	node->tag = ida_alloc(&bwc_matcher->complex->metadata_ida, GFP_KERNEL);
+	ret = ida_alloc(&bwc_matcher->complex->metadata_ida, GFP_KERNEL);
+	if (ret < 0)
+		goto err_free_node;
+	node->tag = ret;
+
 	refcount_set(&node->refcount, 1);
 
 	/* Clear match buffer - turn off all the unrelated fields
@@ -1094,6 +1098,11 @@ hws_bwc_rule_complex_hash_node_get(struct mlx5hws_bwc_rule *bwc_rule,
 	old_node = rhashtable_lookup_get_insert_fast(refcount_hash,
 						     &node->hash_node,
 						     hws_refcount_hash);
+	if (IS_ERR(old_node)) {
+		ret = PTR_ERR(old_node);
+		goto err_free_ida;
+	}
+
 	if (old_node) {
 		/* Rule with the same tag already exists - update refcount */
 		refcount_inc(&old_node->refcount);
@@ -1112,6 +1121,12 @@ hws_bwc_rule_complex_hash_node_get(struct mlx5hws_bwc_rule *bwc_rule,
 
 	bwc_rule->complex_hash_node = node;
 	return 0;
+
+err_free_ida:
+	ida_free(&bwc_matcher->complex->metadata_ida, node->tag);
+err_free_node:
+	kfree(node);
+	return ret;
 }
 
 static void
-- 
2.47.2

