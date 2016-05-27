From: walter harms <wharms@bfs.de>
Date: Fri, 27 May 2016 17:25:30 +0000
Subject: Re: [patch] usb: f_fs: off by one bug in _ffs_func_bind()
Message-Id: <5748830A.2040606@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160527112311.GC3255@mwanda>
In-Reply-To: <20160527112311.GC3255@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org



Am 27.05.2016 14:23, schrieb Michal Nazarewicz:
> On Fri, May 27 2016, Dan Carpenter wrote:
>> This loop is supposed to set all the .num values to -1 but it's doesn't
>> set the first element and it sets one element beyond the end of the
>> array.  Really there is no reason for it to be done backwards.  And
>> "ret" is the wrong variable to use for an iterator.
>>
>> Fixes: ddf8abd25994 ('USB: f_fs: the FunctionFS driver')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Michal Nazarewicz <mina86@mina86.com>
> 
> How on Earth could I have made that mistake is beyond my
> comprehension. O_o On second thought, things being beyond one’s
> comprehension is probably how bugs are introduced…
> 
>> ---
>> I just spotted this reviewing the code, I have not tested it.  Please
>> review carefully, the vla_ptr() macro is difficult to understand.
> 
> Yeah.  In retrospect I’m not sure savings in memory those macros bring
> offset time engineers spent trying to understand them.  Damn you clang!
> 
>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index 73515d5..7fff81a 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -2777,11 +2777,11 @@ static int _ffs_func_bind(struct usb_configuration *c,
>>  	       ffs->raw_descs_length);
>>  
>>  	memset(vla_ptr(vlabuf, d, inums), 0xff, d_inums__sz);
>> -	for (ret = ffs->eps_count; ret; --ret) {
>> +	for (i = 0; i < ffs->eps_count; i++) {
>>  		struct ffs_ep *ptr;
>>  
>>  		ptr = vla_ptr(vlabuf, d, eps);
> 
> As pointed by Walter, this could be moved outside.  Maybe
> 
> 	i = ffs->eps_count;
> 	for (struct ffs_ep *ptr = vla_ptr(vlabuf, d, eps); i; ++ptr, --i)
> 		ptr->num = -1;
> 

I think staying with an array here improves readability.

re,
 wh

>> -		ptr[ret].num = -1;
>> +		ptr[i].num = -1;
>>  	}
>>  
>>  	/* Save pointers
> 
