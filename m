From: Marcel Holtmann <marcel@holtmann.org>
Date: Wed, 02 Feb 2005 23:16:29 +0000
Subject: [KJ] Re: [PATCH 19/20] bluetooth/bluecard_cs: remove
Message-Id: <1107386189.11944.21.camel@pegasus>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============012714935023340868=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050202225855.GY2546@us.ibm.com>
In-Reply-To: <20050202225855.GY2546@us.ibm.com>
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: Max Krasnyansky <maxk@qualcomm.com>, bluez-devel@lists.sf.net, kernel-janitors@lists.osdl.org

--===============012714935023340868==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Nish,

> Please consider applying.
> 
> Description: Remove deprecated interruptible_sleep_on_timeout() function calls
> and replace with direct wait-queue usage. Some naming conflicts occurred, which
> I tried to resolve appropriately. Patch is compile-tested.

you introduce more code than you remove. Is our code a special case or
why don't exists a simple API function as replacement?

Regards

Marcel



--===============012714935023340868==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============012714935023340868==--
