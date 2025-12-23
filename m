Received: from smtp.smtpout.orange.fr (smtp-80.smtpout.orange.fr [80.12.242.80])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CD87FBAC;
	Tue, 23 Dec 2025 13:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766495516; cv=none; b=Fg3oPwhJ11cpmmUV2D+pLw+YbLDgsaSabCNV7eijDcSQwgaOPeJSAk2ydZ8kog3tj4/J+KqPegizBLfNGg+mIQNE7z9KuxzxKyjK25exhfn0qtE1KVXyjTyo1lsYUPCv3w7gXTtKtiOmT21XSj34vZ4isj+i9GpIGF8KfxL6apo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766495516; c=relaxed/simple;
	bh=F3I4K5OPzhqrJhb1R+suDOXU3Bz/yMpyvzTo7HfG0LM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKCWTSyAgWtL4Htq1u0pSuy9sl33TFg6Ap1O9OA/V1dEwLFnFzWcxLWVUQgZ24pbo5OyC+1rb+n8F8dtlhuioYO0rM6NAVG9KWY6NyW3KrPi1pPDbvSW6uRn+pfR+DdsnRoYywVf04607wu1mdAxqW3DYY+nLqEzGPGvOuxxqEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Wq4TJWOU; arc=none smtp.client-ip=80.12.242.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Wq4TJWOU"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id Y2Auvr9AoECGYY2AuvgbFO; Tue, 23 Dec 2025 14:11:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1766495502;
	bh=bM58L9I/i9ZyMehfLP2aRrDC5Uf7gxt7KWKdUsPNwLk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Wq4TJWOUAv3HjtdEoq0EKiQM+v6W6hg2BgCcvxAwz6+//i2k5ybAp8fSh0qln+EPp
	 91VJPSMgW5KmO/cEC0PHo2oFYno9CvZsHz5baqX4ddZKuSars1FwM48T21mqWV6x22
	 OaxnR+x31R32HNuoEzEn52Qvhk8ISNj3MFPotiZ53SVG9jb1cLc1Vi6mi3ZssCK0zg
	 ZcW2b3siiHwR5dgC0jewAe8QJgBPP1l174+BExhEYCCVYGeVUVaMp1bWn3GNxGr6nV
	 0KCyApGp2NPdlHtePeigUQ947MJsRrinxs6XdM4h6pcGQWKt9Jvv0lDd5jlKOzZQyk
	 zE+FU85YWbAcQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 23 Dec 2025 14:11:42 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-nvme@lists.infradead.org
Subject: [PATCH] nvmet: Constify struct configfs_item_operations and configfs_group_operations
Date: Tue, 23 Dec 2025 14:11:34 +0100
Message-ID: <82fd284cf70cffd374f5889a5c2a1f3800bafab3.1766495484.git.christophe.jaillet@wanadoo.fr>
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
  79551	  38896	    640	 119087	  1d12f	drivers/nvme/target/configfs.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  80639	  37808	    640	 119087	  1d12f	drivers/nvme/target/configfs.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This change is possible since commits f2f36500a63b and f7f78098690d.
---
 drivers/nvme/target/configfs.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index 825134d70d08..e44ef69dffc2 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -819,7 +819,7 @@ static void nvmet_ns_release(struct config_item *item)
 	nvmet_ns_free(ns);
 }
 
