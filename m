Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B0F396B61
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Feb 2026 08:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772096190; cv=none; b=X6mJHSGhP/2hp6sKyrcjBUeEk/u8Fy63H8qHq35JjxruAO/6oOjq/FZa1J61UImrdBjjvRyIgLqjKORW/pOzwNkWOACOFbsMMIFBDMJsMmPJbpwZ9kOyiOgYiJidAYvJYnzEZq9t4lMYvL64OrUXKoujKRPApcCF1EMLTvVPN+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772096190; c=relaxed/simple;
	bh=yjujEF507FkM1LvRmeoa1lnj6VPSIxn7+rlLXsx2RIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OKZhViKTJqydwk/CD5xJ+XCmm9D5DGspuVdH2W5biplz4lwXK0xzjNBFP/mEzzPBhoC6jFwHbiUXrb/Q9kgfJMQP8uT8ABM/eHxWC8tlD6qS8anxP5mdKIeALWSkfPgPhtzmKH1vnRPXc81UXp7PFbUc+XTAMyAcz/gF4X7jNHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CM6CiUii; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CM6CiUii"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2adcede372cso2397055ad.0
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Feb 2026 00:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772096189; x=1772700989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V4C5I1Pt/wEGclaDi4K2UNhQ2nDAFpcehkeSkCYPJ+M=;
        b=CM6CiUiivWgCnTC2q4j6DiK0qOQDMYEC3ZHKHcs9H+8NycAlfyvkPEggOy3z/NqiG1
         HNQwqmQH3DlNUEv2vEhzwxtIuloXHFbW6S/ACCDopopNbPVO4khBjXSgRcYoUoaKA4RJ
         5nDO0SRpzRxKIKKZ5oSHpKpyoR2MKJpOuBjjOEz3exBNgTqfRPW7CXSHaLSMIckz1qaw
         W1AkP0xCwt/g3Japp84NpIlPhDfVLKMmHC4D6x7uW+62TA6cqwvnawFDU9x0f0WGuOF4
         tRqqJmma+SMy7Zs8lF71Pj0QWtAusmdX5rEYh9ag6ql5BtcHZdIfr6jguIHIrxZ8pZIA
         PUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772096189; x=1772700989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4C5I1Pt/wEGclaDi4K2UNhQ2nDAFpcehkeSkCYPJ+M=;
        b=wybxEZSocpNaLQV0E5/CA5dL6QeAV1MShnXQe5a1ZKeRiKqvtX+VlRDGPrmU86dUTO
         IO4ohEBC0zaQsn5hR45ZC/4XQztGp+YOyC3MXvlClqRd99Nshv8YZlcyGotz0joE4+G3
         oyOXn9n8Hv/kJ/9UlhaGqIMasTOrtWhWYCce0YD3viklqKW4VRuhB1wd3V14DXlowT1E
         NvJK4ldeRHRHwxu1QRRNQxl1Qq1ayKEFsERAwnKgKbiIaeXBSg6zpxizKnvdzcPoZnBZ
         ddbYBFvYZdzTVjGDVI6QhKdn57bbsB0VaQMFMlEnCaBrah587qRopGw6zmyN+kGtMTRL
         1zqA==
X-Forwarded-Encrypted: i=1; AJvYcCV7qIbXCHAY9kW5rGKCumZHuAKm1YWQtXLqfEQ2tnvlav8hw3CdkoU/eBBuXkteqpJN1KahC3PcmAidyhGS/hA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9d9No/l1HYtdqZlcJeXe+rNnvqio1Zw8PM2aBooZ5nKQEPJrZ
	8NtRsR0PSOavLJqrJKcBRbusYYybA75Uy/ntU7WPvke1THK42mv8tGbc
X-Gm-Gg: ATEYQzytAl9+myxbIH/WqkfxBt626ag8I4AupZxcWcdKuR80rF/1BNRRcYXpIV1YG/9
	7fPm4M7953IHbyyeg1BvTsmqeg6he7/DLlwZ3u3nUimSShvv1FaYOyrgGSwrNRZNeraRdO36iv5
	lm10nlXNrhMqhH9qlTQDfJM1lf8F+ZPvAI8eixnOdm44w/ATlCaLNo29UvK6Gwj8NwYl8J27bfx
	odYVMLukhD5x8bTaSSbdHqv7SljKdhcxMiMzIrh0XAXi3d0peFMYTvE9CuSVdgLg062MCCYTD8X
	gdagKTmdgI9Pkun0M0q9V+R0zVeNhInzvAqxIFGfE0CL8NUoLLbRqOZovtgACPPu/XjHC145OgV
	1iGrQ7IGtzlCRUozWkToK13zMmt0wP94g66wuzjuL+G5pJ48GRvxr6hgl9a1YLjUwqlxxrJIzC+
	OpHwo9MwfTjS/qguDDW/fb3W2EvY4RoLimXy4FrAZ4SPXSG4q344hUxhgnOEDc1UwtquOZ
X-Received: by 2002:a17:902:e5ce:b0:2a9:62ce:1c0c with SMTP id d9443c01a7336-2ae0305f1bdmr16231495ad.6.1772096188631;
        Thu, 26 Feb 2026 00:56:28 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8c7aesm2220020b3a.21.2026.02.26.00.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:56:28 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Sridhar Samudrala <sridhar.samudrala@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH net v3] net: core: failover: fix NULL pointer dereference in failover_slave_register()
Date: Thu, 26 Feb 2026 13:56:01 +0500
Message-ID: <20260226085601.11343-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Smatch warns that 'fops' is dereferenced without a NULL check.
While other callbacks in this function properly check 'fops', the
rx_handler registration does not.

Consolidate the NULL check for 'fops' at the beginning of the function,
before it is first used in slave_pre_register(). This ensures 'fops' is
valid for the entire function scope and allows the removal of redundant
NULL checks later in the function, as suggested by Dan Carpenter.

Fixes: 30c8bd5aa8b2 ("net: Introduce generic failover module")
Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
v3:
 - Move the fops NULL check to the top of the function before any 
   dereferences occur and remove subsequent redundant NULL checks, 
   as suggested by Dan Carpenter.
v2:
 - Target 'net' tree as this is a bug fix.
 - Change logic from an early return (v1) to WARN_ON_ONCE() and abort
   registration, as discussed with Simon Horman.

 net/core/failover.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/core/failover.c b/net/core/failover.c
index 2a140b3ea669..47e4a91dcaa6 100644
--- a/net/core/failover.c
+++ b/net/core/failover.c
@@ -59,7 +59,10 @@ static int failover_slave_register(struct net_device *slave_dev)
 	if (!failover_dev)
 		goto done;
 
-	if (fops && fops->slave_pre_register &&
+	if (WARN_ON_ONCE(!fops))
+		goto done;
+
+	if (fops->slave_pre_register &&
 	    fops->slave_pre_register(slave_dev, failover_dev))
 		goto done;
 
@@ -82,7 +85,7 @@ static int failover_slave_register(struct net_device *slave_dev)
 
 	slave_dev->priv_flags |= (IFF_FAILOVER_SLAVE | IFF_NO_ADDRCONF);
 
-	if (fops && fops->slave_register &&
+	if (fops->slave_register &&
 	    !fops->slave_register(slave_dev, failover_dev))
 		return NOTIFY_OK;
 
-- 
2.43.0

