Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F91C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Mar 2022 14:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237627AbiCROzA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Mar 2022 10:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237625AbiCROy7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Mar 2022 10:54:59 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF02010A7E4
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Mar 2022 07:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647615219; x=1679151219;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yld6LrFeJIp66uBCsGtAheYeUr4v7ay70MC6FnCNO8M=;
  b=Lje/HxYtcHyyvzU+16pZQR3OZBzFrwnbEok0uHwGEk5jn4kM8JhQiGFF
   ijUwL8gy5M51ZbdwZMxTX28Oe/Dtnjt3qeoeSUHnnF9F5gfNPFPLnrIua
   1DyRGBhkEhqNMU8pjSDj0AYFQobcEDu/6092kjv8tUopFYdqd20FEH5RV
   DDTPgKxtkxuokBbARo7gFut9rxYjP9MUaCd9fYhcHzL5pgFdX6s611Mc+
   Rbj7CDEWecHaVP+D7ydYHz0DckG+PhRg5b+9PV0VjLOCm0ge5snG9PfOw
   PSqRaaDfHREYYND01UcDC5yiRzYoqABM5K5ye+xrlYDVRLITasjHOszWq
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="281959332"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="281959332"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 07:53:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="691342095"
Received: from mdabdull-mobl1.amr.corp.intel.com (HELO [10.251.31.89]) ([10.251.31.89])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 07:53:31 -0700
Message-ID: <58fc6207-c4f4-9504-f00f-7f5f18fce6ba@linux.intel.com>
Date:   Fri, 18 Mar 2022 09:51:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] ASoC: SOF: check for NULL before dereferencing
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc:     alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        kernel-janitors@vger.kernel.org,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        sound-open-firmware@alsa-project.org
References: <20220318071308.GC29472@kili>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220318071308.GC29472@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 3/18/22 02:13, Dan Carpenter wrote:
> This code dereferences "dai" before checking whether it can be NULL.
> 
> Fixes: 839e484f9e17 ("ASoC: SOF: make struct snd_sof_dai IPC agnostic")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Same thing, this code will be removed in follow-up patches and we missed 
the intermediate error. Thanks for the patch.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/sof/sof-audio.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
> index 15c36a51f89f..88ddd1e2476d 100644
> --- a/sound/soc/sof/sof-audio.c
> +++ b/sound/soc/sof/sof-audio.c
> @@ -626,10 +626,13 @@ int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
>   		/* update DAI config. The IPC will be sent in sof_widget_setup() */
>   		if (WIDGET_IS_DAI(swidget->id)) {
>   			struct snd_sof_dai *dai = swidget->private;
> -			struct sof_dai_private_data *private = dai->private;
> +			struct sof_dai_private_data *private;
>   			struct sof_ipc_dai_config *config;
>   
> -			if (!dai || !private || !private->dai_config)
> +			if (!dai)
> +				continue;
> +			private = dai->private;
> +			if (!private || !private->dai_config)
>   				continue;
>   
>   			config = private->dai_config;
> @@ -918,10 +921,13 @@ static int sof_dai_get_clk(struct snd_soc_pcm_runtime *rtd, int clk_type)
>   		snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
>   	struct snd_sof_dai *dai =
>   		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
> -	struct sof_dai_private_data *private = dai->private;
> +	struct sof_dai_private_data *private;
>   
>   	/* use the tplg configured mclk if existed */
> -	if (!dai || !private || !private->dai_config)
> +	if (!dai)
> +		return 0;
> +	private = dai->private;
> +	if (!private || !private->dai_config)
>   		return 0;
>   
>   	switch (private->dai_config->type) {
