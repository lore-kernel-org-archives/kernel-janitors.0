From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 01 Mar 2006 07:40:20 +0000
Subject: Re: [KJ] kzalloc() conversion in drivers/isdn
Message-Id: <1141198821.6512.3.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13454740032482793=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141024983.6530.1.camel@alice>
In-Reply-To: <1141024983.6530.1.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============13454740032482793==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-02-28 at 22:32 +0300, Alexey Dobriyan wrote:
> >      /* Allocate space for private device-specific data */
> > -    local = kmalloc(sizeof(local_info_t), GFP_KERNEL);
> > -    if (!local) return -ENOMEM;
> > -    memset(local, 0, sizeof(local_info_t));
> > +    local = kzalloc(sizeof(local_info_t), GFP_KERNEL);
> > +    if (!local)
> > +	return -ENOMEM;
> 
> Don't even try to sneak in unrelated changes. I mean, really. Why bother
> if I'll carefully drop them anyway?

I thought one should clean up the code while doing this
stuff? Or should coding style cleanups just be done in the exact
line one is changing? What would be the way to fix such thing?
Send a patch which indents and cleans the entire file, which would
possible break other patches in queue for that file. or send a patch
to clean up all if() foo; constructs in a subsystem?
Sorry to have caused you work overhead, i'll try not to do those
cleanups anymore.

Thanks Eric


--===============13454740032482793==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13454740032482793==--
