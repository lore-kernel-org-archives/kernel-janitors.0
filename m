From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 01:25:07 +0000
Subject: Re: [KJ] [Patch 8/9] BUG_ON() Conversion in md/raid6main.c
Message-Id: <1138238707.7720.5.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88535117065523772=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138233643.7232.45.camel@alice>
In-Reply-To: <1138233643.7232.45.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============88535117065523772==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

> >  this changes if() BUG(); constructs to BUG_ON() which is
> >  cleaner and can better optimized away
> > 
> gcc optimizes them away if BUG() is not defined, so this is not a true
> statement.

if BUG() is defined to nothing it still leaves the if, which must be optimized
away by the compiler, not by the preprocessor


> > -		if (!list_empty(&sh->lru))
> > -			BUG();
> > -		if (atomic_read(&conf->active_stripes)==0)
> > -			BUG();
> > +		BUG_ON(!list_empty(&sh->lru));
> > +		BUG_ON(atomic_read(&conf->active_stripes)==0);
> 
> Also, no, do not do this!
> If BUG_ON() is turned off, then the logic changes here.

list_empty() just returns wheter the list is empty or not, so there is no logic
change. and atomic_read() as far as i can see just reads the
conf->active_stripes->counter value, so there is nothing changed somewhere
and the logic still stays the same. Or did i miss something here?

Thanks, Eric Sesterhenn


--===============88535117065523772==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88535117065523772==--
