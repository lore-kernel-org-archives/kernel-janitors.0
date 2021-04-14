Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47DBC433ED
	for <kernel-janitors@archiver.kernel.org>; Wed, 14 Apr 2021 06:02:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D88861166
	for <kernel-janitors@archiver.kernel.org>; Wed, 14 Apr 2021 06:02:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348507AbhDNGDJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 14 Apr 2021 02:03:09 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:43810 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348322AbhDNGDJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 14 Apr 2021 02:03:09 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13E5xQ6s149864;
        Wed, 14 Apr 2021 06:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=78oUSeDQnrv+vrZ9S/Pkvr7QEIk0mUXBjWujcLImElA=;
 b=buUeipfTBBxtC9HTey8OW92ctekIzeXUg83Ko+IbcYyfLfTdMNavp3YBFsMugutsRxiu
 bFmy1lTMdGq0+EG+87RXBEE3DCJmdIcaVGmj5afsWzJ+rdcLIZHcbBW3NMpmDGwJFmMU
 zb7I/hZMCC1Hr/CIYROXq/s1tcZ+n2dRNTKNzxPizdRgWooPY2X6B9C5PHoh/K5TeriI
 1RRurL/qz2phJYa191qjMeDKvCyFo0e93x5vtgUx0I8BoesjTuAPLbgCOaVvtVDwqK7f
 AG4OS5PKFWgQbDvRlAINzi+3pUsBZVzWwFFCJBgORxbBCucCXR3EbxP9F6WpJW3+gfe2 Tw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 37u1hbh9t5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 14 Apr 2021 06:02:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13E61WCA062223;
        Wed, 14 Apr 2021 06:02:35 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 37unstf2fg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 14 Apr 2021 06:02:35 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13E62Xa5018042;
        Wed, 14 Apr 2021 06:02:33 GMT
Received: from mwanda (/10.175.166.128)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 14 Apr 2021 06:02:32 +0000
Date:   Wed, 14 Apr 2021 09:02:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        Matt Roper <matthew.d.roper@intel.com>,
        Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= 
        <thomas.hellstrom@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915: fix an error code in intel_overlay_do_put_image()
Message-ID: <YHaFcEzcnh/hk1/Q@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140042
X-Proofpoint-GUID: lpEdzO9HprX7Y1f-Ph4IF_EFjpJ2MZtd
X-Proofpoint-ORIG-GUID: lpEdzO9HprX7Y1f-Ph4IF_EFjpJ2MZtd
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 priorityscore=1501
 clxscore=1011 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140042
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code should propagate the error from intel_overlay_pin_fb()
but currently it returns success.

Fixes: 1b321026e213 ("drm/i915: Pass ww ctx to intel_pin_to_display_plane")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index e477b6114a60..e5dadde422f7 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -803,8 +803,10 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 	atomic_inc(&dev_priv->gpu_error.pending_fb_pin);
 
 	vma = intel_overlay_pin_fb(new_bo);
-	if (IS_ERR(vma))
+	if (IS_ERR(vma)) {
+		ret = PTR_ERR(vma);
 		goto out_pin_section;
+	}
 
 	i915_gem_object_flush_frontbuffer(new_bo, ORIGIN_DIRTYFB);
 
-- 
2.30.2

