From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 04 Feb 2004 18:34:56 +0000
Subject: Re: [Kernel-janitors] New guy here, and patch for kj.pl
Message-Id: <20040204103456.604da342.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040125123747.GA21585@noos.fr>
In-Reply-To: <20040125123747.GA21585@noos.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 25 Jan 2004 13:37:47 +0100 JOUANNE Mickael <grigouze@noos.fr> wrote:

| Hi all.
| 
| Here is a patch for kj.pl
| It doesn't detect the MOD_{INC,DEC}_USE_COUNT correctly because of a
| false regexp !
| 
| The message is also to be change it says : "Net drivers should call
| SET_MODULE_OWNER instead of MOD_{INC,DEC}_USE_COUNT" but
| MOD_{INC,DEC}_USE_COUNT is deprecated for all not only for netdrivers.
| 
| I also got a question, If i want to patch something on kernel with help
| of TODO document, do i have to tell semeone before to not work on same
| files that someone else or not ?

(did anyone reply to your question?)

It's best to let the mailing list know that you plan to tackle
something, in case someone else is already working on it.

It's also a good idea to post some changes early so that you get
some feedback on them before spending lots of time on it and
that time being wasted in the case that it's all wrong/bad.

--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
