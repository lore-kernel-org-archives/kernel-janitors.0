Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1BAECAAD5
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Sep 2022 01:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiIIBYs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Sep 2022 21:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiIIBYq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Sep 2022 21:24:46 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C74193D4;
        Thu,  8 Sep 2022 18:24:45 -0700 (PDT)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MNyph6MTyzZcFc;
        Fri,  9 Sep 2022 09:20:12 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 09:24:44 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 9 Sep
 2022 09:24:43 +0800
From:   Sun Ke <sunke32@huawei.com>
To:     <vincent.sunplus@gmail.com>, <kishon@ti.com>, <vkoul@kernel.org>,
        <p.zabel@pengutronix.de>
CC:     <linux-usb@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, <sunke32@huawei.com>
Subject: [PATCH 0/2] two fixes for phy usb
Date:   Fri, 9 Sep 2022 09:35:44 +0800
Message-ID: <20220909013546.2259545-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

two fixes for phy usb 

Sun Ke (2):
  phy: usb: Fix potential NULL dereference in sp_usb_phy_probe()
  phy: usb: Fix return value check in sp_usb_phy_probe()

 drivers/phy/sunplus/phy-sunplus-usb2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.31.1

