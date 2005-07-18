From: Jim Cromie <jcromie@divsol.com>
Date: Mon, 18 Jul 2005 18:03:23 +0000
Subject: Re: [KJ] RFC - trailing whitespace cleanup script
Message-Id: <42DBEEEB.4080803@divsol.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42D9C495.2090405@divsol.com>
In-Reply-To: <42D9C495.2090405@divsol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Jim Cromie wrote:

> Domen, all,
>
> Ive considered running following 1-lineer and submitting per-subsystem 
> cleanup patches.
>
> cp -al $tree $tree-clean; perl -pi.bak -e 's/\s+\n//' `find 
> $tree-clean -print` > mega-patch
>
I just ran this in a linux-kj directory

     egrep -rl '\s$' * | xargs perl -pi -e 's/\s+\n/\n/'

and omygod, it produces 21 MB of unified diffs.

some observations:
60K lines of arch/ diffs
40K lines of Documentation diffs ( not relevant, tb scrapped)
lots of trailing whitespace in comments
    hard to programmatically avoid patching.
    99% avoided if script tolerates one trailing whitespace.
    ( ie shrinks diff-file by 75% )


> So, what Id propose is:
>
> a. just prior to releasing rc4-kj, do an rc4-kj-pre
> b. run script against pre tree.
> c. diff -rup pre pre-clean > mega-patch
> d. manually edit/chop up mega-patch on subsystem boundaries
> e. apply each to pre, release rc4-kj
>
given the diff size, this is probably inadequate.
Ive written a script to carve a megapatch into individual chunk-files,
and plan to modify it to carve on a specified directory depth, (ala -pN).

Im familiar with LKML patch submission rules
1. no gzips
2. no tars
3. no mega-patches
4. no patch-frags   ( ie reams of tiny patches )
5. use your judgement wrt patch-size, content.

For this list, are the rules the same, slightly different ?
Particularly wrt 5, we're dealing with less/little semantic content,
so can be bigger, esp to avoid 4.
and gzips seems useful, esp for patches with 100k of whitespace.

As an extreme example, I could send to you, privately,
a tarball with thousands of patch frags, and a script to apply them 
serially,
and to delete the ones that fail to apply.  Youre left with the ones 
that did.

> f. repeat periodically
> g. get janitors to recognize that they should do harder fixes, and 
> leave whitespace
> for the robo-janitor / whitespace-roomba
>
> BTW
>
> when were kj patches last merged into mainline ?
> how often (on average) does this happen ?
>
also, are you using git ?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
