Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE137C43334
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Jul 2022 08:40:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbiGFIki (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 6 Jul 2022 04:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbiGFIkh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Jul 2022 04:40:37 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21CB24976
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Jul 2022 01:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657096836; x=1688632836;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JE5KcMJhdcDNhNLv9RZ8QYVQhPQ8wU/E+RAoQr5DEsA=;
  b=hf+nPwCj+VDaoQQqGfbpbksB92NQR7XxePttSgnmCYoGql9goTY9njNY
   Sj6HrVgQRGE/8UoMpYxo3glxXi1S3NEoINVSXPQtxUlWID7ecRpkzLM4N
   usOSfxGPaQpB0I7nowODET1HpkfhSTnpmTh/TVPywlUWmfAXxqy5w/OG0
   aipczHmuxrXoN8/l3RuAf3Cs1XKGQxdOizFEcpb2h1rI7wkFNLTzlOWpY
   uK8b9sKpr4uFR9lhqvepSEQWLs4upCVa4KRwL2sTEi47ovtoqIc3op5Mk
   85BDDU6ZjHiD45gNS9u/UnArqQpRaOvpMtExp3alwh+rP3cYb90Yal3W4
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="272470207"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="272470207"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 01:40:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="920070710"
Received: from gguerra-mobl1.ger.corp.intel.com (HELO [10.249.254.46]) ([10.249.254.46])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 01:40:33 -0700
Message-ID: <ccc2904f-4db9-2bae-2bd4-6142a2eb2001@linux.intel.com>
Date:   Wed, 6 Jul 2022 11:41:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: SOF: debug: delete sof_dfsentry_write()
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
        Fred Oh <fred.oh@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        sound-open-firmware@alsa-project.org
References: <YsU5lTzZND9cDRl0@kili>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YsU5lTzZND9cDRl0@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On 06/07/2022 10:28, Dan Carpenter wrote:
> The sof_dfsentry_write() function used to have a purpose but now it is a
> no-op.  It allocates a zeroed buffer, copies at least one byte of data
> to it, and then frees it without doing anything.  Just delete the
> function.
> 
> Fixes: 6e9548cdb30e ("ASoC: SOF: Convert the generic IPC flood test into SOF client")

it is not really a fix but rather complements that commit...

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From review.  Not tested.
> 
>  sound/soc/sof/debug.c | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
> index c5d797e97c02..00abc2000bfb 100644
> --- a/sound/soc/sof/debug.c
> +++ b/sound/soc/sof/debug.c
> @@ -19,24 +19,6 @@
>  #include "sof-priv.h"
>  #include "ops.h"
>  
> -static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
> -				  size_t count, loff_t *ppos)
> -{
> -	size_t size;
> -	char *string;
> -	int ret;
> -
> -	string = kzalloc(count+1, GFP_KERNEL);
> -	if (!string)
> -		return -ENOMEM;
> -
> -	size = simple_write_to_buffer(string, count, ppos, buffer, count);
> -	ret = size;
> -
> -	kfree(string);
> -	return ret;
> -}
> -
>  static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
>  				 size_t count, loff_t *ppos)
>  {
> @@ -126,7 +108,6 @@ static const struct file_operations sof_dfs_fops = {
>  	.open = simple_open,
>  	.read = sof_dfsentry_read,
>  	.llseek = default_llseek,
> -	.write = sof_dfsentry_write,

I might add a check in snd_sof_debugfs_buf_item() to disallow write
permission for the file. I know, we only use 0444 for the remaining
files. It might be too paranoid, I guess.

>  };
>  
>  /* create FS entry for debug files that can expose DSP memories, registers */

-- 
Péter
