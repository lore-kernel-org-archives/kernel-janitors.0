From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 09:47:37 +0000
Subject: Re: [PATCH 2/2] kprobes: verify jprobe entry point
Message-Id: <Pine.LNX.4.64.1008051145400.1445@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280820323-18929-2-git-send-email-namhyung@gmail.com>
In-Reply-To: <1280820323-18929-2-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 5 Aug 2010, walter harms wrote:

> 
> 
> Namhyung Kim schrieb:
> > verify jprobe's entry point is a function entry point
> > using kallsyms' offset value.
> > 
> > Signed-off-by: Namhyung Kim <namhyung@gmail.com>
> > 
> > ---
> > 
> > Here comes 3rd revision of the patch. Thanks to Masami Hiramatus for suggesting
> > kallsyms_lookup_size_offset. :-)
> > 
> > diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> > index 8f96701..1b0dbe0 100644
> > --- a/kernel/kprobes.c
> > +++ b/kernel/kprobes.c
> > @@ -1339,14 +1339,18 @@ int __kprobes register_jprobes(struct jprobe **jps, int num)
> >  	if (num <= 0)
> >  		return -EINVAL;
> >  	for (i = 0; i < num; i++) {
> > -		unsigned long addr;
> > +		unsigned long addr, offset;
> >  		jp = jps[i];
> >  		addr = arch_deref_entry_point(jp->entry);
> > 
> > -		/* Todo: Verify probepoint is a function entry point */
> > -		jp->kp.pre_handler = setjmp_pre_handler;
> > -		jp->kp.break_handler = longjmp_break_handler;
> > -		ret = register_kprobe(&jp->kp);
> > +		/* Verify probepoint is a function entry point */
> > +		if (kallsyms_lookup_size_offset(addr, NULL, &offset) &&
> > +		    offset = 0) {
> > +			jp->kp.pre_handler = setjmp_pre_handler;
> > +			jp->kp.break_handler = longjmp_break_handler;
> > +			ret = register_kprobe(&jp->kp);
> > +		} else
> > +			ret = -EINVAL;
> > 
> >  		if (ret < 0) {
> >  			if (i > 0)
> 
> 
> I am a bit converned about this code here:
> 	if (kallsyms_lookup_size_offset(addr, NULL, &offset) &&  offset = 0)
> 
> offset is set inside kallsyms_lookup_size_offset(), right ?
> but can you guarantee that the calling sequence is the same on all processors ?
> (it is  not in case of functions).

&& should always be evaluated lazily from left to right.  Otherwise
x != NULL && x->y = z wouldn't be safe.

julia

> perhaps it is more secure (and readable) to do:
> 
> ret=kallsyms_lookup_size_offset(addr, NULL, &offset);
> if ( ret &&  offset = 0 )
> 
> just my  2 cents,
> re,
>  wh
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
