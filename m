From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Mon, 25 Mar 2019 07:58:35 +0000
Subject: Re: [PATCH -next] pm8001: remove set but not used variables 'param, sas_ha'
Message-Id: <CAMGffE=3PTXVeHevwC4xL4Or5xBje3UMaMHJdht14V2EAuEgAw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190323021559.113157-1-yuehaibing@huawei.com>
In-Reply-To: <20190323021559.113157-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

snip
On Sat, Mar 23, 2019 at 3:04 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/pm8001/pm8001_hwi.c: In function 'mpi_smp_completion':
> drivers/scsi/pm8001/pm8001_hwi.c:2901:6: warning:
>  variable 'param' set but not used [-Wunused-but-set-variable]
>
> drivers/scsi/pm8001/pm8001_hwi.c: In function 'pm8001_bytes_dmaed':
> drivers/scsi/pm8001/pm8001_hwi.c:3247:24: warning:
>  variable 'sas_ha' set but not used [-Wunused-but-set-variable]
>
> They're never used since introduction, so can be removed.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>

Thanks,

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
