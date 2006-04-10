From: Andrew Morton <akpm@osdl.org>
Date: Mon, 10 Apr 2006 07:08:10 +0000
Subject: Re: [KJ] [PATCH 2.6.17-rc1-mm2] net: cleanup CONFIG_PCI from dgrs.c
Message-Id: <20060410000810.3968cef5.akpm@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40648081755864163=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <443942FE.6060400@student.ltu.se>
In-Reply-To: <443942FE.6060400@student.ltu.se>
To: kernel-janitors@vger.kernel.org

--===============40648081755864163==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Richard Knutsson <ricknu-0@student.ltu.se> wrote:
>
> From: Richard Knutsson <ricknu-0@student.ltu.se>
> 
> Removed (I believe) unnecessary CONFIG_PCI and an ugly (previous patch 
> of mine) empty struct if !CONFIG_PCI.
> 
> Compiled tested, with and without an "#undef CONFIG_PCI" in dgrs.c, with 
> no warnings/errors.
> 

If !CONFIG_PCI we don't want to be compiling that relatively large but
unused dgrs_pci_probe() into the object file.;

--===============40648081755864163==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40648081755864163==--
