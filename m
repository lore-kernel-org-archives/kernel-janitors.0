From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Thu, 08 Mar 2012 16:51:26 +0000
Subject: Re: [PATCH 1/2] [SCSI] pm8001: Fix bogus interrupt state flag issue.
Message-Id: <CAOD=uF4+F7MYO0cqd7ogmc=K9jtE5DX3wDoMv1eTxFq48JCX2g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330263210-25134-1-git-send-email-santoshprasadnayak@gmail.com>
	<528D7E8A-B2F6-4EDB-A7C0-E0BF494038D0@xyratex.com>
In-Reply-To: <528D7E8A-B2F6-4EDB-A7C0-E0BF494038D0@xyratex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Mark Salyzyn <mark_salyzyn@xyratex.com>
Cc: Jack Wang <jack_wang@usish.com>, lindar_liu <lindar_liu@usish.com>, James Bottomley <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

Hi Mark,

Thanks for your review.

Few queries:

1. Similar changes have been made in mpi_sata_completion() surrounding
spin_*lock_irq*(&t->task->state_lock)
    Should those changes also need to revert back ?

>
>  The change you did was not inert, and result in the IRQ being disabled u=
pon exit should a
>  SAS_TASK_STATE_ABORTED task state condition occur then following block w=
ill enable IRQ.

2.  I could not get this point.
     If "SAS_TASK_STATE_ABORTED" task state condition occurs then following
     block will enable IRQ.

          if (unlikely((t->task_state_flags & SAS_TASK_STATE_ABORTED))) {
                spin_unlock_irq(&t->task_state_lock);
           //   HERE IRQ will be enabled.
                  .......
                pm8001_ccb_task_free(pm8001_ha, t, ccb, tag);
          }

3.  How bad  will be "spin_lock_irq / spin_unlock_irq" in this case compare=
d to
     "spin_lock_irqsave / spin_unlock_irqrestore "



Regards
Santosh

>
> I propose (annotated below) you leave the flags automatic variable, but u=
ninitialized. The changes surrounding spin_*lock_irq*(&pm8001_ha->lock, fla=
gs) are OK, but revert back the changes surrounding the spin_*lock_irq*(&t-=
>task->state_lock,flags) so that lock would be properly nested.
>
> To be pedantic, and to be more correct, this code should have spawned a w=
ork queue task to perform the t->task_done(t) operation in a separate threa=
d rather than inline and precariously unlocked; but that would be beyond th=
e scope of these changes and should be left for future work to decide if it=
 is even necessary. Not sure how such a change would affect performance (us=
ing the work queue) ... so I am 'afraid' of pushing such a change in any ca=
se given the relatively reliable operation of this driver (and the dynamic =
nature of the changes Dan is making to the SATA side of things for instance=
 ;-} ).
>
> I am sorry for taking so long to get to the task of reviewing this (and t=
he previous) code. I look forward to your comments.
>
> Sincerely -- Mark Salyzyn
>
> On Feb 26, 2012, at 8:33 AM, santosh nayak wrote:
>
>> @@ -2207,7 +2206,6 @@ mpi_sata_completion(struct pm8001_hba_info *pm8001=
_ha, void *piomb)
>> static void mpi_sata_event(struct pm8001_hba_info *pm8001_ha , void *pio=
mb)
>> {
>> =A0 =A0 =A0 struct sas_task *t;
>> - =A0 =A0 unsigned long flags =3D 0;
> MGS> =A0 =A0unsigned long flags;
>> =A0 =A0 =A0 struct task_status_struct *ts;
>> =A0 =A0 =A0 struct pm8001_ccb_info *ccb;
>> =A0 =A0 =A0 struct pm8001_device *pm8001_dev;
>> @@ -2287,9 +2285,9 @@ static void mpi_sata_event(struct pm8001_hba_info =
*pm8001_ha , void *piomb)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ts->stat =3D SAS_QUEUE_FULL;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm8001_ccb_task_free(pm8001_=
ha, t, ccb, tag);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mb();/*ditto*/
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&pm8001=
_ha->lock, flags);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irq(&pm8001_ha->lo=
ck);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 t->task_done(t);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&pm8001_ha->=
lock, flags);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irq(&pm8001_ha->lock=
);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> @@ -2387,31 +2385,31 @@ static void mpi_sata_event(struct pm8001_hba_inf=
o *pm8001_ha , void *piomb)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ts->stat =3D SAS_OPEN_TO;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 }
>> - =A0 =A0 spin_lock_irqsave(&t->task_state_lock, flags);
>> + =A0 =A0 spin_lock_irq(&t->task_state_lock);
> MGS> =A0 =A0spin_lock_irqsave(&t->task_state_lock, flags);
>> =A0 =A0 =A0 t->task_state_flags &=3D ~SAS_TASK_STATE_PENDING;
>> =A0 =A0 =A0 t->task_state_flags &=3D ~SAS_TASK_AT_INITIATOR;
>> =A0 =A0 =A0 t->task_state_flags |=3D SAS_TASK_STATE_DONE;
>> =A0 =A0 =A0 if (unlikely((t->task_state_flags & SAS_TASK_STATE_ABORTED))=
) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&t->task_state_lock, fl=
ags);
>> + =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irq(&t->task_state_lock);
> MGS> =A0 =A0 =A0 =A0 =A0 =A0spin_unlock_irqrestore(&t->task_state_lock, f=
lags);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 PM8001_FAIL_DBG(pm8001_ha,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm8001_printk("task 0x%p don=
e with io_status 0x%x"
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 " resp 0x%x stat 0x%x but ab=
orted by upper layer!\n",
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 t, event, ts->resp, ts->stat=
));
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm8001_ccb_task_free(pm8001_ha, t, ccb, tag);
>> =A0 =A0 =A0 } else if (t->uldd_task) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&t->task_state_lock, fl=
ags);
>> + =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irq(&t->task_state_lock);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm8001_ccb_task_free(pm8001_ha, t, ccb, tag);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 mb();/* ditto */
>> - =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&pm8001_ha->lock, flags=
);
>> + =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irq(&pm8001_ha->lock);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 t->task_done(t);
>> - =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&pm8001_ha->lock, flags);
>> + =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irq(&pm8001_ha->lock);
>> =A0 =A0 =A0 } else if (!t->uldd_task) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&t->task_state_lock, fl=
ags);
>> + =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irq(&t->task_state_lock);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm8001_ccb_task_free(pm8001_ha, t, ccb, tag);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 mb();/*ditto*/
>> - =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&pm8001_ha->lock, flags=
);
>> + =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irq(&pm8001_ha->lock);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 t->task_done(t);
>> - =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&pm8001_ha->lock, flags);
>> + =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irq(&pm8001_ha->lock);
>> =A0 =A0 =A0 }
>> }
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
