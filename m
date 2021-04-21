Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06AFC433ED
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Apr 2021 10:20:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCBF66143B
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Apr 2021 10:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239273AbhDUKU6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 21 Apr 2021 06:20:58 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:32800 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238273AbhDUKUy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Apr 2021 06:20:54 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13LAF0t7048043;
        Wed, 21 Apr 2021 10:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=OGVzczo8X2CzYs76hjDAavMU0KllKCDtQcQtDtAgxAg=;
 b=ASr/xIGC4KnB4nLNqd+/I3CPJnBsVVTEtcZzRaCZaiJUjuuCK5PleEpLAs2oJOnLBlrY
 N9Q2847YPMk4zoUc9APMCfRD/BQmyqs+5Xoaez6bqT2uY/ST23u+t8Y46N2/ufTgV71D
 5Lfholth6B+FPnApol17CoRDnskWpvp91zI0ZoXDCe5KmF3zg63Yy21ShNqVxVBOpyzS
 MIvXWYKpkNl3cPUxi1a0HHj+ml0PdKrDYcfwXf2s0WgkpRQO4+EhPSN6aHBEpkuZEx2k
 3R5ZAaHt7Zxxnf0AzCKeDQpRWy7fE1qyeh9j8jVNxW04UvWshBsLxHEhreKwsCFgHCGu xA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 37yveahg9x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 21 Apr 2021 10:18:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13LAAwSR051066;
        Wed, 21 Apr 2021 10:18:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38098rhcsw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 21 Apr 2021 10:18:16 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13LAIFdE078819;
        Wed, 21 Apr 2021 10:18:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 38098rhcs2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 21 Apr 2021 10:18:15 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13LAIAsm001785;
        Wed, 21 Apr 2021 10:18:10 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 21 Apr 2021 03:18:09 -0700
Date:   Wed, 21 Apr 2021 13:18:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Eric Anholt <eric@anholt.duckdns.org>,
        Boris Brezillon <bbrezillon@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/vc4: fix argument ordering in vc4_crtc_get_margins()
Message-ID: <YH/720FD978TPhHp@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: OhSG_osjKYcl93FdRCopBmzUUvB3TSCe
X-Proofpoint-ORIG-GUID: OhSG_osjKYcl93FdRCopBmzUUvB3TSCe
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9960 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 phishscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104210078
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Cppcheck complains that the declaration doesn't match the function
definition.  Obviously "left" should come before "right".  The caller
and the function implementation are done this way, it's just the
declaration which is wrong so this doesn't affect runtime.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index a7500716cf3f..5dceadc61600 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -825,7 +825,7 @@ void vc4_crtc_destroy_state(struct drm_crtc *crtc,
 void vc4_crtc_reset(struct drm_crtc *crtc);
 void vc4_crtc_handle_vblank(struct vc4_crtc *crtc);
 void vc4_crtc_get_margins(struct drm_crtc_state *state,
-			  unsigned int *right, unsigned int *left,
+			  unsigned int *left, unsigned int *right,
 			  unsigned int *top, unsigned int *bottom);
 
 /* vc4_debugfs.c */
-- 
2.30.2

