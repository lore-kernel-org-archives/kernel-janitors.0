From: Joe Perches <joe@perches.com>
Date: Tue, 26 Dec 2017 17:52:28 +0000
Subject: Re: [PATCH 0/1] Input: inline macros for MODULE_LICENSE, etc
Message-Id: <1514310748.3468.3.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514307905-3486-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514307905-3486-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Tue, 2017-12-26 at 18:05 +0100, Julia Lawall wrote:
> Inline macro for MODULE_LICENSE to make the license information easy to
> find, eg with grep.  Inline the other module-related macros at the same
> time.
> 
> The complete semantic patch is as follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @q@
> declarer name MODULE_LICENSE;
> identifier i;
> constant c;
> position p;
> @@
> 
> MODULE_LICENSE(c@i@p);
> 
> @r depends on q@
> declarer name MODULE_AUTHOR, MODULE_DESCRIPTION, MODULE_VERSION;
> identifier i;
> constant c;
> position p;
> @@
> 
> (
> MODULE_AUTHOR(c@i@p);
> > 
> 
> MODULE_DESCRIPTION(c@i@p);
> > 
> 
> MODULE_LICENSE(c@i@p);
> > 
> 
> MODULE_VERSION(c@i@p);
> )
> 
> @other@
> identifier r.i;
> position p != r.p;
> @@
> 
> i@p
> 
> @s depends on !other@
> identifier r.i;
> expression e;
> @@
> 
> #define i e
> 
> @@
> identifier r.i;
> position r.p;
> expression s.e;
> @@
> 
> (
> MODULE_AUTHOR(
> - i@p
> + e
>  );
> > 
> 
> MODULE_DESCRIPTION(
> - i@p
> + e
>  );
> > 
> 
> MODULE_LICENSE(
> - i@p
> + e
>  );
> > 
> 
> MODULE_VERSION(
> - i@p
> + e
>  );
> )
> 
> @@
> identifier r.i;
> expression s.e;
> @@
> 
> -#define i e
> // </smpl>

What assures that the #define is only used by
MODULE_<FOO> and is not used in any other way?

