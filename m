Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9A339BFFF
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Apr 2026 06:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445306; cv=none; b=lJvWjZyDGJgjzvG1acDwsY3QZZBcVtMCx8O2dDVHqNQWT7VCPee56E6D1ckm+Jzm3v099P7FzV24tNTw+R7u6lDBNu6H+A9XA8vhJ5FJ5gndiGCehYP10qdmfd/B9pXJRYfR5xFrdEKyQv9zD/7f6za/XnHPyYtvfUvsiPHFAfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445306; c=relaxed/simple;
	bh=74yiVA+barDrmw2/b2nNUKKQm1v84lTrbgkdtxA3hzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pWKxVUn+W6DEgt2YZb3EiSWWm+93pnRY4HgWb4k2BPSFB2HviISYmJZK6cXqe7WIEnlboaR5KQwpFzTZ6/uc0sY5lSHDGkrwk6FA6rR02ZtU0PawwUkN5LLtYfU7qBzDeZdCTd2p+C/SJdxbRiAVCE2Ga1nI29cBK0tdCAKJbWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gazr7/cz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gazr7/cz"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso166497225e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2026 23:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445302; x=1778050102; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDhQuZ2fFicfJqp5+3HbIXCIa2+xN5jtTHPkvfbA9J0=;
        b=Gazr7/czH233ef4C9mEBOpGxLjLkPZwUhkISYTYvY+1CZFBrEhV/AqEBG+Wnfec5Ty
         xFUDes3bsfRKouMRjClJLxT6+EiE1pBO179KVhCI2BJoTCNqrNNcUktk9xGV8d/ImYem
         P2FCN/q4zP9ek8U862wP5ZdIkRMkPPWhGobTjfX5cw2tpFQPCTY8HKdao98qaLKUlGRO
         ibxvKq82bZOWqYrfZ2MrW7H25wLeWLhptpX7fDPIfa60rHAY917sBcdAfsrrIPtny4PM
         HtKVNZPiS2Uj8Ix25lodL57ZQev+WrgBazQ15AmwUXOm9JYXBaUlRocmWdDIb8w812kH
         RxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445302; x=1778050102;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDhQuZ2fFicfJqp5+3HbIXCIa2+xN5jtTHPkvfbA9J0=;
        b=kdbDN/yGNmHZ6kb1oFezwIEfa+QGAQZZMoP6zHJkccfQc1Bw3kTSAnXjahs6MpHSXJ
         WDmd8DmTJ5qw4BRYELjKSvlVV+3XyEE2AmccLE0DEt9BUB7sPhJ5Sjz3G/IWaC6fePLF
         k5aVjqrwdsTvzC/PicUBIkl/JZIPwyCYb2CRUJKpMuvCfahwtr8Z3xJEDCdSpsIyzu06
         EmswFF84rW+/ut8nLVwbIyaKL8jtEGFbMRdQkz8S7h6mJ4kU01ncY0wDlkQPX4mxlW9O
         9TMHUZzD+oGZkaELLcv2PwSKlxfktukSoDCvacVWJKzMRK2BwFUHCJs4lr8QgpXVWnDj
         ErHA==
X-Forwarded-Encrypted: i=1; AFNElJ+72JiB0IEW98Q8dIqXfuHPSl5VQb2n1RdhS5mFzXOpqw8onV54JzohEo3za4n/ey3yEzim2hReBcwlrqajv8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya5xMD5Epp5UbKEg0dBciVMedeV2Gpn8S+ecfUosPbE1TE3hD7
	Gp7R3BdM6+7B3LJx/og4RBy5u/cRwUlmx29G3NBF7gVWdTtPcymIY2Dk
X-Gm-Gg: AeBDievfHjIzf5iCAWbRX540yHhvggv2Od+qRv9ZdDi5yEs8pIk6QhLqkkR3lBlMm+t
	2Wi/ptl16tVmPeZjv8Lq0OhNvVHBZ8JwfPImNMGbnLtxBXz1naNs2rpzLQabmFbkOjuNCM+qPxU
	qhzPSq+bdKs4CUB+fBruVHWbulEeJgNKT18GShNxPfd0cPyA+1UvtZo68hXrzqWgS6E1GM5iGwY
	pz9OcjiaUCcserKZHtMMUxEouOu+o1Iq59SGqeiU1R1aRdVXiyf0xSWZvlNIk+Vp/KtJCF/qYrj
	WoCE43Oeu567ApNAyScQxpcTjDFWAbNzVmZ6iWq4DeVE1wtQ99xjnz87EmrhIxwu26581sAicHa
	qqkEHmNtul77+tdYd1otRW6jw9i/9wZ3GA6YYXOqd5Ed8URpNIxr9Z86VRT/tq4wCvunCi8sY0b
	FOq2q7XkeitJiJehijFeqD2iweV5fcrw==
X-Received: by 2002:a05:600c:c091:b0:489:19e9:b139 with SMTP id 5b1f17b1804b1-48a7b5125ffmr30806325e9.1.1777445301640;
        Tue, 28 Apr 2026 23:48:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c57b579sm33738925e9.4.2026.04.28.23.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:48:20 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:48:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alejandro Lucero <alejandro.lucero-palau@amd.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Martin Habets <habetsm.xilinx@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org,
	linux-net-drivers@amd.com, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 net] sfc: fix error code in
 efx_devlink_info_running_versions()
Message-ID: <afGpsbLRHL4_H0KS@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -EIO if efx_mcdi_rpc() doesn't return enough space.

Fixes: 14743ddd2495 ("sfc: add devlink info support for ef100")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: Originally I returned -EINVAL but -EIO is the usual error code
    when 'MC response was too short'
---
 drivers/net/ethernet/sfc/efx_devlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/efx_devlink.c b/drivers/net/ethernet/sfc/efx_devlink.c
index d842c60dfc10..e5c6f81af48b 100644
--- a/drivers/net/ethernet/sfc/efx_devlink.c
+++ b/drivers/net/ethernet/sfc/efx_devlink.c
@@ -531,7 +531,7 @@ static int efx_devlink_info_running_versions(struct efx_nic *efx,
 	if (rc || outlength < MC_CMD_GET_VERSION_OUT_LEN) {
 		netif_err(efx, drv, efx->net_dev,
 			  "mcdi MC_CMD_GET_VERSION failed\n");
-		return rc;
+		return rc ?: -EIO;
 	}
 
 	/* Handle previous output */
-- 
2.53.0

