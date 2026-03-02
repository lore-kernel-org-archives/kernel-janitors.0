Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B03D199EAD
	for <kernel-janitors@vger.kernel.org>; Mon,  2 Mar 2026 06:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772433832; cv=none; b=Nlea6huEOsWUc5/6V8mLpJtrZnKwqe93Fo6/KwAbHDHgOhAuGBEn5keZTR1Wpeq7oC90Ev8xW2ytGZK/ygvbp0K2YHwz8mjK2QNZg5sriMabZ3SgVsua5q3XrQ4Jz8BkG0qhHYlKoNkYJVFHws+nb/1rRWBP/mwrPEyJATJf+/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772433832; c=relaxed/simple;
	bh=PKNSEVqwgpezkdcE7Jg366jjgNQJdfEBDD+dXkoYfgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7wmSUhzZeuiEsD4nDwbsbBF0fPacm81YyLMIHrWh4yOzwgJw/luFlSYKH4KqHsAVedurJmwygvz4x+wgjgWJnfsMVquzKhiRDMz3CeAZuTdX8yE2YhXVllWKIkY5UWDqHIx8vf054F2UZnZtDG/6/7oIfkZU6p25j3fxA/g5ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMef/nYa; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMef/nYa"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82418b0178cso2289016b3a.1
        for <kernel-janitors@vger.kernel.org>; Sun, 01 Mar 2026 22:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772433829; x=1773038629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aEMJ/SEK1uGPP1uyITOdW3C1N0iniu09gHnQF77+QCU=;
        b=LMef/nYa9WOuNFpYa9XV5VXBBlB3tdsqHJtKZA21NvwNHdEqIecDCmz1UmqvfJJFI4
         wyR7e2JWsqRLL6cNIN7oisxxJiQOGo6x4HNZxFKWaJAstor/TFFvgwXGOqz98Re+Wq9P
         TxdS6Bts+BvAAHNB9N1YrSv1+gfEuLt0MQvZo+Fl0AEYNT+VMudlAoKHhK/HIwxJChu1
         7cd60gAjSTk9oq/LdrhDCYXpVntJB77j7ml+Mev2vfYkvl9OIW1bAFl6K0ABkZnTstII
         cXtXuNvpVanRHzny9R0zYyvEDDK+P5L6y16ws2tZIwi+KfdwD0UoGkODNXLvDEis9V8m
         qvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772433829; x=1773038629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEMJ/SEK1uGPP1uyITOdW3C1N0iniu09gHnQF77+QCU=;
        b=cjppSZRcu1YKkm+kOrdLh9yBu4jBoVa2AtaMs51WPDYLZRnrJEnBKkQMBMu4BoKUZp
         8VvnJHPj/5Cco7cbUBPQnsgzzHnaey8ififTBt3uzvpLeCxlmm99wclZb02Ebq8dptlI
         ZodLapDxlKtUrJe1R8FaluA5G0ciwn+XxesjYyDQOvR3xBKZ6b/WQOOBoeDFQlOES4eq
         tVYq213lrPkFSrCXOArn5eF5R+JNlghBCEO7IA5ZRVCFPmCjM8YjVdaH4dtHGgrDmWjZ
         zN6m7h9MNNSYdcL0BbU+Dp8Dywqz5w1FPKWX2fsu/zcnv3RN84Jb8oZxyZoS0GdXfSMQ
         wzUw==
X-Forwarded-Encrypted: i=1; AJvYcCW+6FGwcW2Me2pwx8BmmTTyKqQ6Wg/yytEc4mZC7S8orvD7X6xWLmvxdgZGYg4ShRu24IGGy1Ttw7sZdO9wUjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXwhfnbEXD3topThbeKXiWvtjek2Wr4hY03MQrc/nVvfvoNv7T
	ekEFPXEa6VRsulJHw6bbkxgYx+UkbbtGMaeVfrbalpYy7fLotQnVwMIr
X-Gm-Gg: ATEYQzzBmLG5dOzjxpWOdL4ncKPvFuQ9Ujz6Qi+986nt4rCZqoNmujy2VDHszjA31iJ
	zcCL5HwQXZQebDlSMwtbw074gBZ2zGc2VgEm3O0jvjHmMNavgy9T9uGbzPTHMIjo9LwNFsNA/uw
	e62rz8O6Myc/IE9EvYl1ZkcWhtsACCD4FBQOUH3uB6mN+6uipJciMPKV+dNW4jsl0NxZzqWYgIz
	GIF8XdakMT8h5UiJbONvy2sqvcM1deoloF8jk+qSlthjGx215mYvmr0dEBhKX6xB3Pvprm0q2DI
	X7WvH1CjOrbdtafS7BfFSxmOchCb9FNxpFmJppbpOXpaeSXVslTBTOlH5o/6P31TgmOBgsCbdXC
	Jdly5ONjiH4NGeMRtdX6uzL1euR7EQUWBjl+zm/XsizeiGcGDpI6LFqrGy/s50DFP7rUl2BT05e
	+Mm4t47hwLLL6REcZ4c3QwGS0r9CDRIyHRpljMNnuX+gAWd+nxDwgCP1k5vrnwYZcjtuQs
