From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Sep 2014 14:49:11 +0000
Subject: Re: [patch] [media] em28xx-input: NULL dereference on error
Message-Id: <20140925144911.GK5865@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140925113941.GB3708@mwanda>
 <542421DF.9060000@googlemail.com>
In-Reply-To: <542421DF.9060000@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Frank =?iso-8859-1?Q?Sch=E4fer?= <fschaefer.oss@googlemail.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Sep 25, 2014 at 04:08:31PM +0200, Frank Sch=E4fer wrote:
> >  	ir =3D kzalloc(sizeof(*ir), GFP_KERNEL);
> > +	if (!ir)
> > +		return -ENOMEM;
> >  	rc =3D rc_allocate_device();
> > -	if (!ir || !rc)
> > +	if (!rc)
> >  		goto error;
> > =20
> >  	/* record handles to ourself */
> I would prefer to fix it where the actual problem is located.
> Can you send an updated version that changes the code to do
>=20
> ...
> error:
> if (ir)
>   kfree(ir->i2c_client);
> ...
>=20
> This makes the code less prone to future error handling changes.

This kind of bug is called a "One Err Bug" because they are part of
an anti-pattern of bad error handling where there is only one label.  It
was ok at the time it was written but it was fragile and broke when the
code changed.

One Err Bugs are very common kind of bug.  I just reported a similar bug
this morning.  https://lkml.org/lkml/2014/9/25/91  In that case we freed
some sysfs files which were not allocated.

My view is that error handling code should not have if statements unless
there is an if statement in the allocation code.  This is way more
readable.

Another way that people deal with these kinds of errors if they don't
like to return directly is they add an "out:" label.

out:
	return ret;

I hate "out" labels for how vague the name is but I also hate do-nothing
gotos generally.  When you're reading the code you assume that the goto
does something but the name gives you no clue what it does so you have
to interrupt what you are doing and scroll down to the bottom of the
function and it doesn't do anything.  It just returns.  By this point
you have forgotten where you were but it was somewhere reading in the
middle of the function.

Terrible terrible terrible.  Etc.  You have touched a sore spot and
triggered a rant.  :P

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
