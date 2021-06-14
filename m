Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5216EC48BE6
	for <kernel-janitors@archiver.kernel.org>; Mon, 14 Jun 2021 09:58:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 275DF61009
	for <kernel-janitors@archiver.kernel.org>; Mon, 14 Jun 2021 09:58:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbhFNKAx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 14 Jun 2021 06:00:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45996 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232685AbhFNKAw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Jun 2021 06:00:52 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15E9ufCa030757;
        Mon, 14 Jun 2021 09:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=6MD8tacwh74riZ/X3RtHjFNFVvKl9HiTPBKAYwFYGoQ=;
 b=sGtAutBvAzuVBATfTwn+IYN7XonS5KSqV2jYiGcpdijNeJj3woQxtNTM0HpiqoDO583p
 PdWX+vlBKF8Q7+T06opwO1rj6rWIuTPRgnJhQpyD5Hl8lJr+9vC4ZRf9UQo3bVwAmHh+
 pDtNY1GeDq/Ef+4vuQLV2KyuY/LgEP6rsEQVK5brnfEJiXtSlkZDxVTGOhTtHpXyCP3E
 zGCGxm/dYcfe6JdcCJ4+8UAmsG5ph5fJiFqEpzuADenpy8VYbQKI8BtuXdSpVkvScHGN
 gmfZdqbrb1RaLO4+LMJzsxDpJwAliUsfJjS8kjn8Fk9KnK11L7qW7cZ9X4DBaAcBMz5D 5g== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 395y1kr3cb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 14 Jun 2021 09:58:47 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15E9wkhb011117;
        Mon, 14 Jun 2021 09:58:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 3959cj4krd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 14 Jun 2021 09:58:46 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15E9tjwq196437;
        Mon, 14 Jun 2021 09:58:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 3959cj4kqp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 14 Jun 2021 09:58:45 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15E9wiDG029713;
        Mon, 14 Jun 2021 09:58:44 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 14 Jun 2021 09:58:43 +0000
Date:   Mon, 14 Jun 2021 12:58:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Won Kang <wkang77@gmail.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] staging: gdm724x: check for overflow in
 gdm_lte_netif_rx()
Message-ID: <YMcoTPsCYlhh2TQo@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMcnl4zCwGWGDVMG@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: OABA-4KIw-aOwYecM5BbwWkpjnXX7mdq
X-Proofpoint-GUID: OABA-4KIw-aOwYecM5BbwWkpjnXX7mdq
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code assumes that "len" is at least 62 bytes, but we need a check
to prevent a read overflow.

Fixes: 61e121047645 ("staging: gdm7240: adding LTE USB driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
There is a different place that does:

	ip_version = buf[0] >> 4;

Which assumes that "len" is one.  I think that should be checked in the
caller...  I didn't add a check here because I think it's the wrong
place but then I didn't add a check in the caller because I wasn't able
to test it.  I'm not really that worried about reading one element
beyond the end of the buffer.  If we get extremely unlucky it could
result in a crash...  Hopefully we will remember to look at this again
before moving this code out of staging.

#TODO:

 drivers/staging/gdm724x/gdm_lte.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_lte.c b/drivers/staging/gdm724x/gdm_lte.c
index a41af7aa74ec..bd5f87433404 100644
--- a/drivers/staging/gdm724x/gdm_lte.c
+++ b/drivers/staging/gdm724x/gdm_lte.c
@@ -611,10 +611,12 @@ static void gdm_lte_netif_rx(struct net_device *dev, char *buf,
 						  * bytes (99,130,83,99 dec)
 						  */
 			} __packed;
-			void *addr = buf + sizeof(struct iphdr) +
-				sizeof(struct udphdr) +
-				offsetof(struct dhcp_packet, chaddr);
-			ether_addr_copy(nic->dest_mac_addr, addr);
+			int offset = sizeof(struct iphdr) +
+				     sizeof(struct udphdr) +
+				     offsetof(struct dhcp_packet, chaddr);
+			if (offset + ETH_ALEN > len)
+				return;
+			ether_addr_copy(nic->dest_mac_addr, buf + offset);
 		}
 	}
 
-- 
2.30.2

