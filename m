From: Tigran Aivazian <aivazian.tigran@gmail.com>
Date: Mon, 09 Mar 2020 09:14:27 +0000
Subject: Re: [PATCH] bfs: prevent underflow in bfs_find_entry()
Message-Id: <CAK+_RLm9=DER3fM-HwvM14CEzq8eZCwcTZyoA6tsYdhe1J03sA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200307060808.6nfyqnp2woq7d3cv@kili.mountain>
In-Reply-To: <20200307060808.6nfyqnp2woq7d3cv@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hello Dan,

On Sat, 7 Mar 2020 at 06:08, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> -       int namelen = child->len;
> +       unsigned int namelen = child->len;

Thank you, that is sensible, but have you actually verified that
attempting a lookup of a filename longer than 2.2 billion bytes causes
a problem? If that's the case, then your patch should be considered.
If not, it would seem to be a waste of time to worry about something
that cannot ever happen.

Kind regards,
Tigran
