From: Wim Van Sebroeck <wim@iguana.be>
Date: Wed, 04 Feb 2004 19:45:30 +0000
Subject: [Kernel-janitors] Re: [PATCH] Make watchdogs depend on their
Message-Id: <20040204204530.B30061@infomag.infomag.iguana.be>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Matthew,

> In order to make the watchdog menu useful for some architectures, we need
> to only be able to select the watchdogs that can compile.  This patch also
> moves the SuperH watchdog from its own Kconfig file to the normal one.

I like it (it was still on my todo list :-) ). I'll test it and apply it to my bitkeeper tree
this weekend (together with some other changes).

Greetings,
Wim.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
