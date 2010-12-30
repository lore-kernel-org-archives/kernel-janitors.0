From: "Ted Ts'o" <tytso@mit.edu>
Date: Thu, 30 Dec 2010 03:55:53 +0000
Subject: Re: [patch] ext4: checking NULL instead of ERR_PTR
Message-Id: <20101230035553.GL10149@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100826091619.GC20072@bicker>
In-Reply-To: <20100826091619.GC20072@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Eric Sandeen <sandeen@redhat.com>, Dmitry Monakhov <dmonakhov@openvz.org>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 26, 2010 at 11:16:54AM +0200, Dan Carpenter wrote:
> d_path() returns an ERR_PTR and it doesn't return NULL.  This is in
> ext4_error_file() and no one actually calls ext4_error_file().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Thanks, I've added this to the ext4 patch tree.

	     	   	       	    	  - Ted
