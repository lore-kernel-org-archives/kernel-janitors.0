From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Thu, 03 Mar 2005 22:30:07 +0000
Subject: Re: [KJ] [RFC][PATCH 1/5] add poll_event*()
Message-Id: <200503040106.30651.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91178478314420586=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050303182238.GD11600@us.ibm.com>
In-Reply-To: <20050303182238.GD11600@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============91178478314420586==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thursday 03 March 2005 20:22, Nishanth Aravamudan wrote:

> --- 2.6.11-kj-v/include/linux/delay.h
> +++ 2.6.11-kj/include/linux/delay.h
> +#define poll_event_timeout(cond, interval, timeout)			\
> +do {									\
> +	unsigned long stop = jiffies + msecs_to_jiffies(timeout);	\
> +	while (cond && time_before(jiffies, stop))			\

I believe "cond" should be bracketized to avoid surprises.

> +		msleep(interval);					\
> +} while(0)

> +#define poll_event_interruptible_timeout(cond, interval, timeout)	\
> +do {									\
> +	unsigned long stop = jiffies + msecs_to_jiffies(timeout);	\
> +	while (cond && time_before(jiffies, stop)) {			\
	      ^^^^^^

> +		msleep_interruptible(interval);				\
> +		if (signal_pending(current))				\
> +			break;						\
> +	}								\
> +} while(0);

	Alexey

--===============91178478314420586==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91178478314420586==--
