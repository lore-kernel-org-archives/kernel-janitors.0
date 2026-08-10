Received: from smtp.smtpout.orange.fr (smtp-78.smtpout.orange.fr [80.12.242.78])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB41C3B2FF8
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Aug 2026 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367463; cv=none; b=Yeg7ibZ9+ft5uBk9+rtZUDv9U1BQPfMAoYUajurAeCjBPkjTOhAmqfkW6+/m3MR5EHqXsIqPPrIaaJzyBO9NlpAQcbmNOq0B0iGSFDmq8tyUi4UkQzAvEY4zyDNMnE3WvyDNIMfnsfTlNT03o0J/J0vhCRmxPW8g151uRkF1kMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367463; c=relaxed/simple;
	bh=4HSfdKJYU02RHTdZL9Ny3hH4A3XjtsJ0hBfuxaKqtd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OoL8KSJTRrUi3TnXTK5ObjZOjUtZoFxhBw35Ip0MIZXFTF3aA+qmpy4Q2c6gH/k4vpsd/klACidvU1X08yRYDijiaAyadDehHN71B8wTHyniXr1rCvxNj0iRgeC6zP9rwsOX7v28lxng/5EN2P0lpv79iEdR0HM2JmivTNRMQ08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=UEYzhaPl; arc=none smtp.client-ip=80.12.242.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="UEYzhaPl"
Received: from device-101.home ([10.65.86.56])
	by smtp.orange.fr with ESMTP
	id tPmGw8ZBqFIYEtPmGwwewo; Mon, 10 Aug 2026 15:10:52 +0200
Received: from device-101.home ([IPv6:2a01:cb10:785:b00:6128:9b8c:c203:905])
	by smtp.orange.fr with ESMTPSA
	id tPm7wupkZj7gftPm8wexGk; Mon, 10 Aug 2026 15:10:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1786367445;
	bh=Mqst24K6Pm7iTM7Gbhg8zqi2bFNkFpVztNiQ2fwwjKY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=UEYzhaPluzTyUTw19Vsrgjg07ywDGINFVHpwKG5xwyJMmO0WIpAQ7gN2TgMLbUKVe
	 5+YXS22mLynJQysnZTLH1qYlwtkspwxPqdzVlMKUparHjK3FjNqny6ioPFq0xOGJh+
	 +6lZFAcc/ZCJPPH2glqNrMePmDD6TRZV1uZr9UdoZpG3qEY1MrLd655UzNCwGpd77L
	 756LyMlIhb2ol5H29yOfYMeHlBkTb2OxmbyHWYUElFXAxtO6CwCt1OjbcWaQKITFKl
	 IVgq1xLMvlusVYgYSoVrTcGcc5RGOYBZ7quN7veBY2pwJLm66EmYAxchJcjwuUKjfV
	 NnKhJzalcgUwA==
X-ME-Helo: device-101.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 10 Aug 2026 15:10:45 +0200
X-ME-IP: 2a01:cb10:785:b00:6128:9b8c:c203:905
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] sbrmi_i2c_regmap_config: Constify struct regmap_config
Date: Mon, 10 Aug 2026 15:10:40 +0200
Message-ID: <4b1f177cf2967ed27dd0159b3fcefeb96d2bde0f.1786367419.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct regmap_config' are not modified in this driver.

Constifying these structures moves some data to a read-only section, so
increases overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   5776	   3472	    320	   9568	   2560	drivers/misc/amd-sbi/rmi-i2c.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   6544	   2704	    320	   9568	   2560	drivers/misc/amd-sbi/rmi-i2c.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/misc/amd-sbi/rmi-i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-i2c.c b/drivers/misc/amd-sbi/rmi-i2c.c
index 463a9a757464..3ed0a4244be7 100644
--- a/drivers/misc/amd-sbi/rmi-i2c.c
+++ b/drivers/misc/amd-sbi/rmi-i2c.c
@@ -86,12 +86,12 @@ static int sbrmi_common_probe(struct device *dev, struct regmap *regmap, uint8_t
 	return create_misc_rmi_device(data, dev);
 }
 
-static struct regmap_config sbrmi_regmap_config = {
+static const struct regmap_config sbrmi_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 };
 
-static struct regmap_config sbrmi_regmap_config_ext = {
+static const struct regmap_config sbrmi_regmap_config_ext = {
 	.reg_bits = 16,
 	.val_bits = 8,
 	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
-- 
2.55.0

