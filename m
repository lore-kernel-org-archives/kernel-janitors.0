From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 21 Jan 2004 19:35:55 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/.../saa7146_hlp - use {min,
Message-Id: <20040121113555.0fead207.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040121190612.GA26666@eugeneteo.net>
In-Reply-To: <20040121190612.GA26666@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 22 Jan 2004 03:06:12 +0800 Eugene Teo <eugene.teo@eugeneteo.net> wrote:

| use {min,max}_t instead of home-brewed my_{min,max} macros.
| straight-forward. patch compiles, and tested.
| 

This patch and the previous ISDN driver patch both have
a line of trailing whitespace (now fixed).

Please use some method (script, editor, whatever) to detect
and prevent that in the future.

--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
