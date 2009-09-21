From: Segher Boessenkool <segher@kernel.crashing.org>
Date: Mon, 21 Sep 2009 16:26:44 +0000
Subject: Re: [PATCH 5/5] arch/um: remove duplicate structure field initialization
Message-Id: <CCABB2CC-E9F7-4153-8B60-85619DE71A13@kernel.crashing.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0909192149250.27171@ask.diku.dk> <20090921160532.GC3868@hack>
In-Reply-To: <20090921160532.GC3868@hack>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?ISO-8859-1?Q?Am=E9rico_Wang?= <xiyou.wangcong@gmail.com>
Cc: Julia Lawall <julia@diku.dk>, jdike@addtoit.com, user-mode-linux-user@lists.sourceforge.net, user-mode-linux-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> "
> The initialization shall occur in initializer list order, each
> initializer provided for a particular subobject overriding any
> previously listed initializer for the same subobject [...]
> "
>
> I am wondering why gcc doesn't (can't?) complain about this?

Does -Woverride-init (included in -Wextra / -W) not work?  If so, please
file a bug report.

Thanks,


Segher

