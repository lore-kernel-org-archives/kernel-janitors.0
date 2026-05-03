Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE4F39A053;
	Sun,  3 May 2026 21:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777842778; cv=none; b=M5zGIWU9wyvJ+IIOe2uYuerjYC/QZQTlLoA4P7s2PX7kbfNOZM7+/HMupjVYo7elSXC280M/BlL4ASVSNLdZnSDjD07VRc38S6oIfqr18EILgLJHHhspt7YhxLaPzwdQ53GO49fG24U1UpdK+Kx7JtLHa2WpI/s1HueuuwJHTc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777842778; c=relaxed/simple;
	bh=H2RGGnXGH4f7KHfouuojLjO0f0B+hRGUAdBk3ahaVVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXa+FHFpw7fTVIbBIFMWnwVjp/xmwnvi6YWRAp8a1emFVZGXFFAAaY1+FFK7SzLdl0qzaydZWtRlqF0vO3q+cT1edR8ZLz33iJeam7NTVeX5B1rE/mr1Z7SNV4rS3PgLoBiRCTQ5RNEYMj66K4otvMDqy9a0Q1Q/sd51bnUqoh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Su1V/dsH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Su1V/dsH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=61ClowtrPrAEEqaUh93uzcQRo5B4kyUv1BbuM79gSI8=; b=Su1V/dsHRs+5+8CcuxqPt+LMJ9
	7Sy9SjKE2bDEjPux6PjLlX7CoQsyqfs6Wi9LAYSk7vlVv+s1mCRy0ol7gzsjakbul61C/OGEWiqle
	Ah+83CS1FGYRr4oNEM7LAmk8ibjpu0PBEIxvCnQCKun+gZR2fdYncCwzxbkopZEu7x4Zp0MW5f+Qr
	7Nq5up+5CkcBKn5N9eLwrjTSXcGNHq3ODm9XPK0UikkSGXoVwV3OZa5J1W9iU/v7SfLCNckF7zDB6
	H9nB8TK5+TStpI1Cy+GyCkKks80sI/Hn6tK/FgRSVlrz/UckUO7vVnssjFKQYdaUEFQRAGQCFutir
	IWX7mr+A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJe7R-0000000BkHo-3YFQ;
	Sun, 03 May 2026 21:12:53 +0000
Message-ID: <b52d5383-dd57-4bbe-a6cc-fd584cf68957@infradead.org>
Date: Sun, 3 May 2026 14:12:53 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: kprobes: add missing MODULE_DESCRIPTION() macro
To: Arnd Bergmann <arnd@arndb.de>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240622-md-arm-arch-arm-probes-kprobes-v1-1-0832bd6e45db@quicinc.com>
 <3808c973-1315-420c-900d-122a73a34f9e@quicinc.com>
 <05cacd03-686a-4ede-b485-7f4781f69b99@app.fastmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <05cacd03-686a-4ede-b485-7f4781f69b99@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 7/19/24 4:28 AM, Arnd Bergmann wrote:
> On Tue, Jul 9, 2024, at 21:53, Jeff Johnson wrote:
>> On 6/22/2024 9:34 PM, Jeff Johnson wrote:
>>> With ARCH=arm, make allmodconfig && make W=1 C=1 reports:
>>> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
>>>
>>> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>>>
>>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>> ---
>>>  arch/arm/probes/kprobes/test-core.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm/probes/kprobes/test-core.c b/arch/arm/probes/kprobes/test-core.c
>>> index 171c7076b89f..6e9041a76b8b 100644
>>> --- a/arch/arm/probes/kprobes/test-core.c
>>> +++ b/arch/arm/probes/kprobes/test-core.c
>>> @@ -1664,6 +1664,7 @@ static void __exit kprobe_test_exit(void)
>>>  
>>>  module_init(run_all_tests)
>>>  module_exit(kprobe_test_exit)
>>> +MODULE_DESCRIPTION("ARM kprobes test module");
>>>  MODULE_LICENSE("GPL");
>>>  
>>>  #else /* !MODULE */
>>>
>>> ---
>>> base-commit: 563a50672d8a86ec4b114a4a2f44d6e7ff855f5b
>>> change-id: 20240622-md-arm-arch-arm-probes-kprobes-34037098a2c3
>>
>> I don't see this in linux-next yet so following up to see if anything else is
>> needed to get this merged.
> 
> Hi Jeff,
> 
> The arm tree uses a separate submission system for reviewed
> patches to get into the tree, see
> 
> https://www.arm.linux.org.uk/developer/patches/info.php
> https://www.arm.linux.org.uk/developer/patches/section.php?section=0
> 
> I looked at this file as well during build testing
> and ended up combining the change with a cleanup,
> If you like, I can send my version instead, see below.
> 
>       Arnd
> 
> diff --git a/arch/arm/probes/kprobes/test-core.c b/arch/arm/probes/kprobes/test-core.c
> index 171c7076b89f..0c6639509eff 100644
> --- a/arch/arm/probes/kprobes/test-core.c
> +++ b/arch/arm/probes/kprobes/test-core.c
> @@ -1650,24 +1650,16 @@ static int __init run_all_tests(void)
>  
>  	return ret;
>  }
> -
> +late_initcall(run_all_tests);
>  
>  /*
>   * Module setup
>   */
>  
> -#ifdef MODULE
> -
>  static void __exit kprobe_test_exit(void)
>  {
>  }
> -
> -module_init(run_all_tests)
>  module_exit(kprobe_test_exit)
> -MODULE_LICENSE("GPL");
>  
> -#else /* !MODULE */
> -
> -late_initcall(run_all_tests);
> -
> -#endif
> +MODULE_DESCRIPTION("Test code for ARM kprobes");
> +MODULE_LICENSE("GPL");

What happened with this cleanup patch?
I don't see it on a mailing list or in linux.git or linux-next.git.

I was about to come up with the same patch since it still seems to be
needed in linux-next-20260430.

thanks.
-- 
~Randy

