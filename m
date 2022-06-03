Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97466C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri,  3 Jun 2022 09:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238855AbiFCJtZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 3 Jun 2022 05:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236738AbiFCJtY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Jun 2022 05:49:24 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B143B13D2C
        for <kernel-janitors@vger.kernel.org>; Fri,  3 Jun 2022 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654249763; x=1685785763;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dlOLpy+A8O2m4zwqEZZLEk4QfSQQMpvf3qipx/BEfdw=;
  b=LCDvoxQKQnrtOgaVapR035U39EBeZXUO7ffmUE0tE5nY37YMFbZIixf+
   uXMOAbzJK5BOs0gRs132y7R4BL+N24VWDVeA24fWlpI2MlBabMxcyNMeO
   KF2wyOFsSMIBeCOd/vTEikyruYd4L/0E3ukNmdGuMhHloSm4KYh0C0crc
   5PZssQQQItYiSvjBd9u03rZ9/pQq/tADwnzfxcJApbMFN1Gm3B3m/QOU9
   p5juTQax0dH1xdb7OVs42CPiC4G5do7eSZvBSTjtVsUidfNSnq7jJtUby
   fBFRoArsaetQ75fstYNvQaOGzICXq0XE1ELTZaJEbYXkMQee4XhdrYDAt
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="256694666"
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="256694666"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 02:49:23 -0700
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="721689955"
Received: from nmoazzen-mobl2.amr.corp.intel.com (HELO [10.251.214.119]) ([10.251.214.119])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 02:49:20 -0700
Message-ID: <0273c0c4-c5f2-7b0b-dc30-19f15ed9df1c@linux.intel.com>
Date:   Fri, 3 Jun 2022 12:49:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] ASoC: SOF: ipc-msg-injector: Fix reversed if
 statement
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
        Daniel Baluta <daniel.baluta@nxp.com>,
        sound-open-firmware@alsa-project.org
References: <Yph+T3PpGCdPsEDj@kili>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <Yph+T3PpGCdPsEDj@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 02/06/2022 12:09, Dan Carpenter wrote:
> This if statement is reversed.  In fact, the condition can just be
> deleted because writing zero bytes is a no-op.

Wow, you are right. I only tested with a message w/o additional payload.

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Fixes: 066c67624d8c ("ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/soc/sof/sof-client-ipc-msg-injector.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
> index 030cb97d7713..6bdfa527b7f7 100644
> --- a/sound/soc/sof/sof-client-ipc-msg-injector.c
> +++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
> @@ -200,16 +200,14 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
>  		return -EFAULT;
>  
>  	count -= size;
> -	if (!count) {
> -		/* Copy the payload */
> -		size = simple_write_to_buffer(ipc4_msg->data_ptr,
> -					      priv->max_msg_size, ppos, buffer,
> -					      count);
> -		if (size < 0)
> -			return size;
> -		if (size != count)
> -			return -EFAULT;
> -	}
> +	/* Copy the payload */
> +	size = simple_write_to_buffer(ipc4_msg->data_ptr,
> +				      priv->max_msg_size, ppos, buffer,
> +				      count);
> +	if (size < 0)
> +		return size;
> +	if (size != count)
> +		return -EFAULT;
>  
>  	ipc4_msg->data_size = count;
>  

-- 
Péter
