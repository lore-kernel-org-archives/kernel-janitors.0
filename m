From: Robin Getz <rgetz@blackfin.uclinux.org>
Date: Sat, 28 Jul 2007 01:38:23 +0000
Subject: Re: [PATCH 06/68] 0 -> NULL, for arch/frv
Message-Id: <200707272138.23323.rgetz@blackfin.uclinux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17167@ifs.emn.fr> <22618.1185531297@redhat.com> <87lkd29mk9.fsf@wanadoo.fr>
In-Reply-To: <87lkd29mk9.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: David Howells <dhowells@redhat.com>, kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On Fri 27 Jul 2007 06:18, Yoann Padioleau pondered:
> David Howells <dhowells@redhat.com> writes:
> 
> > Yoann Padioleau <padator@wanadoo.fr> wrote:
> >
> >> When comparing a pointer, it's clearer to compare it to NULL than to
> 0.
> >
> > Can you make them of style:
> >
> > 	if (!x)
> 
> Yes I can. I can make another semantic patch later to do that
> transformation. But some people may prefer (x = NULL) to (!x)
> so I don't know. I think that transformation 
> some 0 to NULL is less controversial.
> 
> 
> >
> > instead?

If there is a definite style or semantic preference that everyone should live 
with - does it make sense to put checks in checkpatch.pl to enforce it?

-Robin
