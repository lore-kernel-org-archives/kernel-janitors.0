From: Jeff Garzik <jeff@garzik.org>
Date: Fri, 16 Jul 2010 00:51:19 +0000
Subject: Re: [PATCH 11/25] block: Convert pci_table entries to PCI_VDEVICE
Message-Id: <4C3FAD07.6040104@garzik.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007152051.18189.PeterHuewe@gmx.de> <20100715185904.GA4023@x200>
In-Reply-To: <20100715185904.GA4023@x200>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Peter Huewe <PeterHuewe@gmx.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>, Jens Axboe <jens.axboe@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, =?ISO-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org

On 07/15/2010 03:03 PM, Alexey Dobriyan wrote:
> On Thu, Jul 15, 2010 at 08:51:17PM +0200, Peter Huewe wrote:
>> This patch converts pci_table entries, where .subvendor=PCI_ANY_ID and
>> .subdevice=PCI_ANY_ID, .class=0 and .class_mask=0, to use the
>> PCI_VDEVICE macro, and thus improves readability.
>
> Well, it doesn't improve readability, and ## usage prevents grepping and
> long term plan to switch to numbers instead of PCI_VENDOR_ID_*,
> but whatever.
>
>> -	{ PCI_VENDOR_ID_PROMISE, 0x8000, PCI_ANY_ID, PCI_ANY_ID, 0, 0, },
>> -	{ PCI_VENDOR_ID_PROMISE, 0x8002, PCI_ANY_ID, PCI_ANY_ID, 0, 0, },
>> +	{ PCI_VDEVICE(PROMISE, 0x8000), },
>> +	{ PCI_VDEVICE(PROMISE, 0x8002), },

Switching to use hex numbers for _device ids_ is encouraged, because 
history has proven its pointless to create named constants for 
single-use ids.  However, using named constants for PCI vendor ids makes 
a lot of sense.

	Jeff




