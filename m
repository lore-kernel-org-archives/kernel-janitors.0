Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B999C11F66
	for <kernel-janitors@archiver.kernel.org>; Tue, 29 Jun 2021 08:25:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8273A61DE2
	for <kernel-janitors@archiver.kernel.org>; Tue, 29 Jun 2021 08:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbhF2I2A (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 29 Jun 2021 04:28:00 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37280 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232376AbhF2I17 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Jun 2021 04:27:59 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15T8HOXY032411;
        Tue, 29 Jun 2021 08:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=/X4VQ1Kry2KIOFDMb6OUFJKF4tKiX6sNpuTnnIpJVhw=;
 b=T/HtrZ2hr5U10M4WbUKvTZpoJ/VCmYDL9oVDe3rGmgFOBxeqh24e7AYRVU+NxPAfg1a6
 jX/dQjPSOOT/QN+gnbyowpVlMUQfEmi7etAhZvd4AbwXsMtR2QGWWd7Hq6ee3Xls4lVV
 Vt71sKatpm4/R3gSIThnPGZXXjHHOZLfOTXjMkh/z5EBCMWRalKlmKKqWgc5NsvrNe83
 FSS+scC0XYaZ5Nthc6aRVZyT0jLo5N5iByTb5D2PihcZE4Whzpd0ixIhwsRAU0Ef8Vf/
 Q9J5t9szqjo+p2hmpsPO/q/b5j9d+I/f2jzxwxNv5TSJ+gkDuDOMong1tTVZl3+YOs5e 5A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 39f1hck85e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 08:25:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15T8FsUb015763;
        Tue, 29 Jun 2021 08:25:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 39ee0u8prt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 08:25:24 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15T8POo2042083;
        Tue, 29 Jun 2021 08:25:24 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 39ee0u8pr5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 08:25:24 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0121.oracle.com (8.14.4/8.14.4) with ESMTP id 15T8PM71017561;
        Tue, 29 Jun 2021 08:25:22 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 29 Jun 2021 01:25:21 -0700
Date:   Tue, 29 Jun 2021 11:25:13 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Catherine Sullivan <csully@google.com>,
        Bailey Forrest <bcf@google.com>
Cc:     Sagi Shahar <sagis@google.com>, Jon Olson <jonolson@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Willem de Bruijn <willemb@google.com>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] gve: DQO: Fix off by one in gve_rx_dqo()
Message-ID: <YNrY6WwCYGoWMZZe@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: xNCZ8A9HnARa8vo1wvFB4Ce-SXZGDajx
X-Proofpoint-GUID: xNCZ8A9HnARa8vo1wvFB4Ce-SXZGDajx
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The rx->dqo.buf_states[] array is allocated in gve_rx_alloc_ring_dqo()
and it has rx->dqo.num_buf_states so this > needs to >= to prevent an
out of bounds access.

Fixes: 9b8dd5e5ea48 ("gve: DQO: Add RX path")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/google/gve/gve_rx_dqo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/google/gve/gve_rx_dqo.c b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
index 8738db020061..77bb8227f89b 100644
--- a/drivers/net/ethernet/google/gve/gve_rx_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
@@ -525,7 +525,7 @@ static int gve_rx_dqo(struct napi_struct *napi, struct gve_rx_ring *rx,
 	struct gve_priv *priv = rx->gve;
 	u16 buf_len;
 
-	if (unlikely(buffer_id > rx->dqo.num_buf_states)) {
+	if (unlikely(buffer_id >= rx->dqo.num_buf_states)) {
 		net_err_ratelimited("%s: Invalid RX buffer_id=%u\n",
 				    priv->dev->name, buffer_id);
 		return -EINVAL;
-- 
2.30.2

