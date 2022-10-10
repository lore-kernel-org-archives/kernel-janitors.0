Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AEAC433FE
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 Oct 2022 08:14:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbiJJIOJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 Oct 2022 04:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbiJJIOI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Oct 2022 04:14:08 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9DE5280B;
        Mon, 10 Oct 2022 01:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665389647; x=1696925647;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nD+TiFgre8EfP7ineZy7SVnMlN+CCTdmpGNG1FzZ/l8=;
  b=Jpf49OA80ZIZ73AClXGyxTgJHgfdatGxidhZBDZhDB1zftztCxU08lt/
   AFfrQPfOrMtghdlNiZuyrVG2XVq+PMv+Tv6FtGar2sTYgAK0f8HHnRh3J
   fs/YADiDnmH5e9/jLDKAvr4vEotXMZN38Co57HtzhWdGgbCSqgUXhIJGh
   Lmf8F4sSGK5etPyLB8F9n71+dRS6/o517yLZDXQU8oPEm4EdqRj0V+Pv2
   5wWujq2juprhnqQN9FnOdgw+WNG599QfQUHweollVN6+mgdtq2ZU0KrDu
   NpOijhKLQGj0p9SZeEAf46z9MMJaCDQywzkM2cQH+D9PBUK0cMOEEjcbk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="283896881"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="283896881"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 01:14:05 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="694544256"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="694544256"
Received: from liammurp-mobl1.ger.corp.intel.com (HELO [10.213.197.233]) ([10.213.197.233])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 01:14:03 -0700
Message-ID: <96ba4258-4195-3a6a-e296-291f93a0b8de@linux.intel.com>
Date:   Mon, 10 Oct 2022 09:14:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] drm/i915/perf: remove redundant variable 'taken'
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Colin Ian King <colin.i.king@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221007195345.2749911-1-colin.i.king@gmail.com>
 <6a57b91b-8614-6596-ae0f-acce6a31d161@wanadoo.fr>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <6a57b91b-8614-6596-ae0f-acce6a31d161@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On 08/10/2022 12:55, Christophe JAILLET wrote:
> Le 07/10/2022 à 21:53, Colin Ian King a écrit :
>> The assignment to variable taken is redundant and so it can be
>> removed as well as the variable too.
>>
>> Cleans up clang-scan build warnings:
>> warning: Although the value stored to 'taken' is used in the enclosing
>> expression, the value is never actually read from 'taken'
>> [deadcode.DeadStores]
> 
> Hi,
> 
> #define OA_TAKEN(tail, head)    ((tail - head) & (OA_BUFFER_SIZE - 1))
> 
> So if the result is not used, maybe calling OA_TAKEN() can be removed as 
> well?
> It looks like a no-op in such a case.

AFAICS result is used, just the copy/local variable is not.

For the patch:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Thanks for the cleanup, will merge.

Regards,

Tvrtko


> 
> CJ
> 
>>
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>> ---
>>   drivers/gpu/drm/i915/i915_perf.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_perf.c 
>> b/drivers/gpu/drm/i915/i915_perf.c
>> index 0defbb43ceea..15816df916c7 100644
>> --- a/drivers/gpu/drm/i915/i915_perf.c
>> +++ b/drivers/gpu/drm/i915/i915_perf.c
>> @@ -656,7 +656,6 @@ static int gen8_append_oa_reports(struct 
>> i915_perf_stream *stream,
>>       size_t start_offset = *offset;
>>       unsigned long flags;
>>       u32 head, tail;
>> -    u32 taken;
>>       int ret = 0;
>>       if (drm_WARN_ON(&uncore->i915->drm, !stream->enabled))
>> @@ -692,7 +691,7 @@ static int gen8_append_oa_reports(struct 
>> i915_perf_stream *stream,
>>       for (/* none */;
>> -         (taken = OA_TAKEN(tail, head));
>> +         OA_TAKEN(tail, head);
>>            head = (head + report_size) & mask) {
>>           u8 *report = oa_buf_base + head;
>>           u32 *report32 = (void *)report;
>> @@ -950,7 +949,6 @@ static int gen7_append_oa_reports(struct 
>> i915_perf_stream *stream,
>>       size_t start_offset = *offset;
>>       unsigned long flags;
>>       u32 head, tail;
>> -    u32 taken;
>>       int ret = 0;
>>       if (drm_WARN_ON(&uncore->i915->drm, !stream->enabled))
>> @@ -984,7 +982,7 @@ static int gen7_append_oa_reports(struct 
>> i915_perf_stream *stream,
>>       for (/* none */;
>> -         (taken = OA_TAKEN(tail, head));
>> +         OA_TAKEN(tail, head);
>>            head = (head + report_size) & mask) {
>>           u8 *report = oa_buf_base + head;
>>           u32 *report32 = (void *)report;
> 
