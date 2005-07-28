From: Domen Puncer <domen@coderock.org>
Date: Thu, 28 Jul 2005 21:41:22 +0000
Subject: Re: [KJ] 2.6 kbuild inconsistent CONFIG_DEBUG_INFO usage?
Message-Id: <20050728214122.GF2249@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83211230085661247=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
In-Reply-To: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
To: kernel-janitors@vger.kernel.org

--===============83211230085661247==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 29/07/05 07:14 +1000, Grant Coady wrote:
> On Thu, 28 Jul 2005 22:21:49 +0200, Domen Puncer <domen@coderock.org> wrote:
> >> 
> >> Most users test if the flag is set, some users test == 'y', nothing 
> >> checks for == 'n'.  So if I "Set CONFIG_DEBUG_INFO=n" I get unwanted 
> >> debugging info, opposite result to what was intended?
> >
> >CONFIG_DEBUG_INFO == y compiles debugging info in kernel, and is
> >useful for kernel debuggers (and probably more).
> >For compile tests this option doesn't really mater, as it is not
> >compile time debugging. But disabling it makes compiles faster,
> >which is good.
> 
> top-level 2.6.12.3 Makefile:
> ...
> ifdef CONFIG_DEBUG_INFO
> CFLAGS          += -g
> endif
> ...
> 
> So please tell me how "CONFIG_DEBUG_INFO=n" disables debug?

Ugh, I see the point, I should have read more carefully.
But Nishanth is right, kconfig magic makes this work :-)

domen@homer:~/kernel/a$ grep CONFIG_DEBUG_INFO build/.config
CONFIG_DEBUG_INFO=n
domen@homer:~/kernel/a$ make O=`pwd`/build/ oldconfig >/dev/null
domen@homer:~/kernel/a$ grep CONFIG_DEBUG_INFO build/.config
# CONFIG_DEBUG_INFO is not set

And yes, "just make" will take care of it too.


--===============83211230085661247==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83211230085661247==--
