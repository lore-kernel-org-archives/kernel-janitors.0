Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D3F1BD4FD
	for <kernel-janitors@vger.kernel.org>; Fri, 15 Nov 2024 17:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731690460; cv=none; b=Y/PtFDZSpiFOgyzo8CR22IMureizPDtAOB6MN0zE78qxtCUBFxRggDnJC4f+9QKQxpSdOpBvj/ZTMuJ5T2dQQ/5PgGEBvUv7LaViereNmXE8TLCD98uHXbah5dIQQcxpMig5riHk0g5LJU6Kvcg81dJAAl58seUXet+5A1yVGH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731690460; c=relaxed/simple;
	bh=EzkkrgwX6QicJgrVFN8oP2t4q3QLUwJo1tmpaavTM5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eYV9Zv2g13Kb2KzNXieXM+2U0OGxkmg36oGzKUGB27gaPFtlqp1bwZqtowwcoffg2bQktlBOwhqHGjvGMnAUaMxeJ8BY2Q4fvOga46A4ut6+K85ze+3zfjn7N0k7gthoU8TtoYx5eesi1muNsIxfmWmXYuVv/SWPRiY5Mqkte5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=dc7e4+76; arc=none smtp.client-ip=80.12.242.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dc7e4+76"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Bzn7tcTuub37CBzn8tOZyc; Fri, 15 Nov 2024 18:07:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731690451;
	bh=8WTwIcAx6b/kVp2mWAiv865Zbjt0MpLRftMY+PnKZIs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dc7e4+76ZstjhkJ53J7ch6aKPYIK03+9FbWkQqqUMUjTq6dSi+6XrBwswztNDxalF
	 LwRazKcLJ4WuuNgtkt+hTwrIAFeHqFjjZlULjnvlAaz/ZyL0220IIbTvbetZVytKVm
	 fyYp2UtinkjrH+md0e14Siu4yqpqlQOuAOcrW2Qzl04oLSeEQt0p1PhhlMUGxVg4Ry
	 jyGf6NcJTyEt1gV4cxii909ynqiOpreA091vf0ajLGQwTONqMY8B1qkXdY6XbJOObq
	 stihS4myr9J4+G0kS0qOm2HJmpn0FM/n84brVo7OMXfJ9xOyiRxpzulRYHFhti4ZqM
	 Qqa07O3FBfsJg==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 15 Nov 2024 18:07:31 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: linux@weissschuh.net,
	broonie@kernel.org,
	lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] const_structs.checkpatch: add i2c_device_id, pci_device_id, spi_device_id and usb_device_id
Date: Fri, 15 Nov 2024 18:07:16 +0100
Message-ID: <3b100aca94521c484c9c158897ab7ec139ab3334.1731690298.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i2c_device_id, pci_device_id, spi_device_id and usb_device_id are common,
help keeping them const.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 scripts/const_structs.checkpatch | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/const_structs.checkpatch b/scripts/const_structs.checkpatch
index e8609a03c3d8..725796a899a6 100644
--- a/scripts/const_structs.checkpatch
+++ b/scripts/const_structs.checkpatch
@@ -24,6 +24,7 @@ file_lock_operations
 file_operations
 hv_ops
 hwmon_ops
+i2c_device_id
 ib_device_ops
 ide_dma_ops
 ide_port_ops
@@ -54,6 +55,7 @@ nft_expr_ops
 nlmsvc_binding
 nvkm_device_chip
 of_device_id
+pci_device_id
 pci_raw_ops
 phy_ops
 pinconf_ops
@@ -92,10 +94,12 @@ snd_soc_dai_ops
 snd_soc_ops
 snd_soc_tplg_ops
 soc_pcmcia_socket_ops
+spi_device_id
 stacktrace_ops
 sysfs_ops
 tty_operations
 uart_ops
+usb_device_id
 usb_mon_operations
 v4l2_ctrl_ops
 v4l2_ioctl_ops
-- 
2.47.0

