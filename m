From: Randy Dunlap <rdunlap@xenotime.net>
Date: Wed, 14 Feb 2007 21:02:28 +0000
Subject: Re: [KJ] What does "loopmount" mean?
Message-Id: <20070214130228.72ab22a0.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45D3E149.4060208@minimum.se>
In-Reply-To: <45D3E149.4060208@minimum.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 14 Feb 2007 20:27:53 -0800 Martin Olsson wrote:

> Hi,
> 
> I'm wondering, what does "loopmount" mean? This word is used for 
> instance here:
> 
> http://specialreports.linux.com/article.pl?sid/02/09/0859248&tid8&tidG

It means to mount via a loop device.
Maybe 'man losetup' will help.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
