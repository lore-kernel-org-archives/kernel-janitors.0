From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 25 Jun 2019 18:55:11 +0000
Subject: Re: [PATCH] orangefs: remove redundant assignment to variable buffer_index
Message-Id: <CAOg9mSQmV=BDMpTNLJvb4QBr=f96qg4Hr9qu=bB6xZubB+1LZQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190511132700.4862-1-colin.king@canonical.com>
 <CAOg9mSQt42NQu-3nwZOCGOPx45y7G8aaiDaVe4SwotGnD9iY1A@mail.gmail.com> <20190521150311.GL31203@kadam>
In-Reply-To: <20190521150311.GL31203@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mike Marshall <hubcap@omnibond.com>, linux-fsdevel <linux-fsdevel@vger.kernel.org>
Cc: Colin King <colin.king@canonical.com>, Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>> The only explanation I can think of is that you guys are discussing
>> different code. :P

My response contained several conflations :-) ...

The code in file.c that Colin has flagged does indeed have buffer_index
being initialized needlessly, and the assignment noted by Dan is also
needless. There's even a second needless assignment done in another
place in the same function. While the code around them has changed over
time, these now needless manipulations of buffer_index are not new. I'll
get rid of them.

>> You often send these patches before they hit linux-next so I had skipped
>> reviewing this one when you sent it.

I know Linus is likely to refuse pull requests for stuff that
has not been through linux-next, so I make sure stuff has been
there at least a few days before asking for it to be pulled.
"A few days" is long enough for robots to see it, perhaps not
long enough for humans. I especially appreciate the human review. One of
the good things about Orangefs is that it is easy to install and configure,
especially for testing. Documentation/filesystems/orangefs.txt has
instructions for dnf installing orangefs on Fedora, and also how to download
a source tarball and install from that.

-Mike

On Tue, May 21, 2019 at 11:04 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, May 16, 2019 at 12:06:31PM -0400, Mike Marshall wrote:
> > Hi Colin...
> >
> > Thanks for the patch. Before I initialized buffer_index, Dan Williams sent
> > in a warning that a particular error path could try to use ibuffer_index
> > uninitialized. I could induce the problem he described with one
> > of the xfstests resulting in a crashed kernel. I will try to refactor
> > the code to fix the problem some other way than initializing
> > buffer_index in the declaration.
> >
>
> The only explanation I can think of is that you guys are discussing
> different code.  :P
>
> regards,
> dan carpenter
>
