From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2018 15:50:35 +0000
Subject: Re: [PATCH] fs/coda: potential buffer overflow in coda_psdev_write()
Message-Id: <20180712155034.7ihdmp3mnzlkc6hb@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180712123255.rkcszmwdmrloxaki@kili.mountain>
 <20180712153100.ml2vkv43orrymnax@cs.cmu.edu>
In-Reply-To: <20180712153100.ml2vkv43orrymnax@cs.cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

You misread my commit message, but I have spotted another thing I want
to change so I will resend the patch tomorrow.

On Thu, Jul 12, 2018 at 11:31:00AM -0400, Jan Harkes wrote:
> On Thu, Jul 12, 2018 at 03:32:56PM +0300, Dan Carpenter wrote:
> > "dcbuf" is a union that is "size" bytes large.  We ensure that "nbytes"
> > is large enough to hold the smallest member of the union, but if we
> > require a larger union member then then we could access beyond the end
> > of the allocated memory in coda_downcall().
> 
> I don't see where nbytes is set to hold the smallest member of the
> union.

It's not *always* the smallest member.  It's *at least* the smallest
member (but not necessarily large enough for the largest).

> 
>     // nbytes is how much userspace is trying to write
>     union outputArgs *dcbuf;
>     int size = sizeof(*dcbuf);      // maximum size of the union
>     ...
>     if (nbytes > size) {
>         ...
>         nbytes = size;              // truncate nbytes if the write was
>                                     // larger than our buffer
>     }
>     CODA_ALLOC(*dcbuf, union outputArgs *, nbytes);
>     copy_from_user(dcbuf, buf, nbytes);
> 
> 
> The test between the sizeof and the truncation of nbytes in the
> ellipsized part of the code does test for the smallest size of the
> union, but it has a 'goto out;' when it is hit because if the received
> message is smaller than the message header, the code that would run
> after the copy_from_user would look at fields that were never passed by
> userspace.
> 
> Even if we allocate size instead of nbytes, we still wouldn't
> copy_from_user more than nbytes anyway.
> 

The copy is not the problem, it's coda_downcall().  I did mention that
in my commit message...  Here is how the code looks:

fs/coda/psdev.c
    97  static ssize_t coda_psdev_write(struct file *file, const char __user *buf, 
    98                                  size_t nbytes, loff_t *off)
    99  {
   100          struct venus_comm *vcp = (struct venus_comm *) file->private_data;
   101          struct upc_req *req = NULL;
   102          struct upc_req *tmp;
   103          struct list_head *lh;
   104          struct coda_in_hdr hdr;
   105          ssize_t retval = 0, count = 0;
   106          int error;
   107  
   108          /* Peek at the opcode, uniquefier */
   109          if (copy_from_user(&hdr, buf, 2 * sizeof(u_long)))
   110                  return -EFAULT;
   111  
   112          if (DOWNCALL(hdr.opcode)) {
   113                  union outputArgs *dcbuf;
   114                  int size = sizeof(*dcbuf);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^
size is the whole union.

   115  
   116                  if  ( nbytes < sizeof(struct coda_out_hdr) ) {
                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

struct coda_out_hdr is the smallest member.  We are assuming that
nbytes = sizeof(struct coda_out_hdr) so this test is fine.

   117                          pr_warn("coda_downcall opc %d uniq %d, not enough!\n",
   118                                  hdr.opcode, hdr.unique);
   119                          count = nbytes;
   120                          goto out;
   121                  }
   122                  if ( nbytes > size ) {
                             ^^^^^^^^^^^^^
It's not too large.  That's fine.

   123                          pr_warn("downcall opc %d, uniq %d, too much!",
   124                                  hdr.opcode, hdr.unique);
   125                          nbytes = size;
   126                  }
   127                  CODA_ALLOC(dcbuf, union outputArgs *, nbytes);
                                                              ^^^^^^
We allocate enough space for the smallest member.

   128                  if (copy_from_user(dcbuf, buf, nbytes)) {
   129                          CODA_FREE(dcbuf, nbytes);
   130                          retval = -EFAULT;
   131                          goto out;
   132                  }
   133  
   134                  /* what downcall errors does Venus handle ? */
   135                  error = coda_downcall(vcp, hdr.opcode, dcbuf);
                                                               ^^^^^
But coda_downcall() assumes everything is checked properly.  The
references to CodaFid could be out of bounds, for example.
"fid = &out->coda_zapdir.CodaFid;"

   136  
   137                  CODA_FREE(dcbuf, nbytes);
                                         ^^^^^^
Let me update this...  It's not used, but I guess it's uglier to be
wrong as well as unused.  I will resend tomorrow.

regards,
dan carpenter

