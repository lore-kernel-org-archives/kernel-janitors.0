Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C69C433E6
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Feb 2021 07:43:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAAC264E04
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Feb 2021 07:43:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbhBQHnU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 17 Feb 2021 02:43:20 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:54338 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231717AbhBQHmn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 Feb 2021 02:42:43 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11H7eO8e139423;
        Wed, 17 Feb 2021 07:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=KmoPNcfBoIAItQ0vdnpjsq6lT+zRNAvWYjSnYMsqvxQ=;
 b=BV5W+kGucNywexJM/c9e17hWOXAVpZY55kdsmlMniIH3FisIYRBVGlankJCcJGlq39sm
 B4fPg99Qc5GFKUACgEWptYpk0oFIScd3BvRpg9ZzFpYYqtSpXAYJ2tNkp0XFwsYUMbsk
 fAoWxrMw6+8HHIrM3GPq2LoX/O76I89+z2xu8Tiuc1zosWjLVy6BBvnwsYxh9F+7o41S
 9DfGE4KW64OBMU/n9y2WsQUHeOchraBhiaFGxAjyv6+Oyb53uMKFJdNZWHfyqVYa1lkZ
 LUIXEv32jtH+PHcUWcKz0AgEeY79uWouP/UKfPErVVWPM19XT4aSo2FQH3D7hp8TagKq 3Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 36p7dnh9we-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Feb 2021 07:41:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11H7eMop177400;
        Wed, 17 Feb 2021 07:41:53 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 36prbp5vef-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Feb 2021 07:41:53 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11H7fmeQ016695;
        Wed, 17 Feb 2021 07:41:49 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 17 Feb 2021 07:41:48 +0000
Date:   Wed, 17 Feb 2021 10:41:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sunil Goutham <sgoutham@marvell.com>,
        hariprasad <hkelam@marvell.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Christina Jacob <cjacob@marvell.com>
Cc:     Geetha sowjanya <gakula@marvell.com>,
        Subbaraya Sundeep <sbhatta@marvell.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] octeontx2-pf: Fix otx2_get_fecparam()
Message-ID: <YCzIsxW3B70g7lea@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9897 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102170055
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9897 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102170055
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Static checkers complained about an off by one read overflow in
otx2_get_fecparam() and we applied two conflicting fixes for it.

Correct: b0aae0bde26f ("octeontx2: Fix condition.")
  Wrong: 93efb0c65683 ("octeontx2-pf: Fix out-of-bounds read in otx2_get_fecparam()")

Revert the incorrect fix.

Fixes: 93efb0c65683 ("octeontx2-pf: Fix out-of-bounds read in otx2_get_fecparam()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c
index 5fe74036a611..f4962a97a075 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c
@@ -968,7 +968,7 @@ static int otx2_get_fecparam(struct net_device *netdev,
 		if (!rsp->fwdata.supported_fec)
 			fecparam->fec = ETHTOOL_FEC_NONE;
 		else
-			fecparam->fec = fec[rsp->fwdata.supported_fec - 1];
+			fecparam->fec = fec[rsp->fwdata.supported_fec];
 	}
 	return 0;
 }
-- 
2.30.0

