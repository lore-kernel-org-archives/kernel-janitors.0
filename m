Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89AFC433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Jun 2022 11:03:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243960AbiFOLDf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Jun 2022 07:03:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354831AbiFOLDU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Jun 2022 07:03:20 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C875844741
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Jun 2022 04:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655290959; x=1686826959;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+eBod1AbuflrGZyETNkqQFJ/qRpCcnjD62eOthJoFJE=;
  b=IGQFMWyODZqzGtp1EdAc92ojOQnxrz5yFs6udRlzy3GMlGWsUhzWk485
   HskGWtGWvx3+mUAJuKlc3MAoDMBHtOXwLm86kspLlbL9UFJfV5mKy3ks/
   aLCygcjcEFqk60lnLUUOno87I4yv/CZFgudNoe0eIaEZintDiyZTtWvSQ
   olC5lHup6MQ6bWB0HtpJOHBOTJUQsjWXw2RWeqXmdPPSxHiJblcISYFj6
   lXxrWizzM9SpGJ2AUgteEsU1fJsHjrYuRCICwZzV3rXit4W8e/KSwQTca
   LpuSKwISKPDYmD5rnzzIF8HLSKD5R7GmS9awikHIN/Ex8WUAaGQsMfM1O
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="258772383"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="258772383"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 04:02:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="830979055"
Received: from ldortadu-mobl1.amr.corp.intel.com (HELO [10.209.160.187]) ([10.209.160.187])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 04:02:37 -0700
Message-ID: <5e2f44f1-de41-ac02-9fa8-e26a849897ad@linux.intel.com>
Date:   Wed, 15 Jun 2022 05:56:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: SOF: mediatek: Fix error code in probe
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     alsa-devel@alsa-project.org,
        Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
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
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YqmWIK8sTj578OJP@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 6/15/22 03:19, Dan Carpenter wrote:
> This should return PTR_ERR() instead of IS_ERR().
> 
> Fixes: e0100bfd383c ("ASoC: SOF: mediatek: Add mt8186 ipc support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Nice catch, thanks!

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

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
