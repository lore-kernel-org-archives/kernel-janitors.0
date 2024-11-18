Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FA22629C
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Nov 2024 11:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731929606; cv=none; b=Bk/LxrSyLl5X1FlCoxhlkuq+z6bd01e0AvYum8VGUOSYd4aVMKpVZZB2ALguwFCXnoujaix9gvwrIjFo7f00vxi0qmOpSW9Cu14RXaUlHMxqNM0v+I08pI80MmNXLbvYi4qWZNdL9jN6x5LIVKTb5sR8y+HWDdU3V7ZA3fhXO94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731929606; c=relaxed/simple;
	bh=61rPpt259mef/Lu/dUoWsWMna1DNcWC9vPsLItvXF/s=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cmwS8+NWGQu+F76HP+uzExrj8Cz2dwid+ggOsuQrrOd1xl1gqyiZYU2Q/S5jxCDPFy85q1nEjUKxrF45OToDR+4ycZxinipX7iaTfaYnf39ybk2H0f/Zm3VqFd1RPnFMre9U8gcKRv1fG6fjjdv11zLz502fmHh/08YdqCCA4os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDY/VFb9; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDY/VFb9"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so3960227a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Nov 2024 03:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731929603; x=1732534403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TYqg0HjysGSbBXW+MsEWCqz5uKXh7o6Y3n9uaOm5muQ=;
        b=kDY/VFb9W4QB2IPWDeDpKVR+jJ9WQ5vWBp4pLLpRwF6XOJprw18jI83PQME+gz69xH
         XvmqtY58gi1rCYzZEgMinQEwlVcm9y8yZHoCtvM/ZDH05DCQnwfbKwbh14LehaSW2DRD
         AqH6A7IG08RAeoNnIMwh7tmMy2Qc3d85CmygnhmAcbcczFUHub9FxvK50KiZml87HW9S
         76CbHmxSaDJiM0TXAH8t6WtWebib8YJgtq2btKJt2RJj8iMLsvkRDrYs3NJoy6UjpypR
         HpzOxKEDC7Zh1uteA8W+ipXwaWwdv5UKnpPbj4LiBwd6QDtdCJnGhIDTkl0l6pR01L3k
         sdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731929603; x=1732534403;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TYqg0HjysGSbBXW+MsEWCqz5uKXh7o6Y3n9uaOm5muQ=;
        b=ckCrZf4b2YBU5400ChzcZvDjiHZxIQztdcu7ktFfzSnkBububKPDQKBE12wrHRShjV
         6sf79ObMIb+DNLLyYcJwRbr/0+eb6ZkO1xX1P9YukLapWMjf75jaZJAfOs+Z+jtRnEmg
         Q6C6zgjgwltDLehDpxdzcIdfWQ/MMQ623XbB4YD8fXBFLpGKRonzQmDdsDw5k658H0RX
         4QrMxQ064C383W5hA19vWKuCznd5xA8o67gr7PW3rTZX2rfhPC0qIiDrDkhEud2lN9jX
         AWoVO4VzX0uRnEtazTFT7ZUdBDXRLc3pkvyuxSdYwLH4C+cx/Yl0MNLqxWDDX6zEd0D9
         uZKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOsN3XAtrAwX9XJDQ4C777iMndsdwqn5wwporftcUvrAFBfK8Ep7LkPTDc6+XDOtAz5BASgnknz1aG8667evw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1A4HeAlyHApjhhRyHL+5pLy/6FyZA6Ha2ukj0m0DjBwPtOQrV
	5uWQJEVrLx19lJOheV1MPnKbwDYjnbA6FoTgGWrZKBD9P/8gd8vL
X-Google-Smtp-Source: AGHT+IGCtQLmxwY3apA0VYS2Tg+LjxMFCWZKFQrlEVyqD39yunD0qG5JV0I9rpPpVKCLobndx7BaiQ==
X-Received: by 2002:a05:6402:27cd:b0:5cf:92ea:8bf6 with SMTP id 4fb4d7f45d1cf-5cf92ea9625mr7317755a12.1.1731929602674;
        Mon, 18 Nov 2024 03:33:22 -0800 (PST)
Received: from [127.0.0.1] ([193.252.113.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df268d5sm525205666b.5.2024.11.18.03.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 03:33:22 -0800 (PST)
From: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
X-Google-Original-From: Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Message-ID: <d4e75e41-cbea-4c24-82f7-6b9f85f66bd3@orange.com>
Date: Mon, 18 Nov 2024 12:33:07 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: chasing all idr_remove() misses
To: Matthew Wilcox <willy@infradead.org>,
 Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, kernel-janitors@vger.kernel.org
References: <97f3b17f-2e92-4cb7-8ee5-3a76969fb2cf@orange.com>
 <304a9635-9bb0-4dbe-94c9-135f43dd8217@stanley.mountain>
 <0b537aa4-7dba-4290-8b83-444023571425@orange.com>
 <Zzqq2ypY0JKrwlMb@casper.infradead.org>
Content-Language: fr, en-US
Organization: Orange
In-Reply-To: <Zzqq2ypY0JKrwlMb@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/11/2024 03:47, Matthew Wilcox wrote:
> On Sun, Nov 17, 2024 at 04:07:43PM +0100, Alexandre Ferrieux wrote:
>> On 16/11/2024 20:43, Dan Carpenter wrote:
>> >
>> > On Sat, Nov 16, 2024 at 06:45:37PM +0100, Alexandre Ferrieux wrote:
>> >>
>> >>   73af53d82076 net: sched: cls_u32: Fix u32's systematic failure to free IDR
>> >>                entries for hnodes.
>> >>
>> >> So, unless we have reasons to think cls_u32 was the only place where two ID
>> >> encodings might lend themselves to confusion, I'm wondering if it wouldn't
>> >> make sense to chase the issue more systematically
>> >>
>> > Matthew Wilcox maintains IDR so it's really up to him.  I don't think adding
>> > a WARN_ON_ONCE() in idr_remove() for NULL returns is a bad idea but we could
>> > hide it behind a #if DEBUG_IDR or something and try run syzkaller on it first.
>> 
>> Thanks Dan. Now, I'm not familiar with the syzbot feeding process, can you help
>> me out ? Is the next step to:
>> 
>>  (a) invent the new debug flag (e.g. "DEBUG_IDR") then post a patch using it;
>> wait for its acceptation and merge ; then contact syzbot operators to add it in
>> (some of) its builds
>> 
>>  (b) use some existing wide-range debug flag so that syzbot will automagically
>> test IDR once the patch is merged
>> 
>>  (c) wait for you or Matthew to handle all of this
> 
> IDR is deprecated.  I'm not excited about patches that make it better.
> IDR users should be converted to use the XArray API.

Well, the problem is more about chasing a bad usage pattern than an API's
limitations. Indeed, doing the same grep for Xarray shows that, out of 434
(naked) call sites of xa_erase() in the kernel, 307 fail to check the result.

So, independently from the IDR->XArray transition (which may still take some
time), it looks like there's a Damocles sword over a possibly huge number of
areas, and that would handily be grabbed by a syzbot scan, with a ridiculous
time investment: just add #ifdef ... WARN_ON_ONCE() ...#endif on the "return
NULL" path of both idr_remove() and xa_erase().

Again, I'm not asking to do this on production kernels. All I'm asking is the
detailed procedure to let the "established" fuzzers exercise that, as using
syzkaller locally on my limited hardware is not an serious option.


