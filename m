From: Joonwon Kang <kjw1627@gmail.com>
Date: Thu, 01 Aug 2019 13:41:49 +0000
Subject: Re: [PATCH 2/2] randstruct: remove dead code in is_pure_ops_struct()
Message-Id: <20190801134149.GA2149@host>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1564595346.git.kjw1627@gmail.com>
 <281a65cc361512e3dc6c5deffa324f800eb907be.1564595346.git.kjw1627@gmail.com>
 <201907311259.D485EED2B7@keescook>
In-Reply-To: <201907311259.D485EED2B7@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: re.emese@gmail.com, kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, jinb.park7@gmail.com

On Wed, Jul 31, 2019 at 12:59:30PM -0700, Kees Cook wrote:
> On Thu, Aug 01, 2019 at 03:01:49AM +0900, Joonwon Kang wrote:
> > Recursive declaration for struct which has member of the same struct
> > type, for example,
> > 
> > struct foo {
> >     struct foo f;
> >     ...
> > };
> > 
> > is not allowed. So, it is unnecessary to check if a struct has this
> > kind of member.
> 
> Is that the only case where this loop could happen? Seems also safe to
> just leave it as-is...
> 
> -Kees

I think it is pretty obvious that it is the only case. I compiled kernel
with allyesconfig and the condition never hit even once. However, it will
also be no problem to just leave it as-is as you mentioned.

> 
> > 
> > Signed-off-by: Joonwon Kang <kjw1627@gmail.com>
> > ---
> >  scripts/gcc-plugins/randomize_layout_plugin.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/scripts/gcc-plugins/randomize_layout_plugin.c b/scripts/gcc-plugins/randomize_layout_plugin.c
> > index bd29e4e7a524..e14efe23e645 100644
> > --- a/scripts/gcc-plugins/randomize_layout_plugin.c
> > +++ b/scripts/gcc-plugins/randomize_layout_plugin.c
> > @@ -440,9 +440,6 @@ static int is_pure_ops_struct(const_tree node)
> >  		const_tree fieldtype = get_field_type(field);
> >  		enum tree_code code = TREE_CODE(fieldtype);
> >  
> > -		if (node = fieldtype)
> > -			continue;
> > -
> >  		if (code = RECORD_TYPE || code = UNION_TYPE) {
> >  			if (!is_pure_ops_struct(fieldtype))
> >  				return 0;
> > -- 
> > 2.17.1
> > 
> 
> -- 
> Kees Cook
