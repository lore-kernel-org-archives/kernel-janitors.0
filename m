From: Ingo Molnar <mingo@elte.hu>
Date: Sun, 17 Oct 2004 16:19:53 +0000
Subject: [KJ] Re: [PATCH 0/8] replacing/fixing printk with pr_debug/pr_info
Message-Id: <20041017161953.GA24810@elte.hu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22273247455900957=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1098031764.3023.45.camel@pdp11.tsho.org>
In-Reply-To: <1098031764.3023.45.camel@pdp11.tsho.org>
To: Daniele Pizzoni <auouo@tin.it>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, LKML <linux-kernel@vger.kernel.org>

--===============22273247455900957==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


* Daniele Pizzoni <auouo@tin.it> wrote:

> Hello, I'm going to post a series of small janitorial patches focused on
> 1) replacing DPRINTK-style macros with pr_debug from kernel.h
> 2) replacing printk(KERN_INFO ...) with pr_info(...)
> 3) fixing _obvious_ inconsistencies of printk levels as:
> 
> printk(KERN_INFO "Start... ");
> ...
> printk("Ok!\n");

1) be careful, there is no inconsistency here. It's a printk that doesnt
end in a "\n" in the first line.

2) i dont like the pr_print name at all. What's wrong with Dprintk or
dprintk? Just define them in kernel.h, this will also make your patch
much smaller.

	Ingo

--===============22273247455900957==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22273247455900957==--
