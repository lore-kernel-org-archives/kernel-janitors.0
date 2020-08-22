From: Joe Perches <joe@perches.com>
Date: Sat, 22 Aug 2020 01:08:08 +0000
Subject: Re: [Cocci] coccinelle: Convert comma to semicolons (was Re: [PATCH] checkpatch: Add test for comma 
Message-Id: <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200818184107.f8af232fb58b17160c570874@linux-foundation.org>
 <3bf27caf462007dfa75647b040ab3191374a59de.camel@perches.com>
 <b0fd63e4b379eda69ee85ab098353582b8c054bb.camel@perches.com>
 <alpine.DEB.2.22.394.2008201021400.2524@hadrien>
 <a5713d8597065ef986f780499428fcc4cd31c003.camel@perches.com>
 <alpine.DEB.2.22.394.2008201856110.2524@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2008201856110.2524@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>, kernel-janitors <kernel-janitors@vger.kernel.org>, kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-kernel-mentees@lists.linuxfoundation.org
Cc: Giuseppe Scrivano <gscrivan@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Whitcroft <apw@shadowen.org>, cocci <cocci@systeme.lip6.fr>, LKML <linux-kernel@vger.kernel.org>

(forwarding on to kernel-janitors/mentees and kernelnewbies)

Just fyi for anyone that cares:

A janitorial task for someone might be to use Julia's coccinelle
script below to convert the existing instances of commas that
separate statements into semicolons.

https://lore.kernel.org/lkml/alpine.DEB.2.22.394.2008201856110.2524@hadrien/

On Thu, 2020-08-20 at 19:03 +0200, Julia Lawall wrote:
> > > I have a bunch of variations of this that are more complicated than I
> > > would have expected.  One shorter variant that I have is:
> > > 
> > > @@
> > > expression e1,e2;
> > > statement S;
> > > @@
> > > 
> > >  S
> > >  e1
> > > -,
> > > +;
> > >   (<+... e2 ...+>);
> > > 
> > > This will miss cases where the first statement is the comma thing.  But I
> > > think it is possible to improve this now.  I will check.
> > 
> > Hi Julia.
> > 
> > Right, thanks, this adds a dependency on a statement
> > before the expression.  Any stragglers would be easily
> > found using slightly different form.
> > There are not very many of these in linux kernel.
> > 
> > Another nicety would be to allow the s/,/;/ conversion to
> > find both b and c in this sequence:
> > 	a = 1;
> > 	b = 2,
> > 	c = 3,
> > 	d = 4;
> > without running the script multiple times.
> > There are many dozen uses of this style in linux kernel.
> > 
> > I tried variants of adding a comma after the e2 expression,
> > but cocci seems to have parsing problems with:
> > 
> > @@
> > expression e1;
> > expression e2;
> > @@
> > 	e1
> > -	,
> > +	;
> > 	e2,
> 
> This doesn't work because it's not a valid expression.
> 
> The problem is solved by doing:
> 
>   e1
> - ,
> + ;
>   e2
>   ... when any
> 
> But that doesn't work in the current version of Coccinelle.  I have fixed
> the problem, though and it will work shortly.
> 
> > I do appreciate that coccinelle adds braces for multiple
> > expression comma use after an if.
> > 
> > i.e.:
> > 	if (foo)
> > 		a = 1, b = 2;
> > becomes
> > 	if (foo) {
> > 		a = 1; b = 2;
> > 	}
> 
> I wasn't sure what was wanted for such things.  Should b = 2 now be on a
> separate line?
> 
> I took the strategy of avoiding the problem and leaving those cases as is.
> That also solves the LIST_HEAD problem.  But if it is wanted to change
> these commas under ifs, then that is probably possible too.
> 
> My current complete solution is as follows.  The first rule avoids changing
> commas in macros, where thebody of the macro is just an expression.  The
> second rule uses position variables to ensure that the two expression are
> on different lines.
> 
> @r@
> expression e1,e2;
> statement S;
> position p;
> @@
> 
> e1 ,@S@p e2;
> 
> @@
> expression e1,e2;
> position p1;
> position p2 :
>     script:ocaml(p1) { not((List.hd p1).line_end = (List.hd p2).line) };
> statement S;
> position r.p;
> @@
> 
> e1@p1
> -,@S@p
> +;
> e2@p2
> ... when any
> 
> The generated patch is below.
> 
> julia
> 
> diff -u -p a/drivers/reset/hisilicon/reset-hi3660.c b/drivers/reset/hisilicon/reset-hi3660.c
> --- a/drivers/reset/hisilicon/reset-hi3660.c
> +++ b/drivers/reset/hisilicon/reset-hi3660.c
> @@ -89,7 +89,7 @@ static int hi3660_reset_probe(struct pla
>  		return PTR_ERR(rc->map);
>  	}
> 
> -	rc->rst.ops = &hi3660_reset_ops,
> +	rc->rst.ops = &hi3660_reset_ops;
>  	rc->rst.of_node = np;
>  	rc->rst.of_reset_n_cells = 2;
>  	rc->rst.of_xlate = hi3660_reset_xlate;

The rest of the changes are in the link above...
