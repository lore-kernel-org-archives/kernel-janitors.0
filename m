From: "Carlos Manuel Duclos Vergara" <carlos@embedded.cl>
Date: Mon, 05 Dec 2005 12:47:40 +0000
Subject: Re: [KJ] [PATCH] dm: uninitialize static variables
Message-Id: <50993.206.49.219.34.1133786860.squirrel@webmail.embedded.cl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051205132800.34631bbf@lucky.kitzblitz>
In-Reply-To: <20051205132800.34631bbf@lucky.kitzblitz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Kaiser <nikai@nikai.net>
Cc: kernel-janitors@lists.osdl.org, dm-devel@redhat.com

Hi,

> uninitialize static variables initialized to 0, to make them go
> to .bss instead of .data.
>

if you want that why not explicitely put them in .bss?
something like:

> -static unsigned int major = 0;
> +static unsigned int major; /* = 0 */

static unsigned int major = 0 __attribute__ ((section(".bss"));

Even when crt should take care of initializing bss to zero, so I think
that you're trying to save some cpu cycles

my $1

-- 
Carlos Manuel Duclos Vergara
http://www.toolchains.com/personal/blog

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
