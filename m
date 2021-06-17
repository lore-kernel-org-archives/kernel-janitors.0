Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBEEC2B9F4
	for <kernel-janitors@archiver.kernel.org>; Thu, 17 Jun 2021 13:38:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E12A610A3
	for <kernel-janitors@archiver.kernel.org>; Thu, 17 Jun 2021 13:38:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbhFQNkM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 17 Jun 2021 09:40:12 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:26302 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232071AbhFQNkM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Jun 2021 09:40:12 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15HDVavx028406;
        Thu, 17 Jun 2021 13:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=zE3j2Enhao1E66i+SdrltR4Eo5w6687dBGPeyUl6wBs=;
 b=CPMGPUci7B8uu9qqTaMRA12RxKpKBlk/lMDV2c40s72SN18lJ/TulHMd5KmwwRS2vrKp
 b7S8pvBdicZ1ZuiDUwmZYSuHSOVYPjJUxTG+yc/s90/WbFOtvTUjke+7LcYwOxH/uesW
 BvRe2uqMns4oM1ie/MoJl+gB9D9Q7p5D6pzKYQv4L/1WupiXmL8eCtbZ3cl3cObnHyi9
 qNowM1QMzk/usCW+kfFZvB+0cKwOsxTZ2LxEy33N9Jg9gPAVlP/EpU4wcyQuZSZztX48
 +9vaDJMrP7qTgjgJvyu5Ilh7f+RraLa5Pl4uNzE1yVk8NYyd4aMUUajrKzLsu91K/1Wy rg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 397w1y13jm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 13:37:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15HDUuB7102021;
        Thu, 17 Jun 2021 13:37:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 396waq5ym0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 13:37:44 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15HDUtlk101912;
        Thu, 17 Jun 2021 13:37:43 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 396waq5ygf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 13:37:43 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15HDbYkg005013;
        Thu, 17 Jun 2021 13:37:35 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 17 Jun 2021 06:37:33 -0700
Date:   Thu, 17 Jun 2021 16:37:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: rawnand: Add a check in of_get_nand_secure_regions()
Message-ID: <YMtQFXE0F1w7mUh+@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: y8_E4bor5i1y9sjIhzYPGkMtqm2sB-xz
X-Proofpoint-GUID: y8_E4bor5i1y9sjIhzYPGkMtqm2sB-xz
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Check for whether of_property_count_elems_of_size() returns a negative
error code.

Fixes: 13b89768275d ("mtd: rawnand: Add support for secure regions in NAND memory")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/nand/raw/nand_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 57a583149cc0..cbba46432e39 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5231,8 +5231,8 @@ static int of_get_nand_secure_regions(struct nand_chip *chip)
 	int nr_elem, i, j;
 
 	nr_elem = of_property_count_elems_of_size(dn, "secure-regions", sizeof(u64));
-	if (!nr_elem)
-		return 0;
+	if (nr_elem <= 0)
+		return nr_elem;
 
 	chip->nr_secure_regions = nr_elem / 2;
 	chip->secure_regions = kcalloc(chip->nr_secure_regions, sizeof(*chip->secure_regions),
-- 
2.30.2

