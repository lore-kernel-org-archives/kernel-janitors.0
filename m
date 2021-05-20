Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1BDC433ED
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 05:08:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0790E611AD
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 05:08:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhETFJ3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 May 2021 01:09:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47596 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229498AbhETFJ2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 May 2021 01:09:28 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14K57HAc026940;
        Thu, 20 May 2021 05:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=CticVaCzxTnWWrztDkOoQDsia6opGnbN/MHwdlyE1uM=;
 b=je4wc9UFiYGrf+SL7B87BtMfPD7xcbOYFOY+POdLVajtNvbBj6cBKYukhw27w02zZuF0
 8q/83iPXKes3XEXXOLbTCigDXsW9lblIwOcgNMtComxeFRoSwV96+PfVVFMrBTuop/CF
 HN1IdoGf3mKqgKCb8lBRTlK9sw9F67ksdcbMDeez14YrsUjH4oPseIpERSMhdbbMVPkn
 3U2ntxoNSE6VNQDRGEuS+IyC+M25+AGqcwmui0pN1Xb+Q6AUiUcJcqBpmQ8rXNkND+fi
 psLc458EVnBEjjsAui9I1yKnk5B9ktA+FdwYJFTWzOlaH8xXMVhtpps5qKCyUyaPbBQt Gg== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 38ktd2h978-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 May 2021 05:07:16 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14K57GoN009272;
        Thu, 20 May 2021 05:07:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38mecm7wyc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 May 2021 05:07:15 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14K56c9E006907;
        Thu, 20 May 2021 05:07:14 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 38mecm7wxg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 May 2021 05:07:14 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14K579ew005140;
        Thu, 20 May 2021 05:07:09 GMT
Received: from mwanda (/10.175.161.110)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 19 May 2021 22:07:09 -0700
Date:   Thu, 20 May 2021 08:07:02 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Jaska Uimonen <jaska.uimonen@linux.intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] ASoC: topology: Fix some error codes in
 soc_tplg_dapm_widget_create()
Message-ID: <YKXudu7p8VZ2/zZN@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: 2-YPIjwM2SAhaSJKdrghziEeSlBjhEcf
X-Proofpoint-ORIG-GUID: 2-YPIjwM2SAhaSJKdrghziEeSlBjhEcf
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Return -ENOMEM if these allocations fail.  (The current code returns
success).

Fixes: d29d41e28eea ("ASoC: topology: Add support for multiple kcontrol types to a widget")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/soc-topology.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index e71d98d7b116..6b7a813bc264 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1481,13 +1481,17 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 
 	template.num_kcontrols = le32_to_cpu(w->num_kcontrols);
 	kc = devm_kcalloc(tplg->dev, le32_to_cpu(w->num_kcontrols), sizeof(*kc), GFP_KERNEL);
-	if (!kc)
+	if (!kc) {
+		ret = -ENOMEM;
 		goto err;
+	}
 
 	kcontrol_type = devm_kcalloc(tplg->dev, le32_to_cpu(w->num_kcontrols), sizeof(unsigned int),
 				     GFP_KERNEL);
-	if (!kcontrol_type)
+	if (!kcontrol_type) {
+		ret = -ENOMEM;
 		goto err;
+	}
 
 	for (i = 0; i < w->num_kcontrols; i++) {
 		control_hdr = (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
-- 
2.30.2

