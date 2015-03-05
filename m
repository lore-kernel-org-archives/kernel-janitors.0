From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 05 Mar 2015 11:46:15 +0000
Subject: Re: [patch] m68k: remove a superflous KERN_ERR
Message-Id: <CAMuHMdVEz_vxeXe+gNo6kTBtDV3AKxjjUm8Xh-+J5S_77iZ_bA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150305112700.GC13378@mwanda>
In-Reply-To: <20150305112700.GC13378@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>

On Thu, Mar 5, 2015 at 12:27 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> pr_err() has a KERN_ERR built in.  Smatch complains about these nowadays.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks! Will apply and queue for v4.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
