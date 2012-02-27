From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Mon, 27 Feb 2012 04:58:43 +0000
Subject: Re: [PATCH 1/2] [SCSI] pm8001: Fix bogus interrupt state flag issue.
Message-Id: <CAOD=uF4VGsM5AQTSCW4ZRr_n4HUSr0qO3fG_MAtsYgq=ogXvAQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330263210-25134-1-git-send-email-santoshprasadnayak@gmail.com>
	<20120226150720.GB4763@mwanda>
In-Reply-To: <20120226150720.GB4763@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: jack_wang@usish.com, lindar_liu@usish.com, JBottomley@parallels.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

 In 'mpi_sata_completion'
 the first call for 'spin_unlock_irqrestore()' is with flags=3D0,
 which is as good as 'spin_unlock_irq()' ( unconditional interrupt
 enabling). If intention of the developer is to enable the interrupt during
execution of ' mpi_sata_completion' , then the code changes in the patch
looks ok.

If interrupt should not be enabled during execution of
'mpi_sata_completion' then
we can use simple  spin_lock and spin_unlock.


regards
santosh


On Sun, Feb 26, 2012 at 8:37 PM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> On Sun, Feb 26, 2012 at 07:03:30PM +0530, santosh nayak wrote:
>> From: Santosh Nayak <santoshprasadnayak@gmail.com>
>>
>> Static checker is giving following warning:
>> " error: calling 'spin_unlock_irqrestore()' with bogus flags"
>>
>> The code flow is as shown below:
>> process_oq() --> process_one_iomb --> mpi_sata_completion
>>
>> In 'mpi_sata_completion'
>> the first call for 'spin_unlock_irqrestore()' is with flags=3D0,
>> which is as good as 'spin_unlock_irq()' ( unconditional interrupt
>> enabling).
>>
>> So for better performance 'spin_unlock_irqrestore()' can be replaced
>> with 'spin_unlock_irq()' and 'spin_lock_irqsave()' can be replaced by
>> 'spin_lock_irq()'.
>>
>
> process_oq() is called from the interrupt handler pm8001_chip_isr()
> with interrupts disabled.
>
> drivers/scsi/pm8001/pm8001_hwi.c
> =A04301 =A0 =A0 =A0 =A0 =A0spin_lock_irqsave(&pm8001_ha->lock, flags);
> =A04302 =A0 =A0 =A0 =A0 =A0pm8001_chip_interrupt_disable(pm8001_ha);
> =A04303 =A0 =A0 =A0 =A0 =A0process_oq(pm8001_ha);
> =A04304 =A0 =A0 =A0 =A0 =A0pm8001_chip_interrupt_enable(pm8001_ha);
> =A04305 =A0 =A0 =A0 =A0 =A0spin_unlock_irqrestore(&pm8001_ha->lock, flags=
);
>
> Probably we should just be doing a spin_lock() and spin_unlock()
> without re-enabling the IRQs. =A0Should we even be doing that in the
> irq handler anyway?
>
> regards,
> dan carpenter
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
