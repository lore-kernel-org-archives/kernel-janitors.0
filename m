From: David Miller <davem@davemloft.net>
Date: Sun, 08 Jul 2012 00:26:45 +0000
Subject: Re: [PATCH] net: fix non-ANSI function declaration warning
Message-Id: <20120707.172645.1551059619722271983.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120707.161235.1181930264623743070.davem@davemloft.net>
	<1341706563.25597.170.camel@deadeye.wl.decadent.org.uk>
	<20120707.172539.1943659609718696447.davem@davemloft.net>
In-Reply-To: <20120707.172539.1943659609718696447.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bhutchings@solarflare.com
Cc: emilgoode@gmail.com, edumazet@google.com, mirq-linux@rere.qmqm.pl, jpirko@redhat.com, therbert@google.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: David Miller <davem@davemloft.net>
Date: Sat, 07 Jul 2012 17:25:39 -0700 (PDT)

> From: Ben Hutchings <bhutchings@solarflare.com>
> Date: Sun, 8 Jul 2012 01:16:03 +0100
> 
>> On Sat, 2012-07-07 at 16:12 -0700, David Miller wrote:
>>> From: Ben Hutchings <bhutchings@solarflare.com>
>>> Date: Sat, 7 Jul 2012 20:57:29 +0100
>>> 
>>> > On Sat, 2012-07-07 at 20:47 +0200, Emil Goode wrote:
>>> >> Sparse is warning about non-ANSI function declaration.
>>> >> Add void to the parameterless function.
>>> >> 
>>> >> net/core/dev.c:1804:38: warning:
>>> >> 	non-ANSI function declaration of function
>>> >> 	'netif_get_num_default_rss_queues'
>>> > 
>>> > I also posted a patch for this (and another instance I found).
>>> 
>>> But you were asked to fix up the comment formatting in on of those
>>> patches so you need to fix that up and resubmit the entire set.
>> 
>> You have got to be kidding.  I fixed one thing, so I have to fix
>> another?
> 
> You're fixing up a comment, fix it fully.

And btw when you don't respond to someone who gives you feedback I
have to assume you agree with them and intend to fix it, and thus I
automatically move all of your patches to changes-requested state
in patchwork and that's the last I will look at them.
