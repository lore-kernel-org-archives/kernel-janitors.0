Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C5DC2B9F4
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 19:02:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A72D61166
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 19:02:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbhFVTEy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Jun 2021 15:04:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4844 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229786AbhFVTEy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 15:04:54 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15MIpX5M015464;
        Tue, 22 Jun 2021 19:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=u+Pcpdfv5XiIJVzj+HrRRNCTdf8HxwKR9fmNhdehMXM=;
 b=FR8FZKAFp/KkxakFDQMW0GTqafMMRN34Wbcf9pZl/uLTu5fOnH+Az+5C6nKkhbvVG/p2
 LPP8zBfkDzy2pywWbbALWKZ2CvvXOVcHBMV2jWHQlZPu1cx95IRllAgzf2TGKrun+YUp
 obryrqj0fntU8otYEMHHe4wprBwtggHWZRn7z5XgX+tVDR13+iNvH4O6uWgXNrNoPOoc
 HwF7vQzkz5fEhfXfSASju7wJ2Yasv6NMiv2Jm8WkWmRZ541AzGfgqI8a+5L+pUi8GvDo
 uCT6BZVXhAKIA9VNgqxng//f7uKHC0XL9gY3+1Id0t/hD3dHPDJzlI2WbXAFNPo4VJsN 0w== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 39ap66m53f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 19:02:16 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15MJ2FnH141704;
        Tue, 22 Jun 2021 19:02:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 399tbt72gw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 19:02:15 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15MJ2Esc141663;
        Tue, 22 Jun 2021 19:02:15 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 399tbt72g0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 19:02:14 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15MJ2Adc031545;
        Tue, 22 Jun 2021 19:02:11 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 22 Jun 2021 12:02:09 -0700
Date:   Tue, 22 Jun 2021 22:02:02 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Jasmin Fazlic <superfassl@gmail.com>,
        Romain Perier <romain.perier@gmail.com>,
        Leon Romanovsky <leon@kernel.org>,
        Huilong Deng <denghuilong@cdjrlc.com>,
        Tong Zhang <ztong0001@gmail.com>,
        Allen Pais <allen.lkml@gmail.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: hdsp: fix a test for copy_to_user() failure
Message-ID: <YNIzqpVR6L2t/RwJ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: XfKTsGLLD1wiJBqPkRyD99cj_evkpHhH
X-Proofpoint-GUID: XfKTsGLLD1wiJBqPkRyD99cj_evkpHhH
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The copy_to_user() function returns the number of bytes remaining to be
copied.  It doesn't return negatives.

Fixes: 66c8f75919dd ("ALSA: hdsp: Fix assignment in if condition")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/pci/rme9652/hdsp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index e3e4fabf4abf..8457a4bbc3df 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -4877,9 +4877,8 @@ static int snd_hdsp_hwdep_ioctl(struct snd_hwdep *hw, struct file *file, unsigne
 		memset(&hdsp_version, 0, sizeof(hdsp_version));
 		hdsp_version.io_type = hdsp->io_type;
 		hdsp_version.firmware_rev = hdsp->firmware_rev;
-		err = copy_to_user(argp, &hdsp_version, sizeof(hdsp_version));
-		if (err < 0)
-		    	return -EFAULT;
+		if (copy_to_user(argp, &hdsp_version, sizeof(hdsp_version)))
+			return -EFAULT;
 		break;
 	}
 	case SNDRV_HDSP_IOCTL_UPLOAD_FIRMWARE: {
-- 
2.30.2

