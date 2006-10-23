From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 23 Oct 2006 11:09:39 +0000
Subject: Re: [KJ] make pdfdocs broken in 2.6.19rc2 and needs fixes
Message-Id: <1161601779.19388.20.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200610222347.42418.ak@suse.de>
In-Reply-To: <200610222347.42418.ak@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Ar Sul, 2006-10-22 am 23:47 +0200, ysgrifennodd Andi Kleen:
> When you do make pdfdocs  with 2.6.19rc2-git7 you get tons of error 
> messages and  then some corrupted PDFs in the end.

Some vendor shipped pdf and TeX tools are problematic. It works
correctly on Red Hat except for kernel-api which has become too big for
the default settings when ext4 was added. The TeX hash size gets
exceeded, TeX emits

"! TeX capacity exceeded, sorry [hash size`000].
If you really absolutely need more capacity,
you can ask a wizard to enlarge me."


Really it would be nice to find a more modern way from the input to pdf
without going via tex.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
