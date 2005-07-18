From: Domen Puncer <domen@coderock.org>
Date: Mon, 18 Jul 2005 17:06:41 +0000
Subject: Re: [KJ] RFC - trailing whitespace cleanup script
Message-Id: <20050718170641.GG2457@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76760983382845782=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42D9C495.2090405@divsol.com>
In-Reply-To: <42D9C495.2090405@divsol.com>
To: kernel-janitors@vger.kernel.org

--===============76760983382845782==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16/07/05 20:38 -0600, Jim Cromie wrote:
> Domen, all,

Hi.

> 
> Ive considered running following 1-lineer and submitting per-subsystem 
> cleanup patches.
> 
> cp -al $tree $tree-clean; perl -pi.bak -e 's/\s+\n//' `find $tree-clean 
> -print` > mega-patch
> 
> 
> the problem with doing so is that lots of whitespace has already been 
> cleaned,
> and rc3-kj has presumably been superseded by more whitespace fixes,
> which would result in needless rejects.
> 
> So, what Id propose is:
> 
> a. just prior to releasing rc4-kj, do an rc4-kj-pre
> b. run script against pre tree.
> c. diff -rup pre pre-clean > mega-patch
> d. manually edit/chop up mega-patch on subsystem boundaries
> e. apply each to pre, release rc4-kj
> 
> f. repeat periodically
> g. get janitors to recognize that they should do harder fixes, and leave 
> whitespace
> for the robo-janitor / whitespace-roomba

No, no, no, and again no. And I do hate trailing whitespace, I have
it coloured red in vim, so there's really no other way than hating.

So... why not?
- Maintainers will want to kill us, because no patch will apply
  anymore.
- It would generate _lots_ of traffic.
- It would make it harder to trace bugs ("try to unapply that patch")
- I could probably think of some more, but first one makes it
  obsolete anyways. ;-)


When could whitespace fixes be good?
Maybe on a driver that is in bug-fix-only state and is expected to
stay in kernel for a while (IOW, is not broken :-) ).

> 
> BTW
> 
> when were kj patches last merged into mainline ?

They don't get merged as a whole, just parts, through appropriate
maintainers.
I will need to send some very old ones to akpm, because it looks
like they won't get merged any other way.

> how often (on average) does this happen ?

Hmm... patch per day? It really depends.


--===============76760983382845782==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76760983382845782==--
