From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 24 Jan 2005 23:42:46 +0000
Subject: Re: [KJ] [RFC] TODO file cleanups
Message-Id: <41F587F6.6080108@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Domen Puncer wrote:
> Hi.
> 
> Removed some finished, invalid, duplicate entries.
> Replaced inline explanation with summary and URL to original post.
> Comments, objections to any change?
> 
> Second stage, that i'm doing now is to put stuff into sections (like it
> is at the beginning of file).
> I'm also thinking about ordering from easiest to hardest.
> Ideas, comments?

> -------------------------------------------------------------------------
>  For source files that don't have any license information in them,
>  determine if they should be GPL or GPL/BSD etc. and add license information
>  to them.

We don't really want a blanket set of patches for this one.

If a file is being modified anyway, it's probably a good idea to
update the license info in it (but check with the author(s) first
for the exact license that they prefer).

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
