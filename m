From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 21 Jan 2013 10:37:13 +0000
Subject: Re: [patch] f2fs: use _safe() version of list_for_each
Message-Id: <alpine.DEB.2.02.1301211135300.1930@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-2084525288-1358764633=:1930"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130120150258.GB32551@elgon.mountain> <20130121083245.GA11592@core.coreip.homeip.net> <1358760001.8234.150.camel@kjgkr> <CAKYAXd-H0KHMavYRk3PEshXNtN_ke5rH_qa-8XTT6RWZXYmFcw@mail.gmail.com>
In-Reply-To: <CAKYAXd-H0KHMavYRk3PEshXNtN_ke5rH_qa-8XTT6RWZXYmFcw@mail.gmail.com>
To: Namjae Jeon <linkinjeon@gmail.com>
Cc: jaegeuk.kim@samsung.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2084525288-1358764633=:1930
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 21 Jan 2013, Namjae Jeon wrote:

> 2013/1/21, Jaegeuk Kim <jaegeuk.kim@samsung.com>:
> > 2013-01-21 (월), 00:32 -0800, Dmitry Torokhov:
> >> On Sun, Jan 20, 2013 at 06:02:58PM +0300, Dan Carpenter wrote:
> >> > This is calling list_del() inside a loop which is a problem when we try
> >> > move to the next item on the list.  I've converted it to use the _safe
> >> > version.  And also, as a cleanup, I've converted it to use
> >> > list_for_each_entry instead of list_for_each.
> >> >
> >> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >> > ---
> >> > Static analysis stuff.  Untested.  Please review carefully.
> >>
> >> Makes sense to me.
> >>
> >> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >>
> >
> > No doubt, applied.
> > Thanks,
> I agree in cases – where we will have chances of parallel access and
> modification to the linked we should use list_for_each_entry_safe()
> But my point was related with this code change case in the patch.
> We will have path like this:
> f2fs_fill_super->recover_fsync_data->destroy_fsync_dnodes()
> From this calling path – there can only be a single caller at any
> given time. So, we will not have the case of having parallel access to
> the list which is local to recover_fsync_data() and destroyed on exit
> from this function.
> From the real issue point of view – this does not looks convincing to
> me why expensive _safe fucntion should used.

The need for the safe version has nothing to do with parallelism.  It has
to do with whether the loop deletes some of the elements in the list.
The non-safe list mechanism uses the current element to get to the next
element.  If the current element has been deleted, it cannot get to the
next one.

julia
--8323329-2084525288-1358764633=:1930--
