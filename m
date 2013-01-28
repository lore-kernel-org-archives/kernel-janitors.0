From: walter harms <wharms@bfs.de>
Date: Mon, 28 Jan 2013 12:06:23 +0000
Subject: Re: [patch] TTY: synclink, small cleanup in dtr_rts()
Message-Id: <510669BF.9090706@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130127194039.GA18787@elgon.mountain>	 <1359317078.14406.12.camel@joe-AO722> <20130127201947.GO16282@mwanda> <1359320401.14406.16.camel@joe-AO722>
In-Reply-To: <1359320401.14406.16.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, Paul Fulghum <paulkf@microgate.com>, David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 27.01.2013 22:00, schrieb Joe Perches:
> On Sun, 2013-01-27 at 23:19 +0300, Dan Carpenter wrote:
>> On Sun, Jan 27, 2013 at 12:04:38PM -0800, Joe Perches wrote:
>>> Wouldn't it be clearer still to use | instead of +
>> Yeah.  I think it would be, but adding bitflags together instead of
>> doing bitwise ORs is very common as well.
> 
> Fortunately, less and less so.
> 
> Another option might be to add another #define
> to include/uapi/linux/synclink.h
> 
> #define SerialSignal_DTR_RTS	(SerialSignal_DTR | SerialSignal_RTS)


Do you really want every possible combination ready as define ?
please stay with: (SerialSignal_DTR | SerialSignal_RTS)
Everyone using serial should know about DTR and RTS

re,
 wh
