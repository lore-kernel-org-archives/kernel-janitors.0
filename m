From: Jeff Garzik <jgarzik@pobox.com>
Date: Tue, 13 Jul 2004 19:27:10 +0000
Subject: Re: [Kernel-janitors] [PATCH] IO-APIC debug message reducti
Message-Id: <40F4378E.7010707@pobox.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45949709760073754=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1089145628.2957.9.camel@tigger>
In-Reply-To: <1089145628.2957.9.camel@tigger>
To: kernel-janitors@vger.kernel.org

--===============45949709760073754==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Mark Broadbent wrote:
> --- linux-2.6.7/arch/i386/kernel/apic.c	(revision 1)
> +++ linux-2.6.7/arch/i386/kernel/apic.c	(working copy)
> @@ -40,6 +40,15 @@
>  
>  #include "io_ports.h"
>  
> +/* 
> + * Debug level
> + */
> +extern int apic_verbosity;
> +
> +/* Ensure io_apic can see this level as well */
> +EXPORT_SYMBOL(apic_verbosity);


Your patch looks OK to me except for one small bit, above.

First, you should put the 'extern int apic_verbosity' in a header, 
presumeably the same header into which you stashed 
APIC_{QUIET,VERBOSE,DEBUG} definitions.

Second, it is highly unlikely that this symbol should be exported to 
kernel modules.

	Jeff



--===============45949709760073754==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45949709760073754==--
