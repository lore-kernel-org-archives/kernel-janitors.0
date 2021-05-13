Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3470C43461
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 May 2021 11:16:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B79A4613CB
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 May 2021 11:16:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbhEMLRL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 13 May 2021 07:17:11 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:2473 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233253AbhEMLQz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 May 2021 07:16:55 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Fgpt111JszBv4Z;
        Thu, 13 May 2021 19:12:57 +0800 (CST)
Received: from huawei.com (10.67.174.117) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Thu, 13 May 2021
 19:15:29 +0800
From:   Ruiqi Gong <gongruiqi1@huawei.com>
To:     <gongruiqi1@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Wang Weiyang <wangweiyang2@huawei.com>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] drivers/base/node.c: make CACHE_ATTR define static DEVICE_ATTR_RO
Date:   Thu, 13 May 2021 19:07:16 +0800
Message-ID: <20210513110716.25791-1-gongruiqi1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.174.117]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The Sparse tool reports as follows:

drivers/base/node.c:239:1: warning:
 symbol 'dev_attr_line_size' was not declared. Should it be static?
drivers/base/node.c:240:1: warning:
 symbol 'dev_attr_indexing' was not declared. Should it be static?

These symbols (and several others) are defined by DEVICE_ATTR_RO(name) in
CACHE_ATTR(name, fmt), and all of them are not used outside of node.c. So let's
mark DEVICE_ATTR_RO(name) static to solve these complains from Sparse.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ruiqi Gong <gongruiqi1@huawei.com>
---
 drivers/base/node.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index f449dbb2c746..27f251c2742a 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -233,7 +233,7 @@ static ssize_t name##_show(struct device *dev,				\
 	return sysfs_emit(buf, fmt "\n",				\
 			  to_cache_info(dev)->cache_attrs.name);	\
 }									\
-DEVICE_ATTR_RO(name);
+static DEVICE_ATTR_RO(name);
 
 CACHE_ATTR(size, "%llu")
 CACHE_ATTR(line_size, "%u")

