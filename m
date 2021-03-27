Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E3FC433E5
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 09:53:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6851961A02
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 09:53:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhC0JxJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 27 Mar 2021 05:53:09 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:15357 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbhC0Jww (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 27 Mar 2021 05:52:52 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F6vGk5Jd3z8y9b;
        Sat, 27 Mar 2021 17:50:38 +0800 (CST)
Received: from huawei.com (10.67.174.78) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Sat, 27 Mar 2021
 17:52:30 +0800
From:   Chen Lifu <chenlifu@huawei.com>
To:     <chenlifu@huawei.com>, Sekhar Nori <nsekhar@ti.com>,
        Russell King <linux@armlinux.org.uk>
CC:     <heying24@huawei.com>, <yuehaibing@huawei.com>,
        <weiyongjun1@huawei.com>, <johnny.chenyi@huawei.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] ARM: davinci: dm646x-evm: use DEFINE_SPINLOCK() for spinlock
Date:   Sat, 27 Mar 2021 17:52:26 +0800
Message-ID: <20210327095226.105039-1-chenlifu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.174.78]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Lifu Chen <chenlifu@huawei.com>

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Lifu Chen <chenlifu@huawei.com>
---
 arch/arm/mach-davinci/board-dm646x-evm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index 952ddabc743e..a07b5f83a373 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -470,7 +470,7 @@ static struct davinci_i2c_platform_data i2c_pdata = {
 #define TVP5147_CH1		"tvp514x-1"
 
 /* spin lock for updating above registers */
-static spinlock_t vpif_reg_lock;
+static DEFINE_SPINLOCK(vpif_reg_lock);
 
 static int set_vpif_clock(int mux_mode, int hd)
 {
@@ -746,8 +746,6 @@ static struct vpif_capture_config dm646x_vpif_capture_cfg = {
 
 static void __init evm_init_video(void)
 {
-	spin_lock_init(&vpif_reg_lock);
-
 	dm646x_setup_vpif(&dm646x_vpif_display_config,
 			  &dm646x_vpif_capture_cfg);
 }

