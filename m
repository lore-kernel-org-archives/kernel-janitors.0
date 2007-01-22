From: "Ahmed S. Darwish" <darwish.07@gmail.com>
Date: Mon, 22 Jan 2007 15:47:22 +0000
Subject: Re: [KJ] what's the merge window for janitor fixups?
Message-Id: <20070122154722.GA5865@Ahmed>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701220349560.21161@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701220349560.21161@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 22, 2007 at 03:58:48AM -0500, Robert P. J. Day wrote:
> 
>   as an example, i've attached my current style script which scans the
> tree looking for obvious cleanups (some of which i already know have
> been submitted and ACKed, so not *all* of that is relevant -- i'm just
> showing the results against the latest "git pull" of linus' tree.)
> 
>   as one example, you can see how much code can be simplified by using
> the ARRAY_SIZE() macro.  there's over 250 lines, and it makes sense
> that all of that should be changed since that process is already
> underway.

Are you working on it or you don't have time ? .

-- 
Ahmed S. Darwish
http://darwish-07.blogspot.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
