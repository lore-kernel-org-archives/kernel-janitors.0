From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 27 Jan 2004 22:05:18 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/video/fbcmap.c kmalloc audit
Message-Id: <20040127140518.0bda42b0.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
In-Reply-To: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 27 Jan 2004 22:54:19 +0100 Daniele Bellucci <bellucda@tiscali.it> wrote:

| 
| |+ err_transp:
| |+    kfree(cmap->blue);
| |+ err_blue:
| |+    kfree(cmap->green);
| |+ err_green:
| |+    kfree(cmap->red);
| |+ err_red:
| |+    cmap->red = cmap->green = cmap->blue = cmap->transp = NULL;
| |+    cmap->len = 0;
| |+    return -1;  <--+
|                      |
| ---------------------+
| |
| +-> IMHO "return -1" should be replaced with "return -ENOMEM"


Maybe in theory.  In practice it is documented to return 0 for
success or -1 on error.  Changing that would require auditing all
callers of it....

--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
