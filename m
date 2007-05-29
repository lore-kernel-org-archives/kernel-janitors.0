From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 29 May 2007 17:26:02 +0000
Subject: Re: [KJ] why does struct inodes_stat_t include "int dummy[5]"?
Message-Id: <20070529172602.GE23968@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705291154450.31066@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705291154450.31066@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 29, 2007 at 01:10:12PM -0400, Robert P. J. Day wrote:
> > Generally these can be considered as padding, to make sure that the
> > struct uses 7 * sizeof(int), sometimes this is due to ABI
> > requirements.
> >
> > Have you checked if this is not used at all? Or if instances of this
> > struct aren't casted to something else that uses this area for some
> > purpose?
> 
> i just removed it and did "make allyesconfig" and no problem with a
> build.  so i'll submit a patch to get rid of it and see if anyone
> complains.

That's totally insufficient.  If it's part of an ABI, you won't notice
bugs caused until some random application happens to depend on it.  If
that area's being used as scratch space for something else, you'll get
buffer overruns, and subtle corruptions.

You need to go and look at *all* uses of inodes_stat, and figure out
whether removing it is safe.  Don't just post a patch; you've then put
the onus of proving you're right on someone else.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
