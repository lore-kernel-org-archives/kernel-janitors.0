From: Don Koch <aardvark@krl.com>
Date: Sun, 18 Apr 2004 12:16:50 +0000
Subject: Re: [Kernel-janitors] [PATCH] ide fix, round 2
Message-Id: <200404181216.i3ICGo17026258@p-chan.krl.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67659854186156565=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200404150000.i3F000ZT003450@p-chan.krl.com>
In-Reply-To: <200404150000.i3F000ZT003450@p-chan.krl.com>
To: kernel-janitors@vger.kernel.org

--===============67659854186156565==
Content-Type: text/plain; charset=us-ascii

tony@bakeyournoodle.com said:
>
> Looking at this issue, I wondered if something like the (untested) patch
> below might be better.  My thinking is that it moves knowledge of the
> config into ide.h and then unconditionally uses pnpide_init(), of course
> this /may/ be more confusing???
> 
> If this approach is good then the same logic could be applied to the
> whole probe_for_hwifs() function.
> 
> Please comment
> 		----------------------------------------
> diff -X dontdiff -urN 2.6.5.clean/drivers/ide/ide.c 2.6.5.ide/drivers/ide/ide.c
> --- 2.6.5.clean/drivers/ide/ide.c	2004-04-04 15:22:33.000000000 +1000
> +++ 2.6.5.ide/drivers/ide/ide.c	2004-04-18 13:46:02.000000000 +1000
> @@ -2104,12 +2104,7 @@
>  		buddha_init();
>  	}
>  #endif /* CONFIG_BLK_DEV_BUDDHA */
> -#if defined(CONFIG_BLK_DEV_IDEPNP) && defined(CONFIG_PNP)
> -	{
> -		extern void pnpide_init(int enable);
> -		pnpide_init(1);
> -	}
> -#endif /* CONFIG_BLK_DEV_IDEPNP */
> +	pnpide_init(1);
>  }
>  
>  /*
> @@ -2244,9 +2239,7 @@
>  		up(&ide_setting_sem);
>  		return 1;
>  	}
> -#if defined(CONFIG_BLK_DEV_IDEPNP) && defined(CONFIG_PNP) && defined(MODULE)
>  	pnpide_init(0);
> -#endif /* CONFIG_BLK_DEV_IDEPNP */
>  #ifdef CONFIG_PROC_FS
>  	ide_remove_proc_entries(drive->proc, DRIVER(drive)->proc);
>  	ide_remove_proc_entries(drive->proc, generic_subdriver_entries);
> diff -X dontdiff -urN 2.6.5.clean/include/linux/ide.h 2.6.5.ide/include/linux/ide.h
> --- 2.6.5.clean/include/linux/ide.h	2004-04-04 15:22:57.000000000 +1000
> +++ 2.6.5.ide/include/linux/ide.h	2004-04-18 13:48:03.000000000 +1000
> @@ -1666,4 +1666,12 @@
>  
>  extern struct bus_type ide_bus_type;
>  
> +#if defined(CONFIG_BLK_DEV_IDEPNP) && defined(CONFIG_PNP)
> +extern void pnpide_init(int enable);
> +#else
> +static inline void pnpide_init(int enable)
> +{
> +}
> +#endif /* CONFIG_BLK_DEV_IDEPNP */
> +
>  #endif /* _IDE_H */
> 		----------------------------------------
> 
> Yours Tony
> 
>         linux.conf.au       http://lca2005.linux.org.au/
> 	Apr 18-23 2005      The Australian Linux Technical Conference!
> 

I find this to be more obfuscating.  Looking at just the source code, it
looks like you always try to run pnpide_init().  It's not obvious that
it is null unless you look at the header file, too.  I vote for the
clearer code.

Besides, there are two places in the code where pnpide_init() is called.
I think the ifdefs were slightly different, too.

-- 
Don Koch
http://www.krl.com/



--===============67659854186156565==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67659854186156565==--
