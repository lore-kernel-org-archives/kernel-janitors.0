From: Michael Veeck <michael.veeck@gmx.net>
Date: Wed, 07 Apr 2004 07:56:23 +0000
Subject: Re: [Kernel-janitors] [PATCH] clean up  drivers/scsi/pcmcia/nsp_cs
Message-Id: <4073B427.9080109@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76821491992226421=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <407340C0.7050401@gmx.net>
In-Reply-To: <407340C0.7050401@gmx.net>
To: kernel-janitors@vger.kernel.org

--===============76821491992226421==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


Daniele Bellucci wrote:
> On Wed, Apr 07, 2004 at 01:44:00AM +0200, Michael Veeck wrote:
> |This patch (against 2.6.5) removes some unnecessary macros from 
> |drivers/scsi/pcmcia/nsp_cs.c and .h
> |
> |One Question: Like MIN/MAX and ARRAY_SIZE, it seems that BIT(x) is also 
> | defined a thousand times in the kernel. But which macro should be 
> |used? Here I included linux/input.h, but I do appreciate feedback on 
> |which version is the safest.
> 
> .. the problem occours with the dbg/info/warn macros defined in include/linux/usb.h
> 
> there are many other places where macro like that are defined in a different way,
> why don't we store all these usefull macros to a different file?
> 

Well, some (like the ones I mentioned) are already in 
include/linux/kernel.h. That could be the right place for a safe BIT 
method I think.

--===============76821491992226421==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76821491992226421==--
