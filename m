From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Thu, 08 Dec 2005 23:25:55 +0000
Subject: Re: [KJ] TODO list addition (struct optimization)
Message-Id: <20051208212555.2e9221e5.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13016266473945981=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051208101331.GA21327@rhlx01.fht-esslingen.de>
In-Reply-To: <20051208101331.GA21327@rhlx01.fht-esslingen.de>
To: kernel-janitors@vger.kernel.org

--===============13016266473945981==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  Andreas Mohr <andi@rhlx01.fht-esslingen.de>
Sent on  Thu, 8 Dec 2005 11:13:31 +0100

Hello,

> Examine struct definitions used in kernel files and kernel driver files
> on whether they have optimized layout.
> Very frequently accessed struct member variables (e.g. locks or I/O
> address base values) should be at the first struct position.
> This will save additional asm opcodes (at least on x86) and code will thus
> be faster and smaller.

I'll surely look at this.  I have a great interest on this subject. :)

Regards.

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

  Left to themselves, things tend to go from bad to worse.

--===============13016266473945981==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13016266473945981==--
