From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 21 Jan 2013 08:34:57 +0000
Subject: Re: [patch] f2fs: use _safe() version of list_for_each
Message-Id: <20130121083457.GB11592@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130120150258.GB32551@elgon.mountain>
 <CAKYAXd_Lp7f-cHi-1Cti29JjmXTWOgOOHxy-_f106jTSFdceDg@mail.gmail.com>
In-Reply-To: <CAKYAXd_Lp7f-cHi-1Cti29JjmXTWOgOOHxy-_f106jTSFdceDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Namjae Jeon <linkinjeon@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Jaegeuk Kim <jaegeuk.kim@samsung.com>, linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jan 21, 2013 at 09:39:43AM +0900, Namjae Jeon wrote:
> 2013/1/21, Dan Carpenter <dan.carpenter@oracle.com>:
> > This is calling list_del() inside a loop which is a problem when we try
> > move to the next item on the list.  I've converted it to use the _safe
> > version.  And also, as a cleanup, I've converted it to use
> > list_for_each_entry instead of list_for_each.
> >
> Hi Dan.
> I can't understand why this patch is needed yet.
> Could you elaborate more ?

A simple rule of thumb: if you modify list inside the loop you need to
use the _safe variant of the iterator, since once element is deleted you
can't get from it to the next element.

Thanks.

-- 
Dmitry
