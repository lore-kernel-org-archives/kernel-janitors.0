From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 20 Apr 2004 23:38:05 +0000
Subject: Re: [Kernel-janitors] [PATCH] ide fix, round 2
Message-Id: <20040420163805.274f25af.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============028027438021380302=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200404150000.i3F000ZT003450@p-chan.krl.com>
In-Reply-To: <200404150000.i3F000ZT003450@p-chan.krl.com>
To: kernel-janitors@vger.kernel.org

--===============028027438021380302==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Apr 2004 08:16:50 -0400 Don Koch wrote:

| tony@bakeyournoodle.com said:
| >
| > Looking at this issue, I wondered if something like the (untested) patch
| > below might be better.  My thinking is that it moves knowledge of the
| > config into ide.h and then unconditionally uses pnpide_init(), of course
| > this /may/ be more confusing???
| > 
| > If this approach is good then the same logic could be applied to the
| > whole probe_for_hwifs() function.
| > 
| > Please comment
| > 		----------------------------------------
| > diff -X dontdiff -urN 2.6.5.clean/drivers/ide/ide.c 2.6.5.ide/drivers/ide/ide.c
| > --- 2.6.5.clean/drivers/ide/ide.c	2004-04-04 15:22:33.000000000 +1000
| > +++ 2.6.5.ide/drivers/ide/ide.c	2004-04-18 13:46:02.000000000 +1000
| > @@ -2104,12 +2104,7 @@
| >  		buddha_init();
| >  	}
| >  #endif /* CONFIG_BLK_DEV_BUDDHA */
| > -#if defined(CONFIG_BLK_DEV_IDEPNP) && defined(CONFIG_PNP)
| > -	{
| > -		extern void pnpide_init(int enable);
| > -		pnpide_init(1);
| > -	}
| > -#endif /* CONFIG_BLK_DEV_IDEPNP */
| > +	pnpide_init(1);
| >  }
| >  
| >  /*
| > @@ -2244,9 +2239,7 @@
| >  		up(&ide_setting_sem);
| >  		return 1;
| >  	}
| > -#if defined(CONFIG_BLK_DEV_IDEPNP) && defined(CONFIG_PNP) && defined(MODULE)
| >  	pnpide_init(0);
| > -#endif /* CONFIG_BLK_DEV_IDEPNP */
| >  #ifdef CONFIG_PROC_FS
| >  	ide_remove_proc_entries(drive->proc, DRIVER(drive)->proc);
| >  	ide_remove_proc_entries(drive->proc, generic_subdriver_entries);
| > diff -X dontdiff -urN 2.6.5.clean/include/linux/ide.h 2.6.5.ide/include/linux/ide.h
| > --- 2.6.5.clean/include/linux/ide.h	2004-04-04 15:22:57.000000000 +1000
| > +++ 2.6.5.ide/include/linux/ide.h	2004-04-18 13:48:03.000000000 +1000
| > @@ -1666,4 +1666,12 @@
| >  
| >  extern struct bus_type ide_bus_type;
| >  
| > +#if defined(CONFIG_BLK_DEV_IDEPNP) && defined(CONFIG_PNP)
| > +extern void pnpide_init(int enable);
| > +#else
| > +static inline void pnpide_init(int enable)
| > +{
| > +}
| > +#endif /* CONFIG_BLK_DEV_IDEPNP */
| > +
| >  #endif /* _IDE_H */
| > 		----------------------------------------

| 
| I find this to be more obfuscating.  Looking at just the source code, it
| looks like you always try to run pnpide_init().  It's not obvious that
| it is null unless you look at the header file, too.  I vote for the
| clearer code.

Sometimes this is a tough call, but I too prefer Don's simpler, clearer
patch.

We often try to eliminate ifdef/endif from inside functions, but some
some basic CONFIG_type issues, it makes sense to just be straightforward
about it, as in this case.

| Besides, there are two places in the code where pnpide_init() is called.
| I think the ifdefs were slightly different, too.

The ifdefs differ only by a MODULE, since the non-MODULE case doesn't
(or didn't) need to cleanup on kernel "exit" (shutdown).

--
~Randy

--===============028027438021380302==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============028027438021380302==--
