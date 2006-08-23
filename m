From: "Raseel Bhagat" <raseelbhagat@gmail.com>
Date: Wed, 23 Aug 2006 07:57:03 +0000
Subject: Re: [KJ] [PATCH] all files: init, cleanup to module init/exit
Message-Id: <f68850780608230045h2bebf5a4h82550a0268b1c134@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
In-Reply-To: <d16b1c80608220613y461197a9ye0c53b51823d8f0c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Shakti,


On 8/22/06, Shakthi Kannan <shakthimaan@gmail.com> wrote:
> From: Shakthi Kannan <shakthimaan at gmail.com>
>
> Changed init_module, cleanup_module to use module_init, module_exit in
> all necessary files in 2.6.18-rc4.
>
> Signed-off-by: Shakthi Kannan <shakthimaan at gmail.com>
>
> Index: linux-2.6.17/arch/sparc64/solaris/misc.c
> =================================> --- linux-2.6.17.orig/arch/sparc64/solaris/misc.c       2006-08-18
> 20:51:45.000000000 +0530
> +++ linux-2.6.17/arch/sparc64/solaris/misc.c    2006-08-22 11:52:58.000000000 +0530
> @@ -757,7 +757,7 @@
>
>  extern u32 entry64_personality_patch;
>
> -int init_module(void)
> +static int __int sparc_misc_init(void)

You have a typo on the above line :
correction :
static int __init sparc_misc_init(void)

>  {
>         int ret;
>
> @@ -777,13 +777,16 @@
>         return 0;
>  }
>
> -void cleanup_module(void)
> +static void __exit sparc_misc_exit(void)
>  {
>         update_ttable(solaris_syscall);
>         cleanup_socksys();
>         unregister_exec_domain(&solaris_exec_domain);
>  }
>
> +module_init(sparc_misc_init);
> +module_exit(sparc_misc_exit);
> +
>  #else
>  int init_solaris_emul(void)
>  {
>
>



-- 
Raseel.
http://osd.byethost8.com
http://raseel.livejournal.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
