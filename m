From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 08 Aug 2013 19:45:32 +0000
Subject: Re: [PATCH] convert comma to semicolon
Message-Id: <alpine.DEB.2.02.1308082144110.2013@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375990372-19033-1-git-send-email-Julia.Lawall@lip6.fr> <1375990998.2424.168.camel@joe-AO722>
In-Reply-To: <1375990998.2424.168.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 8 Aug 2013, Joe Perches wrote:

> On Thu, 2013-08-08 at 21:32 +0200, Julia Lawall wrote:
> > These patches result from the following semantic patch
> > (http://coccinelle.lip6.fr/), which checks for expression statements
> > separated by , rather than by ;.  The rule is quite conservative in that it
> > only finds cases where this pattern appears after a statement that ends
> > with ;, to ensure that the expression statements do not form an if branch
> > or loop body.  Iteration is used to treat arbitrary sequences of commas.
> 
> Nice.

Thanks.

> Maybe there also some cases where a block close brace
> is followed by a statement , then statement ;
> 
> Like from fs/reiserfs/fix_node.c
> 
>    231          if ((unsigned int)cur_free >>    232              (vn->vn_size -
>    233               ((vi->vi_type & VI_TYPE_LEFT_MERGEABLE) ? IH_SIZE : 0))) {
>    234                  /* all contents of S[0] fits into L[0] */
>    235  
>    236                  RFALSE(vn->vn_mode = M_INSERT || vn->vn_mode = M_PASTE,
>    237                         "vs-8055: invalid mode or balance condition failed");
>    238  
>    239                  tb->lnum[0] = vn->vn_nr_item;
>    240                  tb->lbytes = -1;
>    241                  return;
>    242          }
>    243  
>    244          d_size = 0, ih_size = IH_SIZE;

I did think of a } as another safe case, but actually, I would not have 
done anything with this one because they are both on the same line.  But I 
was more thinking of i++, j++; which I saw somewhere.  This one is a bit 
more complicated. and would probably be better on separate lines.

Thanks for the feedback.

julia
