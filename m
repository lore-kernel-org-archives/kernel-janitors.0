From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 23 Feb 2004 00:35:44 +0000
Subject: Re: [Kernel-janitors] [PATCH] 90 patches for unnecessary casts
Message-Id: <20040222163544.27a4fc9a.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040125105212.GA2064@localhost>
In-Reply-To: <20040125105212.GA2064@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 22 Feb 2004 13:05:20 +0100 Carlo Perassi <carlo@linux.it> wrote:

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

I see, it was in 2.6.1 but has now disappeared ... or been
reinvented as fec.c.... which appears to need 1 unneeded cast
repaired.

--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
