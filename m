From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Jun 2019 06:18:01 +0000
Subject: Re: [PATCH] orangefs: remove redundant assignment to variable buffer_index
Message-Id: <20190626061801.GA18776@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190511132700.4862-1-colin.king@canonical.com>
 <CAOg9mSQt42NQu-3nwZOCGOPx45y7G8aaiDaVe4SwotGnD9iY1A@mail.gmail.com>
 <20190521150311.GL31203@kadam>
 <CAOg9mSQmV=BDMpTNLJvb4QBr=f96qg4Hr9qu=bB6xZubB+1LZQ@mail.gmail.com>
In-Reply-To: <CAOg9mSQmV=BDMpTNLJvb4QBr=f96qg4Hr9qu=bB6xZubB+1LZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, Colin King <colin.king@canonical.com>, Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Jun 25, 2019 at 02:55:11PM -0400, Mike Marshall wrote:
> >> You often send these patches before they hit linux-next so I had skipped
> >> reviewing this one when you sent it.
> 
> I know Linus is likely to refuse pull requests for stuff that
> has not been through linux-next, so I make sure stuff has been
> there at least a few days before asking for it to be pulled.
> "A few days" is long enough for robots to see it, perhaps not
> long enough for humans. I especially appreciate the human review. One of
> the good things about Orangefs is that it is easy to install and configure,
> especially for testing. Documentation/filesystems/orangefs.txt has
> instructions for dnf installing orangefs on Fedora, and also how to download
> a source tarball and install from that.

No, no, that comment was to Colin.  It's good that he's sending patches
for all the trees as soon as possible like the zero day bot does.  But
it does make it hard to review at times.

regards,
dan carpenter
