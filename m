From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 03 Nov 2017 06:21:53 +0000
Subject: Re: [PATCH] mtd: lpddr: Fix a potential double mutex_lock
Message-Id: <cf1f298f-2eba-0e59-8bd8-bb8dcb54cd1e@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171022082831.26560-1-christophe.jaillet@wanadoo.fr>
 <20171031155800.378cfa0b@bbrezillon>
In-Reply-To: <20171031155800.378cfa0b@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 31/10/2017 à 15:58, Boris Brezillon a écrit :
> Hi Christophe,
>
> On Sun, 22 Oct 2017 10:28:31 +0200
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
>
>> If 'chip->state = FL_SYNCING', we will 'goto retry' with the mutex
>> '&shared->lock' already taken.
>> In such a case, the 'mutex_lock' at line 927 can never succeed.
>>
>> In order to avoid a deadlock, move the 'mutex_lock(&shared->lock)' at the
>> very end of the block.
>>
>> This has been spotted with the following coccinelle script:
>>
>> @find@
>> expression x, t;
>> @@
>>
>> 	mutex_lock(x);
>> 	... when != mutex_unlock(x)
>> 	mutex_lock(t);
>>
>> @@
>> expression find.t;
>> expression find.x;
>> @@
>>
>> *	mutex_lock(t);
>> 	... when != mutex_unlock(t)
>> *	mutex_lock(x);
>>
>>
>> Fixes: 	c68264711ca6 ("[MTD] LPDDR Command set driver")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Review carefuly, untested.
>> ---
>>   drivers/mtd/lpddr/lpddr_cmds.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
>> index 018c75faadb3..830dd0855ab3 100644
>> --- a/drivers/mtd/lpddr/lpddr_cmds.c
>> +++ b/drivers/mtd/lpddr/lpddr_cmds.c
>> @@ -237,7 +237,6 @@ static int get_chip(struct map_info *map, struct flchip *chip, int mode)
>>   				mutex_unlock(&contender->mutex);
>>   				return ret;
>>   			}
>> -			mutex_lock(&shared->lock);
>>   
>>   			/* We should not own chip if it is already in FL_SYNCING
>>   			 * state. Put contender and retry. */
>> @@ -247,6 +246,8 @@ static int get_chip(struct map_info *map, struct flchip *chip, int mode)
>>   				goto retry;
>>   			}
>>   			mutex_unlock(&contender->mutex);
>> +
>> +			mutex_lock(&shared->lock);
> I had a quick look at this code and I must say the locking in this
> driver is a real nightmare (apparently it was copied from CFI driver).
>
> It's not entirely clear to me if the shared lock should be taken before
> releasing the contender one (as done today) or if it can safely be
> moved at the end of the block (as you suggest).
> Unless we have someone who knows about the locking scheme of
> cfi/lpddr and can confirm that moving the mutex_lock() at the end of
> the block is safe, I'd recommend that we take a conservative approach
> and add a mutex_unlock(&shared->lock) in the retry path and keep the
> existing mutex_lock() in place.
Agreed. I'll wait some time for any other feedback and will propose a 
more conservative patch in a couple of weeks if needed.
Thanks for the review.

CJ
>>   		}
>>   
>>   		/* Check if we have suspended erase on this chip.


