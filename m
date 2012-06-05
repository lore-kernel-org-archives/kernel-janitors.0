From: walter harms <wharms@bfs.de>
Date: Tue, 05 Jun 2012 10:06:10 +0000
Subject: Re: [patch] staging: comedi: cleanup comedi_recognize()
Message-Id: <4FCDDA12.20906@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120524102851.GA4399@elgon.mountain>
In-Reply-To: <20120524102851.GA4399@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 24.05.2012 12:57, schrieb Ian Abbott:
> On 2012-05-24 11:28, Dan Carpenter wrote:
>> This function is more complicated than it needs to be because of the
>> consts.  It's not worth saving them because we drop the consts anyway
>> when we return (void *)name_ptr.
>>
>> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/staging/comedi/drivers.c
>> b/drivers/staging/comedi/drivers.c
>> index 1c3d638..a8f576d 100644
>> --- a/drivers/staging/comedi/drivers.c
>> +++ b/drivers/staging/comedi/drivers.c
>> @@ -304,14 +304,13 @@ static int postconfig(struct comedi_device *dev)
>>    * that register their supported board names */
>>   static void *comedi_recognize(struct comedi_driver *driv, const char
>> *name)
>>   {
>> -    unsigned i;
>> -    const char *const *name_ptr = driv->board_name;
>> +    char **name_ptr = (char **)driv->board_name;
>> +    int i;
>> +
>>       for (i = 0; i<  driv->num_names; i++) {
>>           if (strcmp(*name_ptr, name) = 0)
>> -            return (void *)name_ptr;
>> -        name_ptr >> -            (const char *const *)((const char *)name_ptr +
>> -                      driv->offset);
>> +            return name_ptr;
>> +        name_ptr = (char **)((void *)name_ptr + driv->offset);
>>       }
>>
>>       return NULL;
> 
> You could simplify it further by keeping one of the consts:
> 
> static void *comedi_recognize(struct comedi_driver *driv, const char *name)
> {
>     unsigned i;
>     const char **name_ptr = driv->board_name;
>     for (i = 0; i < driv->num_names; i++) {
>         if (strcmp(*name_ptr, name) = 0)
>             return name_ptr;
>         name_ptr = (void *)name_ptr + driv->offset;
>     }
>     return NULL;
> }
> 

Hi all,
the patch is fine with me but i have a few basic questions:

Why the (void  *) at all ? it returns a name what is a const char *.

A look at the structure also shows that this is a linked list, why
using offset instead of driv->next ?

re,
 wh

