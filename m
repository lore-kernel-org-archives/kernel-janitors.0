Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD65C433ED
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 May 2021 09:53:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A463613E5
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 May 2021 09:53:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234695AbhEOJyw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 15 May 2021 05:54:52 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:52940 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbhEOJyv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 15 May 2021 05:54:51 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14F9gIg8165199;
        Sat, 15 May 2021 09:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=cC0VbieU0fURlMvLGTqBnhPm6Ssy7wNrIv5JnQEAHeg=;
 b=vxykoURWVMrBd6CgsCNSbw8+imcpJY3wsXCDq6CCKkt+Pqk90ekJhE5t8IsRAEGr45Ar
 YvLNySRPlgD77inPK+uXpXxSXli+CviW/xthS1RcFeVu+cQxWRWqrVhJul9YCQ1c1nsZ
 djg8SFlcpoKZIYUzaC0qRPgkU/+MZOyYgOuAPZl37Lw7w8pHWKbJDqL7wMYuntilrfTv
 rRYOTxAMVvm9Z7JlOpvH+nkI3wzU3rKzFGvmVWJBceaSYJMjjo0Kz6WXky+0VukswuAX
 KIJrTr6qk/Ntc0uj/7wxeni5pNgK2D5p6Y75W73C10CAoRF0E7cP+dOxabpysXJj/A6v aw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 38j68m8aau-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 May 2021 09:53:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14F9e25S031443;
        Sat, 15 May 2021 09:53:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38j4b9qpfk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 May 2021 09:53:26 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14F9rP9b049643;
        Sat, 15 May 2021 09:53:25 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 38j4b9qpfb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 May 2021 09:53:25 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14F9rL58019846;
        Sat, 15 May 2021 09:53:21 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 15 May 2021 02:53:21 -0700
Date:   Sat, 15 May 2021 12:53:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     David Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm: simpledrm: fix a potential NULL dereference
Message-ID: <YJ+aC47XX58ICXax@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: oGI5P2fvJQkTrjOdeqVUQI_jF7Wv3Shl
X-Proofpoint-GUID: oGI5P2fvJQkTrjOdeqVUQI_jF7Wv3Shl
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9984 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105150068
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The drm_format_info() function returns NULL if the format is
unsupported, but the simplefb_get_validated_format() is expected to
return error pointers.  If we propagate teh NULL return then it will
lead to a NULL dereference in the callers.  Swap the NULL and trade it
in for an ERR_PTR(-EINVAL).

Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index f72ca3a1c2d4..4f605c5fe856 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -72,6 +72,7 @@ simplefb_get_validated_format(struct drm_device *dev, const char *format_name)
 	static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
 	const struct simplefb_format *fmt = formats;
 	const struct simplefb_format *end = fmt + ARRAY_SIZE(formats);
+	const struct drm_format_info *info;
 
 	if (!format_name) {
 		drm_err(dev, "simplefb: missing framebuffer format\n");
@@ -79,8 +80,12 @@ simplefb_get_validated_format(struct drm_device *dev, const char *format_name)
 	}
 
 	while (fmt < end) {
-		if (!strcmp(format_name, fmt->name))
-			return drm_format_info(fmt->fourcc);
+		if (!strcmp(format_name, fmt->name)) {
+			info = drm_format_info(fmt->fourcc);
+			if (!info)
+				return ERR_PTR(-EINVAL);
+			return info;
+		}
 		++fmt;
 	}
 
-- 
2.30.2

