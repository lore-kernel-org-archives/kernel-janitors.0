From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 18 Jun 2007 13:03:20 +0000
Subject: Re: [KJ] [KJ PATCH] Replacing memset(<addr>,0,PAGE_SIZE) with
Message-Id: <Pine.LNX.4.64.0706180856530.18880@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178621156.3598.10.camel@shani-win>
In-Reply-To: <1178621156.3598.10.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 18 Jun 2007, Shani Moideen wrote:
...
> -			memset(buf->page_list[i].buf, 0, PAGE_SIZE);
> +			clear_page(buf->page_list[i].buf);
...

i'm not sure whether this current cleanup project was at all inspired
by the page at the wiki:

http://fsdev.net/wiki/index.php?title=Clear_page_copy_page

note that there are two sort of related cleanups -- clear_page() and
copy_page().  but, as you can read there, it's not *entirely* clear
that the clears or copies are entirely equivalent to the corresponding
memset() or memcpy() calls (or whether they should be).

calling memset() for a size of PAGE_SIZE doesn't necessarily mean that
the address is on a page boundary, while it's possible that something
called "clear_page()" is *meant* to work only on an actual page.
that's not what appears to be happening, but it's something to keep in
mind:  *should* something called "clear_page()" have any extra
semantics above and beyond just clearing something that's the size of
a page?

and the same thing can be asked of "copy_page()".  i'm not saying that
there's anything amiss with the current cleaning, and i'm happy to see
it happening.  i'm just curious as to whether the possible semantic
ambiguity has been examined and dismissed.

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
