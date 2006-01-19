From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 19 Jan 2006 20:42:14 +0000
Subject: Re: [KJ] [PATCH 2/5] README: Remove a.out reference
Message-Id: <20060119204214.GI9569@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70699868929535203=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <a01a16b50601191210g7bb0b4d6uca221f09b33b4a6a@mail.gmail.com>
In-Reply-To: <a01a16b50601191210g7bb0b4d6uca221f09b33b4a6a@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============70699868929535203==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 19, 2006 at 09:10:29PM +0100, H?kon L?vdal wrote:
> Removed a line promising that users still could run a.out user programs.
> As far as I know all distributions have removed libc.4 support years
> ago, so while the kernel itself still might support a.out, the promise
> is both 1) not needed anymore and 2) most likely not correct.

Don't be silly.  Some people still use libc4, as well as old binaries
which are statically linked.

--===============70699868929535203==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70699868929535203==--
