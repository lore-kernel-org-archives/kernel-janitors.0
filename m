Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B23C433EF
	for <kernel-janitors@archiver.kernel.org>; Sun, 26 Sep 2021 06:55:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2399C60F9C
	for <kernel-janitors@archiver.kernel.org>; Sun, 26 Sep 2021 06:55:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhIZG5V (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 26 Sep 2021 02:57:21 -0400
Received: from dvalin.narfation.org ([213.160.73.56]:43032 "EHLO
        dvalin.narfation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbhIZG5U (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 26 Sep 2021 02:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
        s=20121; t=1632639337;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=yWtEe8tQJN4o8o0EqZ9sup95CePFkupC9tPYt9r92NI=;
        b=qLK5W6SUpk//TdNQIw9mmo2CYRa75wFIf7EvCXAATlTxxUvpP2NkRvgn8Ml/2Tz+lAeLDu
        jB6ufRb1jz0Wtw5qAQ5ASKNY84r4jspAxnqU2MpS4jjSxrh3jYW1f2GBKUG6tVsDL53v7q
        z5ZXgjUykczjKVOOoWy3uTlK01uzcIw=
From:   Sven Eckelmann <sven@narfation.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Colin King <colin.king@canonical.com>,
        Sven Eckelmann <sven@narfation.org>
Subject: scripts/spelling.txt: Fix "mistake" version of "synchronization"
Date:   Sun, 26 Sep 2021 08:55:29 +0200
Message-Id: <20210926065529.6880-1-sven@narfation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If both "mistake" version and "correction" version are the same, a warning
message is created by checkpatch which is impossible to fix. But it was
noticed that Colan Ian King created a commit e6c0a0889b80 ("ALSA: aloop:
Fix spelling mistake "synchronization" -> "synchronization"") which
suggests that this spelling mistake was fixed by replacing the word
"synchronization" with itself. But the actual diff shows that the mistake
in the code was "sychronization". It is rather likely that the "mistake"
in spelling.txt should have been the latter.

Fixes: 2e74c9433ba8 ("scripts/spelling.txt: add more spellings to spelling.txt")
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
This was already reported last week in https://lore.kernel.org/all/1930750.yhyOXdeGKK@sven-l14/

diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index fd8f07317b8e1c572e1e0f6bb4f9e01dff96c17c..acf6ea71129921ad77a201d13761382ee032483e 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -1450,7 +1450,7 @@ syfs||sysfs
 symetric||symmetric
 synax||syntax
 synchonized||synchronized
-synchronization||synchronization
+sychronization||synchronization
 synchronuously||synchronously
 syncronize||synchronize
 syncronized||synchronized
