From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Tue, 29 Aug 2006 16:44:02 +0000
Subject: [KJ] Fwd: [Patch] Add HZ values and time_after() macros in iphase.c
Message-Id: <82faac5b0608290944o2452a904x4826da8bbd944daa@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Forgot to reply to all!

---------- Forwarded message ----------
From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Aug 30, 2006 2:42 AM
Subject: Re: [KJ] [Patch] Add HZ values and time_after() macros in iphase.c
To: Nishanth Aravamudan <nacc@us.ibm.com>


G'day Nish

On 8/30/06, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> On 29.08.2006 [12:48:22 +1000], Darren Jenkins" wrote:
> > G'day list
> >
> > After grepping for schedual_timeout() -HZ, I found one in iphase.c.
> > After looking at it I also thought I would add some time_after() macro's
> > for clarification, and remove a variable in one case, that wasn't really
> > needed.
> >
> > Add HZ values and time_after() macro's in iphase.c
>
> Should be split in two patches.

Fair enough.

> > Compile tested with allyesconfig
> >
> >
> > Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
> >
> > --- drivers/atm/iphase.c.orig 2006-08-28 23:29:06.000000000 +1000
> > +++ drivers/atm/iphase.c      2006-08-29 01:07:30.000000000 +1000
> > @@ -184,12 +184,11 @@ static u16 get_desc (IADEV *dev, struct
> >    u_short            desc_num, i;
> >    struct sk_buff        *skb;
> >    struct ia_vcc         *iavcc_r = NULL;
> > -  unsigned long delta;
> >    static unsigned long timer = 0;
> >    int ltimeout;
> >
> >    ia_hack_tcq (dev);
> > -  if(((jiffies - timer)>50)||((dev->ffL.tcq_rd=dev->host_tcq_wr))){
> > +  if(time_after(jiffies, (timer+HZ/2))||((dev->ffL.tcq_rd=dev->host_tcq_wr))){
>
> You're changing the functionality here. It's best to keep the same
> semantics as much as possible, please. And I'd use msecs_to_jiffies().

sounds good.

> BTW, it's not a bug, per se, to only want to sleep for a fixed number of
> jiffies, even if I don't completely approve of it, either.

No not a bug per se. However if we arn't using a single jiffie(for a
min timeout), not making the call HZ relative will cause a bug with a
large enough change in HZ.
That is if the delay really was needed in the first place. :)

>
> >       timer = jiffies;
> >       i=0;
> >       while (i < dev->num_tx_desc) {
> > @@ -198,9 +197,10 @@ static u16 get_desc (IADEV *dev, struct
> >             continue;
> >          }
> >          ltimeout = dev->desc_tbl[i].iavcc->ltimeout;
> > -        delta = jiffies - dev->desc_tbl[i].timestamp;
> > -        if (delta >= ltimeout) {
> > -           IF_ABR(printk("RECOVER run!! desc_tbl %d = %d  delta = %ld, time = %ld\n", i,dev->desc_tbl[i].timestamp, delta, jiffies);)
> > +        if (time_after_eq(jiffies,
> > +             ((unsigned long)dev->desc_tbl[i].timestamp + ltimeout))) {
> > +           IF_ABR(printk("RECOVER run!! desc_tbl %d = %d, time = %ld\n",
> > +             i,dev->desc_tbl[i].timestamp, jiffies);)
> >             if (dev->ffL.tcq_rd = dev->ffL.tcq_st)
> >                dev->ffL.tcq_rd =  dev->ffL.tcq_ed;
> >             else
> > @@ -1223,7 +1223,7 @@ static void rx_intr(struct atm_dev *dev)
> >          iadev->rx_tmp_jif = jiffies;
> >          iadev->rxing = 0;
> >       }
> > -     else if (((jiffies - iadev->rx_tmp_jif) > 50) &&
> > +     else if (time_after(jiffies, ((unsigned long)iadev->rx_tmp_jif + HZ/2)) &&
> >                 ((iadev->rx_pkt_cnt - iadev->rx_tmp_cnt) = 0)) {
>
> Changes functionality.

Just wondering, do you mean it is changed because it is HZ/2 and not HZ/20 ?
(just remembered HZ in 2.6 is/was 1000 not 100 anymore)
or do you mean the adding of time_after() code change ?


>
> >          for (i = 1; i <= iadev->num_rx_desc; i++)
> >                 free_desc(dev, i);
> > @@ -2610,7 +2610,7 @@ static void ia_close(struct atm_vcc *vcc
> >          if (vcc->qos.txtp.traffic_class != ATM_NONE) {
> >             iadev->close_pending++;
> >          prepare_to_wait(&iadev->timeout_wait, &wait, TASK_UNINTERRUPTIBLE);
> > -        schedule_timeout(50);
> > +        schedule_timeout(HZ/2);
>
> Changes functionality.
>
> Thanks,
> Nish


Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
