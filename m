Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F10FC433B4
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 May 2021 09:51:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D894613ED
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 May 2021 09:51:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234676AbhEOJwd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 15 May 2021 05:52:33 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59142 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234691AbhEOJw3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 15 May 2021 05:52:29 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14F9mbsT025279;
        Sat, 15 May 2021 09:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=KfuS4wvCARA6NWgLIsSOng+VhaRUv1UyvcW0jNRiutM=;
 b=EWBPk98of9idHOVBBZhCI2sAEn/13BbVGiYWYgqkDQiHBcEF9HzDziMmVieGpX7lOvLs
 eQP4MMANqm5vhqF7fBCnCFBOrFHjsKCwMC0OJWMjRV2gjaxMoJ96UITpyw1w3nkEx7Ju
 0EhVqSQBYrO+9+aB+c5qxLX2x1St7FFfj5k0cFrV9taMC6HNjSgCJ0q7gOorvIm0XejQ
 tZJvClAMv3ntoFiM368F9qWDUZP8xAVjPAtFHlWUpPpesjh3zfao+3bhVfpznCP4wj5Z
 k1WKkASoYHKAEcXJJTivbcHcvJ+lxPAa5H54A6C4MPvneuPo+8qkb4L1drEcR2+QFSBc ng== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 38j5ws02k4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 May 2021 09:51:07 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14F9p6fX105208;
        Sat, 15 May 2021 09:51:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38j641ffsy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 May 2021 09:51:06 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14F9p6Z0105183;
        Sat, 15 May 2021 09:51:06 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 38j641ffsn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 May 2021 09:51:06 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14F9p56L017583;
        Sat, 15 May 2021 09:51:05 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 15 May 2021 02:51:05 -0700
Date:   Sat, 15 May 2021 12:50:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Phong LE <ple@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] drm: bridge: it66121: fix a resource leak in probe
Message-ID: <YJ+ZgXTFa6voZuJG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJ+ZX3BdKPAN0pUZ@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: igl3bXYpPeRR3XFJ7ImVPFm5KLQ9gtVt
X-Proofpoint-GUID: igl3bXYpPeRR3XFJ7ImVPFm5KLQ9gtVt
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In the original code if the "ctx = devm_kzalloc()" allocation failed
then we should have called of_node_put(ep); before returning.  It's
actually a bit easier to do the allocation first before assigning
ep = of_graph_get_endpoint_by_regs().

Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 6980c9801d0d..7149ed40af83 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -898,14 +898,14 @@ static int it66121_probe(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
-	if (!ep)
-		return -EINVAL;
-
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+	if (!ep)
+		return -EINVAL;
+
 	ctx->dev = dev;
 	ctx->client = client;
 
-- 
2.30.2

