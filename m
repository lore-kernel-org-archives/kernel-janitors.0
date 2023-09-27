Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4602CE810DA
	for <kernel-janitors@archiver.kernel.org>; Wed, 27 Sep 2023 12:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbjI0Mqj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 27 Sep 2023 08:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbjI0Mqh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Sep 2023 08:46:37 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806F4192
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:46:35 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38R79Y3L002836;
        Wed, 27 Sep 2023 07:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        PODMain02222019; bh=nQ779awHgknzMWhlFfvoIYl03BuqDk3HaZgk2JIod4M=; b=
        nh1FD70OOPoFtAMxaKJobUwsN3B+tGsPLQyZDxv4zw9pkZHEVv6B0dTuvPZW7w+C
        kgMGyfOArbpHc3Qq5EHUZtStn+6/TEp6Mjz2OaGWb6UiMwSxcq94T1gCWcUGV2oC
        vGRzn7tcXYJJopQF6g2+baXpIxQRsepJ5Td16lo55Y/XFN2HSMJNG7IcFnMQ6EpQ
        yqRlUuTg2/tg5K61ofoUFpCeJYrYmPmOIWemEuTbagpCVBgdUcY9mGoX3cUbUdFl
        yCypQWZEQQYLnFGC/OmtKnB4dZxhscbSsaFPoWY6bEQhJ9nUXYj4CzcB9kattglu
        UoQJWthsxChNgu6JkcYUCA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t9wdxnv7x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Sep 2023 07:46:14 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 27 Sep
 2023 13:46:12 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Wed, 27 Sep 2023 13:46:12 +0100
Received: from [198.61.65.112] (EDIN4L06LR3.ad.cirrus.com [198.61.65.112])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CE7E911AB;
        Wed, 27 Sep 2023 12:46:11 +0000 (UTC)
Message-ID: <c8acbf4a-4c00-8bb0-e54c-9eebbd436ff4@opensource.cirrus.com>
Date:   Wed, 27 Sep 2023 13:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] ALSA: hda: cirrus_scodec: fix an error code
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        James Schulman <james.schulman@cirrus.com>
CC:     David Rhodes <david.rhodes@cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <kernel-janitors@vger.kernel.org>
References: <5eea7fd5-67c8-4ed4-b5b3-b85dfb7572cc@moroto.mountain>
Content-Language: en-US
From:   Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <5eea7fd5-67c8-4ed4-b5b3-b85dfb7572cc@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 00_LNlPyZLhzEYOCDgQQu_hWSMIgmWqM
X-Proofpoint-GUID: 00_LNlPyZLhzEYOCDgQQu_hWSMIgmWqM
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 27/9/23 13:44, Dan Carpenter wrote:
> The "ret" variable is zero but we should return -EINVAL.
> 
> Fixes: 2144833e7b41 ("ALSA: hda: cirrus_scodec: Add KUnit test")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   sound/pci/hda/cirrus_scodec_test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/pci/hda/cirrus_scodec_test.c b/sound/pci/hda/cirrus_scodec_test.c
> index 5eb590cd4fe2..8ae373676bd1 100644
> --- a/sound/pci/hda/cirrus_scodec_test.c
> +++ b/sound/pci/hda/cirrus_scodec_test.c
> @@ -137,8 +137,8 @@ static int cirrus_scodec_test_create_gpio(struct kunit *test)
>   	priv->gpio_priv = dev_get_drvdata(&priv->gpio_pdev->dev);
>   	if (!priv->gpio_priv) {
>   		platform_device_put(priv->gpio_pdev);
> -		KUNIT_FAIL(test, "Failed to get gpio private data: %d\n", ret);
> -		return ret;
> +		KUNIT_FAIL(test, "Failed to get gpio private data\n");
> +		return -EINVAL;
>   	}
>   
>   	return 0;

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Thanks.
