Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5ECCC433B4
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 09:13:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A61460C3D
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 09:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbhETJOu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 May 2021 05:14:50 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:23552 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230377AbhETJOu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 May 2021 05:14:50 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14K9BskF015356;
        Thu, 20 May 2021 04:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=kgMXgU6Drc7cCBmMzgp6qY185dcSxO/26GftoC92ZcM=;
 b=p5F23JLnRHPaHdvKwWyfosmJ1Gy3Ij8uHg+97eV8g+A5q2nTVzJZ9+TPH/QsGq1VdnAU
 QzMnADrFiovauHLehrYkEi0dgbfhtmgzdYRPbeG55snDJWG59Pq9KI5asnc4p9u6dU6I
 yHLQvonMG+nAOzjBoOEHeRuSpy5PI07JS18nfyQSG6zbDtZ1RQwLiNaivyqfv1v6KCp5
 3fNQtRG1kWg4Ai+pwtbkYOnftxU+ntEIxmfar5MdD4d+2ec++knjCuM4ziDvdWxRbkEF
 IQYzkpOuQ8fzK289FlQ8GvQ2zB09wl3juIX64UWy6cgDe/AgZp0xS+A68ewdcmiEAgU0 9w== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 38n43v960x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 20 May 2021 04:12:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 20 May
 2021 10:12:37 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Thu, 20 May 2021 10:12:37 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1B4D911CD;
        Thu, 20 May 2021 09:12:37 +0000 (UTC)
Date:   Thu, 20 May 2021 09:12:37 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Paul Handrigan <Paul.Handrigan@cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] ASoC: cs35l33: fix an error code in probe()
Message-ID: <20210520091237.GI64205@ediswmail.ad.cirrus.com>
References: <YKXuyGEzhPT35R3G@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YKXuyGEzhPT35R3G@mwanda>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: bYfN73qFYeEJsvw_yGXDZMa0sx_KDVL7
X-Proofpoint-ORIG-GUID: bYfN73qFYeEJsvw_yGXDZMa0sx_KDVL7
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105200070
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 20, 2021 at 08:08:24AM +0300, Dan Carpenter wrote:
> This error path returns zero (success) but it should return -EINVAL.
> 
> Fixes: 3333cb7187b9 ("ASoC: cs35l33: Initial commit of the cs35l33 CODEC driver.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Good spot dude, sorry I missed that one in my recent fix ups.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
