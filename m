From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 19 Jan 2004 22:05:40 +0000
Subject: Re: [Kernel-janitors] [PATCH] comparison always false due to
Message-Id: <20040119140540.45a4137c.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040118152607.GB15165@picchio.gall.it>
In-Reply-To: <20040118152607.GB15165@picchio.gall.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 19 Jan 2004 21:38:39 +0100 Daniele Venzano <venza@libero.it> wrote:

| I'm CCing the ATM maintainer, just in case he wants to check if this is
| really a bug.

Good idea, I should have done that.  And thanks.
I'll leave it up to Chas then.

| On Mon, Jan 19, 2004 at 11:46:19AM -0800, Randy.Dunlap wrote:
| > On Sun, 18 Jan 2004 16:26:08 +0100 Daniele Venzano <venza@libero.it> wrote:
| > 
| > | Compiling 2.6.1 with -W as suggested somewhere in the TODO list, i run
| > | into this warning:
| > | 
| > | drivers/atm/horizon.c: In function `hrz_check_args':
| > | drivers/atm/horizon.c:2905: warning: comparison is always false due to 
| > | limited range of data type
| > | 
| > | the code affected was this:
| > | 
| > | if (max_rx_size > RX_AAL5_LIMIT)
| > |       PRINTK (KERN_NOTICE, "max_rx_size has been limited to %hu",
| > | 	    max_rx_size = RX_AAL5_LIMIT);
| > 
| > Is this a real problem?
| > The code documents the limit/restriction/requirement,
| > and it doesn't generate any code since it's always false.
| > (Yes, I checked.)
| 
| Then I think you can just ignore the patch. I didn't know of the macro
| issue.
| 
| In a similar case I've sent mail to maintainers of the bonding driver 
| where the comparison was always true and what seemed to be an error 
| path was always taken.
| I think I'll concentrate on these 'path always taken', then.
| 
| > Anyway the patch is incomplete.  The MODULE_PARM() for max_rx_size
| > should also be changed if the change above is made.
| > MODULE_PARM(max_rx_size, "h");
| >                           ^-- says that it's "short"
| >                               but doesn't do typechecking,
| > 	but new module param macros fix that.
| I test compiled the change but I was using allyesconfig, so no module
| was compiled.


--
~Randy
Everything is relative.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
