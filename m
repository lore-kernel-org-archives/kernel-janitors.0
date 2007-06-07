From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Thu, 07 Jun 2007 13:07:29 +0000
Subject: [KJ] Re: [PATCH]: complete cleanup of check_region
Message-Id: <9a8748490706070607oac5b2d4j3098670a0ca6893e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181209169.2422.12.camel@bluegenie>
	 <Pine.LNX.4.64.0706071330500.17273@gwdu05.gwdg.de>
In-Reply-To: <Pine.LNX.4.64.0706071330500.17273@gwdu05.gwdg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eberhard Moenkeberg <emoenke@gwdg.de>
Cc: Surya <surya.prabhakar@wipro.com>, linux-kernel@vger.kernel.org, alan@lxorguk.ukuu.org.uk, kernel-janitors <kernel-janitors@lists.osdl.org>, trivial <trivial@kernel.org>, hannu@opensound.com

On 07/06/07, Eberhard Moenkeberg <emoenke@gwdg.de> wrote:
> Hi,
>
> On Thu, 7 Jun 2007, Surya wrote:
>
> >
> > Hi all,
> >       This patch cleans up all the instances of check_region and
> > __check_region and replaces them with request_region and
> > __request_region. Applies and compiles clean on latest Linus tree.
> >
> > Files affected:
> >       drivers/cdrom/sbpcd.c
> >       drivers/pnp/resource.c
> >       include/linux/ioport.h
> >       kernel/resource.c
> >       sound/oss/pss.c
> >
> >
> > thanks.
> >
> >
> > Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
>
>
> in drivers/cdrom/sbpcd.c the message string should be changed too.
>
> Acked-by: Eberhard Moenkeberg <emoenke@gwdg.de>
>

Huh? I don't understand how you can ACK that patch.
Are my comments here:  http://lkml.org/lkml/2007/6/7/102  completely
out in left field?

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
