From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 30 May 2020 10:41:40 +0000
Subject: Re: [PATCH] scsi: cumana_2: Fix different dev_id between 'request_irq()' and 'free_irq()'
Message-Id: <63fbba26-82f4-5c4b-90d6-d951eb914f50@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530073555.577414-1-christophe.jaillet@wanadoo.fr>
 <20200530094338.GE1551@shell.armlinux.org.uk>
In-Reply-To: <20200530094338.GE1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com, jejb@linux.ibm.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org


Le 30/05/2020 à 11:43, Russell King - ARM Linux admin a écrit :
> On Sat, May 30, 2020 at 09:35:55AM +0200, Christophe JAILLET wrote:
>> The dev_id used in 'request_irq()' and 'free_irq()' should match.
>> So use 'host' in both cases.
>>
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> This is itself wrong.  cumanascsi_2_intr() requires "info" as the devid.
> Either cumanascsi_2_intr() needs changing to use shost_priv(host) along
> with this change, or free_irq() needs changing to use "info".

My bad.

I've only looked at the difference of the dev_id for the 2 functions, 
not at the usage of it with the function registered by 'request_irq'. 
This one is obviously correct, or the driver would have some problems 
somewhere.
I don't know why have chosen to change request_irq and not free_irq.

So obvious. I'm a little embarrassed and will send a v2.

Thx for the quick reply and review.


All the 3 patches being in "/drivers/scsi/arm/", do you prefer only 1 
patch for the 3, or separated as I've done so far?

CJ

> Likely the same for the other patches, I haven't looked.
>
