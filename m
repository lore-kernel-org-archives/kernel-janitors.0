Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA2DC05027
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Jan 2023 08:55:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjATIzA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Jan 2023 03:55:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjATIy7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Jan 2023 03:54:59 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF96D5B9A
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Jan 2023 00:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674204898; x=1705740898;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7oANbYIjgIDFI3cmChN7wYp6Yx10CkYP0TIkgphGYbE=;
  b=efDs0UHeeFBUqP218BMauLAurQttgrKoKC81/eLGQp54Gwro2vu6Iy54
   3w0yLLldMTPqm0I5edjmFQymUcruJCLQwt+BoVEw84OpKJDk6Lz827knF
   +dPLT4NLy/06OqyGd3705FfSGkoyZM7BMKs7ZPHBT1ZBKE2M6U7EHpfsP
   s2g1DKyBmJ3jZ3chKNPD52Xq+L4M6bIQRi3uMjHXHI2xcBY17RjkgqkhP
   HFF0kQwzVifLtUAqbc6GNz0gm6YlU7bhaq89b4CfZBD3FMgWqf8RWSnnU
   G8IArtKwWHl1nndbYaXdJ99JCMCKASiNpEjjTaUIu0d/28sDRgh8yW/Hr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="387901723"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="387901723"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 00:54:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="803007044"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="803007044"
Received: from karenodx-mobl1.ger.corp.intel.com (HELO [10.252.29.156]) ([10.252.29.156])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 00:54:54 -0800
Message-ID: <1d14581b-60b7-6745-380f-5540bdbd7564@linux.intel.com>
Date:   Fri, 20 Jan 2023 10:55:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH] ASoC: SOF: ipc4-mtrace: prevent underflow in
 sof_ipc4_priority_mask_dfs_write()
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>
Cc:     alsa-devel@alsa-project.org,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rander Wang <rander.wang@intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        cip-dev <cip-dev@lists.cip-project.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        sound-open-firmware@alsa-project.org
References: <Y8laruWOEwOC/dx9@kili>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <Y8laruWOEwOC/dx9@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 19/01/2023 16:58, Dan Carpenter wrote:
> The "id" comes from the user.  Change the type to unsigned to prevent
> an array underflow.
> 
> Fixes: f4ea22f7aa75 ("ASoC: SOF: ipc4: Add support for mtrace log extraction")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> ---
>  sound/soc/sof/ipc4-mtrace.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/sof/ipc4-mtrace.c b/sound/soc/sof/ipc4-mtrace.c
> index 70dea8ae706e..0ec6ef681012 100644
> --- a/sound/soc/sof/ipc4-mtrace.c
> +++ b/sound/soc/sof/ipc4-mtrace.c
> @@ -344,9 +344,10 @@ static ssize_t sof_ipc4_priority_mask_dfs_write(struct file *file,
>  						size_t count, loff_t *ppos)
>  {
>  	struct sof_mtrace_priv *priv = file->private_data;
> -	int id, ret;
> +	unsigned int id;
>  	char *buf;
>  	u32 mask;
> +	int ret;
>  
>  	/*
>  	 * To update Nth mask entry, write:
> @@ -357,9 +358,9 @@ static ssize_t sof_ipc4_priority_mask_dfs_write(struct file *file,
>  	if (IS_ERR(buf))
>  		return PTR_ERR(buf);
>  
> -	ret = sscanf(buf, "%d,0x%x", &id, &mask);
> +	ret = sscanf(buf, "%u,0x%x", &id, &mask);
>  	if (ret != 2) {
> -		ret = sscanf(buf, "%d,%x", &id, &mask);
> +		ret = sscanf(buf, "%u,%x", &id, &mask);
>  		if (ret != 2) {
>  			ret = -EINVAL;
>  			goto out;

-- 
Péter
