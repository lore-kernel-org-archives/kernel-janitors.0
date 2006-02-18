From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 18 Feb 2006 12:48:37 +0000
Subject: Re: [KJ] CPMiner
Message-Id: <20060218124837.GB11481@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15909750328021843=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139531770.30862.4.camel@alice>
In-Reply-To: <1139531770.30862.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============15909750328021843==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 10, 2006 at 01:36:10AM +0100, Eric Sesterhenn wrote:
> CPMiner (http://opera.cs.uiuc.edu/Projects/ARTS/CP-Miner.htm) is a
> copy/paste error detection tool written by OPERA. I ran it against
> the linux kernel and placed a summary and the programs output online:
>
> http://www.snake-basket.de/cpminer/
>
> some of the stuff seems suspicious, some of it are trivial false
> alerts. I'll try to keep the page updated against the latest -rc
> or stable kernels ( depends on my time since a run of the tool
> takes about 2-3 hours )

Eric, could you do some line up of left and right columns? I mean,
instead of

	A	A
	B	B
	C	C
	X	D
	D	E
	E	F
	F	Y
	G	G

put it as

	A	A
	B	B
	C	C
	X
	D	D
	E	E
	F	F
		Y
	G	G

and probably mark X and Y (different parts of X and Y) in red.

Overall, a very interesting stuff.


--===============15909750328021843==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15909750328021843==--
