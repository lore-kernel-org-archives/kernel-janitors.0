Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE8A50276;
	Tue, 26 May 2026 06:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779775588; cv=none; b=DjG99xE1F0tZc/hdqA6ZNPeCqUzh4K1w3QnxjIIonRwKbJMNn4y1f3rYjMVN2HGgdVqL7BROpCFulJmcE2L5viu7HpedTdamgnFzFUD+EZJuuLR1UzkYo4VTfqMM1KqSkGn7dW422k2cXsp+cxAgOd8PxBzyHGlc6SxgrFcY76A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779775588; c=relaxed/simple;
	bh=jSQ2/6HZxVPvd7ej0vQenXuyViIh2JUb5nln9NM0vtg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=U3XiQ3LfhDtFv84paN/+Ja0DGYTVd3eht4gaA0kTuvwv3hNl7MxRWnbvPRkyOz4yqnalzNZr9iYtFzRlqafGqUkJaWgpAHrBNpiZ4mNv2MxjjLgk94TmCsIBs5rmWpY4+EyEKNC8BiwK7UT9D4+34e2aH+cb5fLWoazWe/dmsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ktf1rbNI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ktf1rbNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779775586; x=1811311586;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=jSQ2/6HZxVPvd7ej0vQenXuyViIh2JUb5nln9NM0vtg=;
  b=Ktf1rbNIq7jymOKVa/iLBsmTxQood3hJH/kxcAvDBq35fH94bWfbgI9e
   2swmd81wI1VcCQ30zw1Rg/H8ccUkQZ7FAhJrPx5Clgr/6iYzfkIbQo5/5
   yTMiPI6nI86gEqi5aXAXTUDbNyzCUXfmQIl5egLqD0uPZV7swekA6e0P0
   CcG4MtrS2YuKx+qeeqKBhevOA+0gn7xJlx/GwoIzlfLvGgS/jKMxqNM2U
   a+3fnWGkU2nfiq9yU+He+JG5xCIrqsYMZZ5da7KgmvWvC09frMcC0rehL
   hm1/oZ8O5HjTVzDJnchm7khTjlxwVvrq3hkgfqekHg8E5RbrD+0corDGZ
   Q==;
X-CSE-ConnectionGUID: 3/aGbqa6QyuqhjCSRsQVRQ==
X-CSE-MsgGUID: 6q8qOi6vSZSKO3qU7smrlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="98008249"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="98008249"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 23:06:26 -0700
X-CSE-ConnectionGUID: 7z48n7yZRdylXMGq7pWGmA==
X-CSE-MsgGUID: YgoCyO9aSvOAGXut+qHEiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="241988971"
Received: from soc-pf6038af.clients.intel.com (HELO [10.217.180.37]) ([10.217.180.37])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 23:06:23 -0700
Message-ID: <764ba649-9a96-44c4-95f2-8dcf2f425133@linux.intel.com>
Date: Tue, 26 May 2026 08:06:20 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: prevent uninitialized data bug in debugfs
From: "Wachowski, Karol" <karol.wachowski@linux.intel.com>
To: Dan Carpenter <error27@gmail.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <ahP24m6Mii9EDL7Q@stanley.mountain>
 <9a6b239c-d970-4ec3-abf0-6b900b786279@linux.intel.com>
Content-Language: en-US
In-Reply-To: <9a6b239c-d970-4ec3-abf0-6b900b786279@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25-May-26 9:25, Wachowski, Karol wrote:
> On 25-May-26 9:14, Dan Carpenter wrote:
>> The simple_write_to_buffer() will only initialize data starting from
>> the *pos offset so if it's non-zero then the first part of the buffer
>> uninitialized.  Really, if *pos is non-zero then this code won't work
>> so just check for that at the start of the function.
>>
>> Fixes: 320323d2e545 ("accel/ivpu: Add debugfs interface for setting 
>> HWS priority bands")
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>> ---
>>   drivers/accel/ivpu/ivpu_debugfs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ 
>> ivpu_debugfs.c
>> index 189dbe94cf14..dc20bc73c6ed 100644
>> --- a/drivers/accel/ivpu/ivpu_debugfs.c
>> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
>> @@ -450,7 +450,7 @@ priority_bands_fops_write(struct file *file, const 
>> char __user *user_buf, size_t
>>       u32 band;
>>       int ret;
>> -    if (size >= sizeof(buf))
>> +    if (*pos != 0 || size >= sizeof(buf))
>>           return -EINVAL;
>>       ret = simple_write_to_buffer(buf, sizeof(buf) - 1, pos, 
>> user_buf, size);
> 
> Thanks for submission.
> 
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>

Applied to drm-misc-fixes.
