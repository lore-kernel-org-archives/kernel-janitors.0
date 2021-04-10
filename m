Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B888C433B4
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 06:49:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18C066115A
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 06:49:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbhDJGt4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 10 Apr 2021 02:49:56 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:16436 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhDJGtz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 10 Apr 2021 02:49:55 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FHQXt5HmtzqSs5;
        Sat, 10 Apr 2021 14:47:26 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.176.196) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Sat, 10 Apr 2021 14:49:32 +0800
From:   Qiheng Lin <linqiheng@huawei.com>
To:     <linqiheng@huawei.com>, Ian Abbott <abbotti@mev.co.uk>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Deepak R Varma <mh12gx2825@gmail.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
CC:     <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] staging: comedi: tests: ni_routes_test: Remove unused variable 'olddevroutes'
Date:   Sat, 10 Apr 2021 14:49:32 +0800
Message-ID: <20210410064932.12905-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

GCC reports the following warning with W=1:

drivers/staging/comedi/drivers/tests/ni_routes_test.c:215:45: warning:
 variable 'olddevroutes' set but not used [-Wunused-but-set-variable]
  215 |  const struct ni_device_routes *devroutes, *olddevroutes;
      |                                             ^~~~~~~~~~~~

This variable is not used in function , this commit
remove it to fix the warning.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 .../staging/comedi/drivers/tests/ni_routes_test.c  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/comedi/drivers/tests/ni_routes_test.c b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
index 48e4a7a9cd14..652362486ff6 100644
--- a/drivers/staging/comedi/drivers/tests/ni_routes_test.c
+++ b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
@@ -212,7 +212,7 @@ static bool route_set_sources_in_order(const struct ni_device_routes *devroutes)
 
 static void test_ni_assign_device_routes(void)
 {
-	const struct ni_device_routes *devroutes, *olddevroutes;
+	const struct ni_device_routes *devroutes;
 	const u8 *table, *oldtable;
 
 	init_pci_6070e();
@@ -248,7 +248,6 @@ static void test_ni_assign_device_routes(void)
 		 RVI(table, B(NI_AI_ConvertClock), B(NI_PFI(2))) == V(NI_PFI_OUTPUT_AI_CONVERT),
 		 "pci-6070e finds e-series route_values table\n");
 
-	olddevroutes = devroutes;
 	oldtable = table;
 	init_pci_6220();
 	ni_assign_device_routes(ni_mseries, pci_6220, NULL,

