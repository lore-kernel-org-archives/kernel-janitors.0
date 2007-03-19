From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 19 Mar 2007 16:04:24 +0000
Subject: Re: [KJ] SEC() and MSEC() and USEC() macros
Message-Id: <200703191704.24553.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703191148570.12453@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703191148570.12453@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Monday 19 March 2007, Robert P. J. Day wrote:
> =A0 no, it's not a serious proposal but, boy, wouldn't it have made the
> code more readable if someone had defined macros/inline functions like
> sec(), msec() and usec() rather than cluttering up the code with
> things like "22*HZ/10" and "30*HZ/100".
>=20
> =A0 just thinking out loud, don't take it seriously.

There is recurring discussion about making sure that for every interface
that takes a jiffie argument, we have a replacement that takes a proper
unit of time (ktime_t, clock_t, timespec, nanoseconds, microseconds, ...).
In short, we have too many ways to express time, and the jiffies are the
least useful one.

	Arnd <><

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
