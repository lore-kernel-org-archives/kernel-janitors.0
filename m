Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2274C2C8
	for <kernel-janitors@vger.kernel.org>; Sun,  9 Aug 2026 12:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786279010; cv=none; b=XunW6ocwfPsAntQ7ue8m7WsapX0kAQ3AG/EKWyPEvKijztK9tel1AqU8ZZcKksdBLpaNSZWVP6oFiKjhC8PPUSpVgVUDCGonqShpSk0whN2dspFe5kLdvDPPjcUJAoL786f7TUlFriDQoqiF7KGVfnapU50Ky/w/lEuBKa6/tBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786279010; c=relaxed/simple;
	bh=dUdn8Ht5DM9KrCx9Q10ogq+sjtq9EosqRAoZJ1qAdl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P6181gfAwrmsmXnrlc8LL3lc21Q0uptHgrWBV73lnvc9F+UhUhVi1QGZmU2Hs6wjGvlndY1j6TZEzi1tRe8D+3ZHdThRPO8a5htjSRCEDdBiCSRWNsmbMsnAHaHvFLxWUGtjF5ofe/dVFu3m5Ydcy4bdS0eVFt9WB25nT9LjWT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=s9Buy3PB; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="s9Buy3PB"
Received: from device-101.home ([10.64.95.113])
	by smtp.orange.fr with ESMTP
	id t2kdwrv7z4aoQt2kdwrnzi; Sun, 09 Aug 2026 14:35:39 +0200
Received: from device-101.home ([IPv6:2a01:cb10:785:b00:6128:9b8c:c203:905])
	by smtp.orange.fr with ESMTPSA
	id t2kUwDJU2YUEJt2kVwP9WI; Sun, 09 Aug 2026 14:35:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1786278932;
	bh=Jg1FTfakvxQChjWFmfjj9AY9yITZ6OKAndXT39v66a8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=s9Buy3PBDs2V0xzzy4iU5WR1zEFzXFQW8m1EZTx5KjcUvQCmDEy62nItTuZaDJ8+x
	 fy6FZfo/ikavO6kRe5R/A8mflmbljYJmjlSpDnpcGR8oD9wQbbOdgVlIqXSAq5xC4E
	 4HQnEtVcBS17ApqyPjQwGThJuXiUdAZVvt4gqFkTs+kXQu5vvuz7RcSw/QroQCX7qM
	 q+QhEaUMeZqBaU1WZEwXTomTJ5lovxh/9M6U1rFyckSIab97/+VyysK/W4XRCZwlpl
	 RJR/99Pq7+MVFX9f1F+FMqlWspTugjxfFoki3ImK0vAq8YxHoguBOwFbq9XUxZD9gL
	 REgoVmD3QuNFQ==
X-ME-Helo: device-101.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 09 Aug 2026 14:35:32 +0200
X-ME-IP: 2a01:cb10:785:b00:6128:9b8c:c203:905
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] extcon: usbc-tusb320: Constify struct tusb320_ops
Date: Sun,  9 Aug 2026 14:35:28 +0200
Message-ID: <f0d7dbdc9794f13b424d3f6e21685d778ef31e5f.1786278909.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct tusb320_ops' is not modified in these drivers.

Constifying this structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  19942	   6128	     64	  26134	   6616	drivers/extcon/extcon-usbc-tusb320.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  19949	   6000	     64	  26013	   659d	drivers/extcon/extcon-usbc-tusb320.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/extcon/extcon-usbc-tusb320.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-usbc-tusb320.c b/drivers/extcon/extcon-usbc-tusb320.c
index 920b03421850..49176b166565 100644
--- a/drivers/extcon/extcon-usbc-tusb320.c
+++ b/drivers/extcon/extcon-usbc-tusb320.c
@@ -203,11 +203,11 @@ static int tusb320l_get_revision(struct tusb320_priv *priv, unsigned int *revisi
 	return regmap_read(priv->regmap, TUSB320L_REGA0_REVISION, revision);
 }
 
-static struct tusb320_ops tusb320_ops = {
+static const struct tusb320_ops tusb320_ops = {
 	.set_mode = tusb320_set_mode,
 };
 
-static struct tusb320_ops tusb320l_ops = {
+static const struct tusb320_ops tusb320l_ops = {
 	.set_mode = tusb320l_set_mode,
 	.get_revision = tusb320l_get_revision,
 };
-- 
2.55.0

