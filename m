From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 25 Oct 2005 07:32:56 +0000
Subject: Re: [KJ] drivers/char/serial167.c status ?
Message-Id: <20051025073256.GA8923@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============029022598086987816=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051025034706.GA22430@poopie.dyndns.org>
In-Reply-To: <20051025034706.GA22430@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============029022598086987816==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 24, 2005 at 10:47:06PM -0500, irwan.djajadi@iname.com wrote:
> I just found that drivers/char/serial167.c is mentioned in the Makefile, but
> not in Kconfig. Doesn't this mean that serial167.c is not compilable ever ?

CONFIG167 is in arch/m68k/Kconfig, though marked as BROKEN.


--===============029022598086987816==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============029022598086987816==--
