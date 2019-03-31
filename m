From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Sun, 31 Mar 2019 17:49:18 +0000
Subject: Re: [PATCH 1/2] scsi: pm8001: clean up structurally dead code when PM8001_USE_MSIX is defined
Message-Id: <CAMGffE=byzyhREomahYv9-VfiTYd2K3NoKPJc0p9K3f5fwUKPA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <822122908.274859.1553944071609@ox-groupware.bfs.de>
In-Reply-To: <822122908.274859.1553944071609@ox-groupware.bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: Colin King <colin.king@canonical.com>, Jack Wang <jinpu.wang@profitbricks.com>, lindar_liu <lindar_liu@usish.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Mar 30, 2019 at 12:07 PM Walter Harms <wharms@bfs.de> wrote:
>
> the ifdef jungle does not make thinks more readable. I am aware that
> using neg is also not good but in this special case it seems helpful
> to have only one branch, like:
>
> static u32 pm80xx_chip_is_our_interupt(struct pm8001_hba_info *pm8001_ha)
> {
> #ifndef PM8001_USE_MSIX
>         u32 value;
>
>         value = pm8001_cr32(pm8001_ha, 0, MSGU_ODR);
>         if (!value)
>                 return 0;
> #endif
>         return 1;
>
>   }
>
> just my 2 cents,
>
> re,
>  wh

Both version looks good to me, I've acked Colin's version.

Thanks!

-- 
Jack Wang
Linux Kernel Developer

1&1 IONOS Cloud GmbH | Greifswalder Str. 207 | 10405 Berlin | Germany
Phone: +49 30 57700-8042 | Fax: +49 30 57700-8598
E-mail: jinpu.wang@cloud.ionos.com | Web: www.ionos.de


Head Office: Berlin, Germany
District Court Berlin Charlottenburg, Registration number: HRB 125506 B
Executive Management: Christoph Steffens, Matthias Steinberg, Achim Weiss

Member of United Internet

This e-mail may contain confidential and/or privileged information. If
you are not the intended recipient of this e-mail, you are hereby
notified that saving, distribution or use of the content of this
e-mail in any way is prohibited. If you have received this e-mail in
error, please notify the sender and delete the e-mail.
