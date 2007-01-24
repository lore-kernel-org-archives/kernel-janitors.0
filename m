From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 24 Jan 2007 22:55:47 +0000
Subject: Re: [KJ] script to flag "dead" CONFIG variables
Message-Id: <20070124225547.GA5205@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701240736110.7569@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701240736110.7569@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Jan 24, 2007 at 07:36:54AM -0500, Robert P. J. Day wrote:
>   it's all written up here:
>
> http://www.fsdev.dreamhosters.com/wiki/index.php?title=DEad_CONFIG_variab=
les

That's a good script.

There is another failure mode: CONFIG_FOO is defined, all right, but
code tests for FOO. ARCH_HAS_ILOG2_U32 and _U64, haven't seen more.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
