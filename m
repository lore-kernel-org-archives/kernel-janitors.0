From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 20 Dec 2004 14:59:09 +0000
Subject: [KJ] Re: [PATCH] pcxx: replace cli()/sti() with
Message-Id: <1103554747.30268.24.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0075858195198335032=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041217223426.11143.44338.87156@localhost.localdomain>
In-Reply-To: <20041217223426.11143.44338.87156@localhost.localdomain>
To: James Nelson <james4765@verizon.net>
Cc: kernel-janitors@lists.osdl.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, akpm@osdl.org

--===============0075858195198335032==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Gwe, 2004-12-17 at 22:34, James Nelson wrote:
> -	save_flags(flags);
> -	cli();
> +	spin_lock_irqsave(&pcxx_lock, flags);
>  	del_timer_sync(&pcxx_timer);

Not safe if the lock is grabbed by the timer between the lock and the
irqsave as it will spin on another cpu and the timer delete will never
finish.



--===============0075858195198335032==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0075858195198335032==--
