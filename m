Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2615925753
	for <kernel-janitors@vger.kernel.org>; Sat, 16 Dec 2023 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="tN79UuHH"
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id EXpEryfYLLMHAEXpEr0s2X; Sat, 16 Dec 2023 17:47:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702745261;
	bh=WZUiXIzL+1Xu6VLydlUDdYsPfdAWNV1xrKK5PwkOP6U=;
	h=From:To:Cc:Subject:Date;
	b=tN79UuHHlTwW6A2typtF5+qkXQaaeMWtvf7mFzssLvxbnxe7It0Ky5japWAhjuj4b
	 guRsIEBzyOoyG4x1Yw6Ap+MOs6puK97GHapRIovBQvj+kWnXRZ0p7ftv+x7fpyntXz
	 fU5QhEnpynGKQ6In0P6K9r4ZrF6rsDEEt2G7q8VksHPksdLod6imsCAvoYFnyhg3Dg
	 sDA0U5vlPAmPgZ1reiqWYHvcZ5Rxgub44OT9kd1aRlysapJxOpFGMoYlTg3mNaPWhH
	 NLdzuObSjGFIDQ/ZLwerrf1XZWs2fz8zGCwJ3Ck4RxoodIWJQSE0UOt3npPROeZKq6
	 E907+JCRlg2kA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 16 Dec 2023 17:47:41 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	alsa-devel@alsa-project.org
Subject: [PATCH] slimbus: core: Remove usage of the deprecated ida_simple_xx() API
Date: Sat, 16 Dec 2023 17:47:34 +0100
Message-Id: <8402a9a8a45937fe2e62617ff0c7408503692b20.1702745212.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

Note that the upper limit of ida_simple_get() is exclusive, but the one of
ida_alloc_range() is inclusive. So change this change allows one more
device. Previously address 0xFE was never used.

Fixes: 46a2bb5a7f7e ("slimbus: core: Add slim controllers support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
/!\ Untested /!\

The change of behavior is motivated by the comment in
drivers/slimbus/slimbus.h stating that /* Manager's logical address is set
to 0xFF per spec */, so all other values, including 0xFE should be valid,
IMHO.

So considering this as a bug-fix, I added a Fixes tag.
---
 drivers/slimbus/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index d43873bb5fe6..01cbd4621981 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -436,8 +436,8 @@ static int slim_device_alloc_laddr(struct slim_device *sbdev,
 		if (ret < 0)
 			goto err;
 	} else if (report_present) {
-		ret = ida_simple_get(&ctrl->laddr_ida,
-				     0, SLIM_LA_MANAGER - 1, GFP_KERNEL);
+		ret = ida_alloc_max(&ctrl->laddr_ida,
+				    SLIM_LA_MANAGER - 1, GFP_KERNEL);
 		if (ret < 0)
 			goto err;
 
-- 
2.34.1

