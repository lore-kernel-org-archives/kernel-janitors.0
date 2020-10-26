From: David Laight <David.Laight@ACULAB.COM>
Date: Mon, 26 Oct 2020 09:13:23 +0000
Subject: RE: [PATCH] vsock: ratelimit unknown ioctl error message
Message-Id: <d893e3251f804cffa797b6eb814944fd@AcuMS.aculab.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023122113.35517-1-colin.king@canonical.com>
 <20201023140947.kurglnklaqteovkp@steredhat>
 <e535c07df407444880d8b678bc215d9f@AcuMS.aculab.com>
 <20201026084300.5ag24vck3zeb4mcz@steredhat>
In-Reply-To: <20201026084300.5ag24vck3zeb4mcz@steredhat>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Stefano Garzarella' <sgarzare@redhat.com>
Cc: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

From: Stefano Garzarella
> Sent: 26 October 2020 08:43
...
> >Isn't the canonical error for unknown ioctl codes -ENOTTY?
> >
> 
> Oh, thanks for pointing that out!
> 
> I had not paid attention to the error returned, but looking at it I
> noticed that perhaps the most appropriate would be -ENOIOCTLCMD.
> In the ioctl syscall we return -ENOTTY, if the callback returns
> -ENOIOCTLCMD.
> 
> What do you think?

It is 729 v 443 in favour of ENOTTY (based on grep).

No idea where ENOIOCTLCMD comes from, but ENOTTY probably
goes back to the early 1970s.

The fact that the ioctl wrapper converts the value is a good
hint that userspace expects ENOTTY.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
