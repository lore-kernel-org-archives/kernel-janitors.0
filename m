From: Christoph Hellwig <hch@infradead.org>
Date: Fri, 31 Aug 2007 13:53:23 +0000
Subject: Re: [PATCH] trivial - constify sched.h
Message-Id: <20070831135323.GA24509@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1188247231.18004.129.camel@localhost> <20070827213323.GA1759@martell.zuzino.mipt.ru> <Pine.LNX.4.64.0708302120290.24730@fbirervta.pbzchgretzou.qr> <alpine.LFD.0.999.0708310121121.28360@enigma.security.iitk.ac.in> <Pine.LNX.4.64.0708302247070.10266@fbirervta.pbzchgretzou.qr>
In-Reply-To: <Pine.LNX.4.64.0708302247070.10266@fbirervta.pbzchgretzou.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: Satyam Sharma <satyam@infradead.org>, Alexey Dobriyan <adobriyan@gmail.com>, Joe Perches <joe@perches.com>, Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 30, 2007 at 10:55:49PM +0200, Jan Engelhardt wrote:
> "those callers". There was _exactly one_ caller, and that was an out-of-tree
> module. There were not any in-kernel callers before, and it did not generate
> any warning. That is perhaps why no one had constified it before me. This does
> not mean we should wait for a caller to pop up before constifying IMHO.

In this case we should just kill it instead of messing with constness.

