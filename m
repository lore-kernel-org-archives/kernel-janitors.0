From: Domen Puncer <domen@coderock.org>
Date: Sat, 22 May 2004 22:43:43 +0000
Subject: [Kernel-janitors] Re: request_region() on sound/oss/wavfront.c.
Message-Id: <20040522224343.GA1643@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91804454248312406=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============91804454248312406==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 22/05/04 18:54 -0300, Gustavo Franco wrote:
> Hi list,
> 
> [Patch aplied against 2.6.6-bk9 - compiles cleanly. ]
> 
> I've added two error checks for request_region() calls on the source
> and replaced a check_region() with request_region().The release_region()
> calls seems to be ok, but let me known if i'm missing something.
> 
> Comments?
>

You request same region twice...

> +++ sound/oss/wavfront.c  2004-05-22 18:28:38.000000000 -0300
> +       if (!request_region (io_base, 16, "wavefront")) {
Few lines later there is a:
	dev.base = io_base;
So this will print ugly error messages.

> +       if(!request_region (dev.base+2, 6, "wavefront synth")) {
> +               if(!request_region (dev.base+8, 8, "wavefront fx")) {

IMHO, you can just get rid of latter 2 request_region's.
And don't forget about release_region.

--===============91804454248312406==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91804454248312406==--
