From: maximilian attems <janitor@sternwelten.at>
Date: Thu, 02 Sep 2004 10:03:22 +0000
Subject: [Kernel-janitors] Re: [patch 8/8] prism54/islpci_dev: replace
Message-Id: <20040902100322.GD1876@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87304602687430211=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200409021135.57632.margitsw@t-online.de>
In-Reply-To: <200409021135.57632.margitsw@t-online.de>
To: Margit Schubert-While <margitsw@t-online.de>
Cc: netdev@oss.sgi.com, kj <kernel-janitors@osdl.org>

--===============87304602687430211==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, 02 Sep 2004, Margit Schubert-While wrote:

> On Thu, 02 Sep 2004, Maximilian scribeth:
> > it shouldn't hinder 2.6 in it's progression.
> I consider this a regression.
> As schedule_timeout is used elesewhere in the prism54 code,
> we are using a consistent and documented method.

you didn't answer to the unit argument in favour of msleep.

shure msleep is also consistent and documented.

--
maks
kernel janitor  	http://janitor.kernelnewbies.org/


--===============87304602687430211==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87304602687430211==--
