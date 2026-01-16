Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716A11F1932;
	Fri, 16 Jan 2026 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768567811; cv=none; b=Oxe1JqkEYGyo8C/YNMrUnFIhW9nUOyuRGprp4SjAA3dCz5uoWZjPzwtLQyS/GTkxuVyv5HN17HpUBLa84PbzHf2GK9umAPfCfi9EM5UTWvTumjelx5QsuGdru2DfjeTmpU4grKGfC9OJ2LLJZJolBoqpjrUjkye3j43LEGPOvPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768567811; c=relaxed/simple;
	bh=R/2UPm+otrepnaP5Y3oqKh7UxV13ZVlm5tlpLkHXMFE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q9VB+/FrWdtwLOsvmxulM7I53l/ecTEM+WJJsiIj09tctYxzdSicmQfIx99CArOxZRq32RUjeZ/w1hS68/S53nS1lWKl1Gvg4uQLZB7LqPjZrA7Vjdr56A48BA39CmbgB+fyQQslHiCxFJuOxQPjC+BuAKFQHTGeOm/Dy289xLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbg8spuY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbg8spuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768567809; x=1800103809;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=R/2UPm+otrepnaP5Y3oqKh7UxV13ZVlm5tlpLkHXMFE=;
  b=jbg8spuYigui+L9EFoawQVfNuXQ0RP666zL3GEdoQElAjWxtNWncrf9I
   l4ShXR8OX199pNG7/8F3LEFyOkU0QhlllSzZ46wO2Qtib+cVuDE/BLDYd
   oUKnqELP9wIECQW9kAkX8PRQ+I/bsZJkTepblmxjnJAm/kvIjge07qmc6
   hW+OCBWmZAlqV7LSzs8I0KXS6OlCGop99jtLzP2dqpldXVk4oBIL3wrkr
   HFzuEBMkxQoS2xjT1SMTy/yatBUfxj4ladtRW8amTvwo2ODcZtCfo6TAC
   MRrKNCwEH2LtKWSk0ezn5GKogXFvBp1E9V8egsOSwcT6eUcOERvSwU7c6
   g==;
X-CSE-ConnectionGUID: wN/fEuOQRR6p4d9F/1qijQ==
X-CSE-MsgGUID: rSvU6zR7R7KbxAuQNDNDUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69084263"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="69084263"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:50:09 -0800
X-CSE-ConnectionGUID: C0CWi0RWTFiK8JEhkkcEbw==
X-CSE-MsgGUID: UNny87WwRG+iSMdokFkMug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="242780375"
Received: from black.igk.intel.com (HELO black) ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:50:05 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: David Arcari <darcari@redhat.com>
Cc: alexander.shishkin@linux.intel.com, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
Subject: Re: [v2] intel_th: core: fix null pointer dereference in intel_th_irq
In-Reply-To: <54ffe25e-c697-4639-b405-af50416764c8@redhat.com>
References: <20251118212106.541728-1-darcari@redhat.com>
 <32755d36-050e-413f-93b9-55d8306c165d@web.de>
 <e314be75-c171-40dd-8298-dce40f65d93b@redhat.com>
 <0d5bad33-49ed-4531-b399-e548d3dfce66@web.de>
 <54ffe25e-c697-4639-b405-af50416764c8@redhat.com>
Date: Fri, 16 Jan 2026 13:49:04 +0100
Message-ID: <834iolbu4f.fsf@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

David Arcari <darcari@redhat.com> writes:

> On 11/20/25 8:07 AM, Markus Elfring wrote:
>> =E2=80=A6>>> the same array.=C2=A0 This can be fixed by disabling interr=
upts
>>>>> during the call to intel_th_output_enable().
>>>>
>>>> 1. Would another imperative wording become helpful for an improved cha=
nge description?
>>>>  =C2=A0=C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/to=
rvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=3Dv6.1=
8-rc6#n94
>>>
>>> I feel like the description explains the problem well.
>>=20
>> Perhaps?
>>=20
>>=20
>>> However, do you have alternate wording you would like to suggest?
>>=20
>> Under which circumstances would you get into the mood to convert the wor=
ding approach
>> =E2=80=9Ccan be fixed by=E2=80=9D into an imperative one?
>
> I see. I will make that change if a v3 is in order. Naturally, I'd like=20
> to hear back from Alexander before putting more effort into this.

Sorry for the delay, I found a working intel_th, so I'm looking into it,
I'll get back to you shortly.

Thanks,
--
Alex
