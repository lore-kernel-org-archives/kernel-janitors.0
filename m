From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Thu, 22 Jan 2004 02:15:01 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/.../saa7146_hlp - use {min,
Message-Id: <20040122021501.GA28706@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040121190612.GA26666@eugeneteo.net>
In-Reply-To: <20040121190612.GA26666@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

<quote sender="Randy.Dunlap">
> On Thu, 22 Jan 2004 03:06:12 +0800 Eugene Teo <eugene.teo@eugeneteo.net> wrote:
> 
> | use {min,max}_t instead of home-brewed my_{min,max} macros.
> | straight-forward. patch compiles, and tested.
> 
> This patch and the previous ISDN driver patch both have
> a line of trailing whitespace (now fixed).

I guess it must be my editor (vim) because I don't untentionally
add a line of trailing whitespace for no reasons.

Will use your "grep" method.

Eugene

> Please use some method (script, editor, whatever) to detect
> and prevent that in the future.
> 
> --
> ~Randy
> kernel-janitors project:  http://janitor.kernelnewbies.org/
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors
> 

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
