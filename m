Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70B3C433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Mar 2022 19:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245463AbiC1TJR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 28 Mar 2022 15:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245473AbiC1TJQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Mar 2022 15:09:16 -0400
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr [80.12.242.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B5B6662C
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Mar 2022 12:07:34 -0700 (PDT)
Received: from pop-os.home ([90.126.236.122])
        by smtp.orange.fr with ESMTPA
        id YuiCnPo2kuvBOYuiCnOEV4; Mon, 28 Mar 2022 21:07:33 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 28 Mar 2022 21:07:33 +0200
X-ME-IP: 90.126.236.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Tony Luck <tony.luck@intel.com>,
        Zhang Yanmin <yanmin.zhang@intel.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-ia64@vger.kernel.org
Subject: [PATCH 1/2] ia64: topology: Fix an error handling path in cache_add_dev()
Date:   Mon, 28 Mar 2022 21:07:31 +0200
Message-Id: <452b20c160a20754022407acefd2abb170f43d14.1648494330.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If kobject_init_and_add()fails, kobject_put() needs to be called.
Add the missing call which is already there a few lines below in another
error handling path.

Fixes: f19180056ea0 ("[IA64] Export cpu cache info by sysfs")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is provided as-is and is not even compile tested. I don't have the
cross-building toolchain for that.
---
 arch/ia64/kernel/topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/ia64/kernel/topology.c b/arch/ia64/kernel/topology.c
index 94a848b06f15..6adb84f05cbb 100644
--- a/arch/ia64/kernel/topology.c
+++ b/arch/ia64/kernel/topology.c
@@ -354,6 +354,7 @@ static int cache_add_dev(unsigned int cpu)
 				      &cache_ktype_percpu_entry, &sys_dev->kobj,
 				      "%s", "cache");
 	if (unlikely(retval < 0)) {
+		kobject_put(&all_cpu_cache_info[cpu].kobj);
 		cpu_cache_sysfs_exit(cpu);
 		return retval;
 	}
-- 
2.32.0

