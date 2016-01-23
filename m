From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 23 Jan 2016 00:36:34 +0000
Subject: Re: [PATCH] mtd: nand: mpc5121: use 'of_machine_is_compatible' to simplify code
Message-Id: <20160123003634.GA16842@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1452408399-5840-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <20160111135558.6ebd1165@bbrezillon>
In-Reply-To: <20160111135558.6ebd1165@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, dwmw2@infradead.org, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

On Mon, Jan 11, 2016 at 01:55:58PM +0100, Boris Brezillon wrote:
> On Sun, 10 Jan 2016 07:46:39 +0100
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 
> > The current code is the same as 'of_machine_is_compatible'.
> > So use it in order to remove a few lines of code and to be more
> > consistent with other parts of the kernel.
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Your patch looks good from a functional POV, but what is this board
> detection hack doing in the NAND driver code in the first place?
> 
> Let's say I didn't see that :-).

:)

> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied to l2-mtd.git/next
