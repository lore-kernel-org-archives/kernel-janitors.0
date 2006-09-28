From: Domen Puncer <domen@coderock.org>
Date: Thu, 28 Sep 2006 16:42:05 +0000
Subject: Re: [KJ] [RFC] request_region() error handling fixes
Message-Id: <20060928164205.GE3189@nd47.coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
In-Reply-To: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 27/09/06 16:15 -0700, Badari Pulavarty wrote:
> On Thu, 2006-09-28 at 00:31 +0200, Jesper Juhl wrote:

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

They are intentional, because otherwise diff -p prints them.

And please don't use labels with numbers. I think there was a
patch posted here a week or two ago that had to rename those
numbers, because an error condition could happen in between.


	Domen
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
