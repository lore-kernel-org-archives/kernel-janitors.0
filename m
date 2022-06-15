Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689CDC433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Jun 2022 12:00:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343836AbiFOMA4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Jun 2022 08:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236920AbiFOMAy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Jun 2022 08:00:54 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF8454024
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Jun 2022 05:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655294454; x=1686830454;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yCu340qMfg6oZcr5JvLYeZcBPp9Lyul8ahB/e4qnXUI=;
  b=Ai7jChyJmhaLkh1aa9pfBHj1n23J+rNCu07+yGMCaPiyx6AcjcT7mcCz
   gRs+y4jgM8W0noE/ChE0kvZGjHzdXhnaYbW5h6fA4IArBjE+R1fzWe1gk
   XwqK2++qkQXxruQdtmWOUTrxJ/OiRX5Iz0AMSdcdP4trrYbav8ldt2Hue
   STQJr7vtOEaGty/nYDYxdVUxmoR4rKb5jxF8qjeHKg0YFKyB2zewG9rN9
   2dy1IZTPlhMPPjGPPoB0ftPcMTVa2TP29DdSpOMGK/mTzyB5Uh7pvf8yX
   IxL/4qljbsRFXWbqwfyUwDtOZsGpCZWHcJHvzHnq9RjZz8+GwAyxW+7/5
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="267624380"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="267624380"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 05:00:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="674463081"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO [10.249.254.173]) ([10.249.254.173])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 05:00:49 -0700
Message-ID: <416df4cf-5421-cbf3-bb47-b39c6129ff71@linux.intel.com>
Date:   Wed, 15 Jun 2022 15:01:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: SOF: mediatek: Fix error code in probe
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     alsa-devel@alsa-project.org,
        Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Mark Brown <broonie@kernel.org>,
        linux-mediatek@lists.infradead.org,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        YC Hung <yc.hung@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        sound-open-firmware@alsa-project.org
References: <YqmWIK8sTj578OJP@kili>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YqmWIK8sTj578OJP@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 15/06/2022 11:19, Dan Carpenter wrote:
> This should return PTR_ERR() instead of IS_ERR().

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Fixes: e0100bfd383c ("ASoC: SOF: mediatek: Add mt8186 ipc support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
> index 3333a0634e29..e006532caf2f 100644
> --- a/sound/soc/sof/mediatek/mt8186/mt8186.c
> +++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
> @@ -392,7 +392,7 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
>  						      PLATFORM_DEVID_NONE,
>  						      pdev, sizeof(*pdev));
>  	if (IS_ERR(priv->ipc_dev)) {
> -		ret = IS_ERR(priv->ipc_dev);
> +		ret = PTR_ERR(priv->ipc_dev);
>  		dev_err(sdev->dev, "failed to create mtk-adsp-ipc device\n");
>  		goto err_adsp_off;
>  	}

-- 
Péter
