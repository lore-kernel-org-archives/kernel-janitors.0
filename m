From: walter harms <wharms@bfs.de>
Date: Sat, 25 Feb 2006 13:06:53 +0000
Subject: Re: [KJ] linux-2.6.15.4/drivers/i2c/i2c-core.c.bak:  EPERM -> EINVAL
Message-Id: <4400566D.4040101@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44004DD8.2040606@bfs.de>
In-Reply-To: <44004DD8.2040606@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi all,
imho EBUSY would indicate someone else is using it. But < 0 should never 
happen (integer overflow ?). even BUG() would be ok but the author 
decided otherwise and i do not what to change that.

re,
  walter

tim: do you know this ?
http://dev1.boomersdomain.com/cgi-bin/store_pedalinghistory_2/01068.html


Tim Cooijmans wrote:
> On Saturday 25 February 2006 13:30, walter harms wrote:
>>   			pr_debug("i2c-core: %s used one too many times\n",
>>   				__FUNCTION__);
>> -			return -EPERM;
>> +			return -EINVAL;
> I think EBUSY would be more apprioriate here.  I'm not sure, though.  
> include/asm-generic/errno-base.h has a short description for each errno.
> 
> Tim
> 
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
