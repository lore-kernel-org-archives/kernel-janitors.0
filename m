Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00752235358
	for <kernel-janitors@vger.kernel.org>; Sat, 12 Sep 2026 07:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789198193; cv=none; b=CEF1lxOqr+VVpMtcSwjPvgGcRwhv6GzWKvfZCYhGiuLjBX9YKAlJ6KLjVtZpsKBHZOPTqcfusU/2UM2/NdF5oDjir6OSTsmrKVxptREwuB7S7tjn3lE4fleeHHu/1bZh6hBRN5goynYkb+mLlTd1Hs5dKx1E5O9hjCxsRve+E9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789198193; c=relaxed/simple;
	bh=4GPqk7Y70Mj9Aq8Rkj+3J44CytamM1JINRXa56Gc9W8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jYnTTsdHKjyM+PDxiCEyqAjxToP2s3SifENudpEPXjZvND9DT6LkC9d0SOmqSUWdl9YcV7eUaAf4daPKVv6K230JB+IqpNXoAV0OrWbhDGLdzeg6z63X++cMCAATRq9n3hTPZ0Uo8sCyd1Uujhh5gi0yl8IjCqYhw/Q65JUJmi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Dcex9FWg; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Dcex9FWg"
Received: from device-106.home ([10.64.95.107])
	by smtp.orange.fr with ESMTP
	id 5IAEx8HpobooQ5IAExMs9Y; Sat, 12 Sep 2026 09:28:42 +0200
Received: from device-106.home ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id 5IA4xBPdCDGip5IA4xOT8z; Sat, 12 Sep 2026 09:28:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1789198115;
	bh=0DeWI7yWKMhOTA8L1o8/gSta/I0gOo2/cgp9qNzVlGE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Dcex9FWgzImdvlzB7ZppOwQ3EHL+OnskH8uEkAulWNMVQWxDx8uZ0iKaFXE17XrB+
	 2Ph9GPtw+Oso5DQDqq8p2kBZqrLHEM0MTAEjuuas+Ca1fdv8jitgXJzobNDVLA6aXh
	 rAppp5M22QF7boY3ilP6FZ7GqBbM5KLQ7i96IicRCGN7C8C/RSDo+cnqO6FH0VrC2F
	 otBqa2L8oQWYR+P57k2038cCDAhOuiw0IpOTDwtvqxyEjwjLKNxM5xzgJKChgRLCSa
	 O9pwXjW09nt10BT7N4SsT856vFoZWGjtBhtfo7QjtmDweBxtKPFwzw76JEtP1Jbz3J
	 Ctfl0jThtjKWA==
X-ME-Helo: device-106.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 12 Sep 2026 09:28:35 +0200
X-ME-IP: 2a01:cb10:785:b00:26fb:aefb:6cd2:db0e
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-nvme@lists.infradead.org
Subject: [PATCH] nvme-keyring: Constify struct nvme_tls_psk_priority_list
Date: Sat, 12 Sep 2026 09:28:25 +0200
Message-ID: <303d4eff4cd1095ed248e64a7d4c799a49027394.1789198083.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct nvme_tls_psk_priority_list' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   7097	   4296	     64	  11457	   2cc1	drivers/nvme/common/keyring.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   7193	   4200	     64	  11457	   2cc1	drivers/nvme/common/keyring.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/nvme/common/keyring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/common/keyring.c b/drivers/nvme/common/keyring.c
index 32d16c53133b..43624d7713de 100644
--- a/drivers/nvme/common/keyring.c
+++ b/drivers/nvme/common/keyring.c
@@ -194,7 +194,7 @@ EXPORT_SYMBOL_GPL(nvme_tls_psk_refresh);
  * PSKs, PSKs with hash (psk_ver 1) should be preferred to PSKs without hash
  * (psk_ver 0), and SHA-384 should be preferred to SHA-256.
  */
-static struct nvme_tls_psk_priority_list {
+static const struct nvme_tls_psk_priority_list {
 	bool generated;
 	u8 psk_ver;
 	enum nvme_tcp_tls_cipher cipher;
-- 
2.55.0

