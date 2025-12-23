Received: from smtp.smtpout.orange.fr (smtp-78.smtpout.orange.fr [80.12.242.78])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ABD207DE2
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Dec 2025 13:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766495825; cv=none; b=s8+lR8QYDzJLzXsVRujo4w0ks45e5OHxzf+rVEBddCHc8WCd6Zy9MZ/3Ud/a0bdgGFTK6Kd/tss2+/4HoNDQCWCYtZd0z5ExUl0dTA0b9vKUMJI2SSfk+rcclPfO5u9SI0G1MVuF+dyBkfgid09bqhoO0/agNLP18uMDe+hA7kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766495825; c=relaxed/simple;
	bh=kVU/+6blnsjkzThTBedF5ZKxzE0HqS/4TFBxEaddouQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SsC+1ESSQpiuv1aHDz6otfAOsASa96OBIEuIVLiYgtt8FPtzPDwNOc/feulhUXtEGHapudrmRzN0XQ9qCrRUlmtcVHv4mtE5tRf1OikZyV78gwhAPMnwHDH/erdahAGAstEOPQdbxphwxKcvbxceax/XpoTHRaH7bV+WLaIcLEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=LU7DAtOO; arc=none smtp.client-ip=80.12.242.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="LU7DAtOO"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id Y2EtvzLWXwYLQY2EtvKyNV; Tue, 23 Dec 2025 14:15:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1766495748;
	bh=FAm5OXDCCcakGDLeza+eId1cVx9jGuE6ABYHL7lw1xI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=LU7DAtOOKbuGi1wNrPIZXyh5DhPfebC6stUnB6RfYDrcqmkwL6d6I3knVzkscKRQA
	 TFR8q3hBqTbZIXTCaTLKecHKI7KSpbEc1mRtX+2n/AYFkRcWYNHZfDOxu90+6Rv/rY
	 94IUptBAyQ2xkDcn1PkGiwEvVx2UfcbOcALU3+bJx+oEKgyIHtC3UQdnEfTxdBPvJH
	 32Z1+Bc3jVsDvG8UilfTnASMQuZXuD4hB+cjp8RAoFT4fFMyjrVQNQm5o9dXWZDny6
	 sjUm27X6YitDY+7LPuo9LBAQy+axOz4dcFXmLtRdeVDpZTxkedkg5lSiIcpVabGrwy
	 h5ar7oPh+jrtw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 23 Dec 2025 14:15:48 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] most: Constify struct configfs_item_operations and configfs_group_operations
Date: Tue, 23 Dec 2025 14:15:44 +0100
Message-ID: <b87a0f4c7504d2b742b72ba86f95189b26da9484.1766495730.git.christophe.jaillet@wanadoo.fr>
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

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  21305	  12664	    320	  34289	   85f1	drivers/most/configfs.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  21785	  12184	    320	  34289	   85f1	drivers/most/configfs.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This change is possible since commits f2f36500a63b and f7f78098690d.
---
 drivers/most/configfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/most/configfs.c b/drivers/most/configfs.c
index 36d8c917f65f..e9d7a25ced6d 100644
--- a/drivers/most/configfs.c
+++ b/drivers/most/configfs.c
@@ -399,7 +399,7 @@ static void mdev_link_release(struct config_item *item)
 	kfree(to_mdev_link(item));
 }
 
-static struct configfs_item_operations mdev_link_item_ops = {
+static const struct configfs_item_operations mdev_link_item_ops = {
 	.release		= mdev_link_release,
 };
 
@@ -454,7 +454,7 @@ static void most_common_release(struct config_item *item)
 	kfree(to_most_common(group->cg_subsys));
 }
 
-static struct configfs_item_operations most_common_item_ops = {
+static const struct configfs_item_operations most_common_item_ops = {
 	.release	= most_common_release,
 };
 
@@ -466,7 +466,7 @@ static void most_common_disconnect(struct config_group *group,
 	module_put(mc->mod);
 }
 
-static struct configfs_group_operations most_common_group_ops = {
+static const struct configfs_group_operations most_common_group_ops = {
 	.make_item	= most_common_make_item,
 	.disconnect_notify = most_common_disconnect,
 };
@@ -571,11 +571,11 @@ static void most_snd_grp_release(struct config_item *item)
 	kfree(group);
 }
 
-static struct configfs_item_operations most_snd_grp_item_ops = {
+static const struct configfs_item_operations most_snd_grp_item_ops = {
 	.release	= most_snd_grp_release,
 };
 
-static struct configfs_group_operations most_snd_grp_group_ops = {
+static const struct configfs_group_operations most_snd_grp_group_ops = {
 	.make_item	= most_snd_grp_make_item,
 };
 
@@ -625,7 +625,7 @@ static void most_sound_disconnect(struct config_group *group,
 	module_put(ms->mod);
 }
 
-static struct configfs_group_operations most_sound_group_ops = {
+static const struct configfs_group_operations most_sound_group_ops = {
 	.make_group	= most_sound_make_group,
 	.disconnect_notify = most_sound_disconnect,
 };
-- 
2.52.0

