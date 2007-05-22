From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 22 May 2007 14:48:48 +0000
Subject: Re: [KJ] what's the value of "NORET_TYPE"?
Message-Id: <Pine.LNX.4.64.0705221048260.14953@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705211425310.25535@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705211425310.25535@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 22 May 2007, walter harms wrote:

> hi,
>
> a quick grep -r looks promissing:
>
> most times it is used like this:
> kernel/exit.c:fastcall NORET_TYPE void do_exit(long code)
>
> my favourite:
> include/linux/kexec.h:extern NORET_TYPE void machine_kexec(struct kimage *image) ATTRIB_NORET;
>
> since all defines do "" and i see no #IF  ...  --> s/NORET_TYPE//g
>
> In some cases  it is used in place of ATTRIB_NORET
> some janitor may like to  replace it

yeah, i've got a patch ready for testing, i'll take care of it.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
