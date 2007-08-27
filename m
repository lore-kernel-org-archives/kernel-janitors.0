From: Andre Haupt <andre@finow14.de>
Date: Mon, 27 Aug 2007 15:25:37 +0000
Subject: Re: standard for documenting conditional preprocessor directives?
Message-Id: <20070827152537.GA20126@ahaupt-debian-vm.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0708270942001.2707@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0708270942001.2707@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Aug 27, 2007 at 10:55:09AM -0400, Robert P. J. Day wrote:
> On Mon, 27 Aug 2007, Andre Haupt wrote:
> 
> > On Mon, Aug 27, 2007 at 09:47:09AM -0400, Robert P. J. Day wrote:
> > >
> > >   is there an understood standard for documenting conditional
> > > preprocessor directives so you can more easily follow the logic in
> > > lengthy code segments?
> > >
> > >   consider:
> > >
> > >     #ifdef SNAFU
> > >     ... very long blah blah ...
> > >     #else
> > >     ... equally long woof woof ...
> > >     #endif
> > >
> > >   if you're perusing the code, and you hit the "#else" or "#endif",
> > > it's almost impossible to tell what they correspond to, particularly
> > > if they're mixed in with even more nested directives.  so what's the
> > > best way to make this more readable?
> > >
> > >   what about something like?
> > >
> > >     #ifdef SNAFU
> > >     ...
> > >     #else /* !SNAFU */
> > >     ...
> > >     #endif /* !SNAFU */
> >
> > I would make that latter
> > 	#endif /* SNAFU */
> > instead, because the #endif refers to the #ifdef and not to the #else
> > statement.
> 
> i thought of that but imagine that you're perusing code and you
> remember that you'd already seen:
> 
>   #ifdef SNAFU
> 
> sometime later, you run across:
> 
>   #endif /* SNAFU */
> 
> now you're not sure if that's a simple end to "SNAFU" or possibly the
> "#else" part that you missed during the perusal.  i'll grant you that
so your perusal was not done very thoroughly ;-)

No, seriously. I understand your point and you see me half convinced.
This is nothing i would fight to death for, though ;-)

regards,

Andre
