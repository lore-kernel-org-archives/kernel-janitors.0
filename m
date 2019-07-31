From: Joonwon Kang <kjw1627@gmail.com>
Date: Wed, 31 Jul 2019 16:25:37 +0000
Subject: Re: [PATCH] randstruct: fix a bug in is_pure_ops_struct()
Message-Id: <20190731162537.GA23152@host>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190727155841.GA13586@host>
 <201907301008.622218EE5@keescook>
In-Reply-To: <201907301008.622218EE5@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: re.emese@gmail.com, kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, jinb.park7@gmail.com

On Tue, Jul 30, 2019 at 10:11:19AM -0700, Kees Cook wrote:
> On Sun, Jul 28, 2019 at 12:58:41AM +0900, Joonwon Kang wrote:
> > Before this, there were false negatives in the case where a struct
> > contains other structs which contain only function pointers because
> > of unreachable code in is_pure_ops_struct().
> 
> Ah, very true. Something like:
> 
> struct internal {
> 	void (*callback)(void);
> };
> 
> struct wrapper {
> 	struct internal foo;
> 	void (*other_callback)(void);
> };
> 
> would have not been detected as is_pure_ops_struct()?
> 
> How did you notice this? (Are there cases of this in the kernel?)

When I compiled kernel with allyesconfig, there seemed to be no such cases,
but I found the bug just by code review and test.
However, I would like to slightly modify this patch and add one more patch.
I will send the patch set soon.

> 
> > Signed-off-by: Joonwon Kang <kjw1627@gmail.com>
> 
> Applied; thanks!
> 
> -Kees
> 
> > ---
> >  scripts/gcc-plugins/randomize_layout_plugin.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> > 
> > diff --git a/scripts/gcc-plugins/randomize_layout_plugin.c b/scripts/gcc-plugins/randomize_layout_plugin.c
> > index 6d5bbd31db7f..a123282a4fcd 100644
> > --- a/scripts/gcc-plugins/randomize_layout_plugin.c
> > +++ b/scripts/gcc-plugins/randomize_layout_plugin.c
> > @@ -443,13 +443,12 @@ static int is_pure_ops_struct(const_tree node)
> >  		if (node = fieldtype)
> >  			continue;
> >  
> > -		if (!is_fptr(fieldtype))
> > -			return 0;
> > -
> > -		if (code != RECORD_TYPE && code != UNION_TYPE)
> > -			continue;
> > +		if (code = RECORD_TYPE || code = UNION_TYPE) {
> > +			if (!is_pure_ops_struct(fieldtype))
> > +				return 0;
> > +		}
> >  
> > -		if (!is_pure_ops_struct(fieldtype))
> > +		if (!is_fptr(fieldtype))
> >  			return 0;
> >  	}
> >  
> > -- 
> > 2.17.1
> > 
> 
> -- 
> Kees Cook
