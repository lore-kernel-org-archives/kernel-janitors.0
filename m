From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Date: Sat, 02 Jan 2016 21:30:48 +0000
Subject: Re: [PATCH 2/2] net-qmi_wwan: Delete an unnecessary variable initialisation in qmi_wwan_register_sub
Message-Id: <87ziwnpt2v.fsf@nemi.mork.no>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
	<5686AE52.1020008@users.sourceforge.net>
	<5686AFAE.7020401@users.sourceforge.net>
In-Reply-To: <5686AFAE.7020401@users.sourceforge.net> (SF Markus Elfring's
	message of "Fri, 1 Jan 2016 17:56:14 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

SF Markus Elfring <elfring@users.sourceforge.net> writes:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 1 Jan 2016 17:35:03 +0100
>
> Omit explicit initialisation at the beginning for one local variable
> that is redefined before its first use.


This patch is unnecessary. The variable initialisation is redundant.
See the difference?  Sending an unnecessary patch causes unnecessary
load on reviewers and maintainers.  Keeping redundant code has no
measurable cost, and can save the same maintainers a lot of trouble
later.

I'd like to keep this particular redundant initialisation as a safe
guard against future code refactoring, causing for example the err label
to move up.  Yes, I do understand that any patch with such a bug should
be rejected, but I do know what happens in the real world and how easy
it is for something like that to slip through in a stream of unnecessary
"cleanup" patches.

Reducing redundancy in the kernel is only making the code less robust.
It is harmful. Please stop.  Thanks.


Bj=C3=B8rn
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
