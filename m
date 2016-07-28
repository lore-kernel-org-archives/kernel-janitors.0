From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Jul 2016 16:00:24 +0000
Subject: Re: staging: wilc1000: Reduce scope for a few variables in mac_ioctl()
Message-Id: <c178cb06-a4b2-0a43-1de1-61bd67816deb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1c4cac35-dded-ea88-45aa-3f8ac098289d@gmx.de>
 <d8d9729c-6d65-a901-1b29-c0b031e143d2@users.sourceforge.net>
 <trinity-308db848-f204-4ebe-9336-484347ffbf37-1469706334519@3capp-gmx-bs72>
In-Reply-To: <trinity-308db848-f204-4ebe-9336-484347ffbf37-1469706334519@3capp-gmx-bs72>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steve Caldwell <Steve.Caldwell@microchip.com>

> Which circumstances do "not any sense at all" imply? 

Should the expression 'strlen("RSSI")' be passed for the parameter 'length' instead?


> I suggest to fix this since it is indeed a bug,

We can agree that this function implementation was broken for a while there.


> instead of doing "micro optimizations" - which is the last thing that code in the staging area 
> needs (as IIRC you have already been told by others, including the staging maintainer).

The acceptance might grow a bit more for such software fine-tuning
(like refactoring around variable usage).

Regards,
Markus
