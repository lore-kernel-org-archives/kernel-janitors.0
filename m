From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 11 Jun 2010 22:12:56 +0000
Subject: Re: [PATCH] staging/wlags49_hs: Fix build error when CONFIG_SYSFS is
Message-Id: <AANLkTimJqo86Gl34ToKx9TDhExL9eAks6b68ryB9u4cn@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1276238148.22216.30.camel@lenovo> <1276238502.1556.512.camel@Joe-Laptop.home> 
	<AANLkTikH_CAVo7sblakUfhI-ysIXk2z1KZz0YkjCDL3m@mail.gmail.com> 
	<1276275156.1637.52.camel@Joe-Laptop.home>
In-Reply-To: <1276275156.1637.52.camel@Joe-Laptop.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>
Cc: Henk de Groot <pe1dnn@amsat.org>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel@vger.kernel.org

On Fri, Jun 11, 2010 at 12:52 PM, Joe Perches <joe@perches.com> wrote:
> On Fri, 2010-06-11 at 08:46 -0400, Javier Martinez Canillas wrote:
>
> Check the general kernel use of macros vs functions.
> Functions verify proper arguments, macros do not.
>
>
>

I see. thank you very much for clarify this. I'm will generate a
correct patch and resend.

Best regards,

-----------------------------------------
Javier Mart=C3=ADnez Canillas
+595 981 88 66 58
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
