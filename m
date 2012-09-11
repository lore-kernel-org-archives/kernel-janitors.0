From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 11 Sep 2012 09:47:38 +0000
Subject: Re: [PATCH] idr: Rename MAX_LEVEL to MAX_ID_LEVEL
Message-Id: <20120911094738.GA32509@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120910131426.GA12431@localhost>
 <1347352069.14488.12.camel@thorin>
In-Reply-To: <1347352069.14488.12.camel@thorin>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Cc: Andrew Morton <akpm@linux-foundation.org>, Glauber Costa <glommer@parallels.com>, kernel-janitors@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>

Hi Bernd,

> > -#define MAX_LEVEL (MAX_ID_SHIFT + IDR_BITS - 1) / IDR_BITS
> > +#define MAX_ID_LEVEL (MAX_ID_SHIFT + IDR_BITS - 1) / IDR_BITS
> 
> And while you are it: Please add '(' and ')' around it as in 
> 
> #define MAX_ID_LEVEL ((MAX_ID_SHIFT + IDR_BITS - 1) / IDR_BITS)

Good idea. Done.

> 
> >  /* Number of id_layer structs to leave in free list */
> > -#define IDR_FREE_MAX MAX_LEVEL + MAX_LEVEL
> > +#define IDR_FREE_MAX MAX_ID_LEVEL + MAX_ID_LEVEL
> #define IDR_FREE_MAX (MAX_ID_LEVEL + MAX_ID_LEVEL)
> 
> For starters (sleeping in "cpp-101";-): People may use it as in
> "IDR_FREE_MAX * 2".
> And I didn't look into that file - that should be changed everywhere in
> that way.

Sure. It's the only place that need change.

Thanks,
Fengguang
