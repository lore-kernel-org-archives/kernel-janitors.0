Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECB03DF00F
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Apr 2026 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776861400; cv=none; b=uNFOmXUn7ZHObDUPQjHFAYBgr4cWpRoh0OVrKwIH7xiCRhXcHet7oRKFuqTrkYxSMXpc+wdgAdBkKbsxRUVLDu7movoJleqNUTr2jWSDh+r3w35IjfKpzYTq/RG0MdQyYg/V2uvZPe+YiW+stCn1Q7lFPqH+V9rb3XeadSd6aLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776861400; c=relaxed/simple;
	bh=GRci3Ps6TOnDQU277EdMiL7Fyn0ArsGYZ4aCWByhIXo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bB8Q9SaiUb7Gus6ayMAULlVMu3oyXVGdMuTQ0EiAN1iFBmX1CABlj36Qn5qrOhfEGmEjWjUeinkNVZUlHPMIMxIBohDGrXrcppQVQQg6s2w3Ik5+gLkfedjrxP1KkuKzxGOysZK+2FlcWrD37X0vaO2iC0YOyFgm6kznADy4IKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SVgWHVwL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GcyaPDx7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SVgWHVwL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GcyaPDx7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776861392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/87qWMjmdqk20+dY4xcLoxNd/NvWXE/CewiI5GysFx8=;
	b=SVgWHVwLq5VPR+Q7Ig3eV82cmj0e8dFlzH36FXdYg6ZHskh77tkM6Fs1WWZHzHSCu+uhNq
	fKL57Xofo+Nb7CjcJZgadefb2AfAxfiBUx0LqZHDd63Rl1LLZacTjed6ofidz/azY4xJif
	mImzXPHgaTYmkvcjlB7yhm09Ov3mnOg=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-I2prBw7HMciD20Lwb0aPnw-1; Wed, 22 Apr 2026 08:36:31 -0400
X-MC-Unique: I2prBw7HMciD20Lwb0aPnw-1
X-Mimecast-MFC-AGG-ID: I2prBw7HMciD20Lwb0aPnw_1776861390
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f07078ff0so3669237b3a.1
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Apr 2026 05:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776861390; x=1777466190; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/87qWMjmdqk20+dY4xcLoxNd/NvWXE/CewiI5GysFx8=;
        b=GcyaPDx7cedNVMaK/tZGBH7XaxfkEi6PkhjPp/dXbsRfftimWO+1xDBO9mWm3C4whz
         GRiamSZPv3zJIJdcKVv7S4Fdpc0+Y5EXZtTSMsjrEYYXBmXxkQWCuZ5yLMYZ42+eQwy5
         jAyAh3nNEmt1ZFlwX88ay0GaQbke+86qNS1llNfiNsJbVWAuPSNHGDW+5PXZ+EOoE1I9
         VzwldsyMfVJnwt68FVnrojr4MmkfyYjF3O8LKYF85tA4kU6pcWX97ATCa6c7ItqANi9Y
         jOqeKL6OoCLPx/iOrlPpxKZlc4Tn0zpxLmvUA5Q+A2tqD6KRD1/B7K0pGhwa/77SdJTi
         YGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776861390; x=1777466190;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/87qWMjmdqk20+dY4xcLoxNd/NvWXE/CewiI5GysFx8=;
        b=hRLoyemYJCQ5YZB6GqgvGxOOSnFuOm246aL6ODMh90lx50wMk5xh4VbBLsevRSQWDb
         WEkGPa4jh7BtQxfeD4svH1jFHcaD9ee2g8NM476udmezUPieUmSGtDExHq3z5FXsX+XN
         F1gXvpLpcPqzAsmT31SEY8ii08wGe0oWez1SgHG/oorTrX7mtUYb44/wwDk5nClnasFg
         i5nPtKcsbVShatWAMpZ5R0lCMkTiCUgmGkoVThGI/OQzscimondmWX4nQo+i+8ySvzL+
         8TXgtFK5MigqWyK/l6GOoJfa0yO6XDgtwFPXlxbxSOXVVy0Z8BGUaC693YVLYI1755Ag
         oucw==
