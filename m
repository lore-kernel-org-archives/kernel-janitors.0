Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A8CC43334
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Jul 2022 09:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbiGFJ1O (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbiGFJ1M (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Jul 2022 05:27:12 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38BA01D0D2
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Jul 2022 02:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657099631; x=1688635631;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OqoSbqDwwOzRRi8jeyun12rYrQP6dVrQCq0Pp8SDvgk=;
  b=aWlAfmUyoVsjjsSTehlWvjtG6Oi9O399yPdUOgbAHPgwzhB3YH3JBSrP
   MosDfYN8HA+PfHCSMsHKxFNbUrNQOaHYXAw09L7seo3DmVRJ2qbf8xy+U
   5TnpbFUeEzCNvQgglJHGj1kYPphpmM1gbrdF/jjrpiacTjXGM6It8TxcT
   K0gZhCfuzharUI7OEd2l90V3EKs3/1MgrBWNj6z5FwRbM0bPfik0KYIyQ
   sdSIuOsqamDc6BoZsS5DXjYyjteK+Erx0u8k21cdqwCrRDbxFKd7DZ8/l
   EDqtR9zVI4DLXEuyR2VFZbk3ToqokuhXgiV2h2cFnKFTOgpB8SpCxQnem
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="266722351"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="266722351"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 02:27:06 -0700
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="920089289"
Received: from gguerra-mobl1.ger.corp.intel.com (HELO [10.249.254.46]) ([10.249.254.46])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 02:27:02 -0700
Message-ID: <2d7bb9f7-a316-16d8-b290-e0cae9b28127@linux.intel.com>
Date:   Wed, 6 Jul 2022 12:27:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] ASoC: SOF: sof-client-probes: cleanup
 tokenize_input()
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
References: <YsU4zCpaV7GBpHci@kili>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YsU4zCpaV7GBpHci@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 06/07/2022 10:25, Dan Carpenter wrote:
> The tokenize_input() function is cleaner if it uses strndup_user()
> instead of simple_write_to_buffer().  The way it's written now, if
> *ppos is non-zero then it returns -EIO but normally we would return
> 0 in that case.  It's easier to handle that in the callers.

This patch breaks the probe point settings:

# echo 52,1,0 > /sys/kernel/debug/sof/probe_points
-bash: echo: write error: Invalid argument

I did not looked for the exact reason, but something is not correct.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/soc/sof/sof-client-probes.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
> index 679bc7d371fc..6c922b683f67 100644
> --- a/sound/soc/sof/sof-client-probes.c
> +++ b/sound/soc/sof/sof-client-probes.c
> @@ -461,24 +461,17 @@ static int strsplit_u32(char *buf, const char *delim, u32 **tkns, size_t *num_tk
>  }
>  
>  static int tokenize_input(const char __user *from, size_t count,
> -			  loff_t *ppos, u32 **tkns, size_t *num_tkns)
> +			  u32 **tkns, size_t *num_tkns)
>  {
>  	char *buf;
>  	int ret;
>  
> -	buf = kmalloc(count + 1, GFP_KERNEL);
> -	if (!buf)
> -		return -ENOMEM;
> -
> -	ret = simple_write_to_buffer(buf, count, ppos, from, count);
> -	if (ret != count) {
> -		ret = ret >= 0 ? -EIO : ret;
> -		goto exit;
> -	}
> +	buf = strndup_user(from, count + 1);
> +	if (IS_ERR(buf))
> +		return PTR_ERR(buf);
>  
> -	buf[count] = '\0';
>  	ret = strsplit_u32(buf, ",", tkns, num_tkns);
> -exit:
> +
>  	kfree(buf);
>  	return ret;
>  }
> @@ -552,12 +545,15 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
>  	u32 *tkns;
>  	int ret, err;
>  
> +	if (*ppos)
> +		return 0;
> +
>  	if (priv->extractor_stream_tag == SOF_PROBES_INVALID_NODE_ID) {
>  		dev_warn(dev, "no extractor stream running\n");
>  		return -ENOENT;
>  	}
>  
> -	ret = tokenize_input(from, count, ppos, &tkns, &num_tkns);
> +	ret = tokenize_input(from, count, &tkns, &num_tkns);
>  	if (ret < 0)
>  		return ret;
>  	bytes = sizeof(*tkns) * num_tkns;
> @@ -607,12 +603,15 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
>  	u32 *tkns;
>  	int ret, err;
>  
> +	if (*ppos)
> +		return 0;
> +
>  	if (priv->extractor_stream_tag == SOF_PROBES_INVALID_NODE_ID) {
>  		dev_warn(dev, "no extractor stream running\n");
>  		return -ENOENT;
>  	}
>  
> -	ret = tokenize_input(from, count, ppos, &tkns, &num_tkns);
> +	ret = tokenize_input(from, count, &tkns, &num_tkns);
>  	if (ret < 0)
>  		return ret;
>  	if (!num_tkns) {

-- 
Péter
