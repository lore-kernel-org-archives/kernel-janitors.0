From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 18 Dec 2005 13:44:25 +0000
Subject: Re: [KJ] RFC: New todo for loops
Message-Id: <20051218134425.GJ2361@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36154033253856999=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051218142953.a30dcf5d.daniel.marjamaki@comhem.se>
In-Reply-To: <20051218142953.a30dcf5d.daniel.marjamaki@comhem.se>
To: kernel-janitors@vger.kernel.org

--===============36154033253856999==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 18, 2005 at 02:29:53PM +0100, Daniel Marjam?ki wrote:
> I have a suggestion for the TODO.
> Making loops faster is important. Therefore in the loops we should use pointers instead of arrays.

Do you have evidence this actually produces better code?  GCC is pretty
smart, you know.  And the exammple you posted is harder to understand.
BTW, examples using gcc 2.95 don't count; the example has to be for 4.0
or later.

--===============36154033253856999==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36154033253856999==--
