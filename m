From: Domen Puncer <domen@coderock.org>
Date: Wed, 24 Nov 2004 17:59:09 +0000
Subject: [KJ] Re: ifdef typos: drivers_net_wireless_wavelan_cs.c
Message-Id: <20041124175909.GA4680@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76857188253333675=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76857188253333675==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 24/11/04 18:25 +0100, walter harms wrote:
> Hi Domen,
> nice work :) i never noticed that there are some much typos.
> 
> To avoid namespace polution: IMHO its better to define:
> wavelan_cd_DEBUG_CONFIG_ERRORS (you get the idea)
> stupid long but would avoid conflics with possible other drivers/kernel 
> debug defines.

I disagree:
- there is no "namespace polution", since most defines are local;
- longer defines make it even easier to make typos.


	Domen
> 
> re,
> walter

--===============76857188253333675==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76857188253333675==--
