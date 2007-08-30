From: Jan Engelhardt <jengelh@computergmbh.de>
Date: Thu, 30 Aug 2007 19:24:16 +0000
Subject: Re: [PATCH] trivial - constify sched.h
Message-Id: <Pine.LNX.4.64.0708302120290.24730@fbirervta.pbzchgretzou.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1188247231.18004.129.camel@localhost> <20070827213323.GA1759@martell.zuzino.mipt.ru>
In-Reply-To: <20070827213323.GA1759@martell.zuzino.mipt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Joe Perches <joe@perches.com>, Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On Aug 28 2007 01:33, Alexey Dobriyan wrote:
>
>On Mon, Aug 27, 2007 at 01:40:31PM -0700, Joe Perches wrote:
>> Add const to some struct task_struct * uses
>
>Why, oh, why?


So that you can actually pass in a const struct task_struct * without having
to cast it back to [non-const].

Why one would have a const struct task_struct * in the first place
is a different matter.

But see http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;hwadbfbf4cf96fedf9b75bb330704828c187b190


	Jan
-- 
