Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148133128D7
	for <kernel-janitors@vger.kernel.org>; Sun, 23 Aug 2026 14:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787495827; cv=none; b=ppdpNf2FqHZZUdIrm2uth5jEWDE9fpDvn/oLxZk8FyXzm3A424p9ohGkeMOFidwC8qkQSBSs2g0Kqcu9KwUbpyxoV3E6fmUb1x571xhavw5M5HjfCo2A8nzbU+P9jOPXqIN0NNUf9aFx4ZCLFho0PZib/w9SqqkCH/aSpxj6sWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787495827; c=relaxed/simple;
	bh=qZZWn22YQl20SjyVdcx7nzk3Bsd1rFBGXKmPjvWGvSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBW9rpt59d3vyGeI9V8Ahu5EyE5/ynI/ivuCvugUkwDCMAzIDe1NPvz3RgZCYqtSFbjouXBmaiZ4fI82Buxr5E/lN6pawMoy6bN2YMJKfq7Hi1UX05soWyK5s6gyJwiQA2i2xuP4UIizx26VCn4B7ils3zZWrUr9CXBC9Hjp3fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GD++IGa9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GD++IGa9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so1123192f8f.2
        for <kernel-janitors@vger.kernel.org>; Sun, 23 Aug 2026 07:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787495824; x=1788100624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjVwgap47YOeIukz8yw67SDCadu22oFRx+M5RlZB4jk=;
        b=GD++IGa9pYcoFWRdE3RHolqCSG0lblSQw1MsJHHGf4BS3EcF4zSSsNaTKc6KSXwHZM
         nUSrVtHeadufgS9HBiGZhmZZFvu+d0u87acz4CYS+8Z26PBJl3vHwA+JauKDovU/XeVE
         44sSZbXozsFGkdRFZRy4RjKHjEUtb8D/JEGiySlQ6BcHP6re8caqVRbKrb71ixqSXBC3
         q2IO60fTDPQj/BsPAFtIy//qFF41N44vbPWUqZGB92IMENx+/ZD78M0A1hT/T9xjTtIX
         u+j4wJXMgWPd8Bgfq6JJ7BrpvqSq3zxHcxzunHRO/b5J28guxXxk9YWZprjTXPakzmQr
         Hfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787495824; x=1788100624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IjVwgap47YOeIukz8yw67SDCadu22oFRx+M5RlZB4jk=;
        b=UeYbzv4UrfrTQteosDavRIE7UXyD/8JTpEtKVx5eng/UIvEligXEfn1JtxB5H0/24t
         W9J5wI13waErWbX13HjoZWpJivTDtgZk1gQ84OIYqcyXGCH5LaGHIqRfRD7AvzkeT8Yd
         NfxsVfx/bIE0hBH+GIfC3FPGM5CNl4SYpFc6M9Yk2FK0y5CN1RDqaVq/AZY7V6XWEbWg
         sE3tvZp+M3eqG0N5oqGmm05HVm/I04G4nScSYw5+C8bakezWmttT/EBoIVzC3WHITbW8
         QTAZ2ZousxrS/J2tem46w4FZMxRGUrT9+o5Tj2zvrTeggvilHr+BP+ucnrCc5MkEso1a
         XoKA==
X-Forwarded-Encrypted: i=1; AHgh+RrT8tZWu/IXT2jNpXh+yCIhimzq902r2FwkkoUs8SYZ3WP/rZH5UEK9epNOux5uZEBoBdrZZ05zecW3lx7QOq8=@vger.kernel.org
X-Gm-Message-State: AFuF++mf0H2xB8ofgqIPHRL5syQ/uTRi9KOxC7OEVJnIgxNCrL21yd9u
	LdMW99x0/JzIBZf4O27wki2gHHpQgR4QoFFwwXQEplrxr5nfMnsOqlxL
X-Gm-Gg: AR+sD13JGNjmal9/B+eM6DxuVs9P9+2aN5buqNUMzoZcXmGh/m4YDgKDFgjSaMH0BzI
	//pHbkPNTwZ4DVMP0edLDRSn+QWwSS9mgwyry2q8flmtTKMJJIMi5Q17ZDeWo8CuhXGSMc5od58
	djl9gh5O1NSPkzPaPytRT/6cUn2tf1WKW/Dij1zbRFmjTPtoNCqWnZxpUoKKDk8GGCHR0q9ptdR
	/g88andYNpVEPkjayz4WTc0hAOYjwpt2hVKJ83lsYWPksT3ZQVJwfKQHJGbxrlWsCL3XNnn52vF
	n5By4yJ6ZxKkj1n3MoQ+nThtQJGEYzC9duDSVhcAStlp+Uj0LzrnoOna1vUK0iFc8TCno7otshM
	8K9UwKEnKPSFEpMD81of3pmGaemE1S4xCe9NbIh/8s1SzQ7caLsp6oUThUj9YkOQao6490NYCoE
	zWlWvML0iY4rQuMRfU04AvlY+cKsGVXug+4exumuu1KYlW6hnpJTMADBMqSsxYd+ZhpQrjZWbSm
	UDovsZ8O9Se129mxpKRIMPN+lsbM5beRYVH8X/kduWtOVurRwYC2r4G7A==
