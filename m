From: Matthew Wilcox <willy@debian.org>
Date: Thu, 29 Jan 2004 02:35:39 +0000
Subject: Re: [Kernel-janitors] mm/slab.c: linux 2.6.1 fix 2 unguarded kmalloc
Message-Id: <20040129023539.GA18725@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: =?ISO-8859-1?Q?=20<vines.sxdD+dlw=B2?= =?ISO-8859-1?Q?+A@SZKOM.BFS.DE>?=
In-Reply-To: =?ISO-8859-1?Q?=20<vines.sxdD+dlw=B2?= =?ISO-8859-1?Q?+A@SZKOM.BFS.DE>?=
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <WHarms@bfs.de>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

On Sun, Jan 25, 2004 at 03:02:24PM +0100, Walter Harms wrote:
> Hi list,
> this fixes catches 2 unguarded kmallocs() and changes a statement so that PAGE_SHIFT >20 causes a warning. 
> At least sparc64 is prepared for a  PAGE_SHIFT >20.

> -       if (num_physpages > (32 << 20) >> PAGE_SHIFT)
> +       if (num_physpages > (32 << (20-PAGE_SHIFT) )

Erm, that's a bad change to make.  There's nothing wrong with having
a PAGE_SHIFT of >20, and this code would still work ... but with your
change it's now undefined behaviour.  Please don't make this change.

(worked examples:

1. suppose we have a PAGE_SHIFT of 24 (16MB page size), the original
code shifts 32 left by 20 then right by 24, net result a right shift of
4 => 2.  Since any machine with a 16MB page size is going to have more
than 2 pages, we're fine.  the new code will shift 32 left by -4 which
is undefined.  bad.

2. suppose we have a PAGE_SHIFT of 26 (64MB page size), the original
code shifts right by 6, result 0.  Since the number of pages is > 0
(one hopes ;-), the test will also succeed as desired.

)

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
