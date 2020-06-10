From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 10 Jun 2020 05:36:16 +0000
Subject: Re: [PATCH] scsi: eesox: Fix different dev_id between 'request_irq()' and 'free_irq()'
Message-Id: <26d388f5-be67-b643-c76c-b9fe52f111f7@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530073418.577210-1-christophe.jaillet@wanadoo.fr>
 <159175686975.7062.16533438955437978870.b4-ty@oracle.com>
In-Reply-To: <159175686975.7062.16533438955437978870.b4-ty@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Martin K. Petersen" <martin.petersen@oracle.com>, jejb@linux.ibm.com, linux@armlinux.org.uk
Cc: kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

Le 10/06/2020 à 04:41, Martin K. Petersen a écrit :
> On Sat, 30 May 2020 09:34:18 +0200, Christophe JAILLET wrote:
>
>> The dev_id used in 'request_irq()' and 'free_irq()' should match.
>> So use 'host' in both cases.
> Applied to 5.8/scsi-queue, thanks!
>
> [1/1] scsi: eesox: Fix different dev_id between request_irq() and free_irq()
>        https://git.kernel.org/mkp/scsi/c/3bab76807d95
>
Please revert, the patch is bogus, as spotted by Russell King - ARM 
Linux admin <linux@armlinux.org.uk>.
See [1].

I'll try to send the correct fix by this week-end.

CJ

[1]: https://marc.info/?l=linux-scsi&m9083184215730&w=4
