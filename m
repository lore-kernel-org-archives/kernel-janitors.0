From: maximilian attems <janitor@sternwelten.at>
Date: Fri, 19 Nov 2004 22:31:42 +0000
Subject: Re: [KJ] [PATCH] floppy: Reorganize drivers/block/floppy.c
Message-Id: <20041119223142.GJ2202@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============089051634119099221=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041105014000.11993.38553.30904@localhost.localdomain>
In-Reply-To: <20041105014000.11993.38553.30904@localhost.localdomain>
To: james4765@verizon.net
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============089051634119099221==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, 04 Nov 2004, james4765@verizon.net wrote:

> Organization of global variables, macros, and #defines in floppy.c
> 
> Signed-off-by: James Nelson <james4765@gmail.com>
> 
> diff -urN --exclude='*~' linux-2.6.9-original/drivers/block/floppy.c linux-2.6.9/drivers/block/floppy.c
> --- linux-2.6.9-original/drivers/block/floppy.c	2004-10-18 17:53:22.000000000 -0400
> +++ linux-2.6.9/drivers/block/floppy.c	2004-11-04 20:25:28.180478012 -0500

hmm could you split up your patch in logical hunks?
nitpicking: your patch adds whitespace.

a++ maks

--===============089051634119099221==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============089051634119099221==--
