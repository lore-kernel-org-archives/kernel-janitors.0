From: Theodore Ts'o <tytso@mit.edu>
Date: Sat, 05 Aug 2017 23:01:18 +0000
Subject: Re: [PATCH] ext4: silence array overflow warning
Message-Id: <20170805230118.5olcshags2qerb6y@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170718092702.bpk2k5qjg4cz2mqk@mwanda>
In-Reply-To: <20170718092702.bpk2k5qjg4cz2mqk@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jul 18, 2017 at 12:27:02PM +0300, Dan Carpenter wrote:
> I get a static checker warning:
> 
>     fs/ext4/ext4.h:3091 ext4_set_de_type()
>     error: buffer overflow 'ext4_type_by_mode' 15 <= 15
> 
> It seems unlikely that we would hit this read overflow in real life, but
> it's also simple enough to make the array 16 bytes instead of 15.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

					- Ted
