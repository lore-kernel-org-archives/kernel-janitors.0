Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4306E1B7F2
	for <kernel-janitors@vger.kernel.org>; Fri, 26 Jan 2024 15:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706282139; cv=none; b=gBUYGQINI8g6Ql5ROEyur0+x0T7GWZcaQERy671L3f4KY2TdKHAEYqSkqhmxy3SO9y58266dv1LysFOsP5HnpFEoLwao8TsIW1pfUQ0t2UW/vKjsuU9dkPek1pbwiZchh3xpXrecac58TK8NqYHV1DGNl5TLCQ5rA/1DQfeEVj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706282139; c=relaxed/simple;
	bh=WEw3XkYGIIGYZyfIRDza4HvHOWpff17SrjPZd6FCd7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7qkr/oTnMiWRL83T+1ddp6Q3urRUhhDPKV3IlNp5t4tLQU2V+ac0MfeLUS39vYsHw+gmRM6JWA1bG2gdqL2yHukZ9sCFsL38Q5j4Cj/uIgjlwqB4Esad/QUbHtFOt0+xzx+RLPc4zIOmemltaTETD9jd3YNLkBsXRwZExXn7dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=cs/9VHa6; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="cs/9VHa6"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7bc32b04dc9so13885139f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Jan 2024 07:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1706282135; x=1706886935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jXWVVHYrG9Uwww5/BzNoPzo2eGIye6zcMyBvXHXs/7Q=;
        b=cs/9VHa6i9RlqcvM6H19kUyjMFZIb/kjMn6/kcqsqtk3teoB6mIKvoK8y7ccpiQwHM
         pFZ4PoT8+gL5A3KsSRxVkXjYPW4KtneLjeMc/nhdUWGiXGQyxKtEe8+yX1zAgIDyoebQ
         dtT5X8OuHnNOOt+Ekob8vrGjJRP4jEIkGUn/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706282135; x=1706886935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jXWVVHYrG9Uwww5/BzNoPzo2eGIye6zcMyBvXHXs/7Q=;
        b=WI+UXyRZztX4Z991fF65Ulpt7e128ICvml3pBztnDqYVnWsvmhcitZDGc11I+2A8FK
         em8Qf9FPVy2DGLgQSmk8kK+tLdPAIIgmsgph6pvxpA4MlJ/352wPVWa+qJWZLOcmWP3I
         ARHdFUYtHo8GA+NBqvi3X3cf5Cf2qgZq0zQm2Jb6dTRilrG1Ig+0jfYmQpsZQc8+TUHc
         NjoV1bJ4OOThFPNRnd20ZoS8crNgQ0v+4LSuck2ngaUXfiYCvyUrhLTeTcY6ThPBzZN5
         hHCFnaixdv8hiduf3N/MTE97AWWrLYxgZNMA2hIJ7aLxULGC1H3IIWdjNhPnfPhg7qRR
         aP7A==
X-Gm-Message-State: AOJu0Yx7v8jobWewbf2KERGetn/t9lkgR5pZXQU71922RhLERcJo0e+b
	K80GlHAAENju+wQc4tzvR7X88rbshh2GmBXLVw4hoGXkDxCMOAAbJyuRjBAP+g==
X-Google-Smtp-Source: AGHT+IG+A6qW5NRqDtxAQZe5CyWqVDgbDJy6JF0IgrcV5OPe1zv1tLLkGSHF+EPz80v9WKkIjSWtgQ==
X-Received: by 2002:a6b:e208:0:b0:7bf:256a:d0c6 with SMTP id z8-20020a6be208000000b007bf256ad0c6mr1862107ioc.21.1706282135452;
        Fri, 26 Jan 2024 07:15:35 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id y22-20020a5ec816000000b007bfcd00e339sm149116iol.27.2024.01.26.07.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 07:15:34 -0800 (PST)
Message-ID: <fd50d641-8090-4067-b4da-5b4cf131aabc@ieee.org>
Date: Fri, 26 Jan 2024 09:15:33 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] net: ipa: remove the redundant assignment to
 variable trans_id
Content-Language: en-US
To: Simon Horman <horms@kernel.org>, Colin Ian King <colin.i.king@gmail.com>
Cc: Alex Elder <elder@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240116114025.2264839-1-colin.i.king@gmail.com>
 <20240116193152.GD588419@kernel.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240116193152.GD588419@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/24 1:31 PM, Simon Horman wrote:
> On Tue, Jan 16, 2024 at 11:40:25AM +0000, Colin Ian King wrote:
>> The variable trans_id is being modulo'd by channel->tre_count and
>> the value is being re-assigned back to trans_id even though the
>> variable is not used after this operation. The assignment is
>> redundant. Remove the assignment and just replace it with the modulo
>> operator.
>>
>> Cleans up clang scan build warning:
>> warning: Although the value stored to 'trans_id' is used in the
>> enclosing expression, the value is never actually read from
>> 'trans_id' [deadcode.DeadStores]
>>
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Colin, net-next is open now and you are welcome to send v2 of
this patch.
     https://netdev.bots.linux.dev/net-next.html

					-Alex

> 
> ## Form letter - net-next-closed
> 
> [adapted from text by Jakub]
> 
> Hi Colin,
> 
> The merge window for v6.8 has begun and therefore net-next is closed
> for new drivers, features, code refactoring and optimizations.
> We are currently accepting bug fixes only.
> 
> Please repost when net-next reopens on or after 22nd January.
> 
> RFC patches sent for review only are obviously welcome at any time.
> 
> See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
> --
> pw-bot: defer

