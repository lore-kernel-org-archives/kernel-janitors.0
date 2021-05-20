Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DEFC433B4
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 05:09:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 092DB60FDA
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 05:09:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhETFKx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 May 2021 01:10:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47954 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229498AbhETFKx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 May 2021 01:10:53 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14K57oRq027317;
        Thu, 20 May 2021 05:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=EZxC9Bb9kO8469btR/OaLge4DcP3Mr1PXtR8r3X7yqs=;
 b=eRsNjkTiPWYNg0WwPWsTvX4nopeXjMsid7gOpIoBoqOfSDp9n69s0VAuwmFcnG+U/sbF
 h9mfNaHyuaVOqzmKfHuPKafW+xXgs8LaI1EWnmM3IPfx259+H0sqbCMgNn+wPu6lWdDl
 mSM4zMuizZEIm8aSK9By/WpIqpVu/A57fP5BH4IHNSxSVwC0r+QGVkMrJ/X8F/ngaKje
 frcosuWWp9/Df0joIk66fQT0gz8VnPQbU3jEUs7l1K9IyjpFeoqT9rIu+1fhVgBiJmhI
 ewVX6iipN0ytd4MvGGIBomoog8WZIdDDloVSz2OkbaQQoX+KHCFC/hiuYyDReEIi9P/r AA== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 38ktd2h97c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 May 2021 05:07:50 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14K57n0X155436;
        Thu, 20 May 2021 05:07:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38meegnce0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 May 2021 05:07:49 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14K57mBG155429;
        Thu, 20 May 2021 05:07:48 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 38meegncdm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 May 2021 05:07:48 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14K57mon013731;
        Thu, 20 May 2021 05:07:48 GMT
Received: from mwanda (/10.175.161.110)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 20 May 2021 05:07:47 +0000
Date:   Thu, 20 May 2021 08:07:40 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] ASoC: topology: Fix a small leak in
 soc_tplg_dapm_graph_elems_load()
Message-ID: <YKXunAOB1DJ4dT5p@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKXudu7p8VZ2/zZN@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: 9K4pwKNgVIrANbh4l5J_SN2G1ZuxtneO
X-Proofpoint-ORIG-GUID: 9K4pwKNgVIrANbh4l5J_SN2G1ZuxtneO
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We have to kfree(routes) on this error path.

Fixes: ff9226224437 ("ASoC: topology: Change allocations to resource managed")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/soc-topology.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 6b7a813bc264..5730fcaa7bc6 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1135,8 +1135,10 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 	 */
 	for (i = 0; i < count; i++) {
 		routes[i] = devm_kzalloc(tplg->dev, sizeof(*routes[i]), GFP_KERNEL);
-		if (!routes[i])
-			return -ENOMEM;
+		if (!routes[i]) {
+			ret = -ENOMEM;
+			goto free_routes;
+		}
 	}
 
 	for (i = 0; i < count; i++) {
@@ -1198,6 +1200,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 	 * The memory allocated for each dapm route will be freed
 	 * when it is removed in remove_route().
 	 */
+free_routes:
 	kfree(routes);
 
 	return ret;
-- 
2.30.2

