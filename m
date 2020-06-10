From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 10 Jun 2020 05:35:49 +0000
Subject: Re: [PATCH] scsi: powertec: Fix different dev_id between 'request_irq()' and 'free_irq()'
Message-Id: <08f63617-03df-71cf-70c4-00f08a9f51d8@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530072933.576851-1-christophe.jaillet@wanadoo.fr>
 <159175686974.7062.8526082970785072740.b4-ty@oracle.com>
In-Reply-To: <159175686974.7062.8526082970785072740.b4-ty@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Martin K. Petersen" <martin.petersen@oracle.com>, jejb@linux.ibm.com, linux@armlinux.org.uk
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org

Le 10/06/2020 à 04:41, Martin K. Petersen a écrit :
> On Sat, 30 May 2020 09:29:33 +0200, Christophe JAILLET wrote:
>
>> The dev_id used in 'request_irq()' and 'free_irq()' should match.
>> So use 'host' in both cases.
> Applied to 5.8/scsi-queue, thanks!
>
> [1/1] scsi: powertec: Fix different dev_id between request_irq() and free_irq()
>        https://git.kernel.org/mkp/scsi/c/af7b415a1ebf
>
Please revert, the patch is bogus, as spotted by Russell King - ARM 
Linux admin <linux@armlinux.org.uk>.
See [1].

I'll try to send the correct fix by this week-end.

CJ

[1]: https://marc.info/?l=linux-scsi&m9083184215730&w=4
