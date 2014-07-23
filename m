From: Artemiy Volkov <artemiyv@acm.org>
Date: Wed, 23 Jul 2014 10:02:12 +0000
Subject: Re: [PATCH 0/5] ext2: Merge string literals on adjacent lines
Message-Id: <alpine.DEB.2.10.1407231953450.8541@a.artemiy.su>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1406051917-3823-1-git-send-email-artemiyv@acm.org>
In-Reply-To: <1406051917-3823-1-git-send-email-artemiyv@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Wed, 23 Jul 2014, Dan Carpenter wrote:

> On Wed, Jul 23, 2014 at 03:58:32AM +1000, Artemiy Volkov wrote:
>> Join lines and merge strings in ext2 files for ease of grep-ability, one file per patch.
>>
>
> To be honest, I don't know if the ext2 devs really want to bother with
> this...
>
> regards,
> dan carpenter
>
>

OK, thanks for the info. Is there maybe a way to know in advance if maintainers
of a certain subsystem wouldn't accept this kind of janitorial patches?

Best regards,
Artemiy
