From: Jim Nelson <james4765@verizon.net>
Date: Sat, 20 Nov 2004 04:33:33 +0000
Subject: Re: [KJ] [PATCH] floppy: Reorganize drivers/block/floppy.c
Message-Id: <419EC91D.5030907@verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56467843564881703=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041105014000.11993.38553.30904@localhost.localdomain> <20041119223142.GJ2202@stro.at>
In-Reply-To: <20041119223142.GJ2202@stro.at>
To: maximilian attems <janitor@sternwelten.at>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============56467843564881703==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

maximilian attems wrote:
> On Thu, 04 Nov 2004, james4765@verizon.net wrote:
> 
> 
>>Organization of global variables, macros, and #defines in floppy.c
>>
>>Signed-off-by: James Nelson <james4765@gmail.com>
>>
>>diff -urN --exclude='*~' linux-2.6.9-original/drivers/block/floppy.c linux-2.6.9/drivers/block/floppy.c
>>--- linux-2.6.9-original/drivers/block/floppy.c	2004-10-18 17:53:22.000000000 -0400
>>+++ linux-2.6.9/drivers/block/floppy.c	2004-11-04 20:25:28.180478012 -0500
> 
> 
> hmm could you split up your patch in logical hunks?

Well, it won't apply to 2.6.10-rc2 anyway (sone ACPI stuff was added), so it 
wouldn't be any less work to re-do it ;)

I guess I'll just take it in smaller chunks, then - spread out over a few -rc's.

> nitpicking: your patch adds whitespace.
> 
> a++ maks
> -
> 


--===============56467843564881703==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56467843564881703==--
