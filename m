From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 04 Nov 2012 21:04:01 +0000
Subject: Re: [PATCH] drivers/misc/kgdbts.c: remove eprintk
Message-Id: <alpine.DEB.2.02.1211042202240.1960@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr> <201211041939.51608.arnd@arndb.de> <alpine.DEB.2.02.1211042051190.1960@localhost6.localdomain6> <201211042051.58473.arnd@arndb.de>
In-Reply-To: <201211042051.58473.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Julia Lawall <julia.lawall@lip6.fr>, walter harms <wharms@bfs.de>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Sun, 4 Nov 2012, Arnd Bergmann wrote:

> On Sunday 04 November 2012, Julia Lawall wrote:
>
>>> Hmm, I did not think that WARN() took a KERN_ERR argument, which should
>>> really be implied here. Looking at the code, it really seems to be required
>>> at the moment, but only 5 out of 117 callers use it this way.
>>>
>>> Any idea what is going on here?
>>
>> I'm not sure to understand the 5 and 117.  Using grep, I get 30 with
>> KERN_ERR, 61 with some KERN thing, and 1207 without KERN.
>
> Right, I was using 'grep -w', which misses a lot of the instances, although
> I see still much fewer in the last category.
>
>> If things are
>> set up such that warn_slowpath_fmt is called, then that function adds
>> KERN_WARNING.  There is an alternate definition of __WARN_printf that just
>> does a printk.
>
> I don't see yet where that KERN_WARNING gets added. Looking at
> warn_slowpath_common, there are two or three lines that get printed at
> KERN_WARNING level, followed by the format that got passed into WARN(),
> which may or may not include a printk level, but I don't see one getting
> added.

OK, I agree.  There are lots of KERN_WARNINGs, but not on the string that 
was passed in.  Still, maybe it is not so good to pass a KERN_XXX for some 
other XXX to WARN.

julia
