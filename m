From: "Carlos Manuel Duclos Vergara" <carlos@embedded.cl>
Date: Mon, 05 Dec 2005 18:06:49 +0000
Subject: Re: [KJ] [PATCH] dm: uninitialize static variables
Message-Id: <56471.206.49.219.34.1133806009.squirrel@webmail.embedded.cl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051205132800.34631bbf@lucky.kitzblitz>
	<50993.206.49.219.34.1133786860.squirrel@webmail.embedded.cl>
	<20051205190029.4b29e759@lucky.kitzblitz>
In-Reply-To: <20051205190029.4b29e759@lucky.kitzblitz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Kaiser <nikai@nikai.net>
Cc: kernel-janitors@lists.osdl.org, dm-devel@redhat.com, Carlos Manuel Duclos Vergara <carlos@embedded.cl>

>  static unsigned int __attribute__((__section__(".bss"))) major = 0;
>  static unsigned int __attribute__((__section__(".bss"))) _major = 0;

it should be:

static unsigned int major __attribute__ ((section(".bss"))) = 0;

> If you could tell me how to achieve this in a fancy way which also works,
> I'm all ears. Maybe the janitorial steering committee might also like the
> idea enough to adjust their current TODO list.

yup, maybe it's worth of a discussion on the list

-- 
Carlos Manuel Duclos Vergara
http://www.toolchains.com/personal/blog

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
