From: "Ted Ts'o" <tytso@mit.edu>
Date: Sat, 30 Jul 2011 16:59:39 +0000
Subject: Re: [patch] ext4: add a kfree() on error i add_new_gdb()
Message-Id: <20110730165939.GJ7361@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110730082557.GB5575@shale.localdomain>
In-Reply-To: <20110730082557.GB5575@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, "open list:EXT4 FILE SYSTEM" <linux-ext4@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Jul 30, 2011 at 11:25:57AM +0300, Dan Carpenter wrote:
> We added some more error handling in b40971426a "ext4: add error
> checking to calls to ext4_handle_dirty_metadata()".  But we need to
> call kfree() as well to avoid a memory leak.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Added to the ext4 tree, thanks for catching this!!

      	     	  	       	   	    - Ted
