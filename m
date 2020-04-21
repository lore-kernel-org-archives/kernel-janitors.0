From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 21 Apr 2020 05:52:27 +0000
Subject: Re: [bug report] bus: mhi: core: Add support for data transfer
Message-Id: <20200421055218.GA4327@Mani-XPS-13-9360>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407135559.GA109574@mwanda>
 <20200407143304.GH2442@Mani-XPS-13-9360>
 <d30c7648-b657-d8b2-ba64-71f1178b4a68@codeaurora.org>
 <20200417101428.GA10295@Mani-XPS-13-9360>
 <184d0d8e-1d5f-c317-a40b-1b44e79ad293@codeaurora.org>
 <19504ACB-4E2A-4883-92E2-7AAC056CE3B4@linaro.org>
 <7d1bda90-dec3-3cfe-9bfc-dbcf97f9a72d@codeaurora.org>
In-Reply-To: <7d1bda90-dec3-3cfe-9bfc-dbcf97f9a72d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Hemant Kumar <hemantk@codeaurora.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Apr 20, 2020 at 03:57:58PM -0700, Hemant Kumar wrote:
> Hi Mani,
>=20
> On 4/18/20 12:19 PM, Manivannan Sadhasivam wrote:
> > Hi Hemant,
> >=20
> > Please try to use an email client supporting plain text mode like mutt.=
 Your reply looks mangled.
> >=20
> > On 18 April 2020 12:40:10 PM IST, Hemant Kumar <hemantk@codeaurora.org>=
 wrote:
