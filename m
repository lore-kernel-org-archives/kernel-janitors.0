From: Daniele Bellucci <bellucda@tiscali.it>
Date: Tue, 27 Jan 2004 22:17:39 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/video/fbcmap.c kmalloc audit
Message-Id: <20040127221739.GA6630@charlie.minidns.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
In-Reply-To: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jan 27, 2004 at 02:05:18PM -0800, Randy.Dunlap wrote:
|On Tue, 27 Jan 2004 22:54:19 +0100 Daniele Bellucci <bellucda@tiscali.it> wrote:
|
|| 
|| |+ err_transp:
|| |+    kfree(cmap->blue);
|| |+ err_blue:
|| |+    kfree(cmap->green);
|| |+ err_green:
|| |+    kfree(cmap->red);
|| |+ err_red:
|| |+    cmap->red = cmap->green = cmap->blue = cmap->transp = NULL;
|| |+    cmap->len = 0;
|| |+    return -1;  <--+
||                      |
|| ---------------------+
|| |
|| +-> IMHO "return -1" should be replaced with "return -ENOMEM"
|
|
|Maybe in theory.  In practice it is documented to return 0 for
|success or -1 on error.  Changing that would require auditing all
|callers of it....

I would be very surprised to see " if (retval = -1) " in the code
of any caller, BTW patch apparently looks good to me.

A quick find/grep shows that a few callers didn't audit
the return code.


-- 

Daniele.




"I could have made money this way, and perhaps amused myself writing code. 
But I knew that at the end of my career, I would look back on years of 
building walls to divide people, and feel I had spent my life making the 
world a worse place."                               
                                                          Richard Stallman

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
