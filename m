From: Ingo Molnar <mingo@elte.hu>
Date: Sun, 20 Jul 2008 17:40:18 +0000
Subject: Re: [PATCH] x86-kernel: declare some functions before they get used
Message-Id: <20080720174018.GA16827@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1216050964.2719.4.camel@jaswinder.satnam>
In-Reply-To: <1216050964.2719.4.camel@jaswinder.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaswinder Singh <jaswinder@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, torvalds@linux-foundation.org, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Woodhouse <dwmw2@infradead.org>


* Jaswinder Singh <jaswinder@infradead.org> wrote:

> x86-kernel: declare some functions before they get used

i like this cleanup - would you mind to do a version of this patch that 
applies to Linus's latest -git tree?

	Ingo
