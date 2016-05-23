From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Date: Mon, 23 May 2016 15:13:48 +0000
Subject: Re: [PATCH 2/2] s390: use canonical include guard style
Message-Id: <20160523171348.10de76eb@mschwide>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160523151938.661e2bfb@newton>
In-Reply-To: <20160523151938.661e2bfb@newton>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 23 May 2016 17:01:53 +0200
Peter Oberparleiter <oberpar@linux.vnet.ibm.com> wrote:

> On 23.05.2016 15:19, Daniel van Gerpen wrote:
> > Signed-off-by: Daniel van Gerpen <daniel@vangerpen.de>
> > ---
> >  arch/s390/include/asm/fcx.h | 2 +-
> >  drivers/s390/cio/chp.h      | 2 +-
> >  drivers/s390/cio/idset.h    | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> 
> Acked-by: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
> 
> Martin, could you pick this up via the s390 tree?
 
Add to the linux-s390:features branch for the 4.8 merge window.

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.

