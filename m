From: Daniele Bellucci <bellucda@tiscali.it>
Date: Tue, 27 Jan 2004 21:54:19 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/video/fbcmap.c kmalloc audit
Message-Id: <20040127215419.GA5967@charlie.minidns.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
In-Reply-To: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


|+ err_transp:
|+    kfree(cmap->blue);
|+ err_blue:
|+    kfree(cmap->green);
|+ err_green:
|+    kfree(cmap->red);
|+ err_red:
|+    cmap->red = cmap->green = cmap->blue = cmap->transp = NULL;
|+    cmap->len = 0;
|+    return -1;  <--+
                     |
---------------------+
|
+-> IMHO "return -1" should be replaced with "return -ENOMEM"


Tnx.




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
