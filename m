From: "Maciej W. Rozycki" <macro@linux-mips.org>
Date: Sun, 06 Jul 2014 11:19:46 +0000
Subject: Re: [PATCH] MIPS: Remove incorrect NULL check in local_flush_tlb_page()
Message-Id: <alpine.LFD.2.11.1407061218090.15455@eddie.linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1404602638-16447-1-git-send-email-emilgoode@gmail.com> <CAOiHx==kyY9ce5jjv5m36OXpG9Vk4NsPa9m+nfWuYWjxOnMisA@mail.gmail.com>
In-Reply-To: <CAOiHx==kyY9ce5jjv5m36OXpG9Vk4NsPa9m+nfWuYWjxOnMisA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonas Gorski <jogo@openwrt.org>
Cc: Emil Goode <emilgoode@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, John Crispin <blogic@openwrt.org>, MIPS Mailing List <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, 6 Jul 2014, Jonas Gorski wrote:

> On Sun, Jul 6, 2014 at 1:23 AM, Emil Goode <emilgoode@gmail.com> wrote:
> > We check that the struct vm_area_struct pointer vma is NULL and then
> > dereference it a few lines below. The intent was to make sure vma is
> > not NULL but this is not necessary since the bug pre-dates GIT history
> > and seem to never have caused a problem. The tlb-4k and tlb-8k versions
> > of local_flush_tlb_page() don't bother checking if vma is NULL, also
> > vma is dereferenced before being passed to local_flush_tlb_page(),
> > thus it is safe to remove this NULL check.
> >
> > Signed-off-by: Emil Goode <emilgoode@gmail.com>
> 
> Looks good.
> 
> Reviewed-by: Jonas Gorski <jogo@openwrt.org>

Acked-by: Maciej W. Rozycki <macro@linux-mips.org>

(as per the observations at the previous version).

  Maciej