-static const struct configfs_item_operations nvmet_ns_item_ops = {
+static struct configfs_item_operations nvmet_ns_item_ops = {
 	.release		= nvmet_ns_release,
 };
 
@@ -860,7 +860,7 @@ static struct config_group *nvmet_ns_make(struct config_group *group,
 	return ERR_PTR(ret);
 }
 
-static const struct configfs_group_operations nvmet_namespaces_group_ops = {
+static struct configfs_group_operations nvmet_namespaces_group_ops = {
 	.make_group		= nvmet_ns_make,
 };
 
@@ -1095,7 +1095,7 @@ static void nvmet_port_subsys_drop_link(struct config_item *parent,
 	kfree(p);
 }
 
-static const struct configfs_item_operations nvmet_port_subsys_item_ops = {
+static struct configfs_item_operations nvmet_port_subsys_item_ops = {
 	.allow_link		= nvmet_port_subsys_allow_link,
 	.drop_link		= nvmet_port_subsys_drop_link,
 };
@@ -1170,7 +1170,7 @@ static void nvmet_allowed_hosts_drop_link(struct config_item *parent,
 	kfree(p);
 }
 
-static const struct configfs_item_operations nvmet_allowed_hosts_item_ops = {
+static struct configfs_item_operations nvmet_allowed_hosts_item_ops = {
 	.allow_link		= nvmet_allowed_hosts_allow_link,
 	.drop_link		= nvmet_allowed_hosts_drop_link,
 };
@@ -1696,7 +1696,7 @@ static void nvmet_subsys_release(struct config_item *item)
 	nvmet_subsys_put(subsys);
 }
 
-static const struct configfs_item_operations nvmet_subsys_item_ops = {
+static struct configfs_item_operations nvmet_subsys_item_ops = {
 	.release		= nvmet_subsys_release,
 };
 
@@ -1741,7 +1741,7 @@ static struct config_group *nvmet_subsys_make(struct config_group *group,
 	return &subsys->group;
 }
 
-static const struct configfs_group_operations nvmet_subsystems_group_ops = {
+static struct configfs_group_operations nvmet_subsystems_group_ops = {
 	.make_group		= nvmet_subsys_make,
 };
 
@@ -1809,7 +1809,7 @@ static void nvmet_referral_release(struct config_item *item)
 	kfree(port);
 }
 
-static const struct configfs_item_operations nvmet_referral_item_ops = {
+static struct configfs_item_operations nvmet_referral_item_ops = {
 	.release	= nvmet_referral_release,
 };
 
@@ -1835,7 +1835,7 @@ static struct config_group *nvmet_referral_make(
 	return &port->group;
 }
 
-static const struct configfs_group_operations nvmet_referral_group_ops = {
+static struct configfs_group_operations nvmet_referral_group_ops = {
 	.make_group		= nvmet_referral_make,
 	.disconnect_notify	= nvmet_referral_notify,
 };
@@ -1915,7 +1915,7 @@ static void nvmet_ana_group_release(struct config_item *item)
 	kfree(grp);
 }
 
-static const struct configfs_item_operations nvmet_ana_group_item_ops = {
+static struct configfs_item_operations nvmet_ana_group_item_ops = {
 	.release		= nvmet_ana_group_release,
 };
 
@@ -1961,7 +1961,7 @@ static struct config_group *nvmet_ana_groups_make_group(
 	return ERR_PTR(ret);
 }
 
-static const struct configfs_group_operations nvmet_ana_groups_group_ops = {
+static struct configfs_group_operations nvmet_ana_groups_group_ops = {
 	.make_group		= nvmet_ana_groups_make_group,
 };
 
@@ -2001,7 +2001,7 @@ static struct configfs_attribute *nvmet_port_attrs[] = {
 	NULL,
 };
 
-static const struct configfs_item_operations nvmet_port_item_ops = {
+static struct configfs_item_operations nvmet_port_item_ops = {
 	.release		= nvmet_port_release,
 };
 
@@ -2084,7 +2084,7 @@ static struct config_group *nvmet_ports_make(struct config_group *group,
 	return &port->group;
 }
 
-static const struct configfs_group_operations nvmet_ports_group_ops = {
+static struct configfs_group_operations nvmet_ports_group_ops = {
 	.make_group		= nvmet_ports_make,
 };
 
@@ -2239,7 +2239,7 @@ static void nvmet_host_release(struct config_item *item)
 	kfree(host);
 }
 
-static const struct configfs_item_operations nvmet_host_item_ops = {
+static struct configfs_item_operations nvmet_host_item_ops = {
 	.release		= nvmet_host_release,
 };
 
@@ -2270,7 +2270,7 @@ static struct config_group *nvmet_hosts_make_group(struct config_group *group,
 	return &host->group;
 }
 
-static const struct configfs_group_operations nvmet_hosts_group_ops = {
+static struct configfs_group_operations nvmet_hosts_group_ops = {
 	.make_group		= nvmet_hosts_make_group,
 };
 
-- 
2.52.0

