From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 08 Feb 2006 04:39:10 +0000
Subject: Re: [kj][Patch] remove implicit sign bit on single bit
Message-Id: <20060208043910.GI26473@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77100095358168641=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139372248.9409.15.camel@localhost.localdomain>
In-Reply-To: <1139372248.9409.15.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============77100095358168641==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08.02.2006 [15:17:27 +1100], Darren Jenkins" wrote:
> Hi,
> 
> This is my first patch so I hope I get everything right.

Two things.

> http://linuxicc.sourceforge.net/
> 
> Warnings/Error while compiling with Intel C Compiler
> 
> Says there is a Warning #108: implictly-signed bit field of length 1
> 
> in sound/oss/viacXXX_audio.c @ line number 310
> 
> looking at the code it seems like it is supposed to be a single bit
> field used as a lock. This just makes it unsigned.
> 
> Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
> 
> 
> --- linux-2.6.16-rc2/sound/oss/via82cxxx_audio.c.orig	2006-02-08
> 13:43:27.000000000 +1100
> +++ linux-2.6.16-rc2/sound/oss/via82cxxx_audio.c	2006-02-08
> 13:45:39.000000000 +1100

Looks like this part was line-wrapped, but the patch was not. Strange.

And OSS is deprecated. Don't bother patching it.

Thanks,
Nish

--===============77100095358168641==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77100095358168641==--
