From: Ingo Molnar <mingo@elte.hu>
Date: Mon, 16 Aug 2004 02:22:28 +0000
Subject: [Kernel-janitors] Re: Add msleep_interruptible() function to
Message-Id: <20040816022228.GA8224@elte.hu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18923084800356671=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040815121805.GA15111@stro.at> <1092570891.17605.1.camel@localhost.localdomain> <20040815132548.GF1799@stro.at>
In-Reply-To: <20040815132548.GF1799@stro.at>
To: maximilian attems <janitor@sternwelten.at>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kj <kernel-janitors@osdl.org>, Andrew Morton <akpm@osdl.org>

--===============18923084800356671==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


* maximilian attems <janitor@sternwelten.at> wrote:

> +/**
> + * msleep_interruptible - sleep waiting for waitqueue interruptions
> + * @msecs: Time in milliseconds to sleep for
> + */
> +unsigned int msleep_interruptible(unsigned int msecs)
> +{
> +       unsigned long timeout = msecs_to_jiffies(msecs);
> +
> +       while (timeout && !signal_pending(current)) {
> +               set_current_state(TASK_INTERRUPTIBLE);
> +               timeout = schedule_timeout(timeout);
> +       }
> +       return jiffies_to_msecs(timeout);
> +}

looks good to me.

Signed-off-by: Ingo Molnar <mingo@elte.hu>

	Ingo


--===============18923084800356671==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18923084800356671==--
