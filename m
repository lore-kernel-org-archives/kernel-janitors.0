Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19238C433ED
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 05:09:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6846611BD
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 05:09:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhETFKl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 May 2021 01:10:41 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:39236 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229498AbhETFKk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 May 2021 01:10:40 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14K58HhZ029793;
        Thu, 20 May 2021 05:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=3LKNlWa84mNtlc0IzsZuszOG3F3MflC9kl6rzzQfwaw=;
 b=zTP0SEmlB1Kz/rWlk+Gu03/Az2jePnS5icE7VOxbbmii0lK2AqbxPe4riIeU4GEPqGWA
 yPH3Mcn2z7ArpQ2/vMuyQN+SFn2MZi83amGLZcLB//ckl7zQP3dYOK8fn2whU7/WHj3z
 5d7HbO41+KFpLNqjNIoly1WZnUtp2JxRp36ZfhuEVL2QeaOEB9MGn50NNuGbd9b8We2H
 Q53UcjPzxVlDUhEPldqxvNjPPDXS6opFFRx/zYhMuzpD1PtMaetg1wU7V80uSq0XaHWz
 tDFcUhCkfzMRiKBw86314L4SdFgXQzVPxIcyyC0Nm+o2ydeptd3hbBuk9v5MQ5rY0MKP 6w== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 38n4utr9wg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 May 2021 05:08:35 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14K58Y1x031103;
        Thu, 20 May 2021 05:08:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38megm3kha-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 May 2021 05:08:34 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14K57KqD029097;
        Thu, 20 May 2021 05:08:33 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 38megm3kh3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 May 2021 05:08:33 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14K58WCi014142;
        Thu, 20 May 2021 05:08:32 GMT
Received: from mwanda (/10.175.161.110)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 19 May 2021 22:08:31 -0700
Date:   Thu, 20 May 2021 08:08:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     James Schulman <james.schulman@cirrus.com>
Cc:     David Rhodes <david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Paul Handrigan <Paul.Handrigan@cirrus.com>,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: cs35l33: fix an error code in probe()
Message-ID: <YKXuyGEzhPT35R3G@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: yKP14-Zssevux8KcCheFgEk2dAdWjhbC
X-Proofpoint-ORIG-GUID: yKP14-Zssevux8KcCheFgEk2dAdWjhbC
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This error path returns zero (success) but it should return -EINVAL.

Fixes: 3333cb7187b9 ("ASoC: cs35l33: Initial commit of the cs35l33 CODEC driver.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/cs35l33.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index 6f6b3c0c88b7..2a6f5e46d031 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -1202,6 +1202,7 @@ static int cs35l33_i2c_probe(struct i2c_client *i2c_client,
 		dev_err(&i2c_client->dev,
 			"CS35L33 Device ID (%X). Expected ID %X\n",
 			devid, CS35L33_CHIP_ID);
+		ret = -EINVAL;
 		goto err_enable;
 	}
 
-- 
2.30.2

