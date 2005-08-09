From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Tue, 09 Aug 2005 15:34:19 +0000
Subject: Re: [KJ] [PATCH] removing odd number of parentheses
Message-Id: <20050809123419.fcdbd6ea.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93685873058470281=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050809140939.GA4603@voyager>
In-Reply-To: <20050809140939.GA4603@voyager>
To: kernel-janitors@vger.kernel.org

--===============93685873058470281==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  Carlo Perassi <carlo@linux.it>
Sent on  Tue, 9 Aug 2005 16:09:40 +0200

Hello Carlo,

>  	if(ivideo->sishw_ext.UseROM) {

          ^

this should be "if ("

> -	   if(ivideo->sishw_ext.pjVirtualRomBase[0x52] & 0x80)) {
> +	   if(ivideo->sishw_ext.pjVirtualRomBase[0x52] & 0x80) {

             ^

this one too.

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

  Left to themselves, things tend to go from bad to worse.

--===============93685873058470281==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93685873058470281==--
