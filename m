Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB6733B6EB
	for <kernel-janitors@vger.kernel.org>; Thu, 20 Nov 2025 13:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644982; cv=none; b=ADbeilwQiCfx3zWdc4OTlmqzcZMKhxrZeBpt/QI1CDsmP96J4Nt50lkE1MKyIGoEIXBFxXQZ6y+pe34DoSNaUdvM2UgcxC4zvwXfaLO7FxWrMTfR+PJD4ZhSHkjYNwNTzfyjisvE0pIZcKSpbRJ7//pTbAvG/vUIPxhzoF+KXKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644982; c=relaxed/simple;
	bh=9qtG9CkAZRsb3wsOb/RQUJ+xeL9HlwdjmU6wDSHWlxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGMj7vYmSH/yDyhwnxLjHnkfZIMQCqjsN/LT+bxuRpEFcn9XmKdB7HFXl7ELUhVebP+dqcNO9dmOZsbaRop3wsiKajGlG63ZYjPmh8OC7Yj+e+QVan/nmGHa6geyOXOsuZrdUHi4IaHO3OoevhLBC7Zabnv7xiB0YVxS5bf4hls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LuM7qtTZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pDh7AOtn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LuM7qtTZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pDh7AOtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763644978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9kLgsM1a2i43i4Ut85isBlu2SYExf3MkKcU6sJyq0M=;
	b=LuM7qtTZCz610Y0uvCdlXR+rfKSrj9nGyt4or0/m+7NdZsBhjFs+CtIu6SfktnjR1E8teP
	SIRzfSfzrq/YKC13SseNh/aZy3qvrg7kOiRmegRgu869JCYirm0gt0kWEQ/qQZDckGHSkK
	s7EjpH1sAjGa/lcEeRNmmkIlsDMvjz0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-esHFXi0uOpSoXdGZmst4Gw-1; Thu, 20 Nov 2025 08:22:57 -0500
X-MC-Unique: esHFXi0uOpSoXdGZmst4Gw-1
X-Mimecast-MFC-AGG-ID: esHFXi0uOpSoXdGZmst4Gw_1763644977
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22ab98226so413798985a.2
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Nov 2025 05:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763644977; x=1764249777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9kLgsM1a2i43i4Ut85isBlu2SYExf3MkKcU6sJyq0M=;
        b=pDh7AOtnyuWzhnp4R5VrT/G9EYNotPeeonPDo0ZfujKwngO9IGnwNvcVUZa/3nTnUO
         VyKuz1mQdoo5hExyLd2hbshMa981zNeZDrWvCgMbeYscq/DLIl0S5p5U0Rv6EJlX1Hvv
         IcWw2/oaow6J797MgbUl+riNQdjv6v77pr3aZ7Zo62NBQSqIT94QJMNpPpFDb2VHqOyo
         77kcdbqp+nNZm34WWRWWHFDzlhw8V8YQT5IredXSljW9JCE/UjvZVOq0hQTyDXmjQ2BX
         DcCXLoWLrLiKlES5nPlO0rOZlgqny4ndu8NaV6UeBbvFSfqpck/GQ57jMtgk2oNZF4A5
         sPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763644977; x=1764249777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9kLgsM1a2i43i4Ut85isBlu2SYExf3MkKcU6sJyq0M=;
        b=NB84Gqd3otMeYXUSOLTCkGuVVmalJrDYxF1t9JflU/xHH+dtAiucL0e1psNgiSHslu
         LJS67wZh71DevIc5Rf6W5Lla6qvUZOgUn48BsrTxFhDgtlZuZVEO/W9di9OI7jcgXzHB
         fvxHl2EBn7NzGtiHIIMRgUhDT2wUe0cuGnHVTjzbptZqcFqrIJbbK76q9Zm5nFb7Re64
         UVRS05FmMdo7IrsISzDQVTgBOnYuLD+TJKUe+FpGYJocxHb/6b98d6C4TqIzElAZqwJq
         NuWFN4gf99oiRG4kWzEmjqgugZieLk7DqEDBcQ3Do9F42e2PSEJDbxfTas6l8za4q+Kq
         nKPg==
