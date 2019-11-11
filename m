From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Mon, 11 Nov 2019 09:16:06 +0000
Subject: Re: [PATCH 1/4] pwm: omap-dmtimer: remove pwmchip in .remove before making it unfunctional
Message-Id: <20191111091606.qf7gj5gln3khfnsl@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191111090357.13903-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20191111090357.13903-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hello,

I created a cover letter but failed to send it together with the series
:-|

It said:

| I promised a cleanup patch but as I found a few more issues I have four
| patches now. The third patch replaces Markus' patch with a more complete
| fix that also drops the reference in .remove not only the error path of
| .probe.
|=20
| The last patch allows to compile the driver in more configurations, it
| compiled successfully on amd64 and arm.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
