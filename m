Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFC8C433B4
	for <kernel-janitors@archiver.kernel.org>; Sat,  8 May 2021 01:51:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EE11613C8
	for <kernel-janitors@archiver.kernel.org>; Sat,  8 May 2021 01:51:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbhEHBwW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 7 May 2021 21:52:22 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:17154 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhEHBwT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 May 2021 21:52:19 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FcVZR4yV9znc3D;
        Sat,  8 May 2021 09:47:59 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Sat, 8 May 2021
 09:51:09 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <cuibixuan@huawei.com>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] locking/static_keys: Make some symbols static
Date:   Sat, 8 May 2021 11:14:41 +0800
Message-ID: <20210508031441.53349-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The sparse tool complains as follows:

lib/test_static_keys.c:15:19: warning:
 symbol 'old_true_key' was not declared. Should it be static?
lib/test_static_keys.c:16:19: warning:
 symbol 'old_false_key' was not declared. Should it be static?
lib/test_static_keys.c:19:1: warning:
 symbol 'true_key' was not declared. Should it be static?
lib/test_static_keys.c:20:1: warning:
 symbol 'false_key' was not declared. Should it be static?

This symbol is not used outside of test_static_keys.c, so this
commit marks it static.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 lib/test_static_keys.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/test_static_keys.c b/lib/test_static_keys.c
index 42daa74be029..17a185312097 100644
--- a/lib/test_static_keys.c
+++ b/lib/test_static_keys.c
@@ -12,12 +12,12 @@
 #include <linux/jump_label.h>
 
 /* old keys */
-struct static_key old_true_key	= STATIC_KEY_INIT_TRUE;
-struct static_key old_false_key	= STATIC_KEY_INIT_FALSE;
+static struct static_key old_true_key	= STATIC_KEY_INIT_TRUE;
+static struct static_key old_false_key	= STATIC_KEY_INIT_FALSE;
 
 /* new api */
-DEFINE_STATIC_KEY_TRUE(true_key);
-DEFINE_STATIC_KEY_FALSE(false_key);
+static DEFINE_STATIC_KEY_TRUE(true_key);
+static DEFINE_STATIC_KEY_FALSE(false_key);
 
 /* external */
 extern struct static_key base_old_true_key;

