From: Oliver Neukum <oliver@neukum.org>
Date: Sun, 15 Aug 2004 12:50:35 +0000
Subject: [Kernel-janitors] Re: Add msleep_interruptible() function to
Message-Id: <200408151450.35196.oliver@neukum.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13104140551484633=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040815121805.GA15111@stro.at>
In-Reply-To: <20040815121805.GA15111@stro.at>
To: maximilian attems <janitor@sternwelten.at>
Cc: linux-kernel@vger.kernel.org, kj <kernel-janitors@osdl.org>

--===============13104140551484633==
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

Am Sonntag, 15. August 2004 14:18 schrieb maximilian attems:
> while doing kernel-janitor msleep conversion of drivers own (incorrect),
> functions, some places would need msleep_interruptible().
> 
> this function is equivalent to:
>         current->state = TASK_INTERRUPTIBLE;
> 	schedule_timeout(timeout);
> 
> idea from Ingo Molnar:
> well, aboves is not 100% equivalent because msleep() is uninterruptible so
> stoppage of the md thread (upon shutdown) will occur with only a 250 msec
> delay. Someone should add a msleep_interruptible() function to kernel/timer.c.

[..] 
> +/**
> + * msleep_interruptible - sleep waiting for waitqueue interruptions
> + * @msecs: Time in milliseconds to sleep for
> + */
> +void msleep_interruptible(unsigned int msecs)
> +{
> +	unsigned long timeout = msecs_to_jiffies(msecs);
> +
> +	while (timeout) {
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		timeout = schedule_timeout(timeout);
> +	}

This is not really interruptible sleep because it is missing a check
for pending signals.

	Regards
		Oliver

--===============13104140551484633==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13104140551484633==--
