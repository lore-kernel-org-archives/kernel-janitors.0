From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Fri, 04 Mar 2005 19:40:16 +0000
Subject: Re: [KJ] [RFC][UPDATE PATCH 1/5] add poll_event*()
Message-Id: <200503042237.40952.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============141617760899031=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050304185331.GF2689@us.ibm.com>
In-Reply-To: <20050304185331.GF2689@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============141617760899031==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Friday 04 March 2005 20:53, Nishanth Aravamudan wrote:

> Add the poll_event(), poll_event_timeout(), poll_event_interruptible() and
> poll_event_interruptible_timeout() interfaces. These macros encapsulate
> typical sleeping code usage in a sane way.

> --- 2.6.11-kj-v/include/linux/delay.h
> +++ 2.6.11-kj/include/linux/delay.h

> +#define poll_event_interruptible_timeout(conditition, interval, timeout)	\
> +({										\
> +	int __ret = 0;								\
> +	unsigned long stop = jiffies + msecs_to_jiffies(timeout);		\
> +										\
> +	for (;;) {								\
> +		if (condition)							\
> +			break;							\
> +		msleep_interruptible(interval);					\
> +		if (signal_pending(current)) {					\
> +			__ret = -EINTR;						\
> +			break;							\
> +		}								\
> +		if (time_after(jiffies, stop)) {				\
> +			__ret = -ETIME;						\
> +			break;							\
> +		}								\
> +	}									\

	__ret;

> +})

Also, can you add kernel-doc comments? Rules are the same as for functions.

	Alexey

--===============141617760899031==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============141617760899031==--
