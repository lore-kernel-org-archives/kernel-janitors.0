Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E908C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Jun 2022 06:29:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359018AbiFPG3m (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 16 Jun 2022 02:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359156AbiFPG3l (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Jun 2022 02:29:41 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D59D56B03
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Jun 2022 23:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655360980; x=1686896980;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wif9O5KgkHB6xEW3qKmsm9ZXlJa2XQra7Oa5kcrBsGA=;
  b=Yt4bHKf5PH+feCY4KIH7LpeBqZ0K0uJq5aeG26zAT9RjT5Oj6ATQUmFX
   kPSvcmNt8R0j4IKr8nQiUx0TplgvCVyLaVL6XY1PqVW6P5fg2zMQ1YNZZ
   nMxG+GPUik33ojzhlqv1KUq7+64nkvBHA3vMfteRy5JU6lM7VwtMer/Hr
   yAz5Qb/rch4c/fD36DepsafpeCObKes0c5CzSpNMTEwaUvi/okZNjmx14
   +wUbR19f7/VfToJJLHiIke9jN+9vQzHZsh8mtqyKRcrWRxZLA51Jc1Tbl
   nkyyRTB6RIftxBMK//4+ftmk7NxqOXPLvNmbWz5k8l16ig3Ok5iwcVGpV
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="279894584"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="279894584"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 23:29:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="831426996"
Received: from marlonpr-mobl3.ger.corp.intel.com (HELO [10.249.254.228]) ([10.249.254.228])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 23:29:36 -0700
Message-ID: <01641154-8cf3-ef29-3bc2-c3c1b31b877c@linux.intel.com>
Date:   Thu, 16 Jun 2022 09:30:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Fix error code in
 sof_ipc4_volume_put()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc:     alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        kernel-janitors@vger.kernel.org,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Rander Wang <rander.wang@linux.intel.com>,
        sound-open-firmware@alsa-project.org
References: <YqqyDU5BhOzpRjco@kili>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YqqyDU5BhOzpRjco@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 16/06/2022 07:31, Dan Carpenter wrote:
> The sof_ipc4_volume_put() function returns type bool so returning
> -ENOENT means returning true.  Return false instead.

Good catch,

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Fixes: 955e84fc0b6d ("ASoC: SOF: ipc4-topology: Add control IO ops")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/soc/sof/ipc4-control.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
> index 95ee121dd3cf..0d5a578c3496 100644
> --- a/sound/soc/sof/ipc4-control.c
> +++ b/sound/soc/sof/ipc4-control.c
> @@ -142,7 +142,7 @@ static bool sof_ipc4_volume_put(struct snd_sof_control *scontrol,
>  
>  	if (!widget_found) {
>  		dev_err(scomp->dev, "Failed to find widget for kcontrol %s\n", scontrol->name);
> -		return -ENOENT;
> +		return false;
>  	}
>  
>  	ret = sof_ipc4_set_volume_data(sdev, swidget, scontrol);

-- 
Péter
