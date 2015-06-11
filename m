From: Evgeniy Polyakov <zbr@ioremap.net>
Date: Thu, 11 Jun 2015 15:31:00 +0000
Subject: Re: [patch] [patch 2/2 v2] w1: use correct lock on error in w1_seq_show()
Message-Id: <1064021434036660@web13o.yandex.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150602121255.GA20149@spacedout.fries.net> <20150604090412.GE22838@mwanda>
In-Reply-To: <20150604090412.GE22838@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Fries <david@fries.net>, Matt Campbell <mattrcampbell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi

04.06.2015, 12:04, "Dan Carpenter" <dan.carpenter@oracle.com>:
> I noticed there was a problem here because Smatch complained:
>
> =9A=9A=9A=9A=9A=9A=9A=9Adrivers/w1/slaves/w1_therm.c:416 w1_seq_show() wa=
rn:
> =9A=9A=9A=9A=9A=9A=9A=9Ainconsistent returns 'mutex:&sl->master->mutex'.
> =9A=9A=9A=9A=9A=9A=9A=9A=9A=9ALocked on: line 416
> =9A=9A=9A=9A=9A=9A=9A=9A=9A=9AUnlocked on: line 413
>
> The problem is that we lock ->mutex but we unlock ->bus_mutex on error.
> David Fries says that ->bus_mutex is correct and ->mutex is incorrect.
>
> Fixes: d9411e57dc7f ('w1: Add support for DS28EA00 sequence to w1-therm')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good to me, Greg please pull this serie into your tree, if you hadn't=
 yet.
Am I right that this is a stable tree material too?

Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
