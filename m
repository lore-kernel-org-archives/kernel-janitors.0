From: "=?UTF-8?Q?H=C3=A5kon_L=C3=B8vdal?=" <hlovdal@gmail.com>
Date: Tue, 22 May 2007 23:10:33 +0000
Subject: Re: [KJ] [PATCH] potential parse error in ifdef
Message-Id: <a01a16b50705221610n3b327495r79d823c273321d0d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87fy5q5dxr.fsf@wanadoo.fr>
In-Reply-To: <87fy5q5dxr.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On 21/05/07, Matthew Wilcox <matthew@wil.cx> wrote:
> On Mon, May 21, 2007 at 06:39:12PM +0200, Yoann Padioleau wrote:
> > I have made a tool to parse the kernel that does not pre-process the
> > source. That means that my parser tries to parse all the code, including
> > code in the #else branch or code that is not often compiled because
> > the driver is not very used (or not used at all). So, my parser
> > sometimes reports parse error not originally detected by gcc.
> > Here is my (first) patch.
>
> These all look good to me.

But one question. His tool has found some code segments
that obviously never have been compiled and most likely are
not included in the kernel in any way (because otherwise
I would assume that allyesconfig would have caught them).

Dead, unused code that theoretically would compile is
probably better than dead, unused code that would not
compile, but if the code in question is indeed dead and
unused I would assume that the best option would be to
remove it?

BR Håkon Løvdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
