From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Mon, 10 Apr 2006 10:43:52 +0000
Subject: Re: [KJ] [PATCH 2.6.17-rc1-mm2] net: cleanup CONFIG_PCI from dgrs.c
Message-Id: <443A36E8.4090403@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <443942FE.6060400@student.ltu.se>
In-Reply-To: <443942FE.6060400@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Andrew Morton wrote:

>Richard Knutsson <ricknu-0@student.ltu.se> wrote:
>  
>
>>From: Richard Knutsson <ricknu-0@student.ltu.se>
>>
>>Removed (I believe) unnecessary CONFIG_PCI and an ugly (previous patch 
>>of mine) empty struct if !CONFIG_PCI.
>>
>>Compiled tested, with and without an "#undef CONFIG_PCI" in dgrs.c, with 
>>no warnings/errors.
>>
>>    
>>
>
>If !CONFIG_PCI we don't want to be compiling that relatively large but
>unused dgrs_pci_probe() into the object file.;
>  
>
Oh, sorry about that. Thought the compiler optimized those away.
Have looked through the Makefile now (better late then never, right?)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
