From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 17 Oct 2004 18:10:37 +0000
Subject: [KJ] Re: [PATCH 0/8] replacing/fixing printk with pr_debug/pr_info
Message-Id: <Pine.GSO.4.61.0410172006060.27743@waterleaf.sonytel.be>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82205830719646023=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1098031764.3023.45.camel@pdp11.tsho.org> <20041017161953.GA24810@elte.hu>
In-Reply-To: <20041017161953.GA24810@elte.hu>
To: Ingo Molnar <mingo@elte.hu>
Cc: Daniele Pizzoni <auouo@tin.it>, kernel-janitors <kernel-janitors@lists.osdl.org>, LKML <linux-kernel@vger.kernel.org>

--===============82205830719646023==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 17 Oct 2004, Ingo Molnar wrote:
> * Daniele Pizzoni <auouo@tin.it> wrote:
> 
> > Hello, I'm going to post a series of small janitorial patches focused on
> > 1) replacing DPRINTK-style macros with pr_debug from kernel.h
> > 2) replacing printk(KERN_INFO ...) with pr_info(...)
> > 3) fixing _obvious_ inconsistencies of printk levels as:
> > 
> > printk(KERN_INFO "Start... ");
> > ...
> > printk("Ok!\n");
> 
> 1) be careful, there is no inconsistency here. It's a printk that doesnt
> end in a "\n" in the first line.

Indeed.

Iff you ever want to replace the above, make sure to do it like this:

    printk_info("Start... ");
    ...
    printkc_info("Ok!\n");

(with `printkc_info()' being a continuation of `printk_info()'. And do the same
for all other KERN_* variations. This would add real value, since the next step
is to make the printk{,c}_*() definitions conditionally empty for embedded
systems and/or systems with few memory.

Gr{oetje,eeting}s,

						Geert

P.S. The naming conventions above are purely hypothetical. I suggest we first
     have a few Holy Wars(tm) about them before settling :-)
--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

--===============82205830719646023==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82205830719646023==--
