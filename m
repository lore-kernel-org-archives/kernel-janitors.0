From: Oliver Neukum <oliver@neukum.org>
Date: Fri, 16 Mar 2012 16:32:17 +0000
Subject: Re: [PATCH] [media] staging: Return -EINTR in s2250_probe() if fails to get lock.
Message-Id: <201203161732.17246.oliver@neukum.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331915038-11231-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1331915038-11231-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: santosh nayak <santoshprasadnayak@gmail.com>
Cc: mchehab@infradead.org, gregkh@linuxfoundation.org, khoroshilov@ispras.ru, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Am Freitag, 16. M=E4rz 2012, 17:23:58 schrieb santosh nayak:
> From: Santosh Nayak <santoshprasadnayak@gmail.com>
>=20
> In s2250_probe(), If locking attempt is interrupted by a signal then
> it should return -EINTR after unregistering audio device and making free
> the allocated memory.
>=20
> At present, if locking is interrupted by signal it will display message
> "initialized successfully" and return success.  This is wrong.

Indeed there's a lot wrong here. The idea of having an interruptible
sleep in probe() is arcane. You need a very, very, very good reason for tha=
t.
The sane fix is using an uninterruptable sleep here.

Second, while you are at it, fix the error case for no initialization
due to a failing kmalloc(). You need to return -ENOMEM.

	Regards
		Oliver
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
