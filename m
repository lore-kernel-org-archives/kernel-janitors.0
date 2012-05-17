From: walter harms <wharms@bfs.de>
Date: Thu, 17 May 2012 10:30:38 +0000
Subject: Re: [patch] iscsi-target: remove some dead code
Message-Id: <4FB4D34E.2070609@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120517070814.GD14660@elgon.mountain>
In-Reply-To: <20120517070814.GD14660@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 17.05.2012 12:26, schrieb Dan Carpenter:
> On Thu, May 17, 2012 at 11:58:40AM +0200, walter harms wrote:
>>
>>
>> Am 17.05.2012 09:08, schrieb Dan Carpenter:
>>> Neither "acceptor_values" nor "proposer_values" can be NULL here.
>>> Smatch complains because we are not allowed to pass NULL pointers to
>>> strchr().
>>>
>>> Also I removed a second later check for "!acceptor_values" because it
>>> gets checked on the next line in the do while condition.
>>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> ---
>>> Compile tested only.  Please review carefully.
>>>
>>> diff --git a/drivers/target/iscsi/iscsi_target_parameters.c b/drivers/target/iscsi/iscsi_target_parameters.c
>>> index ad3b3c1..ed5241e 100644
>>> --- a/drivers/target/iscsi/iscsi_target_parameters.c
>>> +++ b/drivers/target/iscsi/iscsi_target_parameters.c
>>> @@ -1037,13 +1037,6 @@ static char *iscsi_check_valuelist_for_support(
>>>  			tmp2 = strchr(acceptor_values, ',');
>>>  			if (tmp2)
>>>  				*tmp2 = '\0';
>> this looks like strchrnul(). I realy do not know is this supported inside the kernel ?
>>
> 
> It can't be NULL here.  Adding bogus checks is the wrong idea and
> static checkers are right to ask about needless checks.
> 
sorry i was writing (talking) about something different.
the construction:
....
 v=strchr()
 if (v=NULL)
   return '\0'
...
is like strchrnul() in glibc. Maybe this pattern is used more than once inside the kernel code.

re,
 wh
