From: Ingo Molnar <mingo@elte.hu>
Date: Wed, 08 Apr 2009 14:48:42 +0000
Subject: Re: [PATCH 54/56] x86: Remove void casts
Message-Id: <20090408144842.GK12931@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-52-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-53-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-54-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-55-git-send-email-jwjstone@fastmail.fm> <36ca99e90904080518qf81b483h6ed2bc9752ee0d1e@mail.gmail.com> <49DCAE97.8040602@fastmail.fm> <20090408140637.GC12931@elte.hu> <49DCB140.7000603@fastmail.fm> <20090408144055.GH12931@elte.hu> <49DCB8C5.4090108@fastmail.fm>
In-Reply-To: <49DCB8C5.4090108@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: Bert Wesarg <bert.wesarg@googlemail.com>, linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org


* Jack Stone <jwjstone@fastmail.fm> wrote:

> Ingo Molnar wrote:
> > * Jack Stone <jwjstone@fastmail.fm> wrote:
> >
> >   
> >> Ingo Molnar wrote:
> >>     
> >>> * Jack Stone <jwjstone@fastmail.fm> wrote:
> >>>
> >>>   
> >>>       
> >>>> Fixed patch
> >>>>
> >>>> Thanks,
> >>>>     
> >>>>         
> >>> Hm, what was fixed?
> >>>   
> >>>       
> >> I removed casts on pointer arithmetic which probably still needed to be
> >> there to do the arithmetic properly.
> >>     
> >
> > ... which pretty much proves the point that these patches should 
> > not go via any "trivial" tree.
> >
> > Those additions of mmu pointers you did were outright lethal, i 
> > doubt this stuff could have booted on both 32-bit and 64-bit 
> > x86.
> >
> > Please dont do this. Or if you do, please double check your 
> > change and double check that the relevant vmlinux disassembly is 
> > still bit for bit the same.
> >   
> 
> Thats what I meant by fixed - those changes were removed from the 
> patch.

No, i mean, this approach should be changed, and i dont think any 
type cast change should go via any trivial tree. It's easy to mess 
it up. Please submit them to the maintainer trees.

	Ingo
