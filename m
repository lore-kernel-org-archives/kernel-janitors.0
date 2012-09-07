From: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 07 Sep 2012 21:36:53 +0000
Subject: Re: [next:akpm 146/246] mm/migrate.c:827:5: warning: 'ttu_flags' may be used uninitialized in this f
Message-Id: <20120907143653.554c4a2b.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120907112607.GA21965@localhost>
In-Reply-To: <20120907112607.GA21965@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 7 Sep 2012 19:26:07 +0800
Fengguang Wu <fengguang.wu@intel.com> wrote:

> Hi Minchan,
> 
> FYI, there are new compile warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> head:   d28e1f373a79e532eecbe6b17beeb4d2052c1a52
> commit: 29cfd54de3204fe1b8b6a4ea744a21b43f3e00fa [146/246] mm: support MIGRATE_DISCARD
> config: i386-randconfig-k920 (attached as .config)
> 
> All error/warnings:
> 
> mm/migrate.c: In function 'migrate_pages':
> mm/migrate.c:827:5: warning: 'ttu_flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
> mm/migrate.c:701:17: note: 'ttu_flags' was declared here
> 
> vim +827 mm/migrate.c
>    817	
>    818		file = page_is_file_cache(page);
>    819		ttu_flags = TTU_IGNORE_ACCESS;
>    820	retry:
>    821		if (!(mode & MIGRATE_DISCARD) || !file || PageDirty(page))
>    822			ttu_flags |= (TTU_MIGRATION | TTU_IGNORE_MLOCK);
>    823		else
>    824			discard_mode = true;
>    825	
>    826		/* Establish migration ptes or remove ptes */
>  > 827		rc = try_to_unmap(page, ttu_flags);
>    828	
>    829	skip_unmap:
>    830		if (rc = SWAP_SUCCESS) {
>    831			if (!discard_mode) {
>    832				rc = move_to_new_page(newpage, page,
>    833						remap_swapcache, mode);
>    834			} else {
>    835				rc = discard_page(page);
>    836				goto uncharge;
>    837			}

yup, that's a bug.  I dropped the patch.
