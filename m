Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B203C1F22;
	Sat,  1 Aug 2026 19:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785611449; cv=none; b=SnZoEHx+jXaPcp7VjhM+IjCDXK+OWV+WKRgzkBm37IWWA35H32swFHt73Pq9DkBosDazhOQjFJSdsK3H8Kj3vNw+lmcME9n+CTXWNqeTShtenyZGdudhrK4DP4v11J8dM9EXtzukuj9svD5wSR7NAKqgkL6QgpVM0B/Amfk3Qx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785611449; c=relaxed/simple;
	bh=Nbn2eiUDsr2LpxfFyAKnm8wh6Od0rbThODgjaGHHQzw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XPHlFQIeEamHsLVuuFQqrn0sGRigeSG52Evq96gI8c/tuUDXjM7rKEhI5LF5j9sP0/0og5bwWhbxnxohLY3Z+X1UkIFDd45/Xu57RfBnbs6khbor/LPxWdrMdiVDnXmRSS+XXna2PmL+ubMfuro90Qch8YmBnjACLmSVp5ol4sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=tw+b16RV; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="tw+b16RV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DevNZHJKHpefnQHalQJ87NBsfR6SOLOfQBUn/1snJN8=;
  b=tw+b16RVOkih0p0gx94zj4pbQzY+Er2c9TdWahfDZRzhPiBdPgSGPleo
   lxsFYj+kPXAjqLfukvAglWUenIB/OdAr3AiG1OTLFJUL9gucvRJwn7iRJ
   hvROFRnQFo56YraLXqGCwVBzDls4JYZFzkqQtrD+FzX85EhRSPFbm7SJx
   Y=;
X-CSE-ConnectionGUID: v7fRk4gmThG0Tp5LBSF7CA==
X-CSE-MsgGUID: R8ghBiHLT2GaZUedFnWU2w==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,198,1779141600"; 
   d="scan'208";a="288769014"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 21:10:08 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Malcolm Priestley <tvboxspy@gmail.com>
Cc: kernel-janitors@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: lmedm04: drop unneeded semicolon
Date: Sat,  1 Aug 2026 21:09:58 +0200
Message-Id: <20260801191002.1383835-12-Julia.Lawall@inria.fr>
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
 drivers/media/usb/dvb-usb-v2/lmedm04.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index 05c18b6de..e9e407f4e 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -85,7 +85,7 @@ static int dvb_usb_lme2510_debug;
 } while (0)
 #define deb_info(level, args...) lme_debug(dvb_usb_lme2510_debug, level, args)
 #define debug_data_snipet(level, name, p) \
-	 deb_info(level, name" (%8phN)", p);
+	 deb_info(level, name" (%8phN)", p)
 #define info(args...) pr_info(DVB_USB_LOG_PREFIX": "args)
 
 module_param_named(debug, dvb_usb_lme2510_debug, int, 0644);

