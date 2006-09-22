From: "Alexey Dobriyan" <adobriyan@gmail.com>
Date: Fri, 22 Sep 2006 17:57:06 +0000
Subject: [KJ] Gentlemen with commit access
Message-Id: <b6fcc0a0609221057qb40ad65n30633339321f22c9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

And ladies, too

Could one of you, please, remove the following text at the very end of TODO

>  The same task should be done for extern data declarations.

and edit next 3 lines so it wouldn't apply only to prototypes.

In short: __initdata et al should be retained because of FRV where
absence of them
generate link error.

I has exellent explanation but it's on my devel box which is far away right now.

thanks

    Alexey "before too late" Dobriyan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
