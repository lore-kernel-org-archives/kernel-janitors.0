From: walter harms <wharms@bfs.de>
Date: Wed, 10 Jun 2015 18:04:18 +0000
Subject: Re: [PATCH] md: fix a build warning
Message-Id: <55787C22.2060809@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433949658-8455-1-git-send-email-firogm@gmail.com> <557874B9.9010500@bfs.de> <alpine.DEB.2.10.1506101935390.5463@hadrien>
In-Reply-To: <alpine.DEB.2.10.1506101935390.5463@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Firo Yang <firogm@gmail.com>, neilb@suse.de, linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 10.06.2015 19:36, schrieb Julia Lawall:
> 
> 
> On Wed, 10 Jun 2015, walter harms wrote:
> 
>>
>>
>> Am 10.06.2015 17:20, schrieb Firo Yang:
>>> Warning like this:
>>>
>>> drivers/md/md.c: In function ‘update_array_info’:
>>> drivers/md/md.c:6394:26: warning: logical not is only applied
>>> to the left hand side of comparison [-Wlogical-not-parentheses]
>>>       !mddev->persistent  != info->not_persistent||
>>>
>>> I fix it by enclosing !mddev->persistent with parentheses
>>>
>>> By the way, I also fixed a line over 80 characters warning outputed
>>> by ./scripts/checkpatch.pl
>>>
>>> Signed-off-by: Firo Yang <firogm@gmail.com>
>>> ---
>>>  drivers/md/md.c | 5 +++--
>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/md/md.c b/drivers/md/md.c
>>> index dd85be9..b420d82 100644
>>> --- a/drivers/md/md.c
>>> +++ b/drivers/md/md.c
>>> @@ -6391,9 +6391,10 @@ static int update_array_info(struct mddev *mddev, mdu_array_info_t *info)
>>>  	    mddev->ctime         != info->ctime         ||
>>>  	    mddev->level         != info->level         ||
>>>  /*	    mddev->layout        != info->layout        || */
>>> -	    !mddev->persistent	 != info->not_persistent||
>>> +	    (!mddev->persistent) != info->not_persistent ||
>>
>>
>> this looks odd,
>> would it be possible the check for = instead (and drop the !) ?
>> and it someone care for readability: It would be helpful to
>> make some more ifs here.
> 
> The original issue looks like a false positive.  If all of the other cases
> have no parentheses on the left and use !=, isn't it better to leave the
> code as is?
> 

i do not think so, the name indicate persistent/not_persistent devices.
Maybe both parties can agree what should be stored, ppl are bad
at those not_not things and that is an unnecessary trouble spot.

re,
 wh


> julia
> 
>>
>> re,
>>  wh
>>
>>>  	    mddev->chunk_sectors != info->chunk_size >> 9 ||
>>> -	    /* ignore bottom 8 bits of state, and allow SB_BITMAP_PRESENT to change */
>>> +	    /* ignore bottom 8 bits of state, and allow SB_BITMAP_PRESENT
>>> +		to change */
>>>  	    ((state^info->state) & 0xfffffe00)
>>>  		)
>>>  		return -EINVAL;
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
