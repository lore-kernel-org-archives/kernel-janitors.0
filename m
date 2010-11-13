From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Sat, 13 Nov 2010 10:48:59 +0000
Subject: RE: [PATCH] trivial: nandsim.c spell fixes in comments
Message-Id: <1289645339.2218.13.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTimGScstLNC2Hs1v-h6BF0y8GFTw4TJw8JEt+j8X@mail.gmail.com>
	<70E876B0EA86DD4BAF101844BC814DFE093EEF9923@Cloud.RL.local>
	<AANLkTi=ON7CSbGq=X9wOBNcNjY05-ECJzpjxXFiE0fQM@mail.gmail.com>
In-Reply-To: <AANLkTi=ON7CSbGq=X9wOBNcNjY05-ECJzpjxXFiE0fQM@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Jon Povey <Jon.Povey@racelogic.co.uk>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>

On Tue, 2010-11-02 at 16:20 +0530, srimugunthan dhandapani wrote:
> attached patch fixes the program->programm and other  spellfixes in
> comments in nandsim.c
> 
> Signed-off-by: srimugunthan  <srimugunthan.dhandapani@gmail.com>

I've applied this patch to l2-mtd-2.6.git, but please, next time send
patches so that I could just save the e-mail and apply with git-am. In
this case I had to do a lot of work:

1. Try git-am to the body and fail
2. Check that your attachment matches the body
3. Edit your attachement and add author/signoff-by/etc for you.

But thanks for the fixes anyway.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

