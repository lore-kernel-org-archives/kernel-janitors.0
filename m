Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB28ECAAD4
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Sep 2022 14:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234039AbiIDOWz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 4 Sep 2022 10:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiIDOWy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 4 Sep 2022 10:22:54 -0400
Received: from smtp.smtpout.orange.fr (smtp09.smtpout.orange.fr [80.12.242.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC2D32ED6
        for <kernel-janitors@vger.kernel.org>; Sun,  4 Sep 2022 07:22:52 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id UqWOoEaZwJvOZUqWOotKwX; Sun, 04 Sep 2022 16:22:51 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 04 Sep 2022 16:22:51 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org
Subject: [PATCH] ice: Simplify memory allocation in ice_sched_init_port()
Date:   Sun,  4 Sep 2022 16:22:46 +0200
Message-Id: <7cd7cb09607c46763e846d1fa7158ce9fdfca3e6.1662301342.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'buf' is locale to the ice_sched_init_port() function.
There is no point in using devm_kzalloc()/devm_kfree().

use kzalloc()/kfree() instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
As a side effect, it also require less memory. devm_kzalloc() has a small
memory overhead, and requesting ICE_AQ_MAX_BUF_LEN (i.e. 4096) bytes,
8192 are really allocated.
---
 drivers/net/ethernet/intel/ice/ice_sched.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_sched.c b/drivers/net/ethernet/intel/ice/ice_sched.c
index 7947223536e3..118595763bba 100644
--- a/drivers/net/ethernet/intel/ice/ice_sched.c
+++ b/drivers/net/ethernet/intel/ice/ice_sched.c
@@ -1212,7 +1212,7 @@ int ice_sched_init_port(struct ice_port_info *pi)
 	hw = pi->hw;
 
 	/* Query the Default Topology from FW */
-	buf = devm_kzalloc(ice_hw_to_dev(hw), ICE_AQ_MAX_BUF_LEN, GFP_KERNEL);
+	buf = kzalloc(ICE_AQ_MAX_BUF_LEN, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
@@ -1290,7 +1290,7 @@ int ice_sched_init_port(struct ice_port_info *pi)
 		pi->root = NULL;
 	}
 
-	devm_kfree(ice_hw_to_dev(hw), buf);
+	kfree(buf);
 	return status;
 }
 
-- 
2.34.1

