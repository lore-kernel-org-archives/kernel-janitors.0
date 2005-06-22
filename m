From: randy_dunlap <rdunlap@xenotime.net>
Date: Wed, 22 Jun 2005 19:23:57 +0000
Subject: Re: [KJ] [PATCH 2.6.12] /proc/tty/driver/* filtering for non
Message-Id: <20050622122357.2840b952.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35253644293917796=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622190147.GA4848@dansme-mobile.smertnig>
In-Reply-To: <20050622190147.GA4848@dansme-mobile.smertnig>
To: kernel-janitors@vger.kernel.org

--===============35253644293917796==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jun 2005 21:01:48 +0200 Daniel Smertnig wrote:

| Only give out non-sensitive information to CAP_SYS_RAWIO users in
| /proc/tty/driver/* and make it world-readable, as described in the
| kernel janitors TODO:
| 
|   "go through all the tty/serial drivers and make sure they don't give out
|   excessively useful information to non CAP_SYS_RAWIO users, then loosen
|   permissions. [D: http://lkml.org/lkml/2005/1/17/94]"

    "make sure files still build with patches made" (rdd, 2005.june.22 :)


| Only port settings (irqs, baud rate, flow control configuration, ...)
| are given to ordinary users. Current port status (tx, rx, error
| counters, status flags, ...) is limited to CAP_SYS_RAWIO users.
| 
| The following files where checked (should be all serial drivers which
| implement the tty read_proc function):
| 
|   arch/ia64/hp/sim/simserial.c
|   drivers/usb/serial/usb-serial.c
|   drivers/char/synclinkmp.c
|   drivers/char/istallion.c
|   drivers/char/amiserial.c
|   drivers/char/cyclades.c
|   drivers/char/stallion.c
|   drivers/char/pcmcia/synclink_cs.c
|   drivers/char/ip2main.c
|   drivers/char/synclink.c
|   drivers/isdn/capi/capi.c
|   drivers/serial/crisv10.c
|   drivers/serial/serial_core.c
|   drivers/serial/mcfserial.c
|   drivers/serial/68360serial.c
|   drivers/macintosh/macserial.c
|   net/irda/ircomm/ircomm_tty.c
|   net/bluetooth/rfcomm/tty.c
| 
| Signed-off-by: Daniel Smertnig <daniel.smertnig@gmail.com>
| 
| diff --git a/drivers/char/amiserial.c b/drivers/char/amiserial.c
| --- a/drivers/char/amiserial.c
| +++ b/drivers/char/amiserial.c
| @@ -1876,6 +1876,17 @@ static inline int line_info(char *buf, s
|  		info->quot = 0;
|  		info->tty = NULL;
|  	}
| +
| +	if (info->quot) {
| +		ret += sprintf(buf+ret, " baud:%d",
| +			       state->baud_base / info->quot);
| +	}
| +
| +	if (!cabale(CAP_SYS_RAWIO)) {

	     capable()

| +		strcat(buf, "\n");
| +		return ret + 1;
| +	}
| +	
|  	local_irq_save(flags);
|  	status = ciab.pra;
|  	control = info ? info->MCR : status;

| diff --git a/drivers/serial/serial_core.c b/drivers/serial/serial_core.c
| --- a/drivers/serial/serial_core.c
| +++ b/drivers/serial/serial_core.c
| @@ -1616,7 +1616,7 @@ static int uart_line_info(char *buf, str
|  		return ret + 1;
|  	}
|  
| -	if(capable(CAP_SYS_ADMIN))
| +	if(capable(CAP_SYS_RAWIO))

Please use:
	if (capable(....
This is the only instance of "if(" in that source file.

|  	{
|  		status = port->ops->get_mctrl(port);
|  


Isn't there a desire to use something other than sprintf()
to prevent buffer overflows?
(if so, should be a separate patch, not mixed with this patch)

---
~Randy

--===============35253644293917796==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35253644293917796==--
