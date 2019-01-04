From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 04 Jan 2019 22:05:45 +0000
Subject: Re: [PATCH] octeontx2-af: Fix a resource leak in an error handling path in 'cgx_probe()'
Message-Id: <dd1f46d1-8ab7-260d-6e3c-e1ecdcc745d5@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181229164222.15791-1-christophe.jaillet@wanadoo.fr>
 <20190104.124626.1177296586022194416.davem@davemloft.net>
In-Reply-To: <20190104.124626.1177296586022194416.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: David Miller <davem@davemloft.net>
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com, jerinj@marvell.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 04/01/2019 à 21:46, David Miller a écrit :
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Date: Sat, 29 Dec 2018 17:42:22 +0100
>
>> If an error occurs after the call to 'pci_alloc_irq_vectors()', we must
>> call 'pci_free_irq_vectors()' in order to avoid a	resource leak.
>>
>> The same sequence is already in place in the corresponding 'cgx_remove()'
>> function.
>>
>> Fixes: 1463f382f58d ("octeontx2-af: Add support for CGX link management")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Applied and queued up for -stable.
>
> Please fix the date and time on your computer, putting improper dates into
> the email headers of your patch postings makes your patch appear out
> of order in my patchwork queue.
>
> Thank you.
>
Hi,

yes, I've spotted this time issue.
For some reason my VM get out of synch when restored from a saved state.
It was not the case before. It is likely due to an update of VirtualBox 
(i.e. 5.x --> 6.0) performed a few days ago.
Will try to give it a look.

For now, I have to manually do some ntpdate to get the time/date 
fixed... until the next save/restore of the VM.

Sorry for the inconvenience.

CJ
