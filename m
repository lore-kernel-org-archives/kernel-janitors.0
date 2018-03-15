From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Mar 2018 11:26:27 +0000
Subject: Re: [PATCH] rtc: mxc_v2: unlock on error in mxc_rtc_set_alarm()
Message-Id: <20180315112627.35f3gmvmho5mb2fb@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180314073719.GA2470@mwanda>
 <3BB206AB2B1BD448954845CE6FF69A8E01F81FD198@nt-mail04>
In-Reply-To: <3BB206AB2B1BD448954845CE6FF69A8E01F81FD198@nt-mail04>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Patrick =?iso-8859-1?Q?Br=FCnn?= <P.Bruenn@beckhoff.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, Mar 15, 2018 at 11:12:04AM +0000, Patrick Br=FCnn wrote:
> >From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> >Sent: Mittwoch, 14. M=E4rz 2018 08:37
> >
> >We need to unlock if time is more than U32_MAX.
> >
> you are right, that's a bug.
> But I would move the mxc_rtc_lock() entirely behind the (time > U32_MAX) =
check.

Yes, of course.  I will resend.

regards,
dan carpenter
=20
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
