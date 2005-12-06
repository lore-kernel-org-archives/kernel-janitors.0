From: Roland Dreier <roland@digitalvampire.org>
Date: Tue, 06 Dec 2005 17:15:07 +0000
Subject: Re: [KJ] rfc: print mac addr
Message-Id: <87vey2du5g.fsf@love-shack.home.digitalvampire.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============819360496312588=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <43956CB7.2060904@bfs.de>
In-Reply-To: <43956CB7.2060904@bfs.de>
To: kernel-janitors@vger.kernel.org

--===============819360496312588==
Content-Type: text/plain; charset=us-ascii

 > (1) inline in include/linux/{if_ether.h or etherdevice.h or netdevice.h}
 > although I prefer one of the first two since this looks ethernet-specific
 > (due to the "i < 6").
 > And change the 6 to ETH_ALEN if this is for ethernet MAC addresses.
 > And put a space between comma and i:  ",i" should be ", i".

 > or
 > (2) in net/core/dev.c.

I would definitely pick the second option.  There's no reason like
performance for such a helper to be an inline function, so we should
save .text by moving it out of line.

 - R.


--===============819360496312588==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============819360496312588==--
