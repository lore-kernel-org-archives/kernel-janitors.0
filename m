Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F461C2B9F8
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 May 2021 12:48:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7A156142E
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 May 2021 12:48:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbhEYMtf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 25 May 2021 08:49:35 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:56328 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232859AbhEYMtc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 May 2021 08:49:32 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14PCdmsD036221;
        Tue, 25 May 2021 12:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=BKbE7DiW4qZPLcR6JNVoXNFqy3oeaLNh4Q0ktF1XY0g=;
 b=qKJTjFlsMHbwADSZC3EfwielE4piVb+soXvoz7wGBM17+ZG9qsj4Kx9WUNssxO6O8duS
 hmJo/EbB470cZbeYUNneiSTAzzTaB0OGF0ED4Zsdujjs5hxCusrN6gp97mRsBHj4OjvS
 V+OU2V3AZdp05aMwUspgTuw82NYrxnQbMO3FmSGmGG7NpdoA3NMwf/cjvdWV6U3TLxA8
 pM19qsk/+dyktlxbO/osaVHuetHz6VZXQVebDopsh1oE9mdXmKNT6yVa8hBLM7oTT5Lc
 t6t73oVhgF3Fxj/xQzo8AW1emN9Q5MeFGD34LhMNhkWUR92b8zpl6jeRe5H6TAwOqDMq JA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 38ptkp5v9k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 May 2021 12:47:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14PCeBJn069520;
        Tue, 25 May 2021 12:47:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 38qbqs6qa7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 May 2021 12:47:51 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14PCloXg084869;
        Tue, 25 May 2021 12:47:50 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 38qbqs6q9s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 May 2021 12:47:50 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14PClmTm004043;
        Tue, 25 May 2021 12:47:49 GMT
Received: from mwanda (/10.175.166.49)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 25 May 2021 05:47:48 -0700
Date:   Tue, 25 May 2021 15:47:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Felix Kuehling <Felix.Kuehling@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Oak Zeng <Oak.Zeng@amd.com>,
        Ramesh Errabolu <Ramesh.Errabolu@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] drm/amdgpu: Fix an error code in kfd_mem_attach_dmabuf()
Message-ID: <YKzx6sh5g3Y/pNRC@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKzxvyKEl/gNPg/r@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: _xvyZdaqE6-UXsWqWBwpx41bV7CktKVd
X-Proofpoint-ORIG-GUID: _xvyZdaqE6-UXsWqWBwpx41bV7CktKVd
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9994 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250078
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If amdgpu_gem_prime_export() fails, then this code accidentally
returns zero/success instead of a negative error code.

Fixes: 190f2d7696c8 ("drm/amdgpu: Add DMA mapping of GTT BOs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 68109908a869..9b7a3f849a16 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -639,14 +639,16 @@ kfd_mem_attach_dmabuf(struct amdgpu_device *adev, struct kgd_mem *mem,
 		      struct amdgpu_bo **bo)
 {
 	struct drm_gem_object *gobj;
+	int ret;
 
 	if (!mem->dmabuf) {
 		mem->dmabuf = amdgpu_gem_prime_export(&mem->bo->tbo.base,
 			mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
 				DRM_RDWR : 0);
 		if (IS_ERR(mem->dmabuf)) {
+			ret = PTR_ERR(mem->dmabuf);
 			mem->dmabuf = NULL;
-			return PTR_ERR(mem->dmabuf);
+			return ret;
 		}
 	}
 
-- 
2.30.2

