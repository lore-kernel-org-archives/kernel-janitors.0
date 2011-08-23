From: Timur Tabi <timur@freescale.com>
Date: Tue, 23 Aug 2011 19:04:46 +0000
Subject: Re: [PATCH 8/9] arch/powerpc/sysdev/ehv_pic.c: add missing kfree
Message-Id: <4E53F9CE.1040106@freescale.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312802283-9107-8-git-send-email-julia@diku.dk>
	<CAOZdJXX_BS7GMtmyqiS91QByhrjANtKpbqrstR8g-L80r_N8qg@mail.gmail.com>
In-Reply-To: <CAOZdJXX_BS7GMtmyqiS91QByhrjANtKpbqrstR8g-L80r_N8qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Kumar Gala <galak@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia@diku.dk>, linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org

Ben, Kumar, can one of you take a look at my question and help me out?

 wrote:
> On Mon, Aug 8, 2011 at 7:18 AM, Julia Lawall <julia@diku.dk> wrote:
> 
>> diff --git a/arch/powerpc/sysdev/ehv_pic.c b/arch/powerpc/sysdev/ehv_pic.c
>> index af1a5df..b6731e4 100644
>> --- a/arch/powerpc/sysdev/ehv_pic.c
>> +++ b/arch/powerpc/sysdev/ehv_pic.c
>> @@ -280,6 +280,7 @@ void __init ehv_pic_init(void)
>>
>>        if (!ehv_pic->irqhost) {
>>                of_node_put(np);
>> +               kfree(ehv_pic);
>>                return;
>>        }
> 
> Although the fix is correct, I think there is another bug in this
> function.  'np' is not released when the function finishes
> successfully.   I've looked at other functions that use
> irq_alloc_host(), and most of them do the same thing: they don't call
> of_node_put() on the device node pointer.  The only exception I've
> found is mpc5121_ads_cpld_pic_init().
> 
> Ben, Kumar: am I missing something?  irq_alloc_host() calls of_node_get():
> 
> 	host->of_node = of_node_get(of_node);
> 
> so doesn't that mean that the caller of irq_alloc_host() should
> release the device node pointer?
> 


-- 
Timur Tabi
Linux kernel developer at Freescale

