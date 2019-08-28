From: "Theodore Y. Ts'o" <tytso@mit.edu>
Date: Wed, 28 Aug 2019 15:33:01 +0000
Subject: Re: [PATCH] ext4: tidy up white space in count_rsvd()
Message-Id: <20190828153301.GI24857@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190827084725.GA22301@mwanda>
 <20190827205445.3gtjyktwitgnbzx4@rocky>
In-Reply-To: <20190827205445.3gtjyktwitgnbzx4@rocky>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Whitney <enwlinux@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 27, 2019 at 04:54:45PM -0400, Eric Whitney wrote:
> * Dan Carpenter <dan.carpenter@oracle.com>:
> > This line was indented one tab too far.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Good catch, thanks.  You can add:
> 
> Reviewed-by: Eric Whitney <enwlinux@gmail.com>

Thanks, applied by fixing up the original base patch.

		   	     	 - Ted
