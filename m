Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2927AC48BDF
	for <kernel-janitors@archiver.kernel.org>; Sun, 20 Jun 2021 13:28:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B87160FF2
	for <kernel-janitors@archiver.kernel.org>; Sun, 20 Jun 2021 13:28:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhFTNab (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 20 Jun 2021 09:30:31 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:53754 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbhFTNa0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 20 Jun 2021 09:30:26 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d33 with ME
        id KRU82500G21Fzsu03RU97r; Sun, 20 Jun 2021 15:28:13 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 20 Jun 2021 15:28:13 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        davem@davemloft.net, kuba@kernel.org, david.m.ertman@intel.com,
        shiraz.saleem@intel.com
Cc:     intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ice: Fix a memory leak in an error handling path in 'ice_pf_dcb_cfg()'
Date:   Sun, 20 Jun 2021 15:28:06 +0200
Message-Id: <0302ff0ced7f38b0076c08ce351477d338bbe548.1624195601.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If this 'kzalloc()' fails we must free some resources as in all the other
error handling paths of this function.

Fixes: 348048e724a0 ("ice: Implement iidc operations")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
'event' is allocated and freed just a few lines below. It looks like a
small structure, so maybe a better fix would be to avoid the
kzalloc/kfree and use a local variable instead.
Another solution
---
 drivers/net/ethernet/intel/ice/ice_dcb_lib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_dcb_lib.c b/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
index 857dc62da7a8..926cf748c5ec 100644
--- a/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
@@ -316,8 +316,10 @@ int ice_pf_dcb_cfg(struct ice_pf *pf, struct ice_dcbx_cfg *new_cfg, bool locked)
 
 	/* Notify AUX drivers about impending change to TCs */
 	event = kzalloc(sizeof(*event), GFP_KERNEL);
-	if (!event)
-		return -ENOMEM;
+	if (!event) {
+		ret = -ENOMEM;
+		goto free_cfg;
+	}
 
 	set_bit(IIDC_EVENT_BEFORE_TC_CHANGE, event->type);
 	ice_send_event_to_aux(pf, event);
-- 
2.30.2

