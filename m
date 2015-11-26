From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Nov 2015 12:36:19 +0000
Subject: Re: [patch] rt2x00: type bug in _rt2500usb_register_read()
Message-Id: <20151126123618.GE7289@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151126115523.GD10556@mwanda>
 <5656F95C.60107@bfs.de>
In-Reply-To: <5656F95C.60107@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Stanislaw Gruszka <sgruszka@redhat.com>, Helmut Schaa <helmut.schaa@googlemail.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 26, 2015 at 01:21:48PM +0100, walter harms wrote:
> > If the low 16 bits were initialized to zero then this code would only be
> > a problem on big endian systems.

> perhaps, cleaning *value would be sufficient ? Avoiding the need for a tmp var.
> 
> *value = 0
> rt2500usb_register_read(rt2x00dev, offset, (u16 *)value);
> 

Because if you initialize value then you still have a bug on big endian
systems.

regards,
dan carpenter

