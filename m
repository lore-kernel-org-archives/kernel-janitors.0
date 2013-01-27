From: Joe Perches <joe@perches.com>
Date: Sun, 27 Jan 2013 21:00:01 +0000
Subject: Re: [patch] TTY: synclink, small cleanup in dtr_rts()
Message-Id: <1359320401.14406.16.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130127194039.GA18787@elgon.mountain>
	 <1359317078.14406.12.camel@joe-AO722> <20130127201947.GO16282@mwanda>
In-Reply-To: <20130127201947.GO16282@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, Paul Fulghum <paulkf@microgate.com>, David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2013-01-27 at 23:19 +0300, Dan Carpenter wrote:
> On Sun, Jan 27, 2013 at 12:04:38PM -0800, Joe Perches wrote:
> > Wouldn't it be clearer still to use | instead of +
> Yeah.  I think it would be, but adding bitflags together instead of
> doing bitwise ORs is very common as well.

Fortunately, less and less so.

Another option might be to add another #define
to include/uapi/linux/synclink.h

#define SerialSignal_DTR_RTS	(SerialSignal_DTR | SerialSignal_RTS)

