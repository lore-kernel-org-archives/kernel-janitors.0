From: "Sivakumar Subramani" <Sivakumar.Subramani@neterion.com>
Date: Thu, 16 Aug 2007 06:43:11 +0000
Subject: [KJ] RE: drivers/net/tokenring/3c359.c
Message-Id: <78C9135A3D2ECE4B8162EBDCE82CAD77020EEEC6@nekter>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1187000010.29518.27.camel@bluegenie> <46C14297.1050800@garzik.org>
In-Reply-To: <46C14297.1050800@garzik.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jeff@garzik.org>, surya.prabhakar@wipro.com
Cc: mikep@linuxtr.net, netdev@vger.kernel.org, linux-tr@linuxtr.net, Linux Kernel <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>

What exactly the difference between kzalloc and kcalloc? From the
definition, I could see that kcalloc should be used for array
allocation. But I could see kzalloc is used for allocation arrays as in
the below patch.

Any coding standard (or) developers can use kzalloc and kcalloc as per
their coding practice??

Thanks,
~Siva
-----Original Message-----
From: netdev-owner@vger.kernel.org [mailto:netdev-owner@vger.kernel.org]
On Behalf Of Jeff Garzik
Sent: Tuesday, August 14, 2007 11:20 AM
To: surya.prabhakar@wipro.com
Cc: mikep@linuxtr.net; netdev@vger.kernel.org; linux-tr@linuxtr.net;
Linux Kernel; kernel-janitors
Subject: Re: drivers/net/tokenring/3c359.c

Surya Prabhakar N wrote:
> Hi,
>    Replacing kmalloc with kzalloc and cleaning up memset in 
> drivers/net/tokenring/3c359.c
> 
> 
> Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>

applied


-
To unsubscribe from this list: send the line "unsubscribe netdev" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
