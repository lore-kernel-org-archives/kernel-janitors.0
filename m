From: =?ISO-8859-1?Q?Arve_Hj=F8nnev=E5g?= <arve@android.com>
Date: Tue, 12 Mar 2013 00:21:28 +0000
Subject: Re: [PATCH v2 3/3] drivers: android: binder: Remove excessive indentation
Message-Id: <CAMP5XgfwCQDnRvog1tWixo=-mTb4tTZCy33h+Y__H7cW_N_M7g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363030315-10229-1-git-send-email-mirsal@mirsal.fr>
	<1363044388-11409-1-git-send-email-mirsal@mirsal.fr>
	<1363044388-11409-4-git-send-email-mirsal@mirsal.fr>
	<1363046657.3724.11.camel@joe-AO722>
In-Reply-To: <1363046657.3724.11.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>
Cc: Mirsal Ennaime <mirsal@mirsal.fr>, Greg Kroah-Hartman <greg@kroah.com>, Brian Swetland <swetland@google.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

On Mon, Mar 11, 2013 at 5:04 PM, Joe Perches <joe@perches.com> wrote:
...
> I think it's odd to use pr_info in binder_debug.
> Why not use KERN_DEBUG or pr_debug/dynamic_debugging?
>
> #define binder_debug(mask, x...) \
>         do { \
>                 if (binder_debug_mask & mask) \
>                         pr_info(x); \
>         } while (0)
>
>

This code predates the dynamic_debugging framework, but I also find it
easier to use so I would be reluctant to convert it unless there is an
easy way to match the current behavior. It is useful to turn a set of
debug messages on by class and to have some classes on by default.

--=20
Arve Hj=F8nnev=E5g
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
