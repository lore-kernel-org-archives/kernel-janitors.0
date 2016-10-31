From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 31 Oct 2016 05:37:49 +0000
Subject: Re: [PATCH] cxl: Fix error handling
Message-Id: <87wpgp13ki.fsf@concordia.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030214047.25037-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161030214047.25037-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, imunsie@au1.ibm.com, fbarrat@linux.vnet.ibm.com
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

> 'cxl_dev_context_init()' returns an error pointer in case of error, not
> NULL. So test it with IS_ERR.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> un-compiled because I don't have the required  cross build environment.

Do you run Ubuntu or Fedora? If so it's just a dnf/apt-get away:

$ sudo dnf install gcc-c++-powerpc64-linux-gnu binutils-powerpc64-linux-gnu gcc-powerpc64-linux-gnu
or
$ sudo apt-get install gcc-powerpc64le-linux-gnu gcc-powerpc-linux-gnu libc-dev-powerpc-cross libc-dev-ppc64el-cross

More here:

https://github.com/linuxppc/linux/wiki/Building-powerpc-kernels


cheers
