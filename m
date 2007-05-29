From: "Arnaldo Carvalho de Melo" <acme@ghostprotocols.net>
Date: Tue, 29 May 2007 17:35:25 +0000
Subject: Re: [KJ] why does struct inodes_stat_t include "int dummy[5]"?
Message-Id: <39e6f6c70705291035r29fbef87ma715de5ed570866@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705291154450.31066@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705291154450.31066@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/29/07, Matthew Wilcox <matthew@wil.cx> wrote:
> On Tue, May 29, 2007 at 01:10:12PM -0400, Robert P. J. Day wrote:
> > > Generally these can be considered as padding, to make sure that the
> > > struct uses 7 * sizeof(int), sometimes this is due to ABI
> > > requirements.
> > >
> > > Have you checked if this is not used at all? Or if instances of this
> > > struct aren't casted to something else that uses this area for some
> > > purpose?
> >
> > i just removed it and did "make allyesconfig" and no problem with a
> > build.  so i'll submit a patch to get rid of it and see if anyone
> > complains.
>
> That's totally insufficient.  If it's part of an ABI, you won't notice
> bugs caused until some random application happens to depend on it.  If
> that area's being used as scratch space for something else, you'll get
> buffer overruns, and subtle corruptions.
>
> You need to go and look at *all* uses of inodes_stat, and figure out
> whether removing it is safe.  Don't just post a patch; you've then put
> the onus of proving you're right on someone else.

Thanks Willy, that is a more assertive comment 8-)

Robert, I guess you should try to use google codesearch and when
discovering the reason please submit a patch with a comment describing
the purpose for this "dummy" field :-)

Sure, if you feel like pursuing this path...

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
