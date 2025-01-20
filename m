Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id ADD5319004D;
	Mon, 20 Jan 2025 08:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737362570; cv=none; b=cGBuEg5xMGqOuzdvqj0MfhWyvzMvEcCcxRfo3b+S0dbYV4rzFqy2Qg1j8+zVl456cpiDxS3N0M8dF19smh1G4Kd+Y1sJUSyauv2PyqlPBJfQuAvuo41dzTAQJP+XOGs9soxm5vvxdCnDt/386cMNqdKiL7zVLS3UHt3Y9vaVkuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737362570; c=relaxed/simple;
	bh=HXU8TsC7PL79mtwEeHchU/VsmXchewA5JDi4H1gkcaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=Ab8N/Z0pJ8XHzhLbqThnmok1bVtFca4kc/dUhs+PnoKmlidQK8DTjwl85gclSax4rSgFicGOE6yCVJTIlrOnUTwPSzSZPMoS6w0Ior8hOWELwHR/yEUKuQCSXFmy6/G5y963fiLNDW5H50PZuviiFyS39uyqkjSndzEUgZFXZ9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.20.101] (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 2DFC1602549D5;
	Mon, 20 Jan 2025 16:42:39 +0800 (CST)
Message-ID: <0bcdc44e-6921-3658-6651-28ec8330f402@nfschina.com>
Date: Mon, 20 Jan 2025 16:42:38 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] drm/panthor: avoid garbage value in
 panthor_ioctl_dev_query()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: boris.brezillon@collabora.com, steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, mary.guillemard@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <01bf1bd2-2764-41a1-85aa-962f1197387f@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/1/20 15:21, Dan Carpenter wrote:
> On Sun, Jan 19, 2025 at 10:58:29AM +0800, Su Hui wrote:
>> 'priorities_info' is uninitialized, and the uninitialized value is copied
>> to user object when calling PANTHOR_UOBJ_SET(). Using memset to initialize
>> 'priorities_info' to avoid this garbage value problem.
>>
>> Fixes: f70000ef2352 ("drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> How did you find this bug?
Clang found this bug, run command like this:
scan-build  --use-cc=clang    make CC=clang 
drivers/gpu/drm/panthor/panthor_drv.o

There will be some warnings, one is this:
drivers/gpu/drm/panthor/panthor_drv.c:807:22: warning: The left 
expression of the compound
assignment is an uninitialized value. The computed value will also be 
garbage [core.uninitialized.Assign]
   807 |                         arg->allowed_mask |= BIT(prio);
       |                         ~~~~~~~~~~~~~~~~~ ^


regards,
su hui
