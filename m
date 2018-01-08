From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 13:24:41 +0000
Subject: Re: [PATCH 1/3] GenWQE: Delete an error message for a failed memory allocation in genwqe_user_vmap()
Message-Id: <feee4e15-8230-6124-2a6d-6d1090ce1813@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e1b73b1a-ae0a-b76b-33d7-4dc5af8e39b5@users.sourceforge.net>
 <b77e137c-6fb2-e5fa-3e18-9d611dd4f0c1@users.sourceforge.net>
 <127e28a8a4d9081eb323e3c7ab93dad0@linux.vnet.ibm.com>
In-Reply-To: <127e28a8a4d9081eb323e3c7ab93dad0@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Frank Haverkamp <haver@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?J=c3=b6rg-Stephan_Vogt?= <jsvogt@de.ibm.com>, Michael Jung <MIJUNG@de.ibm.com>, =?UTF-8?Q?Michael_R=c3=bcttger?= <michael@ibmra.de>

>> @@ -593,7 +593,6 @@ int genwqe_user_vmap(struct genwqe_dev *cd, struct
>> dma_mapping *m, void *uaddr,
>>                     sizeof(struct page *) + sizeof(dma_addr_t),
>>                     GFP_KERNEL);
>>      if (!m->page_list) {
>> -        dev_err(&pci_dev->dev, "err: alloc page_list failed\n");
> 
> Are there different printouts which cover this?

Is this error message redundant?


> I mean the debug printout is not appearing all the time,
> it must be enabled, if I remember correctly.

Would you like to clarify corresponding configuration possibilities any more?


> So why do you suggest to remove it?

Can the Linux allocation failure report be sufficient for this use case already?

Regards,
Markus
