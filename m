Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCB8C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri,  3 Jun 2022 09:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243195AbiFCJro (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 3 Jun 2022 05:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235321AbiFCJrm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Jun 2022 05:47:42 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB0D1263B
        for <kernel-janitors@vger.kernel.org>; Fri,  3 Jun 2022 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654249661; x=1685785661;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WQz1P93jqawAYhPsWpCHv9lCqsm69nzliCcknvez5jY=;
  b=Cof4rLFid8kyKF09TINi+5yiNyLrGCXOitpCGhjiKEmwOboGtDht/hZK
   lH6tiPfayRygFz8taiw7gEHJexmxxzNhXt8zY5+mvB2yLAloFWaITDqWI
   5qcCA4gZsI5motPlaLz4Jf/oP5zkH1/pL+TzSoqHp5WXloqeCReOv1Oyr
   b16fB5LRkGq1qIrQAeeqM9J/FszCnarJN6FxfZM4IoEfkldUxdd5Lck9f
   6sjwF6uceU/d9Oukqf2UNn0jlhXdyhcN3fIF0afxbavCEAcivB6HEBBMC
   F/CwzLWFSKLiNrsvG6+wwB2x0YtV0ijjNxJz4I7pt0GaRddU6u30fMRRg
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="263861257"
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="263861257"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 02:47:41 -0700
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="721689695"
Received: from nmoazzen-mobl2.amr.corp.intel.com (HELO [10.251.214.119]) ([10.251.214.119])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 02:47:37 -0700
Message-ID: <c756fc79-281e-9c41-6070-c79ca6eb7c32@linux.intel.com>
Date:   Fri, 3 Jun 2022 12:48:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] ASoC: SOF: ipc-msg-injector: Propagate write errors
 correctly
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        Rander Wang <rander.wang@intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        sound-open-firmware@alsa-project.org
References: <Yph+Cd+JrfOH0i7z@kili>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <Yph+Cd+JrfOH0i7z@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 02/06/2022 12:08, Dan Carpenter wrote:
> This code is supposed to propagate errors from simple_write_to_buffer()
> or return -EFAULT if "size != count".  However "size" needs to be signed
> for the code to work correctly and the case where "size == 0" is not
> handled correctly.

Thanks Dan!

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Fixes: 066c67624d8c ("ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages")
> Fixes: 2f0b1b013bbc ("ASoC: SOF: debug: Add support for IPC message injection")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/soc/sof/sof-client-ipc-msg-injector.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
> index 03490a4d4ae7..030cb97d7713 100644
> --- a/sound/soc/sof/sof-client-ipc-msg-injector.c
> +++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
> @@ -150,7 +150,7 @@ static ssize_t sof_msg_inject_dfs_write(struct file *file, const char __user *bu
>  {
>  	struct sof_client_dev *cdev = file->private_data;
>  	struct sof_msg_inject_priv *priv = cdev->data;
> -	size_t size;
> +	ssize_t size;
>  	int ret;
>  
>  	if (*ppos)
> @@ -158,8 +158,10 @@ static ssize_t sof_msg_inject_dfs_write(struct file *file, const char __user *bu
>  
>  	size = simple_write_to_buffer(priv->tx_buffer, priv->max_msg_size,
>  				      ppos, buffer, count);
> +	if (size < 0)
> +		return size;
>  	if (size != count)
> -		return size > 0 ? -EFAULT : size;
> +		return -EFAULT;
>  
>  	memset(priv->rx_buffer, 0, priv->max_msg_size);
>  
> @@ -179,7 +181,7 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
>  	struct sof_client_dev *cdev = file->private_data;
>  	struct sof_msg_inject_priv *priv = cdev->data;
>  	struct sof_ipc4_msg *ipc4_msg = priv->tx_buffer;
> -	size_t size;
> +	ssize_t size;
>  	int ret;
>  
>  	if (*ppos)
> @@ -192,8 +194,10 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
>  	size = simple_write_to_buffer(&ipc4_msg->header_u64,
>  				      sizeof(ipc4_msg->header_u64),
>  				      ppos, buffer, count);
> +	if (size < 0)
> +		return size;
>  	if (size != sizeof(ipc4_msg->header_u64))
> -		return size > 0 ? -EFAULT : size;
> +		return -EFAULT;
>  
>  	count -= size;
>  	if (!count) {
> @@ -201,8 +205,10 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
>  		size = simple_write_to_buffer(ipc4_msg->data_ptr,
>  					      priv->max_msg_size, ppos, buffer,
>  					      count);
> +		if (size < 0)
> +			return size;
>  		if (size != count)
> -			return size > 0 ? -EFAULT : size;
> +			return -EFAULT;
>  	}
>  
>  	ipc4_msg->data_size = count;

-- 
Péter