> > > Hi Mani,
> > >=20
> > > On 4/17/20 3:14 AM, Manivannan Sadhasivam wrote:
> > > > Hi Hemant,
> > > >=20
> > > > On Thu, Apr 16, 2020 at 08:37:16PM -0700, Hemant Kumar wrote:
> > > > > On 4/7/20 7:33 AM, Manivannan Sadhasivam wrote:
> > > > > > Hi Dan,
> > > > > >=20
> > > > > > On Tue, Apr 07, 2020 at 04:55:59PM +0300, Dan Carpenter wrote:
> > > > > > > Hello Manivannan Sadhasivam,
> > > > > > >=20
> > > > > > > The patch 189ff97cca53: "bus: mhi: core: Add support for data
> > > > > > > transfer" from Feb 20, 2020, leads to the following static ch=
ecker
> > > > > > > warning:
> > > > > > >=20
> > > > > > > 	drivers/bus/mhi/core/main.c:1153 mhi_queue_buf()
> > > > > > > 	error: double locked 'mhi_chan->lock' (orig line 1110)
> > > > > > >=20
> > > > > > > drivers/bus/mhi/core/main.c
> > > > > > >      1142          }
> > > > > > >      1143
> > > > > > >      1144          /* Toggle wake to exit out of M2 */
> > > > > > >      1145          mhi_cntrl->wake_toggle(mhi_cntrl);
> > > > > > >      1146
> > > > > > >      1147          if (mhi_chan->dir =3D DMA_TO_DEVICE)
> > > > > > >      1148                  atomic_inc(&mhi_cntrl->pending_pkt=
s);
> > > > > > >      1149
> > > > > > >      1150          if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl))=
) {
> > > > > > >      1151                  unsigned long flags;
> > > > > > >      1152
> > > > > > >      1153                  read_lock_irqsave(&mhi_chan->lock,
> > > flags);
> > > > > parse_xfer_event is taking read lock :
> > > read_lock_bh(&mhi_chan->lock); first
> > > > > and later
> > > > >=20
> > > > > mhi_queue_buf takes read lock: read_lock_irqsave(&mhi_chan->lock,
> > > flags);
> > > > >=20
> > > > > Both are read locks which are recursive, is this problematic ?
> > > > >=20
> > > > read_locks are recursive but I wanted to make the static checker
> > > happy. But
> > > > looking into it further (and after having a chat with Arnd), we mig=
ht
> > > need to
> > > > refactor the locking here.
> > > >=20
> > > > Since 'chan->lock' only prevents 'mhi_chan->ch_state', how about
> > > doing something
> > > > like below?
> > >=20
> > > As comment mentioned for OOB (to enter=A0 DB mode) write lock is acqu=
ired
> > >=20
> > > with preemption disabled (irqsave ver). In case of OOB event control
> > > does not go to mhi_queue_buf
> > >=20
> > > path.
> >=20
> > Again, why do we need irq version of write lock. It should only be used=
 if the data is shared with hardirq handlers which I don't see. Otherwise, =
write_lock_bh() looks sufficient to me as this itself is an exclusive lock.
> irq ver disables preemption where as bh ver does not. In case of OOB even=
t,
> idea is not get preempted and this is for short duration of ringing the
> channel doorbell.

This is a clear abuse of write_lock_irq() API. write_lock_irq() should _onl=
y_
be used when the data is shared with a hardirq handler. The original comment
says,

"If it's a DB Event then we need to grab the lock with preemption disabled =
and
as a write because we have to update db register and there are chances that
another thread could be doing the same."

If the 'another' thread has the lock for this piece of code then we don't n=
eed
to disable the irq, isn't it? The irq needs to be disabled only if the 'ano=
ther'
thread is a hardirq handler. I think the problem here is you are caution of=
 not
getting preempted while mhi_ring_chan_db() which I don't see why. Is this
function non reentrant? I don't think so.

Furthermore, there are _lot_ of places the *_irq and *_bh versions of locks=
 are
mixed. One such instance is mhi_queue_buf() where the read_lock_irq() is us=
ed
for mhi_ring_chan_db() while mhi_queue_skb() uses read_lock_bh().

> >=20
> > > For transfer completion events >read_lock_bh is acquired and
> > > channel state is checked.
> > >=20
> > > This lock is held for entire handling of the transfer completion so
> > > that
> > > in case
> > >=20
> > > __mhi_unprepare_channel() is called from power down context write lock
> > > is acquired
> > >=20
> > > for channel lock to change channel state, which would wait until
> > > parse_xfer_event for
> > >=20
> > > data transfer is done (reader is in critical section).=A0 In case if
> > > __mhi_unprepare_channel() wins then
> > >=20
> > > parse_xfer_event is skipped otherwise parse_xfer_event is done and th=
en
> > >=20
> > > channel state is changed.
> > >=20
> >=20
> > So if we get unprepare_channel() after checking the channel state in pa=
rse_xfer_event(), what could go wrong?
> > Also, grabbing the lock for the entire function doesn't look good to me=
. The purpose of the chan->lock is just to protect 'chan_state'/DB and not =
the whole function.
> >=20
> main problem unprepare_channel and parse_xfer_event have lot in common due
> to that we can not let them run in parallel. For example -parse_xfer_event
> is working on transfer ring (rp and wp updates)
> -parse_xfer_event calling dma_unmap_single on buffer
> -__mhi_unprepare_channel() calling mhi_reset_chan() and
> mhi_deinit_chan_ctxt().

Hmm. So the issue will be when __mhi_unprepare_channel() gets called after
parse_xfer_event() checked the 'mhi_chan->ch_state'. So if we have the read=
_lock
for the whole case then it is guarenteed to run before __mhi_unprepare_chan=
nel()
does its part.

Let's keep it as it is. But please look into the irq vs bh part above.

Thanks,
Mani

> > Thanks,
> > Mani
> >=20
> > > >=20
> > > > diff --git a/drivers/bus/mhi/core/main.c
> > > b/drivers/bus/mhi/core/main.c
> > > > index 3e9aa3b2da77..904f9be7a142 100644
> > > > --- a/drivers/bus/mhi/core/main.c
> > > > +++ b/drivers/bus/mhi/core/main.c
> > > > @@ -474,19 +474,12 @@ static int parse_xfer_event(struct
> > > mhi_controller *mhi_cntrl,
> > > >           result.transaction_status =3D (ev_code =3D MHI_EV_CC_OVER=
FLOW)
> > > ?
> > > >                   -EOVERFLOW : 0;
> > > > -       /*
> > > > -        * If it's a DB Event then we need to grab the lock
> > > > -        * with preemption disabled and as a write because we
> > > > -        * have to update db register and there are chances that
> > > > -        * another thread could be doing the same.
> > > > -        */
> > > > -       if (ev_code >=3D MHI_EV_CC_OOB)
> > > > -               write_lock_irqsave(&mhi_chan->lock, flags);
> > > > -       else
> > > > -               read_lock_bh(&mhi_chan->lock);
> > > > -
> > > > -       if (mhi_chan->ch_state !=3D MHI_CH_STATE_ENABLED)
> > > > -               goto end_process_tx_event;
> > > > +       read_lock_bh(&mhi_chan->lock);
> > > > +       if (mhi_chan->ch_state !=3D MHI_CH_STATE_ENABLED) {
> > > > +               read_unlock_bh(&mhi_chan->lock);
> > > > +               return 0;
> > > > +       }
> > > > +       read_unlock_bh(&mhi_chan->lock);
> > > >           switch (ev_code) {
> > > >           case MHI_EV_CC_OVERFLOW:
> > > > @@ -559,10 +552,12 @@ static int parse_xfer_event(struct
> > > mhi_controller *mhi_cntrl,
> > > >                   mhi_chan->db_cfg.db_mode =3D 1;
> > > >                   read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
> > > > +               write_lock_irqsave(&mhi_chan->lock, flags);
> > > >                   if (tre_ring->wp !=3D tre_ring->rp &&
> > > >                       MHI_DB_ACCESS_VALID(mhi_cntrl)) {
> > > >                           mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> > > >                   }
> > > > +               write_unlock_irqrestore(&mhi_chan->lock, flags);
> > > >                   read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags=
);
> > > >                   break;
> > > >           }
> > > > @@ -572,12 +567,6 @@ static int parse_xfer_event(struct
> > > mhi_controller *mhi_cntrl,
> > > >                   break;
> > > >           } /* switch(MHI_EV_READ_CODE(EV_TRB_CODE,event)) */
> > > > -end_process_tx_event:
> > > > -       if (ev_code >=3D MHI_EV_CC_OOB)
> > > > -               write_unlock_irqrestore(&mhi_chan->lock, flags);
> > > > -       else
> > > > -               read_unlock_bh(&mhi_chan->lock);
> > > > -
> > > >           return 0;
> > > >    }
> > > >=20
> > > > Moreover, I do have couple of concerns:
> > > >=20
> > > > 1. 'mhi_chan->db_cfg.db_mode =3D 1' needs to be added to the critic=
al
> > > section
> > > > above.
> > > >=20
> > > > 2. Why we have {write/read}_lock_irq variants for chan->lock? I don=
't
> > > see where
> > > > the db or ch_state got shared with hardirq handler. Maybe we should
> > > only have
> > > > *_bh (softirq) variants all over the place?
> > > >=20
> > > > Thanks,
> > > > Mani
> > > >=20
> > > > > > >                                              ^^^^^^^^^^^^^^^
> > > > > > > The caller is already holding this lock.
> > > > > > >=20
> > > > > > Hmm. We have one internal user of this function and that's where
> > > the locking
> > > > > > has gone wrong. Will fix it.
> > > > > >=20
> > > > > > Thanks for reporting!
> > > > > >=20
> > > > > > Regards,
> > > > > > Mani
> > > > > >=20
> > > > > > >      1154                  mhi_ring_chan_db(mhi_cntrl, mhi_ch=
an);
> > > > > > >      1155                  read_unlock_irqrestore(&mhi_chan->=
lock,
> > > flags);
> > > > > > >      1156          }
> > > > > > >      1157
> > > > > > >      1158          read_unlock_irqrestore(&mhi_cntrl->pm_lock,
> > > flags);
> > > > > > >      1159
> > > > > > >      1160          return 0;
> > > > > > >      1161  }
> > > > > > >      1162  EXPORT_SYMBOL_GPL(mhi_queue_buf);
> > > > > > >=20
> > > > > > > regards,
> > > > > > > dan carpenter
> > > > > --=20
> > > > > The Qualcomm Innovation Center, Inc. is a member of the Code Auro=
ra
> > > Forum,
> > > > > a Linux Foundation Collaborative Project
> >=20
>=20
> --=20
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
