Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA924C433E6
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Feb 2021 14:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FB3464ECE
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Feb 2021 14:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232763AbhBYOpT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 Feb 2021 09:45:19 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:40346 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232596AbhBYOpQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Feb 2021 09:45:16 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11PEcaRZ080591;
        Thu, 25 Feb 2021 14:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=HIFzO0CwZK6213oUSuv7VGnTPS57wltV+sXylJ7TuDk=;
 b=cLvW1tx5jJoQ281pceIptaKkb/iQd5qf6HyCOlsVGvmQof1ctk+0m6uX3UJ9PegfNDLC
 BJFsVYgMF/9g1Vmn0zBdV4ByNXPvZXLtShTq5vpjvZEZDbqR0+IPmmVn1R4e4aOTWnJI
 rHhnoPX+yxLTd5+KvBHS45em9oe3njIgyL0HlD7XgivJyUvnTXWSu6y52mjzkdJy2bNC
 j0WoEue6zHYA1KXtzqEpEOdYOJmHBIlbiO+pKgg+FMCgTmCUKSK3mjLhkaiwK3uJ6Zjo
 HdMyse+KuVWTOtv6Gm4mddg1QujZK2BVW/zs3GJ90R4RR3zKCBeG9NBPR1V67OSY0m2M Og== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 36ugq3nj38-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Feb 2021 14:42:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11PEecFr083135;
        Thu, 25 Feb 2021 14:42:27 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 36ucc1a3cv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Feb 2021 14:42:27 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11PEgIGl017544;
        Thu, 25 Feb 2021 14:42:18 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 25 Feb 2021 06:42:17 -0800
Date:   Thu, 25 Feb 2021 17:42:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Eric Anholt <eric@anholt.duckdns.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH RESEND] drm/vc4: Fix an error code vc4_create_object()
Message-ID: <20210225144210.GA2222@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9905 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102250119
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9905 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102250119
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The vc4_create_object() needs to return NULL on error, not error
pointers.  If it returns an error pointer then that will lead to an
Oops in the callers.  Fortunately, in current kernels small allocations
always succed so this will never happen.

Fixes: c826a6e10644 ("drm/vc4: Add a BO cache.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I sent this patch last June but it was never applied.

 drivers/gpu/drm/vc4/vc4_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 72d30d90b856c..0af246a5609ca 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -389,7 +389,7 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 
 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
 	if (!bo)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	bo->madv = VC4_MADV_WILLNEED;
 	refcount_set(&bo->usecnt, 0);
-- 
2.26.2
