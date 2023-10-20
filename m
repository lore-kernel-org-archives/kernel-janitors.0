Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649D9C001E0
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 02:43:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235591AbjJTCno (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Oct 2023 22:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233397AbjJTCnn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Oct 2023 22:43:43 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 69B3412D;
        Thu, 19 Oct 2023 19:43:41 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 5CD3F604C5033;
        Fri, 20 Oct 2023 10:43:38 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     dan.carpenter@linaro.org, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc:     Su Hui <suhui@nfschina.com>, intel-wired-lan@lists.osuosl.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH v2] i40e: add an error code check in i40e_vsi_setup
Date:   Fri, 20 Oct 2023 10:43:09 +0800
Message-Id: <20231020024308.46630-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

check the value of 'ret' after calling 'i40e_vsi_config_rss'.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
v2: 
- call i40e_vsi_clear_rings() to free rings(thank dan carpenter for
  pointing out this).
 drivers/net/ethernet/intel/i40e/i40e_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_main.c b/drivers/net/ethernet/intel/i40e/i40e_main.c
index de7fd43dc11c..4904bc8f5777 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_main.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_main.c
@@ -14567,9 +14567,13 @@ struct i40e_vsi *i40e_vsi_setup(struct i40e_pf *pf, u8 type,
 	if ((pf->hw_features & I40E_HW_RSS_AQ_CAPABLE) &&
 	    (vsi->type == I40E_VSI_VMDQ2)) {
 		ret = i40e_vsi_config_rss(vsi);
+		if (ret)
+			goto err_config;
 	}
 	return vsi;
 
+err_config:
+	i40e_vsi_clear_rings(vsi);
 err_rings:
 	i40e_vsi_free_q_vectors(vsi);
 err_msix:
-- 
2.30.2

