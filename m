From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 May 2019 15:01:52 +0000
Subject: Re: [PATCH] orangefs: remove redundant assignment to variable buffer_index
Message-Id: <20190521150152.GK31203@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190511132700.4862-1-colin.king@canonical.com>
In-Reply-To: <20190511132700.4862-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, May 11, 2019 at 02:27:00PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable buffer_index is being initialized however this is never
> read and later it is being reassigned to a new value. The initialization
> is redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused Value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/orangefs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
> index a35c17017210..80f06ee794c5 100644
> --- a/fs/orangefs/file.c
> +++ b/fs/orangefs/file.c
> @@ -52,7 +52,7 @@ ssize_t wait_for_direct_io(enum ORANGEFS_io_type type, struct inode *inode,
>  	struct orangefs_inode_s *orangefs_inode = ORANGEFS_I(inode);
>  	struct orangefs_khandle *handle = &orangefs_inode->refn.khandle;
>  	struct orangefs_kernel_op_s *new_op = NULL;
> -	int buffer_index = -1;
> +	int buffer_index;
>  	ssize_t ret;
>  	size_t copy_amount;
>  

There is a second pointless assignment at the end of the function as
well:

   247  
   248          ret = new_op->downcall.resp.io.amt_complete;
   249  
   250  out:
   251          if (buffer_index >= 0) {
   252                  if ((readahead_size) && (type = ORANGEFS_IO_READ)) {
   253                          /* readpage */
   254                          *index_return = buffer_index;
   255                          gossip_debug(GOSSIP_FILE_DEBUG,
   256                                  "%s: hold on to buffer_index :%d:\n",
   257                                  __func__, buffer_index);
   258                  } else {
   259                          /* O_DIRECT */
   260                          orangefs_bufmap_put(buffer_index);
   261                          gossip_debug(GOSSIP_FILE_DEBUG,
   262                                  "%s(%pU): PUT buffer_index %d\n",
   263                                  __func__, handle, buffer_index);
   264                  }
   265                  buffer_index = -1;
                        ^^^^^^^^^^^^^^^^^

   266          }
   267          op_release(new_op);
   268          return ret;
   269  }

You often send these patches before they hit linux-next so I had skipped
reviewing this one when you sent it.  I'm coming back to work today
after the flu so I was going through my inbox reviewing old unread
messages...

regards,
dan carpenter