X-Forwarded-Encrypted: i=1; AJvYcCWWdIPee3wIxCNl4t7rj303OTIrTl5W9xBszYrZC8XciK/98iO+GS1wzVuvIR9lNeznZan08G1wqQSnNEIX3wg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+lcbOVyICloVk62+tuVac7ZpG9u0xcjvUiufA37rdG3l4EuYX
	4yMww+/W2LPLovnS0oCmyeO7YIpq4zFkUw/VRAFW5riCap6j9nWde0EczhzNNWAaNgPWcnLHeSt
	F1/bFlyAtQhthqObwzZyv6HsINSL3pzQ1ExGM4Hl07EPFUynuuyQhA78bb+DNq/d8/zTZqg==
X-Gm-Gg: ASbGncvC7mu0zlg6cTyjGPwdjTdwQR2wdrtQpM+d1zYV6RdAfIPBi896/gEVGZ4bxIM
	Ve1O9GKxFAnEc0uXCYJBChWrA1meNKR3atis1uz/q1t5a1FDAr+kUlAz3haN0rLBKlwNaoK85IP
	lkmyBGrrnrKvJuvtYMoZRos1PP8Ig1TYltWBibNUIb2teDdtqJiUZbLiGSaYFeAIg2jgDVnPoz4
	7CpPKuT0f1kl2sNYTVhzxKvm8e2Mr5wWFxePWjIWQR3z4vgSl5bSKUhbw16Durdf1WwIjaa2BCi
	YbhC4+/8V3YTci4g9pPTUP1djSAyqPwK/tWwwM2CBKA1L2U6LIWwWSwcgJNuUkrq1TzjR2EiZn4
	ds7nNVNjPIA==
X-Received: by 2002:a05:620a:2683:b0:8a3:87ef:9245 with SMTP id af79cd13be357-8b3274afdbemr395776285a.85.1763644976993;
        Thu, 20 Nov 2025 05:22:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEc8oOJzkvKVhkAexfoiiZeXl3zNtHS/KFcZaK9jBanaZpFkfX4yBSJ0FsDLWlpVVKvZo4mUw==
X-Received: by 2002:a05:620a:2683:b0:8a3:87ef:9245 with SMTP id af79cd13be357-8b3274afdbemr395773085a.85.1763644976615;
        Thu, 20 Nov 2025 05:22:56 -0800 (PST)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e46a4b2sm16914256d6.19.2025.11.20.05.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 05:22:56 -0800 (PST)
Message-ID: <54ffe25e-c697-4639-b405-af50416764c8@redhat.com>
Date: Thu, 20 Nov 2025 08:22:55 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] intel_th: core: fix null pointer dereference in intel_th_irq
To: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20251118212106.541728-1-darcari@redhat.com>
 <32755d36-050e-413f-93b9-55d8306c165d@web.de>
 <e314be75-c171-40dd-8298-dce40f65d93b@redhat.com>
 <0d5bad33-49ed-4531-b399-e548d3dfce66@web.de>
Content-Language: en-US
From: David Arcari <darcari@redhat.com>
In-Reply-To: <0d5bad33-49ed-4531-b399-e548d3dfce66@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/20/25 8:07 AM, Markus Elfring wrote:
> …>>> the same array.  This can be fixed by disabling interrupts
>>>> during the call to intel_th_output_enable().
>>>
>>> 1. Would another imperative wording become helpful for an improved change description?
>>>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.18-rc6#n94
>>
>> I feel like the description explains the problem well.
> 
> Perhaps?
> 
> 
>> However, do you have alternate wording you would like to suggest?
> 
> Under which circumstances would you get into the mood to convert the wording approach
> “can be fixed by” into an imperative one?

I see. I will make that change if a v3 is in order. Naturally, I'd like 
to hear back from Alexander before putting more effort into this.

Best,
-DA

> 
> Regards,
> Markus
> 


