From: Paulo Marques <pmarques@grupopie.com>
Date: Fri, 22 Sep 2006 11:32:15 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/block [sane version]
Message-Id: <4513C9BF.7040706@grupopie.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609202311t47038692x5627f51d69f28209@mail.gmail.com>	 <20060921072017.GA27798@us.ibm.com>	 <6b4e42d10609212240i3d02241djbdaa0176ab9bfb2b@mail.gmail.com> <6b4e42d10609212304o52bbc9b4y434bbd7ef71281e3@mail.gmail.com> <4513A21C.40704@gmail.com>
In-Reply-To: <4513A21C.40704@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>
Cc: Om Narasimhan <om.turyx@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Jiri Slaby wrote:
> Om Narasimhan wrote:
>> [...]
>> --- a/drivers/block/cpqarray.c
>> +++ b/drivers/block/cpqarray.c
>> @@ -424,7 +424,7 @@ static int __init cpqarray_register_ctlr
>>     hba[i]->cmd_pool = (cmdlist_t *)pci_alloc_consistent(
>>         hba[i]->pci_dev, NR_CMDS * sizeof(cmdlist_t),
>>         &(hba[i]->cmd_pool_dhandle));
>> -    hba[i]->cmd_pool_bits = kmalloc(
>> +    hba[i]->cmd_pool_bits = kzalloc(
>>         ((NR_CMDS+BITS_PER_LONG-1)/BITS_PER_LONG)*sizeof(unsigned long),
>>         GFP_KERNEL);
> 
> kcalloc?

Agreed on every comment except this one. That complex expression is 
really just a constant in the end, so there is no point in using kcalloc.

-- 
Paulo Marques - www.grupopie.com

"The face of a child can say it all, especially the
mouth part of the face."
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
