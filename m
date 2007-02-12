From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 12 Feb 2007 16:54:07 +0000
Subject: Re: [KJ] need a better name for existing "FIELD_SIZE" macro sound/.
Message-Id: <Pine.LNX.4.64.0702121149340.25839@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702120748030.23229@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702120748030.23229@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 12 Feb 2007, walter harms wrote:

>
> in my old kernel code is is only used inside the vx driver.
> IMHO it can be replaced with VX_FIELD_SIZE
>
> is is only used by functions in .h (eek) and one .c code.

that's not quite true in the latest "git pull":

$ grep -rwl FIELD_SIZE sound
sound/drivers/vx/vx_cmd.h
sound/drivers/vx/vx_pcm.c
sound/pci/pcxhr/pcxhr_core.h
sound/pci/pcxhr/pcxhr_hwdep.c
sound/pci/pcxhr/pcxhr_core.c

i *could* submit a patch renaming that macro to VX_FIELD_SIZE and
PCXHR_FIELD_SIZE respectively but, if you want to look at those files
more closely, it *seems* that that field represents the same thing in
each, and i'd hate to deliberately rename a macro to two different
names for no good reason when they represent the same thing.

is there a more descriptive name that might be used that describes
what that field is *for*?

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
