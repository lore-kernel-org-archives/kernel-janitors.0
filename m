Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91623C197C;
	Sat,  1 Aug 2026 19:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785611438; cv=none; b=GyAAT86ocDGSUCdAmgHgMPG0dEFVtpBLJRnPw7s6pFIbsStIgdAeWpn1EiNRezQ9au9NJEipFZcSN/Ba9JicazKwELWNgkdiTUaCeiu8rtl3JQ+KZhjZ4JVBa+xou0uI2igoPqw36hS76gcWmsvDFRNhfpqJ1L80qBUGAtigIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785611438; c=relaxed/simple;
	bh=4EQlNqYxYgD5x8ZAXCCNyxz20Go/n+sxp09BXOkcZ+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b7ZpsHY5FhJRscz9/4YSmHmaUqfyDwOBMgv3yNj9Zgtr9q0z5GI5PZJl67OgNV0/uUQY4SAGmZ/Wrt7Rymbxb2iCi9IiYD5mWzeAZIwhcTCFThAVCmyEnIJjHU9LcAh3x8PVwFyW/rB+TEBr2H5QGqI79ISXQzij7OGyChAJp+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=czINYRMX; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="czINYRMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HdVgqiInRqLMNOERRNZocsy0PaE4d6gwvU6kZNk9p50=;
  b=czINYRMXixaConSiuJweyGE0XD94RDSxzTLBGz7uai1HH3nwB5BCA71u
   A5Kct70qZZIxox2cLF4xYoS/KoczNDhIKxvK3eT0aXlI4yBubbw1gi/TC
   +EkCwgJ9VhpfVcplMOZZQaSWFgTmYYiv6obmvQzidy/mZQKAWPftre0hf
   0=;
X-CSE-ConnectionGUID: xMBn0egZTdWQudcP5jJskw==
X-CSE-MsgGUID: Lj0lJnYzRtyPkrHEUjovnw==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,198,1779141600"; 
   d="scan'208";a="288769009"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 21:10:08 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel-janitors@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: marvell: cafe: drop unneeded semicolon
Date: Sat,  1 Aug 2026 21:09:53 +0200
Message-Id: <20260801191002.1383835-7-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a function-like macro expands to an expression, that expression
doesn't need a semicolon after it.  All uses have been verified to
have their own semicolons.

This was found using the following Coccinelle semantic patch:

@r@
identifier i : script:ocaml() { String.lowercase_ascii i = i };
expression e;
@@

*#define i(...) e;

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/platform/marvell/cafe-driver.c |    2 +-
 drivers/media/platform/marvell/mcam-core.c   |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/marvell/cafe-driver.c b/drivers/media/platform/marvell/cafe-driver.c
index 22034df6c..13d8faaab 100644
--- a/drivers/media/platform/marvell/cafe-driver.c
+++ b/drivers/media/platform/marvell/cafe-driver.c
@@ -127,7 +127,7 @@ struct cafe_camera {
  * Debugging and related.
  */
 #define cam_err(cam, fmt, arg...) \
-	dev_err(&(cam)->pdev->dev, fmt, ##arg);
+	dev_err(&(cam)->pdev->dev, fmt, ##arg)
 #define cam_warn(cam, fmt, arg...) \
 	dev_warn(&(cam)->pdev->dev, fmt, ##arg);
 
diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
index b8360d370..c1e8a2a30 100644
--- a/drivers/media/platform/marvell/mcam-core.c
+++ b/drivers/media/platform/marvell/mcam-core.c
@@ -224,11 +224,11 @@ static void mcam_buffer_done(struct mcam_camera *cam, int frame,
  * Debugging and related.
  */
 #define cam_err(cam, fmt, arg...) \
-	dev_err((cam)->dev, fmt, ##arg);
+	dev_err((cam)->dev, fmt, ##arg)
 #define cam_warn(cam, fmt, arg...) \
-	dev_warn((cam)->dev, fmt, ##arg);
+	dev_warn((cam)->dev, fmt, ##arg)
 #define cam_dbg(cam, fmt, arg...) \
-	dev_dbg((cam)->dev, fmt, ##arg);
+	dev_dbg((cam)->dev, fmt, ##arg)
 
 
 /*

