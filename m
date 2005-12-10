From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 10 Dec 2005 16:30:16 +0000
Subject: Re: [KJ] TODO list addition (struct optimization)
Message-Id: <20051210163016.GD2003@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40663951611822258=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051208101331.GA21327@rhlx01.fht-esslingen.de>
In-Reply-To: <20051208101331.GA21327@rhlx01.fht-esslingen.de>
To: kernel-janitors@vger.kernel.org

--===============40663951611822258==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 08, 2005 at 11:13:31AM +0100, Andreas Mohr wrote:
> Examine struct definitions used in kernel files and kernel driver files
> on whether they have optimized layout.
> Very frequently accessed struct member variables (e.g. locks or I/O address
> base values) should be at the first struct position.
> This will save additional asm opcodes (at least on x86) and code will thus
> be faster and smaller.

Not necessarily true.

Suppose you have a group of struct members which are mostly written in
sequence. You move one member out of cluster. Now you produce 2 dirty
cachelines after each sequence.

Or a split group of mostly-read members will require filling of 2
cachelines instead of one.

This stuff is not all clear and not obvious. You may want to look at

	[PATCH] reorder struct files_struct

P. S.: search on MARC is down, so I can't find more examples of what was
       already done.


--===============40663951611822258==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40663951611822258==--
