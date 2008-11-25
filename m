From: Muli Ben-Yehuda <muli@il.ibm.com>
Date: Tue, 25 Nov 2008 14:43:55 +0000
Subject: Re: [PATCH 2/5] arch/x86/kernel/pci-calgary_64.c: change
Message-Id: <20081125144355.GB9912@il.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0811251412330.11897@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0811251412330.11897@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: jdmason@kudzu.us, discuss@x86-64.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

On Tue, Nov 25, 2008 at 02:13:03PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Since bridge is unsigned, it would seem better to use simple_strtoul that
> simple_strtol.
> 
> A simplified version of the semantic patch that makes this change is as
> follows: (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @r2@
> long e;
> position p;
> @@
> 
> e = simple_strtol@p(...)
> 
> @@
> position p != r2.p;
> type T;
> T e;
> @@
> 
> e = 
> - simple_strtol@p
> + simple_strtoul
>   (...)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Muli Ben-Yehuda <muli@il.ibm.com>

Ingo, can you please push?

Thanks,
Muli
-- 
The First Workshop on I/O Virtualization (WIOV '08)
Dec 2008, San Diego, CA, http://www.usenix.org/wiov08/
                       <->
SYSTOR 2009---The Israeli Experimental Systems Conference
http://www.haifa.il.ibm.com/conferences/systor2009/
