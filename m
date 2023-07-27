Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70846C001DC
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 Jul 2023 09:53:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjG0JwW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 27 Jul 2023 05:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbjG0JwT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jul 2023 05:52:19 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD0E97
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Jul 2023 02:52:16 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36R9ggbV020713;
        Thu, 27 Jul 2023 04:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        PODMain02222019; bh=y9h5w3kgmuNZ6VZiUFw3aKCfaW0c+5Bld4TOeOpz9UU=; b=
        AHazICh5tRi4cJGekA/HbdN7FiT8MVP8iFV+anzRlM+vouTxLT1c/XLhO6Lym4VJ
        rw87fpWcVASILVF86JJmQy5/xfA1F3qEXw3tjEmgM/s3GbIY2Mq8cCw+NfEXG2pO
        9nNAdA8b0a+mYuezC3uu/qCUTlmu1/OgOPdsHwGUi51JLPXdiELXyIP8+IrbtSjD
        x9gk/HTAQQrYPoKZZayCRwcWQaZ9/VLJEMyibi5DjZsGXBKZUvVywr23/+8zRAdE
        tixNh1gGtR/9nOlLCzmXYSKW5r60/2fnQ8B83RWj/Lca+9DT4hOrsM6w9tvEVPv/
        Fc2nqh2kes4+OmGIEtEgIA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s1nm9bsmw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Jul 2023 04:51:59 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 10:51:34 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Thu, 27 Jul 2023 10:51:34 +0100
Received: from [198.61.65.196] (EDIN4L06LR3.ad.cirrus.com [198.61.65.196])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A093A45;
        Thu, 27 Jul 2023 09:51:33 +0000 (UTC)
Message-ID: <1bcfb2f4-f893-98a3-6919-132cb4ebbd1f@opensource.cirrus.com>
Date:   Thu, 27 Jul 2023 10:51:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ALSA: hda/cs35l56: Do some clean up on probe error
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Simon Trimmer <simont@opensource.cirrus.com>
CC:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mark Brown <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <kernel-janitors@vger.kernel.org>
References: <465160f4-b7cf-41d5-931e-d6c9e68fa3c7@moroto.mountain>
From:   Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <465160f4-b7cf-41d5-931e-d6c9e68fa3c7@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OFtSwBymQZyL1os5hbf0l72vMwEz-7qQ
X-Proofpoint-GUID: OFtSwBymQZyL1os5hbf0l72vMwEz-7qQ
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 27/7/23 08:16, Dan Carpenter wrote:
> Smatch complains that this return should be a goto:
> 
>      sound/pci/hda/cs35l56_hda.c:910 cs35l56_hda_common_probe()
>      warn: missing unwind goto?
> 
> The goto error disables cansleep so that seems reasonable.
> 
> Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   sound/pci/hda/cs35l56_hda.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> index 71e95e64f8a4..4c3279f61b94 100644
> --- a/sound/pci/hda/cs35l56_hda.c
> +++ b/sound/pci/hda/cs35l56_hda.c
> @@ -907,7 +907,7 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id)
>   
>   	ret = cs35l56_set_patch(&cs35l56->base);
>   	if (ret)
> -		return ret;
> +		goto err;
>   
>   	regcache_mark_dirty(cs35l56->base.regmap);
>   	regcache_sync(cs35l56->base.regmap);

Thanks.

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
