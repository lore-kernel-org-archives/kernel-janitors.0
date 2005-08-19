From: Adrian Bunk <bunk@stusta.de>
Date: Fri, 19 Aug 2005 23:58:18 +0000
Subject: Re: [KJ] [PATCH] mtd: remove compatmac.h
Message-Id: <20050819235818.GH3615@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32349931372773533=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050819205632.GA5211@mipter.zuzino.mipt.ru>
In-Reply-To: <20050819205632.GA5211@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============32349931372773533==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 20, 2005 at 03:46:45AM +0400, Alexey Dobriyan wrote:
> On Fri, Aug 19, 2005 at 11:15:17PM +0200, Adrian Bunk wrote:
> > On Sat, Aug 20, 2005 at 12:56:32AM +0400, Alexey Dobriyan wrote:
> > 
> > > File is effectively empty.
> > >...
> > 
> > That's expected.
> > 
> > The trick is that it's non-empty in 2.4
> 
> Take assorted snippets from version.h, compiler.h, wait.h, uaccess.h,
> module.h, byteorder.h, types.h, spinlock.h, kernel.h, blkdev.h and
> others, mix them, multiply by LINUX_VERSION_CODE [1] ifdeffery [2], add
> some bugs(?) going to happen [3], mix once again and you'll get
> compatmac.h from 2.4. :-\ Just like any other compat header this one is
> mess.
> 
> > and provides some code for letting 2.6 code running on 2.4 .
> > 
> > As long as the MTD maintainer wants to share the code between 2.4 and 
> > 2.6 your patch makes his life much harder.
> 
> As long as patches don't include pretty localized headers in context it
> shouldn't.

Compat headers are a mess, but OTOH it often makes maintaining the code 
for the maintainers much easier if they can use the same file in both 
2.4 and 2.6.

The 2.4 compatmac.h might be a mess, and if you find bugs affecting 2.4 
in it please send patches to fix them.

From a 2.6 point of view, the compatmac.h approach is the best I've ever 
seen because #include'ing an empty file doesn't do much harm (I've 
already seen and removed some pretty ugly #ifdef's and wrapper functions 
doing similar things).

It't up to the MTD maintainer (Cc'ed) whether he wants to continue to 
use this file or whether he'll accept your patch.

> 	Alexey
>...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============32349931372773533==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32349931372773533==--
