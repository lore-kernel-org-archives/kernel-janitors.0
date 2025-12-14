Received: from smtp.smtpout.orange.fr (smtp-72.smtpout.orange.fr [80.12.242.72])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C862C2701CB;
	Sun, 14 Dec 2025 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765735133; cv=none; b=OtwQdjSHV/oubJOm+/euoc9K2nVopxdGqUs02E4hdde198+wzr+UvVoRFPAfUgplwAAh9OzfqgzOM+rln8OD21ST05YnRPQzTLUAyrrfDU69Gx4x5TDTeAg2heSBf/jYsksQcaW+m6kCV3bHpAUXH37luZIqu2F+U/Dlzdt0Yb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765735133; c=relaxed/simple;
	bh=eqgR+/Wxdo5f0m9QoXZgOnZtLNzD8GnvepX4KEFIy6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DeBRfJOpojbYUjU0AoJiDgBsb0GyGO7HtR69hyJuySremVjYVeHX5bTZA20KMPaQHKQ+v9OrX4lIKbciN4ZJqgqfaAmBz+YyCTvf0IZ5/2fYMJFWjc/n0WdbNUlriBL+H+OYAgR46rCmeEKsHmEbFY9kU35a5LQMrcd3blF9MPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=SCnnrhTO; arc=none smtp.client-ip=80.12.242.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="SCnnrhTO"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id UqLdv2norud1nUqLdv9T2w; Sun, 14 Dec 2025 18:57:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1765735055;
	bh=xnZQYaE3f+lyVpaIqfD5G12ltock2Ul/7/4qFYFks1Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SCnnrhTOBZkYuALZm0U1vRmpA4qyiEggQ4ovliUyS5QQbl3RkO4BmvnC7unDVPM+6
	 I9SMO/gsE+PSC0d1+UvzAFkgf37F7kbXFHH7bg6osAntKcXoh5dlw6OZV7Q/qBLNYJ
	 FGFczam2O/TQIGDkDfhZQ7J287mQS4NcwePgjCpSfMXMRJL25HyyJa+dQS8tDfzcsV
	 H8SjxYjfbAkZSQcb2vrmZeCDKzHczKRcV7o2bdSk1C2D07GdAhd8MqrHn5q72aXDSL
	 yoSR2zNCvtIaQUwrMI9xPcyftN1xr8ykmi+rnS3RJPxdJeLtg3cJv+38BwseBAdzm8
	 96EGoiArOhNVg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Dec 2025 18:57:35 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	kexec@lists.infradead.org
Subject: [PATCH] crash_dump: Constify struct configfs_item_operations and configfs_group_operations
Date: Sun, 14 Dec 2025 18:57:30 +0100
Message-ID: <d046ee5666d2f6b1a48ca1a222dfbd2f7c44462f.1765735035.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct configfs_item_operations' and 'configfs_group_operations' are not
modified in this driver.

Constifying these structures moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  16339	  11001	    384	  27724	   6c4c	kernel/crash_dump_dm_crypt.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  16499	  10841	    384	  27724	   6c4c	kernel/crash_dump_dm_crypt.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This change is possible since commits f2f36500a63b and f7f78098690d.
---
 kernel/crash_dump_dm_crypt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 401423ba477d..0d23dc1de67c 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -223,7 +223,7 @@ static void config_key_release(struct config_item *item)
 	key_count--;
 }
 
-static struct configfs_item_operations config_key_item_ops = {
+static const struct configfs_item_operations config_key_item_ops = {
 	.release = config_key_release,
 };
 
@@ -298,7 +298,7 @@ static struct configfs_attribute *config_keys_attrs[] = {
  * Note that, since no extra work is required on ->drop_item(),
  * no ->drop_item() is provided.
  */
-static struct configfs_group_operations config_keys_group_ops = {
+static const struct configfs_group_operations config_keys_group_ops = {
 	.make_item = config_keys_make_item,
 };
 
-- 
2.52.0

