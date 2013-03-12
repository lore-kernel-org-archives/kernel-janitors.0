From: Joe Perches <joe@perches.com>
Date: Tue, 12 Mar 2013 00:29:58 +0000
Subject: Re: [PATCH v2 3/3] drivers: android: binder: Remove excessive indentation
Message-Id: <1363048198.3724.15.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363030315-10229-1-git-send-email-mirsal@mirsal.fr>
	 <1363044388-11409-1-git-send-email-mirsal@mirsal.fr>
	 <1363044388-11409-4-git-send-email-mirsal@mirsal.fr>
	 <1363046657.3724.11.camel@joe-AO722>
	 <CAMP5XgfwCQDnRvog1tWixo=-mTb4tTZCy33h+Y__H7cW_N_M7g@mail.gmail.com>
In-Reply-To: <CAMP5XgfwCQDnRvog1tWixo=-mTb4tTZCy33h+Y__H7cW_N_M7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>
Cc: Mirsal Ennaime <mirsal@mirsal.fr>, Greg Kroah-Hartman <greg@kroah.com>, Brian Swetland <swetland@google.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

On Mon, 2013-03-11 at 17:21 -0700, Arve Hj=F8nnev=E5g wrote:
> On Mon, Mar 11, 2013 at 5:04 PM, Joe Perches <joe@perches.com> wrote:
> ...
> > I think it's odd to use pr_info in binder_debug.
> > Why not use KERN_DEBUG or pr_debug/dynamic_debugging?
> >
> > #define binder_debug(mask, x...) \
> >         do { \
> >                 if (binder_debug_mask & mask) \
> >                         pr_info(x); \
> >         } while (0)
> >
> >
>=20
> This code predates the dynamic_debugging framework, but I also find it
> easier to use so I would be reluctant to convert it unless there is an
> easy way to match the current behavior. It is useful to turn a set of
> debug messages on by class and to have some classes on by default.

No doubt it's easier this way and there are many, many
macros like it sprinkled throughout the kernel sources.

The dynamic_debug framework currently has no mask/level
use than can turn on/off classes of messages.

Emitting at KERN_INFO instead of KERN_DEBUG though is odd.





--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
