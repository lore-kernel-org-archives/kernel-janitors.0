From: Jeff Garzik <jgarzik@pobox.com>
Date: Sat, 30 Oct 2004 22:41:10 +0000
Subject: [KJ] Re: [patch 2.4] back port msleep(), msleep_interruptible()
Message-Id: <41841886.2080609@pobox.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50190206791481806=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040923221303.GB13244@us.ibm.com> <20040923221303.GB13244@us.ibm.com> <5.1.0.14.2.20040924074745.00b1cd40@pop.t-online.de> <415CD9D9.2000607@pobox.com> <20041030222228.GB1456@stro.at>
In-Reply-To: <20041030222228.GB1456@stro.at>
To: maximilian attems <janitor@sternwelten.at>
Cc: Margit Schubert-While <margitsw@t-online.de>, Nishanth Aravamudan <nacc@us.ibm.com>, hvr@gnu.org, mcgrof@studorgs.rutgers.edu, kernel-janitors@lists.osdl.org, prism54-devel@prism54.org, netdev@oss.sgi.com, Domen Puncer <domen@coderock.org>, linux-kernel@vger.kernel.org

--===============50190206791481806==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

maximilian attems wrote:
> diff -puN include/linux/delay.h~add-msleep-2.4 include/linux/delay.h
> --- a/include/linux/delay.h~add-msleep-2.4	2004-10-30 22:48:46.000000000 +0200
> +++ b/include/linux/delay.h	2004-10-30 22:48:46.000000000 +0200
> @@ -34,4 +34,12 @@ extern unsigned long loops_per_jiffy;
>  	({unsigned long msec=(n); while (msec--) udelay(1000);}))
>  #endif
>  
> +void msleep(unsigned int msecs);
> +unsigned long msleep_interruptible(unsigned int msecs);
> +
> +static inline void ssleep(unsigned int seconds)
[...]
> +static inline unsigned int jiffies_to_msecs(const unsigned long j)

> +static inline unsigned int jiffies_to_usecs(const unsigned long j)

> +static inline unsigned long msecs_to_jiffies(const unsigned int m)


I'm pretty sure more than one of these symbols clashes with a symbol 
defined locally in a driver.  I like the patch but we can't apply it 
until the impact on existing code is evaluated.

	Jeff



--===============50190206791481806==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50190206791481806==--
