From: Jonathan Cameron <jic23@kernel.org>
Date: Tue, 29 Sep 2020 15:27:39 +0000
Subject: Re: [PATCH 15/18] counter: use semicolons rather than commas to separate statements
Message-Id: <20200929162739.40c8257e@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
        <1601233948-11629-16-git-send-email-Julia.Lawall@inria.fr>
        <be1d59c5-fd0c-821e-0357-441c26c3d16c@lechnology.com>
In-Reply-To: <be1d59c5-fd0c-821e-0357-441c26c3d16c@lechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Lechner <david@lechnology.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, Valdis =?UTF-8?B?S2zEk3RuaWVr?= =?UTF-8?B?cw==?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 28 Sep 2020 10:37:28 -0500
David Lechner <david@lechnology.com> wrote:

> On 9/27/20 2:12 PM, Julia Lawall wrote:
> > Replace commas with semicolons.  What is done is essentially described by
> > the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
> > 
> > // <smpl>
> > @@ expression e1,e2; @@
> > e1
> > -,
> > +;
> > e2
> > ... when any
> > // </smpl>
> > 
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> > 
> > ---  
> Reviewed-by: David Lechner <david@lechnology.com>
I've picked this one up.  Applied to the togreg branch of iio.git and
pushed out as testing for all the normal reasons.

Thanks,

Jonathan

> 
