From: "Ted Ts'o" <tytso@mit.edu>
Date: Fri, 11 Feb 2011 00:00:35 +0000
Subject: Re: [patch] ext4: off by one check in ext4_groupinfo_create_slab()
Message-Id: <20110211000035.GH16597@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110209232412.GC4384@bicker>
In-Reply-To: <20110209232412.GC4384@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: sandeen@redhat.com, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 10, 2011 at 02:24:12AM +0300, Dan Carpenter wrote:
> If cache_index = NR_GRPINFO_CACHES then we read past the end of the
> ext4_groupinfo_caches[] array a couple lines later.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Oops, thanks for pointing that out!

Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>

					- Ted
