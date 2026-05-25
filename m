Received: from smtp.smtpout.orange.fr (smtp-71.smtpout.orange.fr [80.12.242.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38143815EC
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711878; cv=none; b=JWASDCaDdSwH6D88IOwBByAc4tZIR2Td1tUtFF/MXqHzrUXg6nGwnp+HZtD484zlD8WcwAmZUhhPHH8j7IDtvMtdqMmomzUfqufonirJtj46Yd9C4gTKWqRDpVHgRT1Dnd+AMhjchsPTjBUgP/GhTdDZU7Cdej8yfl7SL5cGANY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711878; c=relaxed/simple;
	bh=6Lf9rTVqmT2MFhxoqT3iHGX6OQQpUWL2dsRdkam0Sgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DGw+zzt3K9kNZCzL+iF9XPm9iKTssbRTJS88RPKBVyskSReaSzg1LJ1KlLo4V/XQSuDYnkUsy0FAZnIi2dwDexLsFMmKEFebCIWdZK5b3aG+TS4FXY6xRG5hqTViZvZkdGkYweJ5agIgqja/2jHK0L5qDuSRKlCopN0BeUaHsf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=RASC9K7/; arc=none smtp.client-ip=80.12.242.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="RASC9K7/"
Received: from fedora.home ([10.65.86.59])
	by smtp.orange.fr with ESMTP
	id RUL6wlWOiYXA2RUL6wAVRV; Mon, 25 May 2026 14:23:24 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id RUKswQkLW4u6pRUKswqNto; Mon, 25 May 2026 14:23:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1779711796;
	bh=m/R8tIupwdX7jr/A/rbgZTkdQCVVpjuXnm7Y+aWrBTk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RASC9K7/vqJDXtXIjmeBvHKBP27uN67YvEpWjaj7UIADGAn3HydAvmno88qyNvJBW
	 +61G0IsHID67iGz+EUGteKCg95vE1KQExy7KvfCj6dCtF7g6+tcqHItMCdOjILhWSZ
	 XPOsyi/vf85SutuJpuymUuCX24pygOx019ER4hgfUsFdFeK0uWgecpz10pO0zSm3Wq
	 19I4MDJb4VrO3Yk0nXv+dA7OEYOK/ZZ3G0x9CaPpkBiyuQixq+/Saiv0rD/QzA4GMa
	 tlS70uAw+pW/d0fjnG9fC4x4OMKJ1ygd6rJm0FIbTZxSzVQQzGb4ZzKtXYRoMq49fn
	 UecsywFdsLlFQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 25 May 2026 14:23:16 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	netdev@vger.kernel.org
Subject: [PATCH net-next] netconsole: Constify struct configfs_item_operations and configfs_group_operations
Date: Mon, 25 May 2026 14:23:00 +0200
Message-ID: <7ff56bdb0cee826a56365f930dcdf457b44931df.1779711734.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.54.0
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
  64259	  24272	    608	  89139	  15c33	drivers/net/netconsole.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  64579	  23952	    608	  89139	  15c33	drivers/net/netconsole.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/net/netconsole.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index d804d44af87c..8ecc2c71c699 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -1264,7 +1264,7 @@ static void userdatum_release(struct config_item *item)
 	kfree(to_userdatum(item));
 }
 
-static struct configfs_item_operations userdatum_ops = {
+static const struct configfs_item_operations userdatum_ops = {
 	.release = userdatum_release,
 };
 
@@ -1319,7 +1319,7 @@ static struct configfs_attribute *userdata_attrs[] = {
 	NULL,
 };
 
-static struct configfs_group_operations userdata_ops = {
+static const struct configfs_group_operations userdata_ops = {
 	.make_item		= userdatum_make_item,
 	.drop_item		= userdatum_drop,
 };
@@ -1370,7 +1370,7 @@ static void netconsole_target_release(struct config_item *item)
 	kfree(nt);
 }
 
-static struct configfs_item_operations netconsole_target_item_ops = {
+static const struct configfs_item_operations netconsole_target_item_ops = {
 	.release		= netconsole_target_release,
 };
 
@@ -1480,7 +1480,7 @@ static void drop_netconsole_target(struct config_group *group,
 	config_item_put(&nt->group.cg_item);
 }
 
-static struct configfs_group_operations netconsole_subsys_group_ops = {
+static const struct configfs_group_operations netconsole_subsys_group_ops = {
 	.make_group	= make_netconsole_target,
 	.drop_item	= drop_netconsole_target,
 };
-- 
2.54.0

