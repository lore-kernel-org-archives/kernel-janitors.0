From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 28 Jan 2007 00:00:53 +0000
Subject: Re: [KJ] replacing "__FUNCTION__" with "__func__"?
Message-Id: <Pine.LNX.4.64.0701271859560.3437@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701271038360.9089@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701271038360.9089@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 27 Jan 2007, Howell, David P wrote:

> If it's only a shorter version for __FuNCTION__, is this eally worth
> the trouble? With no other benefits I'd forget it.

that was pretty much my take on it.  massive disruption for minimal
gain, although any *new* code should be strongly encouraged to use the
shorter form.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