X-Received: by 2002:a05:6000:46c2:b0:482:c650:8c89 with SMTP id ffacd0b85a97d-482c6508d4emr12735930f8f.9.1787495824002;
        Sun, 23 Aug 2026 07:37:04 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b69b3csm5404807f8f.3.2026.08.23.07.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 07:37:03 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <f66f3199-df76-4158-9ddd-23e9096a1fd4@gmail.com>
Date: Sun, 23 Aug 2026 15:37:01 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: remove dead 440SP code
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, Frank.Li@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Cc: linusw@kernel.org, kees@kernel.org, colin.i.king@gmail.com,
 rosenp@gmail.com, joao@joaoff.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20260816125615.985387-1-julianbraha@gmail.com>
 <c4d970dd-cb54-4530-9491-01b6d90e4a2b@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <c4d970dd-cb54-4530-9491-01b6d90e4a2b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Christophe,

On 8/17/26 07:29, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 16/08/2026 à 14:56, Julian Braha a écrit :
>> The 440SP config option can never be enabled, making all references to it
>> dead code.
>>
>> Let's remove support for 440SP, since nobody can be using it anyway.
>>
>> This dead code was found by kconfirm, a static analysis tool for Kconfig.
> 
> It would be good to include history in the commit description:
> 
> As far as I can see, users of CONFIG_440SP were commented out by commit
> f65573314e4e ("[POWERPC] Re-organize Kconfig code for 4xx in arch/
> powerpc") and removed by commit ff5f483f3091 ("powerpc: 4xx: remove
> commented out Kconfig entries")
> 
> 
>>
>> Signed-off-by: Julian Braha <julianbraha@gmail.com>
>> ---
>>   arch/powerpc/boot/cuboot-katmai.c   |  2 +-
>>   arch/powerpc/include/asm/async_tx.h |  2 +-
>>   arch/powerpc/include/asm/dcr-regs.h | 10 +++++-----
>>   arch/powerpc/kernel/cpu_specs_44x.h | 12 ------------
>>   arch/powerpc/platforms/44x/Kconfig  |  3 ---
>>   drivers/dma/Kconfig                 |  2 +-
>>   drivers/dma/ppc4xx/adma.c           |  9 ---------
>>   drivers/dma/ppc4xx/adma.h           |  2 +-
>>   drivers/dma/ppc4xx/dma.h            |  9 ---------
>>   drivers/net/ethernet/ibm/emac/mal.h |  2 +-
>>   10 files changed, 10 insertions(+), 43 deletions(-)
>>
>> diff --git a/arch/powerpc/boot/cuboot-katmai.c b/arch/powerpc/boot/
>> cuboot-katmai.c
>> index 034a748fde24..fcd71e76309f 100644
>> --- a/arch/powerpc/boot/cuboot-katmai.c
>> +++ b/arch/powerpc/boot/cuboot-katmai.c
>> @@ -31,7 +31,7 @@ static void katmai_fixups(void)
>>   {
>>       unsigned long sysclk = 33333000;
>>   -    /* 440SP Clock logic is all but identical to 440GX
>> +    /* 440SPe Clock logic is all but identical to 440GX
>>        * so we just use that code for now at least
>>        */
>>       ibm440spe_fixup_clocks(sysclk, 6 * 1843200, 0);
>> diff --git a/arch/powerpc/include/asm/async_tx.h b/arch/powerpc/
>> include/asm/async_tx.h
>> index a14758426dd5..1ff5b2ca3ed1 100644
>> --- a/arch/powerpc/include/asm/async_tx.h
>> +++ b/arch/powerpc/include/asm/async_tx.h
>> @@ -7,7 +7,7 @@
>>   #ifndef _ASM_POWERPC_ASYNC_TX_H_
>>   #define _ASM_POWERPC_ASYNC_TX_H_
>>   -#if defined(CONFIG_440SPe) || defined(CONFIG_440SP)
>> +#if defined(CONFIG_440SPe)
> 
> Replace by #ifdef CONFIG_440SPe

Thanks for your feedback, will send a v2!

- Julian Braha

