From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Mar 2020 09:06:44 +0000
Subject: Re: [PATCH] bfs: prevent underflow in bfs_find_entry()
Message-Id: <20200310090644.GA11583@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200307060808.6nfyqnp2woq7d3cv@kili.mountain>
 <ba294b1d861142ca8f7b204356009dd0@bfs.de>
In-Reply-To: <ba294b1d861142ca8f7b204356009dd0@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Mar 09, 2020 at 08:40:28AM +0000, Walter Harms wrote:
> hi Dan,
> the namelen usage is fishy. It goes into bfs_namecmp()
> where it is checked for namelen < BFS_NAMELEN, leaving
> only the case =.

The rule in bfs_namecmp() is that the name has to be NUL terminated if
there is enough space.

regards,
dan carpenter
