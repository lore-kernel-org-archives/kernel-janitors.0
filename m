Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5537B15E83
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 22:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="JfMKBQJK"
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDB4124
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 14:59:34 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id yJFFqHI8mvx99yJFFq7gSV; Wed, 01 Nov 2023 22:59:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698875971;
	bh=CZUc2x18jLVE3/dA5z40LzEyxqd/JgpG1ks1H6XqaJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JfMKBQJKcuW5hVFeb3FkC6gJN5P5gPM/1BhbVn5FB5fv3w7Oqy9eWrWY/ZPfBpp1T
	 7lgy+AaRo815BcThA8C/vRY6KjtoifDvpeTBNhrSqZuj9/vG++7eZIGjeEBKWydnB8
	 C8xrraykwVdaGIi0d0m7Dzfs3VDkYxifFGKkrsfeDJ+i5l3P2f50y7qL1HwnL9rrqm
	 2+plC3k9BRoryJ+5D3k6CY3HkZdYWIOHkRK3nbFc0C0TWBbn2h3V3IBihLeYJQejhg
	 I8lsYTZt6tAKDfG8QvnoS/tiqUkvMqiBZLv9InOo2wve2wq9Kc1qxSBeQHpSAkGLAE
	 5fS7RRSgeVWqQ==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 01 Nov 2023 22:59:31 +0100
X-ME-IP: 86.243.2.178
Message-ID: <ee352f12-084d-45d4-9c8e-172e073b7e36@wanadoo.fr>
Date: Wed, 1 Nov 2023 22:59:25 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] seq_buf: Export seq_buf_putc() &nd seq_buf_puts()
Content-Language: fr, en-US
To: Steven Rostedt <rostedt@goodmis.org>
Cc: gregkh@linuxfoundation.org, keescook@chromium.org, willy@infradead.org,
 senozhatsky@chromium.org, list@mail.com, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
References: <cover.1698861216.git.christophe.jaillet@wanadoo.fr>
 <20231101141705.4208d441@gandalf.local.home>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20231101141705.4208d441@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/11/2023 à 19:17, Steven Rostedt a écrit :
> On Wed,  1 Nov 2023 18:59:04 +0100
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 
>> seq_buf_putc() has a potential real use-case (link in the patch), but
>> seq_buf_puts() has currently no forseen use-case, so I have split it in 2
>> patches if only the 1st one is accepted.
>>
>> Christophe JAILLET (2):
>>    seq_buf: Export seq_buf_putc()
>>    seq_buf: Export seq_buf_puts()
>>
>>   lib/seq_buf.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
> 
> I can pull these in as I'm getting ready for my pull request to Linus soon
> (and just kicked off my testing).
> 
> Or do you need them as part of the patch you mentioned? When does that need
> to go in? Can it wait till it hits Linus's tree?
> 
> -- Steve
> 

You timing will be mine, no need to hurry.
I'll see when it reaches -next.

Thanks for taking care of it.

CJ
