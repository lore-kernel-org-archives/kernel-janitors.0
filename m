From: Dan Carpenter <error27@gmail.com>
Date: Mon, 27 Jun 2011 06:50:37 +0000
Subject: Re: [patch] nouveau: free the memory in nouveau_gart_manager_del()
Message-Id: <20110627065037.GV14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110625055324.GS14591@shale.localdomain>
In-Reply-To: <20110625055324.GS14591@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jun 27, 2011 at 06:59:54AM +0200, Julia Lawall wrote:
> On Mon, 27 Jun 2011, walter harms wrote:
> 
> > great bug to make sure that mem is never freed :)
> > 
> > @julia,
> > 
> > can coccinelle find this type  ?
> 
> Yes, I looked and didn't find any other than this one.
>

I've found a hand full of these in the past, but I've fixed them all.
:P

regards,
dan carpenter

