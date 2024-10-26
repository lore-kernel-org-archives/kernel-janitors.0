Received: from msa.smtpout.orange.fr (msa-218.smtpout.orange.fr [193.252.23.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F3718DF97
	for <kernel-janitors@vger.kernel.org>; Sat, 26 Oct 2024 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729938852; cv=none; b=FyfaOPLCFud2B10BD04mH1RLIZTJ1/Xby9aC5aVfYkjh8dqMYWk1S4y7hF7XbpdZhnaXFclQYUzNcgyAxHVgZhKH4x3Ba0owB11Vub9fr7iuiI6Yk5k84EXVZSjl8jThqRGgyFRi+9GoBSNReJhaczW8dqKlT/jqMk9CyZTDbdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729938852; c=relaxed/simple;
	bh=A6U8ta+ZnS34szYa58THBFeG3YWzos6OCdiFKXWHVxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pPN+ngzvWgWcb6tzf9MNQp4oE8QjnOU2myDvq8C8cKDgh61bLe2xNhaNS3nzgqAgZ4EMBw+79WG5HpIaatduSoyD5KAyNKrF90RMcIfrfdp0OI06TMQD/p2+EsqVikZdmxEt30ceJYoWVrlh/HKlbVrBAULGf7oPD3jKhbCgoUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=JQN6IgbE; arc=none smtp.client-ip=193.252.23.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="JQN6IgbE"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 4e6KtNTeWVYl14e6Ltepe2; Sat, 26 Oct 2024 12:32:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1729938777;
	bh=L28aRX9acwpDAskDQ+9C2QZMMfPavq0GBAMSCErET88=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=JQN6IgbEVAdmr2N9c36JAG8x5t2KvDy7i2WbUJsk1ZOQonWoRf8HkMI5kZS5GF3vX
	 kf+9PSJKqQrTam4qCnC3lL4AK+Cr0LtoRqpTpddN2+PtIk8aXLQnSVML+lMySsHCya
	 tLqtA4it9YBpcAPa0waG8wvQoBbVgCtjxX54312wZrx+Sr1v7dOOqj5daqJpMuWqIV
	 rg4I5PdzKKhLWCxkxIfMasbE7osQbMHUgOb/YLBy6pAiJR4tyOS/UTTRrdpdx1GAsI
	 h+9PZ86xQJl3Kogy715PB/+4qWx0teDB05pT2Mpih1u0aD5seeZnyPP4sOUUCT/FP0
	 DpXF4grvKTLpw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 26 Oct 2024 12:32:57 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Thomas Richard <thomas.richard@bootlin.com>,
	Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mfd: cgbc-core: Fix error handling paths in cgbc_init_device()
Date: Sat, 26 Oct 2024 12:32:46 +0200
Message-ID: <24ec1348b99e76a853435ab081ae9a8f0e51fd52.1729938747.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after a cgbc_session_request() call, it should be
balanced by a corresponding cgbc_session_release(), as already done in the
remove function.

Fixes: 6f1067cfbee7 ("mfd: Add Congatec Board Controller driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/mfd/cgbc-core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 93004a6b29c1..7771d010eb2e 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -321,9 +321,19 @@ static int cgbc_init_device(struct cgbc_device_data *cgbc)
 
 	ret = cgbc_get_version(cgbc);
 	if (ret)
-		return ret;
+		goto release_session;
+
+	ret = mfd_add_devices(cgbc->dev, -1, cgbc_devs, ARRAY_SIZE(cgbc_devs),
+			      NULL, 0, NULL);
+	if (ret)
+		goto release_session;
+
+	return 0;
+
+release_session:
+	cgbc_session_release(cgbc);
+	return ret;
 
-	return mfd_add_devices(cgbc->dev, -1, cgbc_devs, ARRAY_SIZE(cgbc_devs), NULL, 0, NULL);
 }
 
 static int cgbc_probe(struct platform_device *pdev)
-- 
2.47.0

