From: Tim Cooijmans <tim@aapopfiets.nl>
Date: Tue, 28 Feb 2006 05:53:32 +0000
Subject: Re: [KJ] [PATCH] check request_region() return value in arch/ppc and
Message-Id: <200602280653.32341.tim@aapopfiets.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602272229.51950.tim@aapopfiets.nl>
In-Reply-To: <200602272229.51950.tim@aapopfiets.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 28 February 2006 06:33, Tim Cooijmans wrote:
>  static void __init pplus_init2(void)
>  {
>  #ifdef CONFIG_NVRAM
>  	request_region(PREP_NVRAM_AS0, 0x8, "nvram");
>  #endif
Whoops, missed one there.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
