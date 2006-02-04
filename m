From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 04 Feb 2006 18:32:19 +0000
Subject: Re: [KJ] [Patch 2/2] BUG_ON() Conversion in input/serio/hp_sdc_mlc.c
Message-Id: <20060204183219.GD5966@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81504190083917005=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============81504190083917005==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 26, 2006 at 04:25:30PM +0100, Eric Sesterhenn / snakebyte wrote:
> this changes if() BUG(); constructs to BUG_ON() which is
> cleaner and can better optimized away

Merged. Whitespace damage fixed locally.


--===============81504190083917005==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81504190083917005==--
