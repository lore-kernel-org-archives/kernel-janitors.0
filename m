Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0982EC433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Mar 2022 14:53:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236578AbiCROzC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Mar 2022 10:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237623AbiCROy6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Mar 2022 10:54:58 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5371F10876B
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Mar 2022 07:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647615218; x=1679151218;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bfWU2YF+kWT90DlMBu51PEmAdtdOwU0hgjdLKZfgG2s=;
  b=Bx/Rs+J8yx9YTou+ZpZw0INueGKXZzCdga/Z0XyJzkfEIAfCSwOcAlx1
   lIDQ9glhqwiSHfNgHOvOmTdwMDtlrHNJZ+NvjgkuIhGr9HbExMeFeaUXh
   NmvuFebbIbR4Xnget4IS5r+UXBShXdunh38rtxGJbbISfbJzPZnAtxr/l
   bkWNkARnfc7xAw3f6ovNQ9qxieP9I/0CUE+h36QATEIcd8/BQuEsD1Y9D
   EF9nuKjSlonUcf2b5zwfel3Au2oin6KMHvGvhhmllyAOpKv7MvxzwVoBJ
   vqTFxZFoemlTwdQ0Lan///YOXapIonM1Jev6gddHxaGmcejbA5D4VpZUT
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="281959326"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="281959326"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 07:53:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="691342073"
Received: from mdabdull-mobl1.amr.corp.intel.com (HELO [10.251.31.89]) ([10.251.31.89])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 07:53:29 -0700
Message-ID: <cf4c4a84-335d-8799-7a5b-afe298881342@linux.intel.com>
Date:   Fri, 18 Mar 2022 09:42:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] ASoC: SOF: Prevent NULL dereference in
 sof_pcm_dai_link_fixup()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc:     alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
        kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        sound-open-firmware@alsa-project.org
References: <20220318071233.GB29472@kili>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220318071233.GB29472@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 3/18/22 02:12, Dan Carpenter wrote:
> The "dia" pointer can be NULL, so handle that condition first before
> storing "dia->private".
> 
> Fixes: 839e484f9e17 ("ASoC: SOF: make struct snd_sof_dai IPC agnostic")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch.

This part will be removed in follow-up patches, likely the reason why 
this problem was missed.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/sof/pcm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> index 1661b0bc6f12..71f5bce0c4c7 100644
> --- a/sound/soc/sof/pcm.c
> +++ b/sound/soc/sof/pcm.c
> @@ -702,7 +702,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
>   	struct snd_sof_dai *dai =
>   		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
>   	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
> -	struct sof_dai_private_data *private = dai->private;
> +	struct sof_dai_private_data *private;
>   	struct snd_soc_dpcm *dpcm;
>   
>   	/* no topology exists for this BE, try a common configuration */
> @@ -727,6 +727,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
>   	/* read format from topology */
>   	snd_mask_none(fmt);
>   
> +	private = dai->private;
>   	switch (private->comp_dai->config.frame_fmt) {
>   	case SOF_IPC_FRAME_S16_LE:
>   		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
