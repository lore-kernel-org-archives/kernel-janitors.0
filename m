From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 07 Jul 2019 07:09:31 +0000
Subject: Re: ipc/sem: Three function calls less in do_semtimedop()
Message-Id: <4013bfa0-4369-3e29-b205-7d7059e68e5a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ba328a83-63ac-c3a3-cbc0-81059012c555@web.de>
 <3c5d5941-63bf-5576-e6eb-17ca02a6a8a3@canonical.com>
In-Reply-To: <3c5d5941-63bf-5576-e6eb-17ca02a6a8a3@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Davidlohr Bueso <dave@stgolabs.net>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Manfred Spraul <manfred@colorfullife.com>, Mathieu Malaterre <malat@debian.org>, LKML <linux-kernel@vger.kernel.org>

>> +		list_add_tail(&queue.list,
>> +			      alter
>> +			      ? (sma->complex_count
>> +				? &sma->pending_alter
>> +				: &curr->pending_alter)
>> +			      : &curr->pending_const);
>
> Just no. This is making the code harder to comprehend

This can be according to your current view.


> with no advantage.

I propose to take additional aspects into account for the interpretation
of such source code.
The shown design direction can provide benefits which might get
a lower value for the software development attention so far.


>> +		list_add_tail(&queue.list,
>> +			      alter ? &sma->pending_alter : &sma->pending_const);

Can this code variant look more succinct?

Regards,
Markus
