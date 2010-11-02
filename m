From: Jon Povey <Jon.Povey@racelogic.co.uk>
Date: Tue, 02 Nov 2010 01:24:54 +0000
Subject: RE: [PATCH] trivial: nandsim.c spell fixes in comments
Message-Id: <70E876B0EA86DD4BAF101844BC814DFE093EEF9923@Cloud.RL.local>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <AANLkTimGScstLNC2Hs1v-h6BF0y8GFTw4TJw8JEt+j8X@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>

linux-mtd-bounces@lists.infradead.org wrote:
> attached patch has trivial spell fixes in comments in nandsim.c
> Signed-off-by: srimugunthan  <srimugunthan.dhandapani@gmail.com>
>
> ------
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index a6a73aa..697979c 100644 --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c

...

> - * only needed for page programm operation with preceeded read command
> + * only needed for page programm operation with preceded read command

Might as well fix programm -> program while you are there?

--
Jon Povey
jon.povey@racelogic.co.uk

Racelogic is a limited company registered in England. Registered number 2743719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Bucks, MK18 1TB .

The information contained in this electronic mail transmission is intended by Racelogic Ltd for the use of the named individual or entity to which it is directed and may contain information that is confidential or privileged. If you have received this electronic mail transmission in error, please delete it from your system without copying or forwarding it, and notify the sender of the error by reply email so that the sender's address records can be corrected. The views expressed by the sender of this communication do not necessarily represent those of Racelogic Ltd. Please note that Racelogic reserves the right to monitor e-mail communications passing through its network


