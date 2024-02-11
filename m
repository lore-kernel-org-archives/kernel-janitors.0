Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B46A5A7A1
	for <kernel-janitors@vger.kernel.org>; Sun, 11 Feb 2024 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707654543; cv=none; b=Xw9utLXxPTL97pFy7PY9DcHxtUEid4ENAHcxNUGlK2eNsAC2Fl7Zz0vsNfUB+Idm6bw4omB8JV1lnN7aaH5oHb5pUtEKq7nYqbkKzgK5sjE2qN6LkGVp1vr1v9OohK0EQhxFJHiyOyskDDsHeVUuep3xSEcHGn04we5F8YuV2Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707654543; c=relaxed/simple;
	bh=VDd0p4EgHd0V78fptXuQVp76nhioQUVgvT6c7xK6XB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aCfHFpX/v4l8XvPx5HUStVURE13PYgjudvx5ENiFOvl2RrmaS8l25gse02VPrOrizb5pgQF7Abo5t1oxqKsOF3UJk6oIQ6t/FJl2BQGcrJamEwz9Zr4jAriJzNpIIcZ2mh9pC9Wp2EzeyksyLqd7SmWo5UIFwnb2rpCRcgjXx2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=h3rFLLTL; arc=none smtp.client-ip=80.12.242.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="h3rFLLTL"
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id Z8w2rS5yOymFYZ8w2rQ4zQ; Sun, 11 Feb 2024 13:27:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1707654470;
	bh=yjTdCUQsFTSNm5Ev7xNn7axY7MBZ0FtXX9CI5fLO26M=;
	h=From:To:Cc:Subject:Date;
	b=h3rFLLTLkMZjqWbUjtTisjdWyfYwJt1jHDbPkmO9jBbTFmmyaeFXdFUWb20lag9vH
	 xu/FEycccHE+QoLhTHVsj9hX2XySe2SnitNm5vpnpLspP+WIHx3PrwY7VVHYyp90WT
	 hIn8gbrZC3WiPGFvDHj8tw5IWIgjQbTSRW5HqlljriNKdv6M+yBPDXtDnpS7Yb4ahU
	 /xj7tWW/QQHQm66zAIEEPiZfqN3d3frQv3xDsuwutuiYokfWYDxOJT2Ro3T/HBVNwF
	 /fVwANHFr7Vybw9gnJ0tkEt+9iN3K9WONO+r95egNghqhFwPUJICCQRXp1b64N3pK3
	 ph1JfsJ3MSTmQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 11 Feb 2024 13:27:50 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: axis-fifo: Use sysfs_emit()
Date: Sun, 11 Feb 2024 13:27:10 +0100
Message-ID: <588327734f374b5f5cb5c4d5725d884fdc83663e.1707654406.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysfs_read() is anly called from _show() functions declared by
DEVICE_ATTR_RW().

Using sysfs_emit() is the preferred style and here, it saves a useless
copy and a temporary buffer in the stack.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/axis-fifo/axis-fifo.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 727b956aa231..c51818c56dd2 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -165,14 +165,9 @@ static ssize_t sysfs_read(struct device *dev, char *buf,
 {
 	struct axis_fifo *fifo = dev_get_drvdata(dev);
 	unsigned int read_val;
-	unsigned int len;
-	char tmp[32];
 
 	read_val = ioread32(fifo->base_addr + addr_offset);
-	len =  snprintf(tmp, sizeof(tmp), "0x%x\n", read_val);
-	memcpy(buf, tmp, len);
-
-	return len;
+	return sysfs_emit(buf, "0x%x\n", read_val);
 }
 
 static ssize_t isr_store(struct device *dev, struct device_attribute *attr,
-- 
2.43.0

