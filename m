From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Sun, 15 Aug 2004 11:54:52 +0000
Subject: [Kernel-janitors] Re: Add msleep_interruptible() function to
Message-Id: <1092570891.17605.1.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============094962944898955293=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040815121805.GA15111@stro.at>
In-Reply-To: <20040815121805.GA15111@stro.at>
To: maximilian attems <janitor@sternwelten.at>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kj <kernel-janitors@osdl.org>

--===============094962944898955293==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sul, 2004-08-15 at 13:18, maximilian attems wrote:
> + * msleep_interruptible - sleep waiting for waitqueue interruptions
> + * @msecs: Time in milliseconds to sleep for
> + */
> +void msleep_interruptible(unsigned int msecs)
> +{
> +	unsigned long timeout = msecs_to_jiffies(msecs);
> +
> +	while (timeout) {

You want to have while(timeout && !signal_pending(current))

A signal will wake the timeout which will then loop. It might also
be good to add

> +		set_current_state(TASK_INTERRUPTIBLE);
> +		timeout = schedule_timeout(timeout);
> +	}

return timeout;

so that the caller knows more about how long the timer ran for before
the interrupt and if it was interrupted.



--===============094962944898955293==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============094962944898955293==--
