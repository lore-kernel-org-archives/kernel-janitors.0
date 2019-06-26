From: Song Liu <liu.song.a23@gmail.com>
Date: Wed, 26 Jun 2019 19:20:37 +0000
Subject: Re: [PATCH] md/raid1: Fix a warning message in remove_wb()
Message-Id: <CAPhsuW7p14K=6Q7YSxFqKY7j18kyTbP6LwQPt4Ckfx5wZ578pA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190626094251.GA3242@mwanda>
In-Reply-To: <20190626094251.GA3242@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jun 26, 2019 at 2:44 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The WARN_ON() macro doesn't take an error message, it just takes a
> condition.  I've changed this to use WARN(1, "...") instead.
>
> Fixes: 3e148a320979 ("md/raid1: fix potential data inconsistency issue with write behind device")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied. Thanks for the fix.

Song
