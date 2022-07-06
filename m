Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C98DC43334
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Jul 2022 10:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbiGFKAE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 6 Jul 2022 06:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbiGFKAC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Jul 2022 06:00:02 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1F7205C5
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Jul 2022 03:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657101601; x=1688637601;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=v5Jtw8TNJ86g2xK++XtxFf439WA0tQUMSwkUzcPYJD8=;
  b=iW1BQkHnaVTzes17KZRU9rH3FA+y+t1D6XpCBInJ9mONSPy1h4GGvTmZ
   ddvdo6Hf5KfjbjWAU132+Kpvc+a7wr53JQSV9YmwShFpG1aK61Vmz7p16
   paFGqYTKdFwAp2btV29DW6LREx/l0UoJUV1U7xcPAsY6tmJ/mEvIqbgql
   NZ7OQElYmhjaJ1zYzJWJrGaLg6NekUhSeupMhM+qdax3RdvuRWRW3w9aF
   1lWXToI+KotX2oxSkXbardQueHYiW/OetTbCCUwRcS4dX1xjuCV01zlt1
   gZgyZAebHtJ+/XX3UO9nglbYaCWUlEfCxL5uxRs/xU4HxTBsnMNwzscLy
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="309249859"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="309249859"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 03:00:01 -0700
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="920098852"
Received: from gguerra-mobl1.ger.corp.intel.com (HELO [10.249.254.46]) ([10.249.254.46])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 02:59:58 -0700
Message-ID: <61def9b6-b6bf-c2c0-2a75-54d10003c7ca@linux.intel.com>
Date:   Wed, 6 Jul 2022 13:00:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] ASoC: SOF: sof-client-probes: fix error codes in
 sof_probes_compr_copy()
Content-Language: en-US
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        sound-open-firmware@alsa-project.org
References: <YsU4dYXYYVsfs92J@kili>
 <26db7e60-51d1-444a-7620-8225239ad7bf@linux.intel.com>
In-Reply-To: <26db7e60-51d1-444a-7620-8225239ad7bf@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 06/07/2022 12:05, Péter Ujfalusi wrote:
> 
> 
> On 06/07/2022 10:23, Dan Carpenter wrote:
>> This function tries to return the number of bytes that it was able to
>> copy to the user.  However, because there are multiple calls to
>> copy_to_user() in a row that means the bytes are not necessarily
>> consecutive so it's not useful.  Just return -EFAULT instead.
> 
> The function is copying data from a circular buffer to a use buffer.
> The single copy_to_user() is used when we don't have wrapping, the
> 'double' copy_to_user() is when we wrap, so first copy is from the end
> of the buffer then we copy the data from the start of the buffer to get
> all data.

What I wanted to say is that the original code is correct, this patch
would break the functionality.

> 
>> Fixes: 3dc0d7091778 ("ASoC: SOF: Convert the generic probe support to SOF client")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>  sound/soc/sof/sof-client-probes.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
>> index 1f1ea93a7fbf..679bc7d371fc 100644
>> --- a/sound/soc/sof/sof-client-probes.c
>> +++ b/sound/soc/sof/sof-client-probes.c
>> @@ -385,7 +385,6 @@ static int sof_probes_compr_copy(struct snd_soc_component *component,
>>  	struct snd_compr_runtime *rtd = cstream->runtime;
>>  	unsigned int offset, n;
>>  	void *ptr;
>> -	int ret;
>>  
>>  	if (count > rtd->buffer_size)
>>  		count = rtd->buffer_size;
>> @@ -395,14 +394,15 @@ static int sof_probes_compr_copy(struct snd_soc_component *component,
>>  	n = rtd->buffer_size - offset;
>>  
>>  	if (count < n) {
>> -		ret = copy_to_user(buf, ptr, count);
>> +		if (copy_to_user(buf, ptr, count))
>> +			return -EFAULT;
>>  	} else {
>> -		ret = copy_to_user(buf, ptr, n);
>> -		ret += copy_to_user(buf + n, rtd->dma_area, count - n);
>> +		if (copy_to_user(buf, ptr, n))
>> +			return -EFAULT;
>> +		if (copy_to_user(buf + n, rtd->dma_area, count - n))
>> +			return -EFAULT;
>>  	}
>>  
>> -	if (ret)
>> -		return count - ret;
>>  	return count;
>>  }
>>  
> 

-- 
Péter
