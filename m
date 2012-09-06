From: Borislav Petkov <bp@amd64.org>
Date: Thu, 06 Sep 2012 13:06:53 +0000
Subject: Re: [patch] x86, microcode, AMD: use after free in free_cache()
Message-Id: <20120906130653.GE550@aftab.osrc.amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123042.GB6128@elgon.mountain>
In-Reply-To: <20120905123042.GB6128@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 06, 2012 at 05:30:48AM -0700, Dan Carpenter wrote:
> > #define list_for_each_entry_reverse(pos, head, member)			\
> > 	for (pos = list_entry((head)->prev, typeof(*pos), member);	\
> > 	     &pos->member != (head); 	\					<--- DEREF.
> 
> No.  That's not what I'm talking about.  (And also that's not a
> dereference, it just gives you the address of the struct member).
> 
> > 	     pos = list_entry(pos->member.prev, typeof(*pos), member))
>                               ^^^^^
> Here is the dereference.  We have already freed "pos" at this point.

Ok, I see it now, thanks for pointing it out exactly.

One last thing remains: why didn't I hit this during testing at all?
Timings, or some other out-of-order x86 reason I'm unable to see now?

> GAR GAR GAR! STOP! NO! I've seen this before where people remove
> locking code and change to using the _safe() version of the
> list_for_each macros. The _safe() version has *NOTHING* to do with
> concurency. It is for if we are freeing a list element.

Ok.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551
