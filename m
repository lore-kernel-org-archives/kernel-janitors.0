From: Dan Carpenter <error27@gmail.com>
Date: Tue, 27 Apr 2010 10:30:51 +0000
Subject: Re: [patch] gpio: potential null dereference
Message-Id: <20100427103051.GB29093@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100426192520.GU29093@bicker> <20100426230515.GA1388@emlix.com> <20100427090533.GZ29093@bicker> <4BD6B13C.6020406@emlix.com>
In-Reply-To: <4BD6B13C.6020406@emlix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Daniel =?iso-8859-1?Q?Gl=F6ckner?= <dg@emlix.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jani Nikula <ext-jani.1.nikula@nokia.com>, David Brownell <dbrownell@users.sourceforge.net>, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 27, 2010 at 11:41:16AM +0200, Daniel Gl=F6ckner wrote:
> It returns a valid pointer iff (desc->flags & GPIO_TRIGGER_MASK).
>=20
> When !(desc->flags & GPIO_TRIGGER_MASK) it returns NULL and everything
> gets allocated (unless !gpio_flags as well). What you wanted to remove
> is the allocation code, not error handling code.=20

No no.  I don't want to remove anything.  I'm happy with the code as is
now that you've explained it to me.  :)

regards,
dan carpenter

> It is always run when
> the trigger is set from "none" to something else.
>=20
>   Daniel
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
