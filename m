Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ACAC4338F
	for <kernel-janitors@archiver.kernel.org>; Sun,  1 Aug 2021 15:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED10061057
	for <kernel-janitors@archiver.kernel.org>; Sun,  1 Aug 2021 15:12:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbhHAPMQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 1 Aug 2021 11:12:16 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:34054
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231940AbhHAPMP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 1 Aug 2021 11:12:15 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 0EF843F043;
        Sun,  1 Aug 2021 15:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627830726;
        bh=AB7di8QQs0GyZqrmRL+UUGYTBNO1x35EKgvYXlfpRxc=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=D9GZF7bgXC+SsH9vZnpGOCjeCH//I3TJBzaBjHQDWDIYiVlO43oQHlJEPDgEPoS/O
         +WaWl9wQsHbY3DTltAjjY5olyCJ4G2RzxNlTrH0QwZ9kh3aln9gQurAj0onARPVM3Y
         mYJb10o25K7dx5OmrNdA5t3ksXFm5q0/0bmrRdZzR4JEPaJn2jZDW9r5fPjTmtitBD
         wyn6f4lfgUnA/ssIFwEOttETBl8sEzuUP5rXeVFRvNexjkFZbukGZP4C+z2JauK8Ju
         TYLO7nP0Lu1gWEtAXNE8XQMRalLoM/YS+uraA5zT3naoV4cVIz9meLR88/RiM8bTsK
         Q1N9hamGZDDGA==
From:   Colin King <colin.king@canonical.com>
To:     Raju Rangoju <rajur@chelsio.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] cxgb4: make the array match_all_mac static, makes object smaller
Date:   Sun,  1 Aug 2021 16:12:05 +0100
Message-Id: <20210801151205.145924-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array match_all_mac on the stack but instead it
static const. Makes the object code smaller by 75 bytes.

Before:
   text    data     bss     dec     hex filename
  46701    8960      64   55725    d9ad ../chelsio/cxgb4/cxgb4_filter.o

After:
   text    data     bss     dec     hex filename
  46338    9120     192   55650    d962 ../chelsio/cxgb4/cxgb4_filter.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_filter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_filter.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_filter.c
index 6260b3bebd2b..786ceae34488 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_filter.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_filter.c
@@ -1441,7 +1441,7 @@ static int cxgb4_set_hash_filter(struct net_device *dev,
 	} else if (iconf & USE_ENC_IDX_F) {
 		if (f->fs.val.encap_vld) {
 			struct port_info *pi = netdev_priv(f->dev);
-			u8 match_all_mac[] = { 0, 0, 0, 0, 0, 0 };
+			static const u8 match_all_mac[] = { 0, 0, 0, 0, 0, 0 };
 
 			/* allocate MPS TCAM entry */
 			ret = t4_alloc_encap_mac_filt(adapter, pi->viid,
@@ -1688,7 +1688,7 @@ int __cxgb4_set_filter(struct net_device *dev, int ftid,
 	} else if (iconf & USE_ENC_IDX_F) {
 		if (f->fs.val.encap_vld) {
 			struct port_info *pi = netdev_priv(f->dev);
-			u8 match_all_mac[] = { 0, 0, 0, 0, 0, 0 };
+			static const u8 match_all_mac[] = { 0, 0, 0, 0, 0, 0 };
 
 			/* allocate MPS TCAM entry */
 			ret = t4_alloc_encap_mac_filt(adapter, pi->viid,
-- 
2.31.1

