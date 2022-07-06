Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFD8CCA48E
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Jul 2022 09:07:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233006AbiGFJHw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbiGFJHc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Jul 2022 05:07:32 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B9B255B9
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Jul 2022 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657098324; x=1688634324;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RfpzoH4hfqwhAmi1U0DrZ8kMnGeJ0kLgO1VmGWYJIK4=;
  b=Yxe8bUJpNXFJDZEDCxdyBrB4XE+1iZQrTC7nQe3MfSGL9rOnWdyD/rRt
   lMdu6jYfB3rOrZZqn9PEn8/RornP7S8/wws303zIZfGh11wPmgtjY02Mi
   i8bLkI5vITRE4jRB9PShbR1bTXdhwOMmk/f0cTymH/aSI/8/LeZOQyDRo
   qe1im2TIqN+eULTLsjVte1h1codHyxVeanbhAzfhAY1Il6Op0nugM+JE2
   3EOJyQ3sn+LYgmFVvUedMZrlse26GURG0hLPMrIcMwPtMlSD5+foGCTvG
   2iq45NzIdB+Ktuk7XaMMWjXZyQfbJogINt2kKT4ZqDQOIejMH/270jMpz
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="370007231"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="370007231"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 02:04:54 -0700
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="920080488"
Received: from gguerra-mobl1.ger.corp.intel.com (HELO [10.249.254.46]) ([10.249.254.46])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 02:04:50 -0700
Message-ID: <26db7e60-51d1-444a-7620-8225239ad7bf@linux.intel.com>
Date:   Wed, 6 Jul 2022 12:05:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] ASoC: SOF: sof-client-probes: fix error codes in
 sof_probes_compr_copy()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
References: <YsU4dYXYYVsfs92J@kili>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YsU4dYXYYVsfs92J@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 06/07/2022 10:23, Dan Carpenter wrote:
> This function tries to return the number of bytes that it was able to
> copy to the user.  However, because there are multiple calls to
> copy_to_user() in a row that means the bytes are not necessarily
> consecutive so it's not useful.  Just return -EFAULT instead.

The function is copying data from a circular buffer to a use buffer.
The single copy_to_user() is used when we don't have wrapping, the
'double' copy_to_user() is when we wrap, so first copy is from the end
of the buffer then we copy the data from the start of the buffer to get
all data.

> Fixes: 3dc0d7091778 ("ASoC: SOF: Convert the generic probe support to SOF client")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/soc/sof/sof-client-probes.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
> index 1f1ea93a7fbf..679bc7d371fc 100644
> --- a/sound/soc/sof/sof-client-probes.c
> +++ b/sound/soc/sof/sof-client-probes.c
> @@ -385,7 +385,6 @@ static int sof_probes_compr_copy(struct snd_soc_component *component,
>  	struct snd_compr_runtime *rtd = cstream->runtime;
>  	unsigned int offset, n;
>  	void *ptr;
> -	int ret;
>  
>  	if (count > rtd->buffer_size)
>  		count = rtd->buffer_size;
> @@ -395,14 +394,15 @@ static int sof_probes_compr_copy(struct snd_soc_component *component,
>  	n = rtd->buffer_size - offset;
>  
>  	if (count < n) {
> -		ret = copy_to_user(buf, ptr, count);
> +		if (copy_to_user(buf, ptr, count))
> +			return -EFAULT;
>  	} else {
> -		ret = copy_to_user(buf, ptr, n);
> -		ret += copy_to_user(buf + n, rtd->dma_area, count - n);
> +		if (copy_to_user(buf, ptr, n))
> +			return -EFAULT;
> +		if (copy_to_user(buf + n, rtd->dma_area, count - n))
> +			return -EFAULT;
>  	}
>  
> -	if (ret)
> -		return count - ret;
>  	return count;
>  }
>  

-- 
Péter
