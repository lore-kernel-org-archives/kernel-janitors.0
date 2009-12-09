From: Jiri Kosina <jkosina@suse.cz>
Date: Wed, 09 Dec 2009 23:26:57 +0000
Subject: Re: [PATCH] Coding style correction on some drivers that use Generic
Message-Id: <alpine.LNX.2.00.0912100025190.3755@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20091209143540.GA9620@vacuum.larces.uece.br>  <20091209145554.GQ6070@fi.muni.cz> <4B1FC5A4.9030300@bfs.de> <235c15c10912091309q6c20b417y3f80dbac0be2a073@mail.gmail.com>
In-Reply-To: <235c15c10912091309q6c20b417y3f80dbac0be2a073@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rudy Matela <rudy.matela@gmail.com>
Cc: wharms@bfs.de, Jan Yenya Kasprzak <kas@fi.muni.cz>, Krzysztof Halasa <khc@pm.waw.pl>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 9 Dec 2009, Rudy Matela wrote:

> > It is ok until the driver is removed, if this "issue" is not fixed it 
> > will trigger any check-coding-style and generate new patches. Since it 
> > involves no code changes it is harmless.
>   Sould I keep sending coding style corrections to the Linux Kernel?
> I'm trying to help, but if i'm just being annoying, please tell me and
> I can try to contribute in a better way.  :-)

Coding style corrections (if they really improve readability of the code), 
comment fixes (if they really make grepping for things better or make the 
whole text more understandable) are welcome and I will happily merge them.

What I usually don't merge are purely whitespace "fixes", which don't 
really fix anything in fact.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
