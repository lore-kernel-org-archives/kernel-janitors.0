Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4C3C48BDF
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 13:42:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3155F60C41
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 13:42:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbhFRNot (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Jun 2021 09:44:49 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6596 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232427AbhFRNot (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Jun 2021 09:44:49 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15IDfpRh008900;
        Fri, 18 Jun 2021 13:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=yljVuedjY6niamRBdEoaeowYyYsdAK6hBbi4/1HCqes=;
 b=Y+RMJ5OOAZRuvFlrb0AL3aAkagXE+Zv4jwj4t1QyXblqDKFLhq3RAUjS0haLsm3bltf/
 PIxd+JxuLsBufwEGnqviF4NAtOJcF2EAY1LZTE9XADkFPFJPqfT3gc3FZZGq+bKgyJ7p
 3eObdFxDgaLcRSs06c0CoBxIQlO8ACbcgfxquZWMg+wcxTBthK7T+34Kdi+ab45kPG97
 n0xCbVwLxgJogFhehjqKiI81k3Qh8ha2Yqg3ADoEj14rSP/vCzsoEXnUzp5ytOAIjSDk
 rzxRtZH1hWII50D8IadhAugSpjZiaDDqXpu9RWk0TOMNPaDneT+ntlf36WOr7N1dLBWm AA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 397w1y393f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Jun 2021 13:42:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15IDf5Ao155079;
        Fri, 18 Jun 2021 13:42:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 396ware7gy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Jun 2021 13:42:21 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15IDfF50155758;
        Fri, 18 Jun 2021 13:42:20 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 396ware7gg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Jun 2021 13:42:20 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15IDgFqL011164;
        Fri, 18 Jun 2021 13:42:15 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 18 Jun 2021 13:42:14 +0000
Date:   Fri, 18 Jun 2021 16:42:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Heiko Schocher <hs@denx.de>, linux-mtd@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: mchp48l640: silence some uninitialized variable warnings
Message-ID: <YMyir961W28TX5dT@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: slNlys459IfK-JtsXKcxczcvvKS6_3Di
X-Proofpoint-GUID: slNlys459IfK-JtsXKcxczcvvKS6_3Di
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that zero length read/writes will lead to an
uninitalized return value.  I don't know if that's possible, but
it's nicer to return a zero literal anyway so let's do that.

Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
People, when we add a new driver can we make sure the first commit uses
the new prefered subsystem prefix?  For example,

"mtd: mchp48l640: add support for microchip 48l640 EERAM"
      ^^^^^^^^^^
Otherwise it's not clear to me what I should use as a patch prefix.

 drivers/mtd/devices/mchp48l640.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
index efc2003bd13a..ad66b5aaf4e9 100644
--- a/drivers/mtd/devices/mchp48l640.c
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -229,7 +229,7 @@ static int mchp48l640_write(struct mtd_info *mtd, loff_t to, size_t len,
 		woff += ws;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int mchp48l640_read_page(struct mtd_info *mtd, loff_t from, size_t len,
@@ -286,7 +286,7 @@ static int mchp48l640_read(struct mtd_info *mtd, loff_t from, size_t len,
 		woff += ws;
 	}
 
-	return ret;
+	return 0;
 };
 
 static const struct mchp48_caps mchp48l640_caps = {
-- 
2.30.2

