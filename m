From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 06 Apr 2018 09:01:40 +0000
Subject: Re: [PATCH v2] rsi: remove unecessary PTR_ALIGN()s
Message-Id: <87woxkd7yj.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180406083717.GA21857@mwanda> <5AC7338C.3000307@broadcom.com>
In-Reply-To: <5AC7338C.3000307@broadcom.com> (Arend van Spriel's message of
        "Fri, 6 Apr 2018 10:45:00 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Amitkumar Karwar <amit.karwar@redpinesignals.com>, Prameela Rani Garnepudi <prameela.j04cs@gmail.com>, Karun Eagalapati <karun256@gmail.com>, Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Arend van Spriel <arend.vanspriel@broadcom.com> writes:

> On 4/6/2018 10:37 AM, Dan Carpenter wrote:
>> The issue here is that we allocate "data" and then set
>> "data = PTR_ALIGN(data, 8);" and then we free the aligned pointer
>> instead of the original pointer.
>>
>> kmalloc() pointers are already ARCH_SLAB_MINALIGN aligned which is 8 or
>> more on everything except certain Xtensa variants.  We decided that if
>> the Xtensa people ever notice a bug here then we'll tell them the bug is
>> on their side.  ;)
>
> I am not sure if it was decided to be a xtensa bug, but just to ignore
> the issue until it would arise.

IIRC on other architectures the allocation is already aligned properly
so there shouldn't be any functional changes with this patch, expect on
xtensa of course.

> Anyway, not sure if the last sentence is useful in the commit message.

IMHO it is useful as it gives a summary of our discussion, just with a
humorous tone :)

-- 
Kalle Valo
