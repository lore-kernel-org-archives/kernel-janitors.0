From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 17 Nov 2004 01:30:59 +0000
Subject: [KJ] Re: [PATCH] Add ssleep_interruptible()
Message-Id: <20041117013059.GA4218@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49689164025029531=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <E1CO1vc-00022t-N2@sputnik> <20041101200749.GF1730@us.ibm.com>
In-Reply-To: <20041101200749.GF1730@us.ibm.com>
To: janitor@sternwelten.at
Cc: netdev@oss.sgi.com, jgarzik@pobox.com, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

--===============49689164025029531==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 01, 2004 at 12:07:49PM -0800, Nishanth Aravamudan wrote:
> Description: Adds ssleep_interruptible() to allow longer delays to occur
> in TASK_INTERRUPTIBLE, similarly to ssleep(). To be consistent with
> msleep_interruptible(), ssleep_interruptible() returns the remaining time
> left in the delay in terms of seconds. This required dividing the return
> value of msleep_interruptible() by 1000, thus a cast to (unsigned long)
> to prevent any floating point issues.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.10-rc1-vanilla/include/linux/delay.h	2004-10-30 
> 15:34:03.000000000 -0700
> +++ 2.6.10-rc1/include/linux/delay.h	2004-11-01 12:06:11.000000000 -0800
> @@ -46,4 +46,9 @@ static inline void ssleep(unsigned int s
> 	msleep(seconds * 1000);
> }
> 
> +static inline unsigned long ssleep_interruptible(unsigned int seconds)
> +{
> +	return (unsigned long)(msleep_interruptible(seconds * 1000) / 1000);
> +}
> +
> #endif /* defined(_LINUX_DELAY_H) */

After a discussion on IRC, I believe it is pretty clear that this
function has serious issues. Mainly, that if I request a delay of 1
second, but msleep_interruptible() returns after 1 millisecond, then
ssleep_interruptible() will return 0, claiming the entire delay was
used (due to rounding).

Perhaps we should just be satisfied with milliseconds being the grossest
(in contrast to fine) measure of time, at least in terms of
interruptible delays. ssleep() is unaffected by this problem, of course.

Please revert this patch, if applied, as well as any of the other
patches I sent using ssleep_interruptible() [only a handful].

Thanks,
Nish

--===============49689164025029531==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49689164025029531==--
