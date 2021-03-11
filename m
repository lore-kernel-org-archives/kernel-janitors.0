Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE459C433E0
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 23:01:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7F2464F8D
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 23:01:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhCKXBO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Mar 2021 18:01:14 -0500
Received: from pv50p00im-ztdg10021201.me.com ([17.58.6.45]:49345 "EHLO
        pv50p00im-ztdg10021201.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230259AbhCKXAw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Mar 2021 18:00:52 -0500
X-Greylist: delayed 614 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Mar 2021 18:00:52 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
        s=1a1hai; t=1615503037;
        bh=gzupFvlplijsWU4QGQzs8gytlwyj8mMLWfvwvIvRkzw=;
        h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:To;
        b=YrtLePh3y6d35JsoqfcaSiJtD30I5eEE16PbqYJqCH0UuPA3EnPpdGjdG0Aik7E/7
         1z5G41/p4Vii1VMQm+Qkd0otoMy5EkcysLfpY1thZ7gOT2RP6vKyTkfmyLVgAOhJ8c
         rqiXAn+CGm35r34CeXbxLD4nZA8nhD7Pov9nBE6l9UZH+Hb+jbd3CzzLny8g6DHQI9
         /xKDw0h1DZ8ZSZI1xsidM097jHFSv47crf/wpsSRrJBpEROh/cawRUHI5gez4QHGIf
         ouRpDV4ixAslwvWCuUk+wz9SxpPYNqDvcPgYKhYPEC5mcPdlml1kZpU6ViabxathYY
         JFeye7A4hMMCA==
Received: from [10.180.231.95] (unknown [176.204.148.171])
        by pv50p00im-ztdg10021201.me.com (Postfix) with ESMTPSA id 2CBDFA4041D;
        Thu, 11 Mar 2021 22:50:37 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
From:   bin 5alaf <mayedbinkhalaf@icloud.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH -next] ASoC: rt715-sdca: Remove unused including <linux/version.h>
Message-Id: <BF212C7D-5590-4FC7-AF10-2538021ABEBA@icloud.com>
Date:   Fri, 12 Mar 2021 02:50:33 +0400
To:     weiyongjun1@huawei.com
Cc:     alsa-devel@alsa-project.org, broonie@kernel.org, hulkci@huawei.com,
        jack.yu@realtek.com, kernel-janitors@vger.kernel.org,
        lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
        oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com
X-Mailer: iPhone Mail (18C66)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_12:2021-03-10,2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=689 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2103110122
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

2YXvu78NCtmF2Kgg2YbZgtmI2YQgDQrigKvYo9mP2LHYs9mE2Kog2YXZhiDYp9mE2YAgaVBob25l
4oCs
