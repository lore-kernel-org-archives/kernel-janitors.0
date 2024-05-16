Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC74139F
	for <kernel-janitors@vger.kernel.org>; Thu, 16 May 2024 02:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715826578; cv=none; b=HlnHmUEr94+Fo6tdNSIRjluZE63cbq4Wu4EmBBUkQ66ZV0/tt8Y2NTrJw+CGCsHwPpBZmqpgcEcA0TSkmvxp+pyp+WwKMovHauEoUUdl3LmqNAVvpabAg3TV2XRbmvLXR5I6uU51Df85SUW80XhQ2Ub+pO4I+18ePllOWFGyHvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715826578; c=relaxed/simple;
	bh=64eqbHF30pFDvZplJnmy2dWsn/ELyqHpe4QH89CQlOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pOWJg0Sjvox1gcNIT1M84GKPnHqgZrfzw7YKOc3OqLgbNCn6sYXRnwoNsfqYeYeU1upFprgDtgeYp476BasvviZLUvCGg9ngvpy+qYBik0hStzbvPxIXHF1Qk2iQxoyTPwug8TN6LsMkqm9JhGYzC9RVH0rHulFewgZJ61vyyAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W6AFsVHd; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W6AFsVHd"
Message-ID: <f90a46dc-8842-47a2-a269-826367f991fb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1715826574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POjo41Qty2BYUDgH9m3H+3cml12oIPmG9DVVmyYHKx8=;
	b=W6AFsVHdGQnW0sZExoT5TvfA/u6N2+D9Hv5YDhe5+QkE3S/K1Ccn3GZOlNW5uQkXqSlLIu
	q/Vw4SGlKr+0G0E8IaCsMQDj9w9/wVkI1/jlza8rB2HAsAGDI+8owaDIceKTvGYBUtPlow
	PGfiHkX9qfYZUe83PEw9XBDQcsQI4nc=
Date: Thu, 16 May 2024 10:29:26 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] drm/loongson: Add helpers for creating subdevice
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>
References: <20240513001243.1739336-2-sui.jingfeng@linux.dev>
 <fe55ddf4-b86f-4d9f-aac4-373c5f2a46ac@web.de>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <fe55ddf4-b86f-4d9f-aac4-373c5f2a46ac@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 5/16/24 04:30, Markus Elfring wrote:
>> In some display subsystems, the functionality of a PCI(e) device may too
> …
>> of the functionality into child devices can helps to achieve better
>> modularity, eaiser for understand and maintain.
>>
>> Add the loongson_create_platform_device() function to pove the way …
> 
> Please avoid typos in such a change description.


I was too hurry, sorry, my bad.
Will be fixed at the next version.


> Regards,
> Markus

-- 
Best regards
Sui
