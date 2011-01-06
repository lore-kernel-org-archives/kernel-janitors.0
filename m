From: Martin Knoblauch <knobi@knobisoft.de>
Date: Thu, 06 Jan 2011 12:11:31 +0000
Subject: Re: [patch] checkpatch: putting the && or || on the wrong line
Message-Id: <839814.56179.qm@web113319.mail.gq1.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110104055900.GA5062@bicker>  <20110104163836.GA30317@fieldses.org>  <20110104164414.GX5875@const.bordeaux.inria.fr>  <1294160834.6617.51.camel@Joe-Laptop> <m3fwt7i740.fsf@intrepid.localdomain> <1294249529.6617.118.camel@Joe-Laptop>
In-Reply-To: <1294249529.6617.118.camel@Joe-Laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Krzysztof Halasa <khc@pm.waw.pl>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, "J. Bruce Fields" <bfields@fieldses.org>, Dan Carpenter <error27@gmail.com>, Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

----- Original Message ----

> From: Joe Perches <joe@perches.com>
> To: Krzysztof Halasa <khc@pm.waw.pl>
> Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>; J. Bruce Fields 
><bfields@fieldses.org>; Dan Carpenter <error27@gmail.com>; Andy Whitcroft 
><apw@canonical.com>; linux-kernel@vger.kernel.org; 
>kernel-janitors@vger.kernel.org
> Sent: Wed, January 5, 2011 6:45:29 PM
> Subject: Re: [patch] checkpatch: putting the && or || on the wrong line
> 
> > Increasing e.g.
> > readability of the code would be a good reason, but  statistics?
> 
> Standardization of style in a large project  increases
> readability and decreases errors full stop.

 Anything that prevents errors from happening is good. No question.
 Anything that enforces "style" for no good reason is just counterproductive
 "readability" is a personal thing. It cannot be increased by enforcing "style". 
Not for everybody.

 And when discussing this issue we should not forget the environment. If I am a 
programmer working for a big$$$ company, I better follow their style-guide (if 
they have one). They pay my food and shelter after all. If I am "just" a 
volunteer on some mainly volunteer open source project, why should I care about 
"in my opinion" crap style. It will just drive me away from that project.

 Again as I wrote elsewhere - all depends on context. If a contribution is just 
a small patch to existing work one can easily follow the "style" of the existing 
work. If it is genuinely new work, it should be valued by the peers on technical 
merit, not on whether they like the contributors way of writing out an 
condition.

> 
> Outside of that,  it's _all_ bikeshedding.

 Your shed is my castle

> 
> cheers, Joe

Cheers
Martrin (to hell with style)
