From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Mon, 23 Jan 2006 04:49:21 +0000
Subject: [KJ] Re: Fixing make mandocs
Message-Id: <20060122204921.613349e5.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70267757995996427=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200601230531.27609.ak@suse.de>
In-Reply-To: <200601230531.27609.ak@suse.de>
To: Andi Kleen <ak@suse.de>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============70267757995996427==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Jan 2006 05:31:27 +0100 Andi Kleen wrote:

> 
> Here would be a good janitor task for 2.6.16. make mandocs currently
> doesn't build because a number of descriptions are missing parameters etc.
> It would be good if someone could fix that and submit patches for 2.6.16.
> 
> It should be relatively straight forward, if one cannot figure out
> what a missing parameter does adding a dummy description ("Undocumented") 
> would be also ok.
> 
> -Andi

Lots of these have been fixed in the last 2-3 days by Martin Waitz
and/or me and have been posted on lkml.  Martin is collecting them
in his kernel-doc tree.


>   DOCPROC Documentation/DocBook/kernel-api.xml
> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//mm/slab.c:1505): No descript
> ion found for parameter 'cachep'
> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//mm/slab.c:1505): No descript
> ion found for parameter 'size'
> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//mm/slab.c:1505): No descript
> ion found for parameter 'align'
> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//mm/slab.c:1505): No descript
> ion found for parameter 'flags'

mm/slab.c fixed

> Error(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//include/asm-i386/uaccess.h:416
> ): cannot understand prototype: '__always_inline unsigned long __must_check __co
> py_to_user_inatomic(void __user *to, const void *from, unsigned long n) '

uaccess.h fixed

> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//fs/inode.c:1189): No descrip
> tion found for parameter 'dentry'

fixed

> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//fs/bio.c:427): No descriptio
> n found for parameter 'q'

fixed

> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//include/linux/skbuff.h:308):
>  No description found for parameter 'copied_early'
> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//include/linux/skbuff.h:308):
>  No description found for parameter 'dma_cookie'
> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//net/core/skbuff.c:211): No d
> escription found for parameter 'fclone'

above seem to be needed.

> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//net/sunrpc/sched.c:920): No 
> description found for parameter 'clnt'
> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//net/sunrpc/sched.c:920): No 
> description found for parameter 'flags'
> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//net/sunrpc/sched.c:920): No 
> description found for parameter 'ops'
> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//net/sunrpc/sched.c:920): No 
> description found for parameter 'data'
> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//net/sunrpc/sched.c:942): No 
> description found for parameter 'parent'

These are fixed.

> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//net/core/dev.c:3317): No des
> cription found for parameter 'chan'
> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//net/core/dev.c:3317): No des
> cription found for parameter 'event'

Above seem to be needed.

> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//kernel/irq/manage.c:177): No
>  description found for parameter 'new'

Fix seems to be needed.

> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//block/ll_rw_blk.c:317): No d
> escription found for parameter 'prepare_flush_fn'
> Warning(/usr/src/packages/BUILD/linux-2.6.16-rc1-3//block/ll_rw_blk.c:2637): No 
> description found for parameter 'error'

Martin fixed those.

> make[1]: *** [Documentation/DocBook/kernel-api.xml] Error 1

---
~Randy

--===============70267757995996427==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70267757995996427==--
