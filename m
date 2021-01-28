From: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 28 Jan 2021 20:51:29 +0000
Subject: Re: [PATCH][next] mm/zswap: fix potential uninitialized pointer read on tmp
Message-Id: <20210128125129.27dd2042b8d04b28c45ad7c0@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210128141728.639030-1-colin.king@canonical.com>
	<2dee1f77-863b-e7aa-a3d2-bb4591d4f720@suse.cz>
In-Reply-To: <2dee1f77-863b-e7aa-a3d2-bb4591d4f720@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Colin King <colin.king@canonical.com>, Seth Jennings <sjenning@redhat.com>, Dan Streetman <ddstreet@ieee.org>, Vitaly Wool <vitaly.wool@konsulko.com>, Tian Tao <tiantao6@hisilicon.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 28 Jan 2021 16:18:23 +0100 Vlastimil Babka <vbabka@suse.cz> wrote:

> On 1/28/21 3:17 PM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > In the case where zpool_can_sleep_mapped(pool) returns 0
> > then tmp is not allocated and tmp is then an uninitialized
> > pointer. Later if entry is null, tmp is freed, hence free'ing
> > an uninitialized pointer. Fix this by ensuring tmp is initialized
> > to NULL.
> > 
> > Addresses-Coverity: ("Uninitialized pointer read")
> > Fixes: 908aa806dba0 ("mm/zswap: fix potential memory leak")
> 
> That's a linux-next hash, patch is in mmotm [1] *) You know what it means...
> 
> *) actually it's not there, yet it is in -next. What's going on?
> 
> [1]
> https://ozlabs.org/~akpm/mmotm/broken-out/mm-zswap-fix-potential-memory-leak.patch

The containing file was renamed to
https://ozlabs.org/~akpm/mmotm/broken-out/mm-zswap-add-the-flag-can_sleep_mapped-fix-2.patch,
since it's a fix against mm-zswap-add-the-flag-can_sleep_mapped.patch.

And this patch's containing file will of course be
mm-zswap-add-the-flag-can_sleep_mapped-fix-3.patch.
