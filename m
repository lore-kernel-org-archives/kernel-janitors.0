From: Dan Carpenter <error27@gmail.com>
Date: Tue, 21 Sep 2010 10:31:28 +0000
Subject: Re: Fw: [PATCH] drivers/block/cciss.c (2.6.34.7): Fixed useless
Message-Id: <20100921102633.GA5989@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <481583.87768.qm@web45807.mail.sp1.yahoo.com>
In-Reply-To: <481583.87768.qm@web45807.mail.sp1.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 21, 2010 at 02:48:12AM -0700, Poyo VL wrote:
> GCC version: gcc version 4.5.0 20100604 [gcc-4_5-branch revision 160292] (SUSE 
> Linux) 
> 
> And I'm sorry, the kernel version is 2.6.34.7 not 2.6.35.7.

It also applies to the 2.6.36-rc4 kernel with offset 45 so that's ok.

> But I selected almost all options from "make menuconfig", I think this is 
> important to mention.

You can leave this information out.

> All warnings are like this one
> drivers/block/cciss.c: In function ‘dev_show_unique_id’:
> drivers/block/cciss.c:564:7: warning: ‘sn[0]’ may be used uninitialized in this 
> function
> I tried to explain. The sn[] array is initialized here: else memcpy(sn, 
> drv->serial_no, sizeof(sn)); so it is initialized in a conditional expression, 
> and is is used downer. So, the compiler think that it can be used unititialized 
> and it throws that warning.

> I fixed the patch, I am sorry, I'm a newbie.

Don't appologize.  Kernel-janitors is here to help newbies.

This version was much better, but your email client is still changing
all the spaces to tabs.  Can you send it again as version 3?  Please
send the email to yourself and verify that the patch applies.  Just save
the email as "raw format with headers" or whatever it's called.  Then
`cat raw_email.txt | patch -p1` and send it to us again once that works.

regards,
dan carpenter

