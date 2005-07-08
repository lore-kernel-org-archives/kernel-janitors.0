From: James Lamanna <jlamanna@gmail.com>
Date: Fri, 08 Jul 2005 18:04:05 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/advansys.c: Convert pci_find_device()
Message-Id: <aa4c40ff05070811046bada462@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <aa4c40ff0507071414328c64ad@mail.gmail.com>
In-Reply-To: <aa4c40ff0507071414328c64ad@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 7/8/05, Greg KH <greg@kroah.com> wrote:
[snip]
> Why not just move this out of the if statement as you are doing it
> either way?

Depending on whether the board is a "wide" or "narrow" board, the dev
struct is stored in a different field of the union (adv_dvc_cfg vs.
asc_dvc_cfg - not much difference in names there, easy to miss)

 
> Also, this driver doesn't even work, see the big #warning at the top of
> it.  You might want to ask the linux-scsi list if it's obsolete.

Ah, apparently I'm blind.
I guess this was the first driver I stumbled upon needing the conversion.
I'll check around about that.
I'll also see if there are any non-broken/warned drivers that need
this fix that I can tackle.

Thanks.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