X-Forwarded-Encrypted: i=1; AFNElJ+PXNdRrlPDwxnL0OfUW9LOhm2Yuf8AT3DWPdU8T9e5FOwDrmRAz+220W3weVo/6dOU5iGXWTBvZ7Cvl3v49Js=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrp7JMh+IbRY724UtYdJevZVB+PiLCmtr7bcmnQB7zLZscpQun
	vdztuyZpHhgDBjiWlvtIUifHtBIrBMb9VzYXQSSKnAqpY8r+CoOqROHJ94FEM/B0+OpkT7jWAIr
	OMq87Yob+qHWNJBQy4jEiai4F6yt+n34wnFjZUEjH5+tmCSxD2c98HdXMKjy8tK6iplK7rlR3i3
	b5PA==
X-Gm-Gg: AeBDietZ9WlDNk1GqSBADdITArYyPtKReDLXNHu9pG+eid4kZ1Yr7MKnjNc43dgxhvd
	1gqd+jKhNfZADUcmcn4jjLCvykj0yCsD1jF4ZeESc58CIHb8NTneh8rw/uJ6lmd7bTwnnCZTVg8
	Wg8CF1Ej3fRCot9WexAWDmj31+/bRMJ0Tj1VT88qyykfy4isqkAm9f2JMYwI1Bqu/fROaVLPkM9
	R/TLVcrIBMlRS7da8VCSLdvRuDH3foPAELcfveTzCzixyN+MQ6gyxYro2Yw7wB6ZqQs8poq3KLh
	H/lV+97AH6mkblwwZjYFT3yVL3jwVXnIq8BnwgyQy8UBFY7089oq9XBHCO0LLSQhWI46fMBZA5T
	bFVrmSAi3+njC8xHU1jzmnSJ+kNsX
X-Received: by 2002:a05:6a00:1a0b:b0:82f:b519:a5d0 with SMTP id d2e1a72fcca58-82fb519a776mr10942178b3a.39.1776861390357;
        Wed, 22 Apr 2026 05:36:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a0b:b0:82f:b519:a5d0 with SMTP id d2e1a72fcca58-82fb519a776mr10942152b3a.39.1776861389901;
        Wed, 22 Apr 2026 05:36:29 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d35acsm17671348b3a.15.2026.04.22.05.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:36:29 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Piotr Zarycki <piotr.zarycki@gmail.com>, kvm@vger.kernel.org
Cc: seanjc@google.com, pbonzini@redhat.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Piotr Zarycki <piotr.zarycki@gmail.com>
Subject: Re: [PATCH] KVM: selftests: hyperv_tlb_flush: replace NOP loop with
 udelay()
In-Reply-To: <20260421172953.191345-1-piotr.zarycki@gmail.com>
References: <20260421172953.191345-1-piotr.zarycki@gmail.com>
Date: Wed, 22 Apr 2026 14:36:17 +0200
Message-ID: <87v7djgoji.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Piotr Zarycki <piotr.zarycki@gmail.com> writes:

> Replace the open-coded NOP loop with udelay() which was added to KVM
> selftests in commit 6b878cbb87bf ("KVM: selftests: Add guest udelay()
> utility for x86"). The NOP loop is CPU speed dependent while udelay()
> provides a deterministic delay regardless of host CPU frequency.
>
> Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
> ---
>  tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
> index c542cc4762b1..68ebd790ff41 100644
> --- a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
> +++ b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
> @@ -141,15 +141,9 @@ static void swap_two_test_pages(vm_paddr_t pte_gva1, vm_paddr_t pte_gva2)
>  	*(uint64_t *)pte_gva2 = tmp;
>  }
>  
> -/*
> - * TODO: replace the silly NOP loop with a proper udelay() implementation.
> - */
>  static inline void do_delay(void)
>  {
> -	int i;
> -
> -	for (i = 0; i < 1000000; i++)
> -		asm volatile("nop");
> +	udelay(100);
>  }
>  
>  /*

Oh, I completely forgot I added the TODO :-) Thanks for the patch! I
also gave it a spin and it looks like rdtsc() from udelay() doesn't
hurt.

Personally, I belive we should now just drop the whole do_delay()
function and use udelay(100) instead. We have only two call sites and
there's no strict requirement that the delay time should match. 

In any case,

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

-- 
Vitaly

