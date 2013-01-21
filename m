From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 21 Jan 2013 08:25:31 +0000
Subject: Re: [patch] f2fs: use _safe() version of list_for_each
Message-Id: <20130121082531.GS4584@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130120150258.GB32551@elgon.mountain>
 <CAKYAXd_Lp7f-cHi-1Cti29JjmXTWOgOOHxy-_f106jTSFdceDg@mail.gmail.com>
In-Reply-To: <CAKYAXd_Lp7f-cHi-1Cti29JjmXTWOgOOHxy-_f106jTSFdceDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Namjae Jeon <linkinjeon@gmail.com>
Cc: Jaegeuk Kim <jaegeuk.kim@samsung.com>, linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
> 

In this case "this", "entry" and "&entry->list" are all the same
pointer, but just casted differently.  The call to list_del() sets
"&entry->list->next = LIST_POISON1;".  On the next iteration "entry"
now points to LIST_POISON1 so the iput(entry->inode); will cause an
Oops.

This was a static checker patch and I didn't test it, but I would
have expected that it would be easy to trigger...

regards,
dan carpenter


