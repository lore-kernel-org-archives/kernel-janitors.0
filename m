From: Bernd Petrovitsch <bernd@firmix.at>
Date: Fri, 16 Mar 2007 17:15:50 +0000
Subject: Re: [KJ] [RFC] A need for "yesno"-function? (and "cleanup" of
Message-Id: <1174065350.26648.58.camel@tara.firmix.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45F95351.60308@student.ltu.se>
	 <39e6f6c70703152036m778ea054gf32723d0eda2be68@mail.gmail.com>
	 <45FAB6C5.8050302@student.ltu.se>
	 <1174062833.26648.56.camel@tara.firmix.at>
	 <45FACF2E.3040600@student.ltu.se>
In-Reply-To: <45FACF2E.3040600@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Knutsson <ricknu-0@student.ltu.se>
Cc: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, Kernel Janitors List <kernel-janitors@lists.osdl.org>, linux-kernel@vger.kernel.org

On Fri, 2007-03-16 at 18:09 +0100, Richard Knutsson wrote:
> Bernd Petrovitsch wrote:
> > On Fri, 2007-03-16 at 16:24 +0100, Richard Knutsson wrote:
> > [...]
> >   
> >> more readable). The big problem is, where to put it? Seems wrong to put 
> >> in <linux/string.h> since it appear to be a replica of userspace's 
> >> <string.h> (otherwise, why put mem*-functions in there?).
> >>     
> >
> > memcpy(3) and memcmp(3) are also there in user-space.
> >   
> Did I miss something or did you just restate what was stated? (If it was 
> not a replica, I think the mem*-functions would be better placed in 
> memory.h, or such)

Ah,  I misunderstood it as if you wonder why mem*() functions in
<string.h>.
Sorry.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
