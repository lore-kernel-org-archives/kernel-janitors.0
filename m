From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 16 Aug 2006 00:44:38 +0000
Subject: Re: [KJ] New to Kernel Work - Need Direction
Message-Id: <20060816004438.GF27227@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200608151531.40914.lordsauronthegreat@gmail.com>
In-Reply-To: <200608151531.40914.lordsauronthegreat@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Also, never trim the Cc, without saying you have done so at the top,
it's bad etiquette :)

On 15.08.2006 [17:43:01 -0700], Nishanth Aravamudan wrote:
> On 15.08.2006 [17:10:37 -0700], Lord Sauron wrote:
> > On Tuesday 15 August 2006 16:22, you wrote:
> > > On 15.08.2006 [15:31:17 -0700], Lord Sauron wrote:
> > > > First I need something to do.  I looked at the current to-do list and
> > > > decided that convincing the XFS folks to use negative error codes
> > > > couldn't be terribly difficult.  I'm thinking of making the
> > > > modifications to the code myself (assuming I'm correct in thinking
> > > > that the XFS code is in fs/xfs in the source directory).
> > >
> > > The XFS folks can be hard to work with :) Sometimes. It may be worth
> > > trying to update their code again, but check the archives to see if
> > > anyone has tried before and been summarily rejected (there may be a
> > > legitimate reason I don't know of).
> > 
> > Sounds like a good idea.  Couldn't hurt though (learning experiences
> > are what I'm looking for, not the fame and fortune of a good hack).
> 
> Then you're at the right place. Maintainers can often be harsh when a
> patch comes through that isn't wanted :)
> 
> > > The XFS code is in fs/xfs, you are correct.
> > >
> > > > My second question is about development environments.  I like
> > > > KDevelop, and wish to use it to work on the kernel.  Does anyone have
> > > > any tips or suggestions for a good graphical way to work with the
> > > > Kernel?
> > >
> > > Don't? :) I mostly use $text_editor (vim, emacs, etc.) and that's it.
> > > cscope and lxr are good code reference tools, as is grep (or cgvg, if
> > > you prefer a bit more organized grep experienced).
> > 
> > The best I've ever come into contact with is nano.  I'm not terribly
> > command-line literate, though I switched my laptop to Gentoo in order
> > to force myself down that path.
> 
> You'll want to become more so, if you're seriously interested in being a
> kernel developer/hacker. nano is fine, although some of the more
> advanced features in vim and emacs can help make you more efficient.
> Switching distros isn't necessary to being more CLI literate, btw, and
> Gentoo might be considered by some (myself included) a bit of an extreme
> step :) You just need to familiarize yourself with the necessary tools.
> 
> > > I'm not sure you *need* a graphical way to work with the kernel,
> > > even if that's what you're used to.
> > 
> > You don't really ever need a graphical way (though my friend, a Apple
> > developer, will rant for days about why you really do *need* XCode).
> > I just find it easier, that's all.
> 
> Right, that's what I figured. I don't know of anyone off the top of my
> head, who uses any graphical tools for developing on the kernel (IDE
> like, or whatever).
> 
> Oh, and by the way, depending on what mail client you use, make sure you
> set it up right for submitting patches (preserve tabs, no HTML, no
> attachments, etc) :)
> 
> > > > I'd rather not try and bludgeon my way through it with KATE and
> > > > writing makefiles and caveman debugging and the likes of that,
> > > > however, the kernel is a gigantic code base, and I'm not sure how
> > > > to approach organizing it in a manner which is good for the total
> > > > and complete newbie (me).
> > >
> > > Uhh, if you end up needing to write a Makefile for janitorial work,
> > > you're probably doing something wrong :) Not sure what "caveman
> > > debugging" exactly is, but most janitor stuff is cleanup, not
> > > bugfixing, although sometimes they are closely related. If you want
> > > to fix bugs, get an account at bugzilla.kernel.org and help out :)
> > > In that case, though, expertise is useful, more often than not.
> > 
> > Caveman debugging... if you've ever written something like this:
> > 
> > | cout << "x = " << x << endl;
> > 
> > you might have been a caveman debugger at some time of your life.
> > It's the art of trying to figure out what went on inside the black box
> > by looking at what came out the other end.  It's *very* time consuming
> > and requires frequent rebuilds.
> 
> Ah, well, yes, that you'll end up doing down the road whether you want
> to or not. It's called "printk debugging" in the kernel world. Hopefully
> not "frequent" rebuilds, but in this case will require reboots (unless
> you use UML or an emulation layer). You won't really be doing much
> debugging when it comes to janitorial work; mostly build- and
> boot-testing and passing patches on to the appropriate Maintainers. If
> it's a serious bug, then it's probably not janitor-material.
> 
> > > I'm not sure what you need to be organizing in the code base. It's
> > > already *highly* organized...
> > 
> > Yes, it is.
> > 
> > > > Thanks for your time, and please tell me if this isn't the
> > > > appropriate place to start with getting to know and work on the
> > > > kernel.
> > >
> > > While it may not be explicitly be the former, it certainly covers
> > > the latter. I also recommend sitting on #kernelnewbies and/or
> > > #kerneljanitor on OFTC.
> > 
> > I don't like IRC that much.  Call me archaic or weird or whatever, but
> > I still think email is the hottest thing.
> 
> There is also a kernelnewbies mailing list. You may want to read the
> archives first and start Googlin' around, as you'll find more and more
> responses to FAQs as "Check the archive". There is also a wiki at
> www.kernelnewbies.org.
> 
> I would seriously reconsider your stance on IRC, btw, it's a very useful
> means of communication / forum to ask questions in. To each either own.
> 
> > > Thanks,
> > > Nish
> > >
> > > > - -- Lord Sauron
> > >
> > > P.S. A *big* part of kernel development is trust. Trust starts with
> > > using your real name :)
> > 
> > And punch through this gigantic aura I've built around myself?  Sure.
> > I use the Lord Sauron alias to sidestep cyberbullies.  They usually
> > leave when I pull the "I'll spam you to death" line on them.
> 
> I find that treating kernel development like one big company -- a very
> very informal one -- is useful when thinking abou this. You wouldn't use
> a pseudonym when sending e-mail to a co-worker, I don't think.

<snip personal information, resend if you want>

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
