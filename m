From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 24 Jan 2007 19:06:11 +0000
Subject: Re: [KJ] script to flag "dead" CONFIG variables
Message-Id: <Pine.LNX.4.64.0701241405140.27036@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701240736110.7569@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701240736110.7569@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 24 Jan 2007, walter harms wrote:

> hi robert,
> are you aware of ifnames ? it is part auf the autoconf tools
> and lists all the #if #elif etc.

um ... yeah, that'll make my life *way* easier.  :-)  thanks.

> that should surface all important vars and a compare with kconfig
> should show up any dead variables. bonus points for collecting all
> #defines also.

i'll see what i can do with that.

rday

-- 
===============================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Kernel_Janitor%27s_Todo_List
===============================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
