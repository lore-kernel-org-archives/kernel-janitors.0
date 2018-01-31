From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 31 Jan 2018 17:38:55 +0000
Subject: =?UTF-8?Q?Re=3A_=5Bv2=5D_Coccinelle=3A_zalloc-simple=3A_Delete_function_=E2=80=9Ckmem=5Fcache=5Fallo
Message-Id: <alpine.DEB.2.20.1801311836320.3707@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1890958981-1517420340=:3707"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
 <243e83a2-ae0c-2dd2-7f8f-83ac0978cc0e@users.sourceforge.net>
In-Reply-To: <243e83a2-ae0c-2dd2-7f8f-83ac0978cc0e@users.sourceforge.net>
To: cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1890958981-1517420340=:3707
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Wed, 31 Jan 2018, SF Markus Elfring wrote:

> > I removed the blank line at EOF,
> > then applied to linux-kbuild/misc.
>
> I have taken another look at this script for the semantic patch language.
> I imagined that I could refactor the shown SmPL disjunctions a bit.
> But I noticed then that these SmPL rules contain a development mistake.
>
> The deletion for a call of the function “memset” depends on the specification
> that a size determination is passed by the expression “E1”.
> The function “kmem_cache_alloc” was specified despite of the technical detail
> that this function does not get a parameter passed which would correspond
> to such a size information.
> https://elixir.free-electrons.com/linux/v4.15/source/tools/testing/radix-tree/linux/slab.h#L14
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/tools/testing/radix-tree/linux/slab.h?id=537659c08a7da298aa748854f65f2aa1f31b1378#n14
>
> Thus I suggest to remove it from the first two SmPL rules and omit the rule “r4”.
> Will the rule set be more consistent then?

If E1 is not bound by the kem_cache_alloc rule, then it will match
anything.  The user can check if it is appropriate.

Another option would be to use the type of the variable storing the result
of the call to compute the expected size.  Feel free to send a patch.

julia
--8323329-1890958981-1517420340=:3707--
