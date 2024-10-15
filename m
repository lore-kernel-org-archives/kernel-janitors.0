Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D7116F8E9
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729008088; cv=none; b=i96lS3ngvuYH+lJwzNLq8FzkGh7BVTyTB8ZIFUMqI7rqpNv4fV2NQBr3C9aMImGVwh8KcVpBkz5Qi+QrMtdOphysUiUCYgRoDKcQ8FFof/o36rAD3kRnVsPys0hFlD7MjMv8A86bL8YLC1Z2AtmZluPnA2v/E/THCQrF9KIM5RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729008088; c=relaxed/simple;
	bh=jqzuI1KjZlYwaYQXOMQWI/2ET4ZxgrRbs5jSZKisPNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcJGjtJED1qAQ/zVjscu4WF2qjPklh6oPI1xLrMB4/04I18v3cCney0uQQwxYJsIoU3Q/g36lXoJNKRWy5BH3oxBFYOCylbKGXXi3tkBiwmIDbbBnyODnq7kdClc7A6V3WNxl8SBjIo3LbCt5Q5WySgNZ8XKByXbe/5I785zhaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BzoaOpGL; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BzoaOpGL"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-82aac438539so235588039f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729008084; x=1729612884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8s+7gsg2JYqPAfbKcYne9b3YpM+dhp+OYrhzHgGLomQ=;
        b=BzoaOpGL0slJy5/E7DS5kQEBQAX4IA3lgaExH0so1HwaF0Jf4AlJiFWPSgBjthRvG/
         DF+CKUE11bX5/kR+5cOz64j28HHiTRLQVcEgOd4PuC+IvCazVpndoDihdrNEIuGEpEnG
         ladE0LSk8h92Hf1j+ty++5QMsObcimaqy60KI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729008084; x=1729612884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8s+7gsg2JYqPAfbKcYne9b3YpM+dhp+OYrhzHgGLomQ=;
        b=C0cNqI54clSfuhC23vcPlr9+Fm1zmr8zXd3You275JXnTNz5lbfh0a5UUHtY4pcVuU
         1MtjW1kCvBCxvUU8GDALGiMNdfKFWvXptw9HTxrxS8mCU290Dk3CFpCY247CrtubSwLI
         3ZRwwsltAtNSAwlGukN/L9Yrp/e8KjRZVp6DIgUabrf8iE8UpPRR+epIm6Myv5lCRDOR
         map/cfYKesBHrH5WP5i/DaLPeK3idzLVEJ2nt3V/o3ozHH4pFO+w3rjdS8tC7aghZ1WG
         gTUDEZ5pRuLPGLzFDCkOXqNpJxRCQJxS+cvs4Y5Z6yz003b3FG1Fez5A7XzbZJcdVhOb
         wGnA==
X-Forwarded-Encrypted: i=1; AJvYcCWEroJAXDt4BGFdocJJlDccwOBVCZpZlR0isFKtX2LPHB1ymwGGITxeaywpzN29kqFb+8BeobVgyWiRNF1yIlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX1wa7VxAxjejvMA/6LeiJ8AP5rCHmYXsUb2q54BKDnnVF/x/f
	/FZowzRk+VPY8xc0aogLVGGGBMDsvZpeAh9jw/c97L5uHC7GAnKaA4OelwT5YBE=
X-Google-Smtp-Source: AGHT+IGzELDMMYz4ZVvCQt2W2himwaElc8LWbYn6pi8ZJFv3gg5InzK/2HEeDQrXYkzZunPzolfDwg==
X-Received: by 2002:a05:6602:1503:b0:82b:40f:63c6 with SMTP id ca18e2360f4ac-83a64d161a3mr1396226739f.4.1729008084313;
        Tue, 15 Oct 2024 09:01:24 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83a96c7fee6sm6304139f.53.2024.10.15.09.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 09:01:23 -0700 (PDT)
Message-ID: <43eff9c9-9a23-46ac-9015-dbee35562848@linuxfoundation.org>
Date: Tue, 15 Oct 2024 10:01:22 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2][next] Bluetooth: btintel_pcie: Remove structually
 deadcode
To: Dan Carpenter <dan.carpenter@linaro.org>,
 "Everest K.C." <everestkc@everestkc.com.np>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
 kernel-janitors@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20241015045843.20134-1-everestkc@everestkc.com.np>
 <8a4a8915-d59a-407d-9f93-f047370cca62@stanley.mountain>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <8a4a8915-d59a-407d-9f93-f047370cca62@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/24 03:48, Dan Carpenter wrote:
> The subject has a typo.  s/structually/structurally/
> 
>> The intel bluetooth module was successfully built after the change
>> without any errors.
>>
> 
> Delete this sentence.  It should just be assumed that changes don't break the
> build.  You can put that code isn't tested under the --- cut off line, if you
> want to put a warning message.  But we don't need this in the permanent git log.
> 
> 
>> This issue was reported by Coverity Scan.
>> https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600709

Restating what I said in your other coverity patch, include
the coverity warning. This link requires login and no use
for people who don't have coverity account.

In the future don't include link that require login in the
commit logs.

>>
>> Fixes: 5ea625845b0f ("Bluetooth: btintel_pcie: Add handshake between driver and firmware")
>> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
>> ---
>    ^^^
> Cut off line.
> 
> regards,
> dan carpenter
> 

thanks,
-- Shuah
