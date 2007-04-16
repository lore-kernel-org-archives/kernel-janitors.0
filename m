From: "Antonino A. Daplas" <adaplas@gmail.com>
Date: Mon, 16 Apr 2007 21:25:34 +0000
Subject: Re: [KJ] [PATCH]vfc_dev.c-kzalloc
Message-Id: <1176758734.10238.3.camel@daplas>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1176703528.13066.9.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1176703528.13066.9.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vignesh.babu@wipro.com
Cc: kernel-janitors@lists.osdl.org, linux-fbdev-devel@lists.sourceforge.net

On Mon, 2007-04-16 at 11:35 +0530, vignesh.babu@wipro.com wrote:
> Replacing kmalloc/memset combination with kzalloc.

Wrong subsystem, it's not a framebuffer but a frame grabber, and it's a
Sparc only device.  Maintainers: Ultrasparc (David Miller), Sparc
(William L. Irvin)

Tony


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
