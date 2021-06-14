Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E356EC48BE6
	for <kernel-janitors@archiver.kernel.org>; Mon, 14 Jun 2021 09:55:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFCF461380
	for <kernel-janitors@archiver.kernel.org>; Mon, 14 Jun 2021 09:55:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232691AbhFNJ57 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 14 Jun 2021 05:57:59 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:53632 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232579AbhFNJ57 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Jun 2021 05:57:59 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15E9rRjb030980;
        Mon, 14 Jun 2021 09:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ro3sNk6vZBqit6iisTENhkundRv2qnFGNjjJeABKqc8=;
 b=MQuzhxCK+ndXL1SQpFJ0nEn9HUYtaOjuPpC3CmOawgjMPCX4Ye+6k4pbP/Z2dqAqmQYO
 ch5DNUzPyDViMfgYHl7/qisRS7X9DZUZIFugEHuDGaC4p4q7zfpyRrT4O9Y5roG2YrSY
 IJZE4FW2z9SIPiM9x8ZcAR1dldS09xu948KsNVf8DJRGgK9NKi04mAAYFr0vTwKH/9Os
 zHO/3pAfVi2HAkIJeqGkPuVL5/JqMeyMNlex9zGZmJ1T9MrTYz638MinZc7DS/PsYZ2L
 ZR1zQJ2or0q32etglItVZHAS25GKyUfPoSQ4X8+X9Qr0uXmWsUf29/Q3IXthYgVX/ctl Nw== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 395x06g3sg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 14 Jun 2021 09:55:47 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15E9tkQD196455;
        Mon, 14 Jun 2021 09:55:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 3959cj4frn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 14 Jun 2021 09:55:46 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15E9tjwo196437;
        Mon, 14 Jun 2021 09:55:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 3959cj4fqv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 14 Jun 2021 09:55:45 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15E9tiEN027627;
        Mon, 14 Jun 2021 09:55:44 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 14 Jun 2021 09:55:43 +0000
Date:   Mon, 14 Jun 2021 12:55:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Won Kang <wkang77@gmail.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] staging: gdm724x: check for buffer overflow in
 gdm_lte_multi_sdu_pkt()
Message-ID: <YMcnl4zCwGWGDVMG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: djI1XCEHSxhVm-bWvHGSgbAd_0YZSpAj
X-Proofpoint-GUID: djI1XCEHSxhVm-bWvHGSgbAd_0YZSpAj
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There needs to be a check to verify that we don't read beyond the end
of "buf".  This function is called from do_rx().  The "buf" is the USB
transfer_buffer and "len" is "urb->actual_length".

Fixes: 61e121047645 ("staging: gdm7240: adding LTE USB driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The truth is that I don't really understand where the 12 comes from in
(hci_len - 12) but I copy and pasted it.  I am a bit tempted to say that
actually hci_len - 12 has to be greater than zero but I didn't do that
because I don't have the hardware to test it.

 drivers/staging/gdm724x/gdm_lte.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gdm724x/gdm_lte.c b/drivers/staging/gdm724x/gdm_lte.c
index 571f47d39484..a41af7aa74ec 100644
--- a/drivers/staging/gdm724x/gdm_lte.c
+++ b/drivers/staging/gdm724x/gdm_lte.c
@@ -677,6 +677,7 @@ static void gdm_lte_multi_sdu_pkt(struct phy_dev *phy_dev, char *buf, int len)
 	struct sdu *sdu = NULL;
 	u8 endian = phy_dev->get_endian(phy_dev->priv_dev);
 	u8 *data = (u8 *)multi_sdu->data;
+	int copied;
 	u16 i = 0;
 	u16 num_packet;
 	u16 hci_len;
@@ -688,6 +689,12 @@ static void gdm_lte_multi_sdu_pkt(struct phy_dev *phy_dev, char *buf, int len)
 	num_packet = gdm_dev16_to_cpu(endian, multi_sdu->num_packet);
 
 	for (i = 0; i < num_packet; i++) {
+		copied = data - multi_sdu->data;
+		if (len < copied + sizeof(*sdu)) {
+			pr_err("rx prevent buffer overflow");
+			return;
+		}
+
 		sdu = (struct sdu *)data;
 
 		cmd_evt  = gdm_dev16_to_cpu(endian, sdu->cmd_evt);
@@ -698,7 +705,8 @@ static void gdm_lte_multi_sdu_pkt(struct phy_dev *phy_dev, char *buf, int len)
 			pr_err("rx sdu wrong hci %04x\n", cmd_evt);
 			return;
 		}
-		if (hci_len < 12) {
+		if (hci_len < 12 ||
+		    len < copied + sizeof(*sdu) + (hci_len - 12)) {
 			pr_err("rx sdu invalid len %d\n", hci_len);
 			return;
 		}
-- 
2.30.2

