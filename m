From: David Brownell <david-b@pacbell.net>
Date: Tue, 13 Jul 2004 19:16:14 +0000
Subject: [Kernel-janitors] Re: [linux-usb-devel] no set_current_state()
Message-Id: <40F434FE.5020403@pacbell.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6574552762091801=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200407132053.18110.oliver@neukum.org>
In-Reply-To: <200407132053.18110.oliver@neukum.org>
To: kernel-janitors@vger.kernel.org

--===============6574552762091801==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Nishanth Aravamudan wrote:

> drivers/usb/gadget/pxa2xx_udc.c::udc_enable()
> 
> If someone could tell me which state (TASK_INTERRUPTIBLE or 
> TASK_UNINTERRUPTIBLE) is desired, I can fix this and perhaps replace the 
> calls with msleep().

That'd make a fine msleep(), thanks.

- Dave


--===============6574552762091801==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6574552762091801==--
