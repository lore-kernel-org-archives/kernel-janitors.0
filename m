Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C46C43334
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Jul 2022 10:41:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbiGFKlQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 6 Jul 2022 06:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbiGFKlI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Jul 2022 06:41:08 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564C5275F8
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Jul 2022 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657104065; x=1688640065;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zrd7SJrYJgiBHyxXw1JHDeHv6/0QQpqh6HUxViDgkbY=;
  b=jyR3po5VoSabpIDAFJfGS9bXEck9V6Ttv6nV7NW8Eh9NFkFk3G3c+8ZE
   lzg/LfrIEaWCRD09uagTSGGBmeXBfntU+4C1x0JJ0jlhClgV92rzCr9Lo
   vzyBN9ifYjl6CwshyC8p4AIW8OFy7UUw01JDleqAGybsyHU56E5vouOJE
   aCUx6mCWc0YM0s3MiiOvpKWoztA+KEFCZgDF5phXLw/oVF963Y3sJv+te
   NUs5MXpxvK1Nd+Dr0ukz6PST4doq1x76jpe5SsNhse2h1N5N2EnPtLUtc
   zXhGccIjPs9LcFClFPfciyTpEmm6GxaFCdXUUdCf9p7DVStqo0PvxzFKx
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="272496920"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="272496920"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 03:41:02 -0700
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="920113573"
Received: from gguerra-mobl1.ger.corp.intel.com (HELO [10.249.254.46]) ([10.249.254.46])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 03:40:59 -0700
Message-ID: <b67ec7f9-7f1a-1014-b6e8-c953cd795202@linux.intel.com>
Date:   Wed, 6 Jul 2022 13:41:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] ASoC: SOF: sof-client-probes: fix error codes in
 sof_probes_compr_copy()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
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
 <26db7e60-51d1-444a-7620-8225239ad7bf@linux.intel.com>
 <20220706102159.GC2338@kadam> <20220706103139.GB2316@kadam>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220706103139.GB2316@kadam>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 06/07/2022 13:31, Dan Carpenter wrote:
> On Wed, Jul 06, 2022 at 01:21:59PM +0300, Dan Carpenter wrote:
>> On Wed, Jul 06, 2022 at 12:05:37PM +0300, Péter Ujfalusi wrote:
>>>
>>>
>>> On 06/07/2022 10:23, Dan Carpenter wrote:
>>>> This function tries to return the number of bytes that it was able to
>>>> copy to the user.  However, because there are multiple calls to
>>>> copy_to_user() in a row that means the bytes are not necessarily
>>>> consecutive so it's not useful.  Just return -EFAULT instead.
>>>
>>> The function is copying data from a circular buffer to a use buffer.
>>> The single copy_to_user() is used when we don't have wrapping, the
>>> 'double' copy_to_user() is when we wrap, so first copy is from the end
>>> of the buffer then we copy the data from the start of the buffer to get
>>> all data.
>>
>> Ok.  But the bugs in the original code are real.  I will resend.
> 
> Actually that's not true.  The bugs in the original code are something
> that only affect users who deserve it?  I might not resend.  A fix would
> look something like below?
> 
> regards,
> dan carpenter
> 
> diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
> index 1f1ea93a7fbf..32fa3186c295 100644
> --- a/sound/soc/sof/sof-client-probes.c
> +++ b/sound/soc/sof/sof-client-probes.c
> @@ -398,9 +398,14 @@ static int sof_probes_compr_copy(struct snd_soc_component *component,
>  		ret = copy_to_user(buf, ptr, count);
>  	} else {
>  		ret = copy_to_user(buf, ptr, n);
> -		ret += copy_to_user(buf + n, rtd->dma_area, count - n);
> +		if (ret) {
> +			ret += count - n;
> +			goto done;
> +		}
> +		ret = copy_to_user(buf + n, rtd->dma_area, count - n);

I think this should work, can you please resend it?

>  	}
>  
> +done:
>  	if (ret)
>  		return count - ret;
>  	return count;

-- 
Péter
