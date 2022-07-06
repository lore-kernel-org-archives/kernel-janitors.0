Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7090C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Jul 2022 08:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbiGFIyw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 6 Jul 2022 04:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbiGFIyv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Jul 2022 04:54:51 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7330FB7CE
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Jul 2022 01:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657097690; x=1688633690;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=U0htDIIwhpcah+EPk3c0bva5ZhF6BmA8fSZxA04XU+o=;
  b=BijQu46gFPoYKadhAk7dcjW0K7rFue5x8cyoU8xCam4IZhYaM50Nvk7t
   AudyKwNClrRC/9Awo4OI9zU7vi/UNiWk29FJBndGQA3TbC0RbfG5R6Akx
   PLM3aFyHIJi73ZIlHBOngJNGll6/WgcJ4+D6Ol/jid7pOw31MdQWaElcu
   ppIcF2OhpQBB9BrQOkt63StepkI7m7Y0k8j8qUWZ5DS7VunA9yLbbhK7L
   mSaXyrbEssIlgDGhVLOVCAIoCLlvEoPn1NB8RgWnJBz499hDmCfhv4Lsf
   p3wsfBy4V4BnucUcyyp8YOM8R0FDNcsd4WgYoH4HISvK5YSx5pCsyaDao
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="347671646"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="347671646"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 01:54:49 -0700
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="920075962"
Received: from gguerra-mobl1.ger.corp.intel.com (HELO [10.249.254.46]) ([10.249.254.46])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 01:54:46 -0700
Message-ID: <4cf393e1-00f6-2b5b-a5f5-9f555fdeafdc@linux.intel.com>
Date:   Wed, 6 Jul 2022 11:55:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: SOF: ipc-msg-injector: fix copy in
 sof_msg_inject_ipc4_dfs_write()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        kernel-janitors@vger.kernel.org,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        sound-open-firmware@alsa-project.org
References: <YsUzQPyZYMkhN/Q9@kili>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YsUzQPyZYMkhN/Q9@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 06/07/2022 10:01, Dan Carpenter wrote:
> The bug here is that when we copy the payload the value of *ppos should
> be zero but it is sizeof(ipc4_msg->header_u64) instead.  That means that
> the buffer will be copied to the wrong location within the
> ipc4_msg->data_ptr buffer.
> 
> Really, in this context, it is simpler and more appropriate to use
> copy_from_user() instead of simple_write_to_buffer() so I have
> re-written the function.
> 
> Fixes: 066c67624d8c ("ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  Not tested.  I believe this function is mostly
> used to write random junk to the device and see what breaks.  So
> probably it works fine as-is.
> 
>  sound/soc/sof/sof-client-ipc-msg-injector.c | 27 ++++++++-------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
> index 6bdfa527b7f7..e8ab173e95b5 100644
> --- a/sound/soc/sof/sof-client-ipc-msg-injector.c
> +++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
> @@ -181,7 +181,7 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
>  	struct sof_client_dev *cdev = file->private_data;
>  	struct sof_msg_inject_priv *priv = cdev->data;
>  	struct sof_ipc4_msg *ipc4_msg = priv->tx_buffer;
> -	ssize_t size;
> +	size_t data_size;
>  	int ret;
>  
>  	if (*ppos)
> @@ -191,25 +191,18 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
>  		return -EINVAL;
>  
>  	/* copy the header first */
> -	size = simple_write_to_buffer(&ipc4_msg->header_u64,
> -				      sizeof(ipc4_msg->header_u64),
> -				      ppos, buffer, count);
> -	if (size < 0)
> -		return size;
> -	if (size != sizeof(ipc4_msg->header_u64))
> +	if (copy_from_user(&ipc4_msg->header_u64, buffer,
> +			   sizeof(ipc4_msg->header_u64)))
>  		return -EFAULT;
>  
> -	count -= size;
> +	data_size = count - sizeof(ipc4_msg->header_u64);
> +	if (data_size > priv->max_msg_size)
> +		return -EINVAL;
>  	/* Copy the payload */
> -	size = simple_write_to_buffer(ipc4_msg->data_ptr,
> -				      priv->max_msg_size, ppos, buffer,
> -				      count);
> -	if (size < 0)
> -		return size;
> -	if (size != count)
> +	if (copy_from_user(ipc4_msg->data_ptr, buffer, data_size))

I think this is still needs an update:
if (copy_from_user(ipc4_msg->data_ptr,
		   buffer + sizeof(ipc4_msg->header_u64), data_size))

To skip the already copied header.

Or without a rewrite the fix would be simple as:
/* Copy the payload */
size = simple_write_to_buffer(ipc4_msg->data_ptr,  0,
		buffer + sizeof(ipc4_msg->header_u64), data_size),
		count);


>  		return -EFAULT;
>  
> -	ipc4_msg->data_size = count;
> +	ipc4_msg->data_size = data_size;
>  
>  	/* Initialize the reply storage */
>  	ipc4_msg = priv->rx_buffer;
> @@ -221,9 +214,9 @@ static ssize_t sof_msg_inject_ipc4_dfs_write(struct file *file,
>  
>  	/* return the error code if test failed */
>  	if (ret < 0)
> -		size = ret;
> +		count = ret;
>  
> -	return size;
> +	return count;
>  };
>  
>  static int sof_msg_inject_dfs_release(struct inode *inode, struct file *file)

-- 
Péter
