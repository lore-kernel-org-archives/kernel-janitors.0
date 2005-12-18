From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Sun, 18 Dec 2005 16:45:01 +0000
Subject: Re: [KJ] [Patch] Check unsigned < 0 in media/video/mxb.c
Message-Id: <20051218144501.a3739db3.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28276562722576659=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134733947.8536.2.camel@alice>
In-Reply-To: <1134733947.8536.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============28276562722576659==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Sent on  Fri, 16 Dec 2005 14:38:05 +0100

Hello,

IIRC, these should be fixed too:

> -		if( i->index < 0 || i->index >= MXB_INPUTS) {
> +		if( i->index >= MXB_INPUTS) {

if (i->index >= ....) {

> -		if( a->index < 0 || a->index > MXB_INPUTS ) {
> +		if( a->index > MXB_INPUTS ) {

if (a->index > ...) {

Regards.

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

  Left to themselves, things tend to go from bad to worse.

--===============28276562722576659==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28276562722576659==--
