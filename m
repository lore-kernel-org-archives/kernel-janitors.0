From: Ian Molton <spyro@f2s.com>
Date: Fri, 21 Jan 2005 16:40:53 +0000
Subject: [KJ] Re: [PATCH 0/2][RESEND] acorn: clean up printk()'s in
Message-Id: <41F13095.7010209@f2s.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <41F0F021.4050600@treblig.org>
In-Reply-To: <41F0F021.4050600@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dave Gilbert (Home) wrote:
> James Nelson wrote:
> 
>> This series of patches makes the printk()'s in drivers/acorn behave a 
>> bit better.
>>
>> Re-sending them after noticing I used KERN_WARN instead of KERN_WARNING.
>>
>> Diffstat output:
>>  fd1772.c |  142 
>> +++++++++++++++++++++++++++++++--------------------------------
>>  mfmhd.c  |  138 
>> ++++++++++++++++++++++++++++---------------------------------
>>  2 files changed, 136 insertions(+), 144 deletions(-)
> 
> 
> Those files are ancient - I haven't done anything on them in yonks; the 
> right person to ask about this is Ian Molton - current maintainer of the 
> ARM26/Archimedes world cc'd).

Hi there.

Im not sure whats best here. those files *are* ancient, and likely 
differ somewhat from those in my current tree. I have done most of the 
restructuring of arm26 now, but its still not quite actually *working* 
yet. I have a whole diff full of driver updates and even some new 
drivers, but Im reluctant to submit them at this point for a number of 
reasons, not least of which is that they are often untested and some 
conflict with mainstream arm.

I guess we could either:

leave them alone
update them
delete them pending me re-inserting working versions at some later date
other
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
