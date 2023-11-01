Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D7DD26B
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Rk+wJHPW"
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE01DB
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 02:38:05 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id y7fmqyDrRdFbKy7fnqnDdw; Wed, 01 Nov 2023 10:38:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698831483;
	bh=ad2YBC4kdC7h9yIQ+wHLqq1yakTOU/H6sF4OhosOPYI=;
	h=From:To:Cc:Subject:Date;
	b=Rk+wJHPWYeECroi7Y+yzItW+7eeAsQBmnZwcuGilA1G2EXtphCiOolBwEPBPvy0tA
	 B+6fmnkP1O1nS8hfLaARQKPxd7pien4SUiq3UGMmOsVUDe6EO4L/08+rAojMtBjr+a
	 D80s1PqL6T60vEjOh0CZ2vvFN2Ml3ui3ZjSNxTPxoOGwcOB5Ma54GwkwJ8Loy6FMn1
	 fsnGw5mgMqx0ASLcvkvKKjCDw3Zk9kbXU7mp9+iAEwiyjNwEICdEoWs8+WxkaZWmsN
	 BFtsHKnR236AGEUiLJD+No//GM1TFewr92SN4hEQPy83ktf/hQBymgzS9GRB+8P2Fu
	 k03XqWn7PjICw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 01 Nov 2023 10:38:03 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-input@vger.kernel.org
Subject: [PATCH] HID: sony: Remove usage of the deprecated ida_simple_xx() API
Date: Wed,  1 Nov 2023 10:38:00 +0100
Message-Id: <19b538bc05c11747a3dd9fa204fde91942063d52.1698831460.git.christophe.jaillet@wanadoo.fr>
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

This is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/hid-sony.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index ebc0aa4e4345..55c0ad61d524 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -1844,8 +1844,7 @@ static int sony_set_device_id(struct sony_sc *sc)
 	 * All others are set to -1.
 	 */
 	if (sc->quirks & SIXAXIS_CONTROLLER) {
-		ret = ida_simple_get(&sony_device_id_allocator, 0, 0,
-					GFP_KERNEL);
+		ret = ida_alloc(&sony_device_id_allocator, GFP_KERNEL);
 		if (ret < 0) {
 			sc->device_id = -1;
 			return ret;
@@ -1861,7 +1860,7 @@ static int sony_set_device_id(struct sony_sc *sc)
 static void sony_release_device_id(struct sony_sc *sc)
 {
 	if (sc->device_id >= 0) {
-		ida_simple_remove(&sony_device_id_allocator, sc->device_id);
+		ida_free(&sony_device_id_allocator, sc->device_id);
 		sc->device_id = -1;
 	}
 }
-- 
2.34.1

