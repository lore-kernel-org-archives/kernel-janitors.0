Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEC3C433DB
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Mar 2021 14:58:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E034161A01
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Mar 2021 14:58:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbhCYO5b (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 Mar 2021 10:57:31 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14546 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbhCYO5F (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Mar 2021 10:57:05 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5p6G0hD8zPlHS;
        Thu, 25 Mar 2021 22:54:30 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.177.129) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 22:56:52 +0800
From:   'Qiheng Lin <linqiheng@huawei.com>
To:     <linqiheng@huawei.com>, Petko Manolov <petkan@nucleusys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <netdev@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH net-next] net: usb: pegasus: Remove duplicated include from pegasus.c
Date:   Thu, 25 Mar 2021 22:56:52 +0800
Message-ID: <20210325145652.13469-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.174.177.129]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Qiheng Lin <linqiheng@huawei.com>

Remove duplicated include.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/net/usb/pegasus.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index 9a907182569c..e0ee5c096396 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -65,7 +65,6 @@ static struct usb_eth_dev usb_dev_id[] = {
 	{.name = pn, .vendor = vid, .device = pid, .private = flags},
 #define PEGASUS_DEV_CLASS(pn, vid, pid, dclass, flags) \
 	PEGASUS_DEV(pn, vid, pid, flags)
-#include "pegasus.h"
 #undef	PEGASUS_DEV
 #undef	PEGASUS_DEV_CLASS
 	{NULL, 0, 0, 0},
@@ -84,7 +83,6 @@ static struct usb_device_id pegasus_ids[] = {
 #define PEGASUS_DEV_CLASS(pn, vid, pid, dclass, flags) \
 	{.match_flags = (USB_DEVICE_ID_MATCH_DEVICE | USB_DEVICE_ID_MATCH_DEV_CLASS), \
 	.idVendor = vid, .idProduct = pid, .bDeviceClass = dclass},
-#include "pegasus.h"
 #undef	PEGASUS_DEV
 #undef	PEGASUS_DEV_CLASS
 	{},

