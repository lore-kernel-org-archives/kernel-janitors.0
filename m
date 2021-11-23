Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFD7C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 Nov 2021 08:23:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234454AbhKWI0Z (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 Nov 2021 03:26:25 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:31898 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbhKWI0U (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 Nov 2021 03:26:20 -0500
Received: from dggeml709-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hyxpp70wVzcb8k;
        Tue, 23 Nov 2021 16:18:10 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 dggeml709-chm.china.huawei.com (10.3.17.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Tue, 23 Nov 2021 16:23:10 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>,
        Ioanna Alifieraki <ioanna-maria.alifieraki@canonical.com>,
        Corey Minyard <minyard@acm.org>
CC:     <openipmi-developer@lists.sourceforge.net>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] ipmi: msghandler: Make symbol 'remove_work_wq' static
Date:   Tue, 23 Nov 2021 08:36:18 +0000
Message-ID: <20211123083618.2366808-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeml709-chm.china.huawei.com (10.3.17.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The sparse tool complains as follows:

drivers/char/ipmi/ipmi_msghandler.c:194:25: warning:
 symbol 'remove_work_wq' was not declared. Should it be static?

This symbol is not used outside of ipmi_msghandler.c, so
marks it static.

Fixes: 1d49eb91e86e ("ipmi: Move remove_work to dedicated workqueue")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 1ade72bfae0f..a2ec0171363a 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -191,7 +191,7 @@ struct ipmi_user {
 	struct work_struct remove_work;
 };
 
-struct workqueue_struct *remove_work_wq;
+static struct workqueue_struct *remove_work_wq;
 
 static struct ipmi_user *acquire_ipmi_user(struct ipmi_user *user, int *index)
 	__acquires(user->release_barrier)

