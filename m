Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB56C001B0
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 Jul 2023 15:55:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235076AbjGMPzW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 13 Jul 2023 11:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbjGMPzW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Jul 2023 11:55:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB2AE1BEB
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jul 2023 08:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689263681;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=OpGloaBWnj5MoBWfiTNEz+6FTbZvx0Cg+d8CD3SV6Uo=;
        b=KkNCobE88cjzl/XPi4Qm5aBzusCd4IYuPy4RkZSqLBVxlduZT2oP5X4zqT3+RKNHTLYwvC
        oU5IDaYYHF2SF88FpQsBBJ7TC3giCvSO7XYQLcGElgFebQ+KCSz6ra+IzPOHj2Sko1zlkz
        qiWzyzeKaHz6ef+f4psy+KNgskyo5JE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-SNd6AOccMHm6qbNBjoSbpg-1; Thu, 13 Jul 2023 11:54:39 -0400
X-MC-Unique: SNd6AOccMHm6qbNBjoSbpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2191983FC20;
        Thu, 13 Jul 2023 15:54:39 +0000 (UTC)
Received: from firesoul.localdomain (unknown [10.45.242.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E1CD940C2063;
        Thu, 13 Jul 2023 15:54:38 +0000 (UTC)
Received: from [192.168.42.3] (localhost [IPv6:::1])
        by firesoul.localdomain (Postfix) with ESMTP id EB02F307372E8;
        Thu, 13 Jul 2023 17:54:37 +0200 (CEST)
Subject: [PATCH net-next] gve: trivial spell fix Recive to Receive
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     kernel-janitors@vger.kernel.org
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>, netdev@vger.kernel.org
Date:   Thu, 13 Jul 2023 17:54:37 +0200
Message-ID: <168926364598.10492.9222703767497099182.stgit@firesoul>
User-Agent: StGit/1.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Spotted this trivial spell mistake while casually reading
the google GVE driver code.

Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>
---
 drivers/net/ethernet/google/gve/gve_desc.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Yes, I know net-next is closed, but perhaps kernel-janitors
will pick this up for later?

diff --git a/drivers/net/ethernet/google/gve/gve_desc.h b/drivers/net/ethernet/google/gve/gve_desc.h
index f4ae9e19b844..c2874cdcf40c 100644
--- a/drivers/net/ethernet/google/gve/gve_desc.h
+++ b/drivers/net/ethernet/google/gve/gve_desc.h
@@ -105,10 +105,10 @@ union gve_rx_data_slot {
 	__be64 addr;
 };
 
-/* GVE Recive Packet Descriptor Seq No */
+/* GVE Receive Packet Descriptor Seq No */
 #define GVE_SEQNO(x) (be16_to_cpu(x) & 0x7)
 
-/* GVE Recive Packet Descriptor Flags */
+/* GVE Receive Packet Descriptor Flags */
 #define GVE_RXFLG(x)	cpu_to_be16(1 << (3 + (x)))
 #define	GVE_RXF_FRAG		GVE_RXFLG(3)	/* IP Fragment			*/
 #define	GVE_RXF_IPV4		GVE_RXFLG(4)	/* IPv4				*/


