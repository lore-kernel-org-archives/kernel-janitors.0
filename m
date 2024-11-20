Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA39A1A4F1F
	for <kernel-janitors@vger.kernel.org>; Wed, 20 Nov 2024 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732113818; cv=none; b=fsL7zJVpadPWBv9kgrzRUi1TBtUEzI3QXC1OtJ9GsqCPnsH4NLo3M951Ad2+fbHgKQsmUBz5a1lqiuGhJ8Vh225xDgsKnRphtAYH3UQjh48u2wZe2H6Wc87Mfsv1e5GXwCL8vqWdwzhzbIzaEU0m9M/GLsU7K5JeFt2Dpy9gOU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732113818; c=relaxed/simple;
	bh=HWv3O6mnhLgHBvZnLjyJuGkoqsE6g/V5K7cYN3gihHk=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G9aNcOFVHpuTRfUY+Vnly7eSOFa1CtT4zZp4MyhaiTVrBy6sPmbvCdAIlmk50Dh76eGlDd5nyPdCCOtN1NWZhkdcVQDUVZHXiH8PV/Vjha+zkfi9v9UN0NJ3oDevRzMLSOMXZVkIKAPu9tS1OZo6hSjH9TFkQMny1/8MkvyqAWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Za6YGCLG; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Za6YGCLG"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa4b439c5e8so596523166b.2
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Nov 2024 06:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732113815; x=1732718615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5mwThuDCRr+UAlhR80l7NoS9A71RIIDiDHpF0mb3xcY=;
        b=Za6YGCLGYHk1T8RZLizh5BxttMSuS8eDFYLh4DRs/Fv/qZMdO0QUzLD5x99BAzdVvo
         Ben4KF556i0B9xUCloCw4wbFRQmPiFdfsYRRep6l6CPi9fBAb5soe09IYZjIwwv5RHGH
         sVATO/WfsRbzN1g1zM/Vk3awoi7hDXdDlG/LjqEotLJBWzq3zfcIYamjS+a1YsVoKH66
         mGwVFFlChvbK0HycD+bap2B3w6cN2bYFasYiaNI+kaBrldinhjK2gxQFmG654QTMULp0
         4FdFtY+QDVcOqcgChbcXKyCDXIAdMJWCH8kw/BqVuX/9FcwATT2mB/Os70NOp+tzICrP
         VN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732113815; x=1732718615;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5mwThuDCRr+UAlhR80l7NoS9A71RIIDiDHpF0mb3xcY=;
        b=P29YcGaxXK6rBQbYfUsNoj0epCp0pNSjgD28DDbsLTqGTac0kzLWl/1BnrAIyWJ3yV
         kQte2RuL09JziSFNv6fx4cRW/MMWH7wt+0qtlK1K2Obplb2fc8ql2XxuucIpO2VFl3eQ
         Q20oPn06Kv86PW5GEv/gBUcgjDvUWdMFCe76W6uJeblyhv5L9fIx1b/+BrPauI8aMJih
         FqqWx9NaNgQjnSHOJ4jLbKSDKnRmJ2rZjbDqWvJEegtWvFzph6S7Te7lwzrOpNlVLB6f
         MV/bEI6c+izDZb0qWdtvbyNTmUReaDEI/9YKFnm9tm+UETeAF9YbxVg1m9cMILTc42b1
         sNeA==
X-Forwarded-Encrypted: i=1; AJvYcCXKQhiEo7RtRBLfnFumlU9CI+gSUXdO8h0t96zqiYkMAQ1WwgFU1B55LJq0ugfo5XwH8BYGtm0+rGaJsRaSr3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNtX6d6h5I4fGVMu9aMy6ZFvB+/yLJFqxRyI5gpwhJfVMKoGaS
	gVhIIZ2lOeOwqL404QCuWzR/XIrsUhrfy8pxocw+hKXbY3iA1CcCTeAYDw==
X-Google-Smtp-Source: AGHT+IF4ivbmM3zTkLn/9rbQ1Ncc+xJ3/jeY6/1TXsIev5TFTNFaQbnSzoxV+v8vgnbGqpyrpSWlcA==
X-Received: by 2002:a17:907:787:b0:a9e:c881:80bd with SMTP id a640c23a62f3a-aa4dd719b2dmr206574666b.37.1732113814921;
        Wed, 20 Nov 2024 06:43:34 -0800 (PST)
Received: from [127.0.0.1] ([193.252.113.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dffd75asm791488466b.104.2024.11.20.06.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 06:43:33 -0800 (PST)
From: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
X-Google-Original-From: Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Message-ID: <e9035219-4f16-4d27-bc8d-31f720c52e00@orange.com>
Date: Wed, 20 Nov 2024 15:43:23 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: chasing all idr_remove() misses
To: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, kernel-janitors@vger.kernel.org
References: <97f3b17f-2e92-4cb7-8ee5-3a76969fb2cf@orange.com>
 <304a9635-9bb0-4dbe-94c9-135f43dd8217@stanley.mountain>
 <0b537aa4-7dba-4290-8b83-444023571425@orange.com>
 <Zzqq2ypY0JKrwlMb@casper.infradead.org>
 <d4e75e41-cbea-4c24-82f7-6b9f85f66bd3@orange.com>
Content-Language: fr, en-US
Organization: Orange
In-Reply-To: <d4e75e41-cbea-4c24-82f7-6b9f85f66bd3@orange.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/11/2024 12:33, Alexandre Ferrieux wrote:
> On 18/11/2024 03:47, Matthew Wilcox wrote:
>> 
>> IDR is deprecated.  I'm not excited about patches that make it better.
>> IDR users should be converted to use the XArray API.
> 
> Well, the problem is more about chasing a bad usage pattern than an API's
> limitations. Indeed, doing the same grep for Xarray shows that, out of 434
> (naked) call sites of xa_erase() in the kernel, 307 fail to check the result.
> 
> So, independently from the IDR->XArray transition (which may still take some
> time), it looks like there's a Damocles sword over a possibly huge number of
> areas, and that would handily be grabbed by a syzbot scan, with a ridiculous
> time investment: just add #ifdef ... WARN_ON_ONCE() ...#endif on the "return
> NULL" path of both idr_remove() and xa_erase().
> 
> Again, I'm not asking to do this on production kernels. All I'm asking is the
> detailed procedure to let the "established" fuzzers exercise that, as using
> syzkaller locally on my limited hardware is not an serious option.

Reading up on syzbot documentation, I can see that the recommended idiom for
such cases is #if IS_ENABLED(CONFIG_DEBUG_AID_FOR_SYZBOT):

>> https://github.com/google/syzkaller/blob/master/docs/syzbot.md says:
>
> However, syzbot kernel config always includes CONFIG_DEBUG_AID_FOR_SYZBOT=y
> setting, which is not normally present in kernel. What was used for
> particularly elusive bugs in the past is temporary merging some additional
> debugging code into linux-next under this config setting (e.g. more debug
> checks and/or debug output) and waiting for new crash reports from syzbot

So, if I submitted a patch doing WARN_ON_ONCE(..==NULL) under this flag in all
naked idr_remove() and xa_erase() call sites, with suitable macro decoration to
keep readability, would it stand a chance to be committed ?
