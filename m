From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 07 Nov 2013 11:22:58 +0000
Subject: Re: [patch] mfd: pm8921: potential NULL dereference in pm8921_remove()
Message-Id: <20131107112258.GM30901@lee--X1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107080420.GP21844@elgon.mountain>
 <20131107100609.GL30901@lee--X1>
 <20131107105050.GL20521@mwanda>
In-Reply-To: <20131107105050.GL20521@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Brown <davidb@codeaurora.org>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 07 Nov 2013, Dan Carpenter wrote:

> On Thu, Nov 07, 2013 at 10:06:09AM +0000, Lee Jones wrote:
> > Just a thought. If you use `git format-patch` you don't have to
> > hand-craft the [PATCH] part of the subject line.
>=20
> The lower case [patch] is annoying?

Not particularly. It didn't even make it to 'nit' status.

The pointer was more to aid you than anything. `git format-patch` is a
nice tool with some really useful options.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