X-Received: by 2002:a05:6a21:1186:b0:392:e5cb:da81 with SMTP id adf61e73a8af0-395c39f7bb6mr10443610637.3.1772433829349;
        Sun, 01 Mar 2026 22:43:49 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa82c531sm11015265a12.24.2026.03.01.22.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 22:43:48 -0800 (PST)
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
	Dan Carpenter <dan.carpenter@linaro.org>,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH net-next v4] net: core: failover: enforce mandatory ops and clean up redundant checks
Date: Mon,  2 Mar 2026 11:43:17 +0500
Message-ID: <20260302064317.9964-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The failover framework requires 'ops' to be functional. Currently,
failover_register() allows an instance to be registered with NULL
ops, which leads to inconsistent NULL checks and potential NULL
pointer dereferences in the slave registration paths.

Harden the entry point by requiring non-NULL ops in
failover_register(). This ensures the 'fops' pointer is guaranteed
to be valid for any successfully registered failover instance.
Consequently, remove the now redundant NULL checks for 'fops'
throughout the module to simplify the logic.

Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
v4:
 - Harden failover_register() to forbid NULL ops as suggested by
   Jakub Kicinski.
 - Remove all redundant NULL checks for fops throughout the module.
 - Remove the Fixes tag and target net-next, as this is now categorized
   as a refactor/cleanup rather than a standalone bug fix.
v3:
 - Move the fops NULL check to the top of the function before any
   dereferences occur, as suggested by Dan Carpenter.
v2:
 - Wrap the dereference in an if(fops) block instead of an early return 
   based on feedback from Simon Horman.

 net/core/failover.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/core/failover.c b/net/core/failover.c
index 0eb2e0ec875b..11bb183c7a1b 100644
--- a/net/core/failover.c
+++ b/net/core/failover.c
@@ -59,7 +59,7 @@ static int failover_slave_register(struct net_device *slave_dev)
 	if (!failover_dev)
 		goto done;
 
-	if (fops && fops->slave_pre_register &&
+	if (fops->slave_pre_register &&
 	    fops->slave_pre_register(slave_dev, failover_dev))
 		goto done;
 
@@ -82,7 +82,7 @@ static int failover_slave_register(struct net_device *slave_dev)
 
 	slave_dev->priv_flags |= (IFF_FAILOVER_SLAVE | IFF_NO_ADDRCONF);
 
-	if (fops && fops->slave_register &&
+	if (fops->slave_register &&
 	    !fops->slave_register(slave_dev, failover_dev))
 		return NOTIFY_OK;
 
@@ -115,7 +115,7 @@ int failover_slave_unregister(struct net_device *slave_dev)
 	if (!failover_dev)
 		goto done;
 
-	if (fops && fops->slave_pre_unregister &&
+	if (fops->slave_pre_unregister &&
 	    fops->slave_pre_unregister(slave_dev, failover_dev))
 		goto done;
 
@@ -123,7 +123,7 @@ int failover_slave_unregister(struct net_device *slave_dev)
 	netdev_upper_dev_unlink(slave_dev, failover_dev);
 	slave_dev->priv_flags &= ~(IFF_FAILOVER_SLAVE | IFF_NO_ADDRCONF);
 
-	if (fops && fops->slave_unregister &&
+	if (fops->slave_unregister &&
 	    !fops->slave_unregister(slave_dev, failover_dev))
 		return NOTIFY_OK;
 
@@ -149,7 +149,7 @@ static int failover_slave_link_change(struct net_device *slave_dev)
 	if (!netif_running(failover_dev))
 		goto done;
 
-	if (fops && fops->slave_link_change &&
+	if (fops->slave_link_change &&
 	    !fops->slave_link_change(slave_dev, failover_dev))
 		return NOTIFY_OK;
 
@@ -174,7 +174,7 @@ static int failover_slave_name_change(struct net_device *slave_dev)
 	if (!netif_running(failover_dev))
 		goto done;
 
-	if (fops && fops->slave_name_change &&
+	if (fops->slave_name_change &&
 	    !fops->slave_name_change(slave_dev, failover_dev))
 		return NOTIFY_OK;
 
@@ -244,7 +244,7 @@ struct failover *failover_register(struct net_device *dev,
 {
 	struct failover *failover;
 
-	if (dev->type != ARPHRD_ETHER)
+	if (dev->type != ARPHRD_ETHER || !ops)
 		return ERR_PTR(-EINVAL);
 
 	failover = kzalloc_obj(*failover);
-- 
2.43.0

