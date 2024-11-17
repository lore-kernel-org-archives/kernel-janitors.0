Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051F27DA68
	for <kernel-janitors@vger.kernel.org>; Sun, 17 Nov 2024 15:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731856084; cv=none; b=nhXXY11hFhLTBZEFDbVUYY3swoUs0mTX7xSPo8J7dLsQenNu3uMFlOSVbiuBTd8hXd0yrgutgH3FXMFG4SDTN4bkikqp52qQzLc0zKluE0owAmEzz9a9KMp0rw/6Awtq8fvOqVocvdzGe5ZhclfQ5lEnJCYoYH3GhrWJV0MnpHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731856084; c=relaxed/simple;
	bh=Z78xT1u2GKnDJYyDOSrvCI9h3g1zvBHHhasKYRyetf4=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BcLbUxZiksUoVBZQtOB67nL3mjRLVMGs7EsdwtsR2W6kR7/8YtnmQWjR8FMLhFNZUSlBE2OZQ4/xSoRzDZ1RmVD1W6rYysJDJt0eHlcMXyoyJ+ITme+yvNyGurvCia3YfVXIb+DW3/K6Eal3/CrrFHMAiLd4H8mqFG29kipwJw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBX61oN7; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBX61oN7"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c96b2a10e1so6051835a12.2
        for <kernel-janitors@vger.kernel.org>; Sun, 17 Nov 2024 07:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731856081; x=1732460881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=H217wy37D94BWA77AByeyRbZF9b4ghhovd1baVaPfDg=;
        b=WBX61oN7HewzKVhl7ZWHhF9L5C4h9exBWguqypd0JGvS+nrjl94Rb0n7iUXKua4+6k
         oXRzglJMhzjafaQ5nVr9NZXTX4sY7s33xtAwV8Q9J0WFC8jLjJGEvOgL+CPUe64XJCAv
         yN2zKGH7qTAtyqAGAYyLbwZ+wVntPfEeI62kRwlDhubidP2ZCd5hKvAsMR7YO0ESbEDp
         nCoyZPEDr0Ib5+geMbru0E4x0sr5RhXukGgbhuP0Y2a+Qg/9iCatlvwO4vjecbKNJj8S
         1cUoAqvx+m4Ht8oQL6U+vj6GiKoSNPOZgD4hDkadZLGo0lWAt+iniJITsf/rR8aUQQFi
         FLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731856081; x=1732460881;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H217wy37D94BWA77AByeyRbZF9b4ghhovd1baVaPfDg=;
        b=chZDK01IKGUeg+humdyavzw25XoPzIrin5nIc6zaT2Kp0WsCsVUcV+7zXvDjkqHHL9
         YDoiygaO2VooyFdNiIr/M9hsjsHDNEwTDmHlc0wSULLSEUqT3h+69t6n0K8cG1R0ZIMm
         dfJ+jr3qZstpmAby8qV/GCFuZDg+L4uK1GjbEvmCS0oD/sZ2O4OhZSJ44/8t56oG/86V
         7CoWRRhMywkJImTG1aZs2Ppex1+XtJfuPBmXLbl0PpWGAF7FRVWaMMiitetqkdqpZnBz
         sa8RG4/ysQNwyAIdlDD1Y7kDlDTACvXwnIjlRDBqZPJTFDppe8JqcuBSL9Oz9JR3eELd
         /3wg==
X-Gm-Message-State: AOJu0YxtlMGkA8nwuXwC4FXcfxbaiqiOY4fhhlIn697PpPB9YH8CRBGI
	rwLG5PpqspDYTaULva4OEBnem60LxMHgoUTio+ZKg/hYPjXpKdUG
X-Google-Smtp-Source: AGHT+IF5Hi5gf78p2qfSd21L88J7QFSxcny/P2FprsW9tNVnSLeb469DgigK+bxM8N5gyyOIjVu5vQ==
X-Received: by 2002:a05:6402:42ca:b0:5cf:c188:81bf with SMTP id 4fb4d7f45d1cf-5cfc18882aamr841080a12.25.1731856081019;
        Sun, 17 Nov 2024 07:08:01 -0800 (PST)
Received: from [127.0.0.1] ([193.252.113.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cfc2677c5csm267108a12.72.2024.11.17.07.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Nov 2024 07:08:00 -0800 (PST)
From: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
X-Google-Original-From: Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Message-ID: <0b537aa4-7dba-4290-8b83-444023571425@orange.com>
Date: Sun, 17 Nov 2024 16:07:43 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: chasing all idr_remove() misses
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Alexandre Ferrieux <alexandre.ferrieux@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Cc: kernel-janitors@vger.kernel.org
References: <97f3b17f-2e92-4cb7-8ee5-3a76969fb2cf@orange.com>
 <304a9635-9bb0-4dbe-94c9-135f43dd8217@stanley.mountain>
Content-Language: fr, en-US
Organization: Orange
In-Reply-To: <304a9635-9bb0-4dbe-94c9-135f43dd8217@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/11/2024 20:43, Dan Carpenter wrote:
>
> On Sat, Nov 16, 2024 at 06:45:37PM +0100, Alexandre Ferrieux wrote:
>>
>>   73af53d82076 net: sched: cls_u32: Fix u32's systematic failure to free IDR
>>                entries for hnodes.
>>
>> So, unless we have reasons to think cls_u32 was the only place where two ID
>> encodings might lend themselves to confusion, I'm wondering if it wouldn't
>> make sense to chase the issue more systematically
>>
> Matthew Wilcox maintains IDR so it's really up to him.  I don't think adding
> a WARN_ON_ONCE() in idr_remove() for NULL returns is a bad idea but we could
> hide it behind a #if DEBUG_IDR or something and try run syzkaller on it first.

Thanks Dan. Now, I'm not familiar with the syzbot feeding process, can you help
me out ? Is the next step to:

 (a) invent the new debug flag (e.g. "DEBUG_IDR") then post a patch using it;
wait for its acceptation and merge ; then contact syzbot operators to add it in
(some of) its builds

 (b) use some existing wide-range debug flag so that syzbot will automagically
test IDR once the patch is merged

 (c) wait for you or Matthew to handle all of this

Thanks in advance,

-Alex

