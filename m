Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E689814884F;
	Mon,  6 Jan 2025 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736171405; cv=none; b=ebVT+HshC9t/ifv62XGGpx3r10aJcfAsUKBqolcmKP7Eq6QwhygNTveZHViS3WqQbkl75i6Beb8B4tEdFa5B3qv898JdycRE3lpeRfL6817lpswEAZY3m1ZUyDymSn/ZtzEH7qtJkZD1Rr6sqPRxN2vYTPgab4NXFmpVhfqsstE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736171405; c=relaxed/simple;
	bh=M9pLJh0v7qWyD7zOiuyQG9VH+vZu6HBogg0BqHRF7PY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=khiXmcN6ATQl2AHzBNVqnY0MWGyCDnvNI0Z+EX2FscSSSk12fPgFTWyZ8L6KFIDb1hblUVvUE4SsJef4zgsoaMjBeN0OpAEcG1J695lP0T9g3C3hUi6uVZiZLl50rpNCRJ3NwqFzfLFWATn5mjG6L3Pj/UQd9fbDwH/YMtfi5kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YRb140P3jz9sPd;
	Mon,  6 Jan 2025 14:40:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJ3gtH1K1DVt; Mon,  6 Jan 2025 14:40:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YRb136lQPz9rvV;
	Mon,  6 Jan 2025 14:40:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D6ECF8B76D;
	Mon,  6 Jan 2025 14:40:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mOVSrQxjcbU4; Mon,  6 Jan 2025 14:40:55 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 603748B763;
	Mon,  6 Jan 2025 14:40:55 +0100 (CET)
Message-ID: <ffe7a52b-95cf-4611-b0ee-667272c9e0ee@csgroup.eu>
Date: Mon, 6 Jan 2025 14:40:55 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries/vas: Fix typo
To: Markus Elfring <Markus.Elfring@web.de>,
 Colin Ian King <colin.i.king@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Haren Myneni <haren@linux.ibm.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20250106123241.161225-1-colin.i.king@gmail.com>
 <484f8c43-2c50-4467-be3f-8fe02f36e6b0@web.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <484f8c43-2c50-4467-be3f-8fe02f36e6b0@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 06/01/2025 à 14:35, Markus Elfring a écrit :
> …
>> +++ b/arch/powerpc/platforms/book3s/vas-api.c
>> @@ -490,7 +490,7 @@ static void vas_mmap_close(struct vm_area_struct *vma)
>>   	 * address. So it has to be the same VMA that is getting freed.
>>   	 */
>>   	if (WARN_ON(txwin->task_ref.vma != vma)) {
>> -		pr_err("Invalid paste address mmaping\n");
>> +		pr_err("Invalid paste address mmapping\n");
> 
>                                                mapping?


Or mmap-ing , as this is the action of calling mmap() ?

> 
> 
>>   		return;
>>   	}
> 
> 
> Regards,
> Markus

