From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 30 Nov 2007 21:01:56 +0000
Subject: Re: [PATCH] Some grammatical and whitespace cleanups in init.h.
Message-Id: <alpine.LFD.0.9999.0711301600590.32726@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.0.9999.0711301424120.25301@localhost.localdomain>
In-Reply-To: <alpine.LFD.0.9999.0711301424120.25301@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 30 Nov 2007, Matthew Wilcox wrote:

> On Fri, Nov 30, 2007 at 02:24:57PM -0500, Robert P. J. Day wrote:
> > -/* These macros are used to mark some functions or
> > - * initialized data (doesn't apply to uninitialized data)
> > - * as `initialization' functions. The kernel can take this
> > - * as hint that the function is used only during the initialization
> > - * phase and free up used memory resources after
> > +/* These macros are used to mark functions and initialized
> > + * data as 'initialization' objects, which tells the kernel that
> > + * they are used only during the initialization phase and can be
> > + * freed afterwards to recover memory.
>
> If you're going to get rid of 'some', then you need to change 'are' to
> 'may be' or 'can be'.

i'm sorry, i don't see a problem here.  that replacement text looks
perfectly unambiguous.  how do you think it might be misinterpreted?

rday
--
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
