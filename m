From: Meelis Roos <mroos@linux.ee>
Date: Mon, 20 Jul 2015 19:28:56 +0000
Subject: Re: [PATCH] parisc: mm: Fix a memory leak related to pmd not attached to the pgd
Message-Id: <alpine.LRH.2.11.1507202228030.21509@math.ut.ee>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1436779963-4286-1-git-send-email-christophe.jaillet@wanadoo.fr> <55A408F5.601@gmx.de>
In-Reply-To: <55A408F5.601@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Helge Deller <deller@gmx.de>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jejb@parisc-linux.org, mpatocka@redhat.com, kirill.shutemov@linux.intel.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, John David Anglin <dave.anglin@bell.net>

> Hi Christophe,
> 
> On 13.07.2015 11:32, Christophe JAILLET wrote:
> > Commit 0e0da48dee8d ("parisc: mm: don't count preallocated pmds")
> > introduced a memory leak.
> >
> > After this commit, the 'return' statement in pmd_free is executed in all
> > cases. Even for pmd that are not attached to the pgd.
> > So 'free_pages' can never be called anymore, leading to a memory leak.
> 
> That's really great!!! Thanks for spotting this!
> 
> I assume this fixes the leak which killed our debian buildds with OOM
> after an uptime of 1-4 days and which only happened since kernel 4.0.
> Meelis Roos reported the issue already in this thread:
> http://marc.info/?l=linux-parisc&m2999113232154&w=2

Yes, the patch that is merged in 4.2-rc3 fixed my RP3410 with 1G RAM.

-- 
Meelis Roos (mroos@linux.ee)
