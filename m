From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 29 Jan 2007 17:53:51 +0000
Subject: Re: [KJ] replacing "__FUNCTION__" with "__func__"?
Message-Id: <20070129175351.GA5546@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701271038360.9089@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701271038360.9089@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jan 27, 2007 at 03:47:37PM -0800, Howell, David P wrote:

[s/__FUNCTION__/__func__/g]

> If it's only a shorter version for __FuNCTION__, is this eally worth
> the trouble? With no other benefits I'd forget it.

__func__ is in C99.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
