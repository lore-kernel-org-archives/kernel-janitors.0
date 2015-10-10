From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 10 Oct 2015 21:12:55 +0000
Subject: Re: [PATCH 5/5] arm: add missing of_node_put
Message-Id: <alpine.DEB.2.02.1510102310230.2053@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444480254-14399-1-git-send-email-Julia.Lawall@lip6.fr>
 <1444480254-14399-6-git-send-email-Julia.Lawall@lip6.fr>
 <8655275.vMqHQfLN9g@wuerfel> <20151010230802.71d1c421@free-electrons.com>
In-Reply-To: <20151010230802.71d1c421@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Sat, 10 Oct 2015, Thomas Petazzoni wrote:

> Arnd,
> 
> On Sat, 10 Oct 2015 23:02:15 +0200, Arnd Bergmann wrote:
> 
> > The same for_each_child_of_node() loop has three 'return' statements'
> > aside from the 'break' statement here. I think you should change your
> > semantic patch to cover both cases.
> 
> I think Julia's semantic patch covers both cases, but only the cases
> where there is one break or return (though I have essentially zero
> Coccinelle knowledge, this is all based on guessing looking at the
> semantic patch in the cover letter).

Normally, it should be OK with lots of returns.  And contrary to my 
previous email, even with return;.  Will check on it.

julia
