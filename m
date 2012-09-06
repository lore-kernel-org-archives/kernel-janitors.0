From: Borislav Petkov <bp@amd64.org>
Date: Thu, 06 Sep 2012 12:01:45 +0000
Subject: Re: [patch] x86, microcode, AMD: use after free in free_cache()
Message-Id: <20120906120145.GA550@aftab.osrc.amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123042.GB6128@elgon.mountain>
In-Reply-To: <20120905123042.GB6128@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 05, 2012 at 04:42:03PM -0700, Dan Carpenter wrote:
> The dereference happens inside the assignment.

Yes, this:

#define list_for_each_entry_reverse(pos, head, member)			\
	for (pos = list_entry((head)->prev, typeof(*pos), member);	\
	     &pos->member != (head); 	\					<--- DEREF.
	     pos = list_entry(pos->member.prev, typeof(*pos), member))

but we kfree pos aka p after the deref and in the next iteration p
becomes the list entry of the next list element, AFAICT.

> That's actually the reason why we have the the _safe() version of the
> macro.

_safe, the way I see it, is for concurrent list manipulations and at the
point we free the cache, I don't see us concurrently manipulating that
list.

So, sorry, but I don't see the problem.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551
