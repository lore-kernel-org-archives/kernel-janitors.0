From: Badari Pulavarty <pbadari@us.ibm.com>
Date: Wed, 27 Sep 2006 23:15:07 +0000
Subject: Re: [KJ] [RFC] request_region() error handling fixes
Message-Id: <1159398907.1709.51.camel@dyn9047017100.beaverton.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
In-Reply-To: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 2006-09-28 at 00:31 +0200, Jesper Juhl wrote:
> On 27/09/06, Badari Pulavarty <pbadari@us.ibm.com> wrote:
> > Hi,
> >
> > I started working on request_region() error handling fixes.
> > Before I got too far, want to make sure its following approach
> > is acceptable. (not happy with too many "goto" statements).
> > Is there a better way to do this ?
> >
> > Please comment.
> >
> [snip]
> 
> If you don't like all these goto's :
> 
..
> 
> 
> So I'd say your version with the goto's (which is similar to what's
> used elsewhere in the kernel) is the right way to go...

Yes. I considered few other options (and infact, coded to see how
they look), but settled on "goto". 

> Ohh btw, shouldn't there be a single space before your label names?  Like
> 
>  out4:
> 
> instead of
> 
> out4:

hmm. I haven't seen many of those (I thought, they were typos).

> 
> I seem to remember something about label names shouldn't start at column 0.
> 
> 
> Also, in a line like this :
> 
>        if (!request_region(0x20,0x20,"pic1")) {
> 
> I think the consensus is that it should be spaced like this instead
> (space after the commas):
> 
>        if (!request_region(0x20, 0x20, "pic1")) {
> 

Sure. I will fix those too, I was trying to keep as much code as
"common".

Thanks for your suggestions.

Thanks,
Badari

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
