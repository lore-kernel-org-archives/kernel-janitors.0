From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Jun 2016 19:53:26 +0000
Subject: Re: [patch] ext4: underflow in alignment check
Message-Id: <20160620195325.GM32247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160616070709.GC23129@mwanda>
 <20160620160204.GG6882@quack2.suse.cz>
In-Reply-To: <20160620160204.GG6882@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jun 20, 2016 at 06:02:04PM +0200, Jan Kara wrote:
> On Thu 16-06-16 10:07:09, Dan Carpenter wrote:
> > My static checker complains that this can underflow if arg is negative
> > which is true.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> How come? (1 << 30) fits even into 32-bit signed type. So where's the
> problem?

Bad changelog...  I was talking about a different issue.  I was casting
it to unsigned to take advantage of type promototion.  Assume we have:

int arg = 1 << 31;

(arg > (1 << 30)) // <-- this is false
(arg > (1U << 30)) // <-- this is true so there is no underflow.

regards,
dan carpenter

