Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E83526FD97;
	Sun, 14 Dec 2025 17:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765734632; cv=none; b=E40rfN8GhzHbkGj1p++qkcuylvooe+SYx+yJApEL07/gyToFtFuwZXvyvZC968W74TiB+1G7dE/mx5SAq9TTChzMKFur1iUA/8t5IUJihty1E5kc9VWJqtvkCdju7nE0JoydfjPhvDYJtFe3VTPV7DvAA2gxlfRwrHRWo0r7sKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765734632; c=relaxed/simple;
	bh=guyPnnxNDLlfGGwk7ygeM0m2HJKf7wK6nNymv2KAYfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NBflVICpw9zkidXBLy4+1ULvDdDC/qi/ckeXRKpF9cIkFGVwccW3dvd8DmZFx/mHm01Twc3FdYy4+0/Y5MRr0VK1pQX7UVLhpRTIUFn6PoANiv0AaozWvd+UfV5kRngDaYldI8asks1ipFQVsF+rjQ5tJUJmxtVi7qRCXlATtyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Q0aUFhZl; arc=none smtp.client-ip=80.12.242.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Q0aUFhZl"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id UqDZve9EWBoKRUqDZvZY3L; Sun, 14 Dec 2025 18:49:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1765734556;
	bh=8bTXwwa4yWYmr7RPK5yqMVybpKLz/hsRLqe6vIgI6FU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Q0aUFhZlMIAYVtUpnB+Yt+5owMGpqikBvZS7AsEeLg0ZwIqPl5FDLwFkoGjxkdNmX
	 l094Y+/3wL5Ea+GwsjU803rk7oHa/EYRxtETrOrrR45WwlvdDZ/xBHNzBJ0l5hUqJo
	 JWY7cSecI32YgqE56n7HGKUlLnTvgnBgzSlyYquaQE93RD8ZiPFRRpsU5ZcrVglciA
	 HHnJtn0WGrbLxYxyZrbLK+X27jcyc3miJdZbZUklHf4vJNTU9IV4qcnn49VIq+cNYn
	 PgvZxFGi4zPiKWOA5/i/sP5ozpNyQPPF3MUnJ+jpLevSqOR0nvi1l6X72PhVno7dGd
	 2MNYZRVzufp2A==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Dec 2025 18:49:16 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] stm class: Constify struct configfs_item_operations and configfs_group_operations
Date: Sun, 14 Dec 2025 18:49:09 +0100
Message-ID: <b5811c1c5efdc6e9c8eb4886b8046b50b09c37f0.1765734533.git.christophe.jaillet@wanadoo.fr>
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
  11786	   4216	     64	  16066	   3ec2	drivers/hwtracing/stm/policy.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  12202	   3800	     64	  16066	   3ec2	drivers/hwtracing/stm/policy.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This change is possible since commits f2f36500a63b and f7f78098690d.
---
 drivers/hwtracing/stm/policy.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/stm/policy.c b/drivers/hwtracing/stm/policy.c
index 42103c3a177f..a1af8d585fc9 100644
--- a/drivers/hwtracing/stm/policy.c
+++ b/drivers/hwtracing/stm/policy.c
@@ -181,7 +181,7 @@ static void stp_policy_node_release(struct config_item *item)
 	kfree(node);
 }
 
-static struct configfs_item_operations stp_policy_node_item_ops = {
+static const struct configfs_item_operations stp_policy_node_item_ops = {
 	.release		= stp_policy_node_release,
 };
 
@@ -270,7 +270,7 @@ stp_policy_node_drop(struct config_group *group, struct config_item *item)
 	config_item_put(item);
 }
 
-static struct configfs_group_operations stp_policy_node_group_ops = {
+static const struct configfs_group_operations stp_policy_node_group_ops = {
 	.make_group	= stp_policy_node_make,
 	.drop_item	= stp_policy_node_drop,
 };
@@ -364,11 +364,11 @@ static void stp_policy_release(struct config_item *item)
 	kfree(policy);
 }
 
-static struct configfs_item_operations stp_policy_item_ops = {
+static const struct configfs_item_operations stp_policy_item_ops = {
 	.release		= stp_policy_release,
 };
 
-static struct configfs_group_operations stp_policy_group_ops = {
+static const struct configfs_group_operations stp_policy_group_ops = {
 	.make_group	= stp_policy_node_make,
 };
 
@@ -466,7 +466,7 @@ stp_policy_make(struct config_group *group, const char *name)
 	return ret;
 }
 
-static struct configfs_group_operations stp_policy_root_group_ops = {
+static const struct configfs_group_operations stp_policy_root_group_ops = {
 	.make_group	= stp_policy_make,
 };
 
-- 
2.52.0

