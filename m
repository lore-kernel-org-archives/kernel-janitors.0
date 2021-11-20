Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5D6C433EF
	for <kernel-janitors@archiver.kernel.org>; Sat, 20 Nov 2021 18:22:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237869AbhKTSZm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 20 Nov 2021 13:25:42 -0500
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:52603 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237844AbhKTSZl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 20 Nov 2021 13:25:41 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id oV0UmDpuNozlioV0UmJ4vf; Sat, 20 Nov 2021 19:22:34 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 20 Nov 2021 19:22:34 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     dhowells@redhat.com
Cc:     linux-cachefs@redhat.com, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] CacheFiles: Slightly simplify 'cachefiles_has_space()'
Date:   Sat, 20 Nov 2021 19:22:32 +0100
Message-Id: <495d769a2b90ebad5f21bdfb4df3800cb5d9a627.1637432444.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "CACHEFILES_CULLING" bit is tested twice. Once with 'test_bit()' and
once with 'test_and_clear_bit()'.
Remove the first test.

While at it, bring back a ')' at the end of a line to be more compliant
with Linux coding style.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
If testing the bit first was a kind of optimization, a few words shoul
explained it.
---
 fs/cachefiles/daemon.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 752c1e43416f..be8f2ec453b6 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -725,11 +725,9 @@ int cachefiles_has_space(struct cachefiles_cache *cache,
 	    stats.f_bavail < cache->bcull)
 		goto begin_cull;
 
-	if (test_bit(CACHEFILES_CULLING, &cache->flags) &&
-	    stats.f_ffree >= cache->frun &&
+	if (stats.f_ffree >= cache->frun &&
 	    stats.f_bavail >= cache->brun &&
-	    test_and_clear_bit(CACHEFILES_CULLING, &cache->flags)
-	    ) {
+	    test_and_clear_bit(CACHEFILES_CULLING, &cache->flags)) {
 		_debug("cease culling");
 		cachefiles_state_changed(cache);
 	}
-- 
2.30.2

