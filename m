From: Tigran Aivazian <aivazian.tigran@gmail.com>
Date: Tue, 10 Mar 2020 18:22:42 +0000
Subject: Re: [PATCH] bfs: prevent underflow in bfs_find_entry()
Message-Id: <CAK+_RLk3D1VA6Rms1TGEFuEeO8JGxUaXfmWxznn+cHCG96TOTQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200307060808.6nfyqnp2woq7d3cv@kili.mountain>
 <ba294b1d861142ca8f7b204356009dd0@bfs.de> <20200310090644.GA11583@kadam> <fabccce3c25444bbb5aa51f8c08e9865@bfs.de>
In-Reply-To: <fabccce3c25444bbb5aa51f8c08e9865@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hello,

On Tue, 10 Mar 2020 at 17:57, Walter Harms <wharms@bfs.de> wrote:
> that raises the question why is there a len paramter in the first place.
> Surely the writer can make sure that there is always a NUL terminated
> string, then it would be possible the use a simple strcmp() and the
> range check is useless and can be removed.
>
> seems a question for the maintainer.

Please have a look at, for example,
fs/ufs/dir.c:ufs_find_entry()/ufs_match() functions --- they do almost
the same thing as the ones in bfs. And, presumably, the line "int
namelen = qstr->len;" in ufs_find_entry() is causing the static
checker warning too, just like the one in bfs which Dan mentioned and
fixed. So, let's not over-complicate things (or make a mountain out of
a molehill) and accept Dan's patch as is.

Kind regards,
Tigran
