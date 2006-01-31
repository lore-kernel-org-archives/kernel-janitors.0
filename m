From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 14:53:15 +0000
Subject: Re: [KJ] [Patch 7/7] BUG_ON() Conversion in mm/vmalloc.c
Message-Id: <1138719196.12413.4.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43553929431309046=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138712609.11570.21.camel@alice>
In-Reply-To: <1138712609.11570.21.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============43553929431309046==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

> > -			if (unlikely(!area->pages[i]))
> > -				BUG();
> > +			BUG_ON(unlikely(!area->pages[i]));
> >...
> 
> You can drop the unlikely.

of course... thanks.
Here is an updated patch

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/mm/vmalloc.c.orig	2006-01-30 22:26:02.000000000 +0100
+++ linux-2.6.16-rc1-git4/mm/vmalloc.c	2006-01-30 22:26:56.000000000 +0100
@@ -321,8 +321,7 @@ void __vunmap(void *addr, int deallocate
 		int i;
 
 		for (i = 0; i < area->nr_pages; i++) {
-			if (unlikely(!area->pages[i]))
-				BUG();
+			BUG_ON(!area->pages[i]);
 			__free_page(area->pages[i]);
 		}
 



--===============43553929431309046==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43553929431309046==--
