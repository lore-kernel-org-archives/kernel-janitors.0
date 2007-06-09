From: Oleg Verych <olecom@flower.upol.cz>
Date: Sat, 09 Jun 2007 04:19:07 +0000
Subject: Re: [KJ] [patch] scripts: clean-whitespace.sh
Message-Id: <20070609041907.GB7266@flower.upol.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070609031336.GA7266@flower.upol.cz>
In-Reply-To: <20070609031336.GA7266@flower.upol.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jun 09, 2007 at 11:32:05AM +0800, WANG Cong wrote:
> On Sat, Jun 09, 2007 at 05:13:36AM +0200, Oleg Verych wrote:
> >If somebody have problems with whitespace damage: can't see it, don't
> >know how to deal with it, please see my proposition.
> >
> 
> In fact, there's already a Perl script that can do this in kernel source.
> 
> See scripts/cleanfile to learn more.

Exactly. That's why i've wrote this

- user-friendly, rather than "this
  can be a highly destructive operation.  Use with caution." one.

- PATCH and SOURCE files supporting
- 1024 bytes with all comments

script!
____
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
