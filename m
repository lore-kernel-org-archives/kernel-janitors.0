From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Sep 2013 12:56:05 +0000
Subject: Re: [patch 3/4] skd: use strncpy() as a cleanup
Message-Id: <20130913125605.GL25896@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130913080539.GG19211@elgon.mountain>
 <CAMuHMdX88cUEu2dmamEttK=9Lv0TKiZauCtPDLbgKUde+8ufyQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX88cUEu2dmamEttK=9Lv0TKiZauCtPDLbgKUde+8ufyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jens Axboe <axboe@kernel.dk>, Jeff Moyer <jmoyer@redhat.com>, Ramprasad Chinthekindi <rchinthekindi@stec-inc.com>, Akhil Bhansali <abhansali@stec-inc.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, Sep 13, 2013 at 02:03:23PM +0200, Geert Uytterhoeven wrote:
> On Fri, Sep 13, 2013 at 10:05 AM, Dan Carpenter
> > +       strncpy(inq.driver_version, DRV_VER_COMPL,
> > +               min(sizeof(inq.driver_version), strlen(DRV_VER_COMPL)));
> 
> This does the exact same thing as memcpy(), right? So why not use that?
> memcpy() has much simpler semantics than strncpy().

You're right.  I've redone this.

regards,
dan carpenter

