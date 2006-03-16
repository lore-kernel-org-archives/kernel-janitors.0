From: Narasimha Sharoff <njsharoff@yahoo.com>
Date: Thu, 16 Mar 2006 17:56:13 +0000
Subject: Re: [KJ] Re: [PATCH] bug fix to include/linux/cn_proc.h for 2.6.16-rc5
Message-Id: <20060316175613.96415.qmail@web52715.mail.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1142312124.24621.82.camel@stark>
In-Reply-To: <1142312124.24621.82.camel@stark>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If time.h need not be included in cn_proc.h, is there
a reason not to apply this patch?

As i see, not having time.h in cn_proc.h resolves user
space problem i am seeing. Kernel compilation seems to
go ok (tried it on a ppc system,2.6.16-rc5).

I do not know how the header files end up in
/usr/include/linux directory. Is there a standard
process followed while packaging or is this distro
specific? Can someone forward me a pointer?

Thanks
Narasimha

--- Matt Helsley <matthltc@us.ibm.com> wrote:

> On Tue, 2006-03-14 at 06:38 -0800, Nishanth
> Aravamudan wrote:
> > On 13.03.2006 [23:17:04 -0800], Narasimha Sharoff
> wrote:
> > > Matt,
> > > 
> > > Yes, i compile tested this. See the patch below.
> > > Note that the test uses the user space header
> > > /usr/include/linux/cn_proc.h which is the same
> as the
> > > one found at /usr/src/linux/include/linux.
> > 
> > This sounds like something is busted in userspace
> packaging. I would not
> > expect these files to be identical. That just
> sounds like a workaround
> > to the "don't include kernel files in userspace
> issue".
> > 
> > Thanks,
> > Nish
> 
> Narasimha,
> 
> 	Who packaged the headers? Is it a distro package?
> If so it may be
> appropriate to contact them and point out the
> problem. I'd appreciate
> being cc'd just so I can track this.
> 
> 	Thanks for submitting a report.
> 
> Cheers,
> 	-Matt Helsley
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
