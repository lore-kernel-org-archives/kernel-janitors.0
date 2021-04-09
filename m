Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDC6C43460
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 09:43:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EAD3611C1
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 09:43:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233005AbhDIJnk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Apr 2021 05:43:40 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:16873 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbhDIJnh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 05:43:37 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FGtSG21N4zlWyJ;
        Fri,  9 Apr 2021 17:41:34 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 17:43:12 +0800
From:   Ye Bin <yebin10@huawei.com>
To:     <yebin10@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] usb: ftdi-elan: use DEFINE_MUTEX() for mutex lock and LIST_HEAD for list head
Date:   Fri, 9 Apr 2021 17:51:37 +0800
Message-ID: <20210409095137.2293813-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

mutex lock can be initialized automatically with DEFINE_MUTEX()
rather than explicitly calling mutex_init().
list head can be initialized automatically with LIST_HEAD()
rather than explicitly calling INIT_LIST_HEAD().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/usb/misc/ftdi-elan.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/ftdi-elan.c b/drivers/usb/misc/ftdi-elan.c
index 8a3d9c0c8d8b..6dc17092b095 100644
--- a/drivers/usb/misc/ftdi-elan.c
+++ b/drivers/usb/misc/ftdi-elan.c
@@ -61,9 +61,9 @@ extern struct platform_driver u132_platform_driver;
  * ftdi_module_lock exists to protect access to global variables
  *
  */
-static struct mutex ftdi_module_lock;
+static DEFINE_MUTEX(ftdi_module_lock);
 static int ftdi_instances = 0;
-static struct list_head ftdi_static_list;
+static LIST_HEAD(ftdi_static_list);
 /*
  * end of the global variables protected by ftdi_module_lock
  */
@@ -2761,8 +2761,6 @@ static int __init ftdi_elan_init(void)
 {
 	int result;
 	pr_info("driver %s\n", ftdi_elan_driver.name);
-	mutex_init(&ftdi_module_lock);
-	INIT_LIST_HEAD(&ftdi_static_list);
 	result = usb_register(&ftdi_elan_driver);
 	if (result) {
 		pr_err("usb_register failed. Error number %d\n", result);

