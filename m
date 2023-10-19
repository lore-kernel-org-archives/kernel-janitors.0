Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9DACDB465
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Oct 2023 08:34:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235109AbjJSIeb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Oct 2023 04:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbjJSIea (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Oct 2023 04:34:30 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 12F3BAB;
        Thu, 19 Oct 2023 01:34:27 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id C9F696071E216;
        Thu, 19 Oct 2023 16:34:10 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     shannon.nelson@amd.com, brett.creeley@amd.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc:     Su Hui <suhui@nfschina.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] pds_core: add an error code check in pdsc_dl_info_get
Date:   Thu, 19 Oct 2023 16:33:52 +0800
Message-Id: <20231019083351.1526484-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

check the value of 'ret' after call 'devlink_info_version_stored_put'.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/ethernet/amd/pds_core/devlink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/amd/pds_core/devlink.c b/drivers/net/ethernet/amd/pds_core/devlink.c
index d9607033bbf2..09041f7fccaf 100644
--- a/drivers/net/ethernet/amd/pds_core/devlink.c
+++ b/drivers/net/ethernet/amd/pds_core/devlink.c
@@ -124,6 +124,8 @@ int pdsc_dl_info_get(struct devlink *dl, struct devlink_info_req *req,
 			snprintf(buf, sizeof(buf), "fw.slot_%d", i);
 		err = devlink_info_version_stored_put(req, buf,
 						      fw_list.fw_names[i].fw_version);
+		if (err)
+			return err;
 	}
 
 	err = devlink_info_version_running_put(req,
-- 
2.30.2

