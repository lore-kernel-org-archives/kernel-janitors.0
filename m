From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 24 Feb 2004 21:53:49 +0000
Subject: Re: [Kernel-janitors] [PATCH] 90 patches for unnecessary casts
Message-Id: <20040224135349.7fa3bf1b.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040125105212.GA2064@localhost>
In-Reply-To: <20040125105212.GA2064@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 22 Feb 2004 13:05:20 +0100 Carlo Perassi wrote:

| > I have most of these merged, but some of the changes no longer
| > apply.  Please rediff and resend the changes for:
| > 
| > drivers/net/3c527.c
| > drivers/net/tc35815.c
| > drivers/net/68360enet.c
| > 
| > (against 2.6.3).
| 
| - a patch for drivers/net/3c527.c is attached
| - drivers/net/tc35815.c is fine
| - drivers/net/68360enet.c doesn't exist. which file do you mean?

Hi, [for everyone, not just Carlo]

In the future please make sure that the beginning ("header")
for a patch begins at a linux/ top-level directory
(not something like /usr/src/linux-2.6.3) and that the
old and new lines are alike in their filename/directory
splits.  Otherwise too much hand-editing is needed.

Example received:
--- drivers/net/3c527.c	2004-02-18 04:58:12.000000000 +0100
+++ tmp/3c527.c	2004-02-22 12:58:56.000000000 +0100

Should be (e.g.):
--- old/drivers/net/3c527.c	2004-02-18 04:58:12.000000000 +0100
+++ tmp/drivers/net/3c527.c	2004-02-22 12:58:56.000000000 +0100


Thanks,
--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
