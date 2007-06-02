From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 02 Jun 2007 13:15:55 +0000
Subject: Re: [KJ] Why keeping lines commented out via #if 0?
Message-Id: <Pine.LNX.4.64.0706020915260.9418@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706021359.23564.lists-receive@programmierforen.de>
In-Reply-To: <200706021359.23564.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 2 Jun 2007, Andi Drebes wrote:

> Hi!
> I recently grep'd through the kernel sources and found *a lot* of lines
> that are commented out using #if 0. Is there any reason to keep them?
> I think that lines that are commented out should be removed from
> the mainline kernel. If developers need them in future, they can create
> a local copy or branch on their machines. Or am I missing the point
> about the whole #if 0 thing?
>
> 		Andi

been there, done that:

http://fsdev.net/wiki/index.php?title=If_0_or_if_1_directives

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
