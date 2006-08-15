From: Henne <henne@nachtwindheim.de>
Date: Tue, 15 Aug 2006 09:48:29 +0000
Subject: Re: [KJ] [PATCH] Change pci_module_init from macro to inline
Message-Id: <44E1986D.8030008@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44E18DE2.8020700@nachtwindheim.de> <1155634967.3011.81.camel@laptopd505.fenrus.org>
In-Reply-To: <1155634967.3011.81.camel@laptopd505.fenrus.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arjan van de Ven <arjan@infradead.org>
Cc: gregkh@suse.de, linux-pci@atrey.karlin.mff.cuni.cz, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Arjan van de Ven schrieb:
> On Tue, 2006-08-15 at 11:03 +0200, Henne wrote:
>> From: Henrik Kretzschmar <henne@nachtwindheim.de>
>>
>> Replaces the pci_module_init()-macro with a inline function,
>> which is marked as deprecated.
>> This gives a warning at compile time, which may be useful for driver developers who still use
>> pci_module_init() on 2.6 drivers.
> 
> Hi,
> 
> good work, but  please stick this also in feature-removal.txt with a
> hard date on it, otherwise we can never get rid of it.....
> 
> Greetings,
>    Arjan van de Ven
> 
Hi,

it's already in that file since Feb06 ;).
The removal date is Jan07.

Greets,
Henne
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
