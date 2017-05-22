From: Oliver Neukum <oneukum@suse.com>
Date: Mon, 22 May 2017 07:08:45 +0000
Subject: Re: [PATCH 2/2] usbnet: Improve a size determination in usbnet_write_cmd_async()
Message-Id: <1495436925.11462.1.camel@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a81c2551-ce6c-967d-1120-4307f95b1e65@users.sourceforge.net>
         <d5ae61d4-8339-29e4-e91c-90ba644d69aa@users.sourceforge.net>
In-Reply-To: <d5ae61d4-8339-29e4-e91c-90ba644d69aa@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Am Montag, den 22.05.2017, 07:10 +0200 schrieb SF Markus Elfring:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 22 May 2017 06:42:33 +0200
> 
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Acked-by: Oliver Neukum <oneukum@suse.com>
