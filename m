From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Aug 2019 11:45:50 +0000
Subject: Re: [PATCH] ima: Fix a use after free in ima_read_modsig()
Message-Id: <20190808114549.GJ1935@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190808103310.GC30506@mwanda>
 <1565263042.4220.25.camel@kernel.org>
In-Reply-To: <1565263042.4220.25.camel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Mimi Zohar <zohar@kernel.org>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 08, 2019 at 07:17:22AM -0400, Mimi Zohar wrote:
> On Thu, 2019-08-08 at 13:33 +0300, Dan Carpenter wrote:
> > This code frees "hdr" and then dereferences it on the next line to get
> > the error code.
> >=20
> > Fixes: 39b07096364a ("ima: Implement support for module-style appended =
signatures")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Thanks, Dan. =A0Julia already reported this. =A0Thiago posted a patch last
> night. =A0Just getting to it now. =A0Can I add your Reviewed-by or Tested-
> by?

I haven't seen the other patch so Reviewed-by seems like the wrong
thing.  I don't really need any sort of credit.  I'm just going through
my backlog of warnings from being out of office.  Perhaps Reported-by?

regards,
dan carpenter
