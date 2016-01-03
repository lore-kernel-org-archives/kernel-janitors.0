From: David Miller <davem@davemloft.net>
Date: Sun, 03 Jan 2016 01:45:35 +0000
Subject: Re: [PATCH 2/2] net-qmi_wwan: Delete an unnecessary variable initialisation in qmi_wwan_register_sub
Message-Id: <20160102.204535.816844219039778167.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5686AE52.1020008@users.sourceforge.net>
	<5686AFAE.7020401@users.sourceforge.net>
	<87ziwnpt2v.fsf@nemi.mork.no>
In-Reply-To: <87ziwnpt2v.fsf@nemi.mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: bjorn@mork.no
Cc: elfring@users.sourceforge.net, linux-usb@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: Bj=F8rn Mork <bjorn@mork.no>
Date: Sat, 02 Jan 2016 22:30:48 +0100

> SF Markus Elfring <elfring@users.sourceforge.net> writes:
>=20
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Fri, 1 Jan 2016 17:35:03 +0100
>>
>> Omit explicit initialisation at the beginning for one local variable
>> that is redefined before its first use.
>=20
>=20
> This patch is unnecessary. The variable initialisation is redundant.
> See the difference?  Sending an unnecessary patch causes unnecessary
> load on reviewers and maintainers.  Keeping redundant code has no
> measurable cost, and can save the same maintainers a lot of trouble
> later.

+1

I'm getting really tired of these changes.  And a lot of them are
coming in right now...
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
