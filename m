From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 10 Mar 2007 09:34:10 +0000
Subject: Re: [KJ] does anything compile net/wanrouter/af_wanpipe.c?
Message-Id: <Pine.LNX.4.64.0703100433510.25315@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703091945390.7302@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703091945390.7302@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 9 Mar 2007, Randy Dunlap wrote:

> On Fri, 9 Mar 2007 19:46:56 -0500 (EST) Robert P. J. Day wrote:
>
> >
> >   AFAICT, there is nothing that would cause the source file
> > net/wanrouter/af_wanpipe.c to be compiled.  does this mean this file
> > is superfluous and can be deleted?
>
> Yes, looks that way to me also.

ok, patch has been submitted to remove it.

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
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
