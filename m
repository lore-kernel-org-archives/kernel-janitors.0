From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 01 Oct 2005 08:35:15 +0000
Subject: Re: [KJ] [PATCH] printk: arch/i386/kernel/doublefault.c
Message-Id: <20051001083515.GB1281@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46575122275936065=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <433DA691.6080804@users.sourceforge.net>
In-Reply-To: <433DA691.6080804@users.sourceforge.net>
To: kernel-janitors@vger.kernel.org

--===============46575122275936065==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Besides the points Nish alreaqdy brought up:

On 2005-09-30 at 22:56:49 +0200, Dinolinux <slackfan@users.sourceforge.net> wrote:
> printk() should include the appropriate KERN_* constant.

But not always KERN_ERR. See include/linux/kernel.h for all KERN_*
constants. Also it is better to write:
	printk(KERN_ERR "Some error message");
instead of
	printk(KERN_ERR"Some error message");
as you did.

Cheers, Tobias

--===============46575122275936065==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46575122275936065==--
