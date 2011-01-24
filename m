From: Vasiliy Kulikov <segooon@gmail.com>
Date: Mon, 24 Jan 2011 20:14:48 +0000
Subject: Re: [PATCH 2/4] arch/arm/mach-at91/clock.c: Add missing IS_ERR test
Message-Id: <20110124201447.GA31162@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1295898922-18822-1-git-send-email-julia@diku.dk>
	<1295898922-18822-3-git-send-email-julia@diku.dk>
	<4D3DD964.9020107@bluewatersys.com>
	<Pine.LNX.4.64.1101242058430.3167@ask.diku.dk>
	<20110124200515.GA30963@albatros>
	<Pine.LNX.4.64.1101242108180.3167@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1101242108180.3167@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Mon, Jan 24, 2011 at 21:09 +0100, Julia Lawall wrote:
> On Mon, 24 Jan 2011, Vasiliy Kulikov wrote:
> > clk_get() is defined per-architecture, sometimes it is NULL only.
> 
> In this case there is a definition in the same file, so it doesn't seem 
> necessary to worry about possible other ones.  Unless there is some goal 
> in the future to remove the local one?

My oppinion is that even such architecture dependent code written in
architecure indepenent way is highly desirable.  Besides more clean code
it is probably review by smaller group of people, so it is potentially
more buggy.


Thanks,

-- 
Vasiliy
