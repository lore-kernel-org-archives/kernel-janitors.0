From: Matthew Martin <lihnucks@gmail.com>
Date: Wed, 12 Jul 2006 12:05:03 +0000
Subject: Re: [KJ] [PATCH] Convert DPRINTK to pr_debug in drivers/scsi/ahci.c
Message-Id: <44B4E56F.6040703@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44B44D3A.8010101@gmail.com>
In-Reply-To: <44B44D3A.8010101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Domen Puncer wrote:
> On 11/07/06 20:15 -0500, Matthew Martin wrote:
>   
>> Hello,
>>     This converts DPRINTK to pr_debug in drivers/scsi/ahci.c
>>     
>
> If you look at libata.h, you see that DPRINTK also includes the
> function name.
>
> Maybe it's better left as it is (it looks like it's a part of
> libata api).
>
>
> 	Domen
>
>   
Then someone should take it off the Kernel Janitor TODO list...
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
