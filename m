From: Amol Lad <amol@verismonetworks.com>
Date: Thu, 28 Sep 2006 04:34:06 +0000
Subject: Re: [KJ] [RFC] request_region() error handling fixes
Message-Id: <1159417326.9310.10.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
In-Reply-To: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Also, when you progress on this you will find that there are lots of
places where the fix is required. So take care of below:

1. Split a big patch in multiple patches. Read
http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt

2. If you are confident that your patch is fine then also CC subsystem
maintainer & subsystem mailing list (if it's there). If you are
confused, then CC lkml

Best of luck !


On Wed, 2006-09-27 at 16:15 -0700, Badari Pulavarty wrote:
> On Thu, 2006-09-28 at 00:31 +0200, Jesper Juhl wrote:
> > On 27/09/06, Badari Pulavarty <pbadari@us.ibm.com> wrote:
> > > Hi,
> > >
> > > I started working on request_region() error handling fixes.
> > > Before I got too far, want to make sure its following approach
> > > is acceptable. (not happy with too many "goto" statements).
> > > Is there a better way to do this ?
> > >
> > > Please comment.
> > >
> > [snip]
> > 
> > If you don't like all these goto's :
> > 
> ..
> > 
> > 
> > So I'd say your version with the goto's (which is similar to what's
> > used elsewhere in the kernel) is the right way to go...
> 
> Yes. I considered few other options (and infact, coded to see how
> they look), but settled on "goto". 
> 
> > Ohh btw, shouldn't there be a single space before your label names?  Like
> > 
> >  out4:
> > 
> > instead of
> > 
> > out4:
> 
> hmm. I haven't seen many of those (I thought, they were typos).
> 
> > 
> > I seem to remember something about label names shouldn't start at column 0.
> > 
> > 
> > Also, in a line like this :
> > 
> >        if (!request_region(0x20,0x20,"pic1")) {
> > 
> > I think the consensus is that it should be spaced like this instead
> > (space after the commas):
> > 
> >        if (!request_region(0x20, 0x20, "pic1")) {
> > 
> 
> Sure. I will fix those too, I was trying to keep as much code as
> "common".
> 
> Thanks for your suggestions.
> 
> Thanks,
> Badari
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
