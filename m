From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Sep 2017 20:08:13 +0000
Subject: Re: [bug report] lib: Add zstd modules
Message-Id: <20170926200813.64bfp5i7msogmsva@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170926200519.uqc5uvwic4ez7mp7@mwanda>
In-Reply-To: <20170926200519.uqc5uvwic4ez7mp7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Also a few lines later:

    lib/zstd/zstd_opt.h:855 ZSTD_compressBlock_opt_extDict_generic()
    error: buffer overflow 'opt[cur - mlen].rep' 3 <= 3


regards,
dan carpenter

On Tue, Sep 26, 2017 at 11:05:20PM +0300, Dan Carpenter wrote:
> Hello Nick Terrell,
> 
> The patch 73f3d1b48f50: "lib: Add zstd modules" from Aug 9, 2017,
> leads to the following static checker warning:
> 
> 	lib/zstd/zstd_opt.h:547 ZSTD_compressBlock_opt_generic()
> 	error: buffer overflow 'opt[cur - mlen].rep' 3 <= 3
> 
> lib/zstd/zstd_opt.h
>    537  
>    538                          mlen = opt[cur].mlen;
>    539                          if (opt[cur].off > ZSTD_REP_MOVE_OPT) {
>                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> The checker is complaining that assume "opt[cur].off = ZSTD_REP_MOVE_OPT".
> 
>    540                                  opt[cur].rep[2] = opt[cur - mlen].rep[1];
>    541                                  opt[cur].rep[1] = opt[cur - mlen].rep[0];
>    542                                  opt[cur].rep[0] = opt[cur].off - ZSTD_REP_MOVE_OPT;
>    543                          } else {
>    544                                  opt[cur].rep[2] = (opt[cur].off > 1) ? opt[cur - mlen].rep[1] : opt[cur - mlen].rep[2];
>    545                                  opt[cur].rep[1] = (opt[cur].off > 0) ? opt[cur - mlen].rep[0] : opt[cur - mlen].rep[1];
>    546                                  opt[cur].rep[0] >    547                                      ((opt[cur].off = ZSTD_REP_MOVE_OPT) && (mlen != 1)) ? (opt[cur - mlen].rep[0] - 1) : (opt[cur - mlen].rep[opt[cur].off]);
>                                                                                                                                                    ^^^^^^^^^^^^^^^^^
> also we have to assume "mlen = 1" then opt[cur - mlen].rep[opt[cur].off]
> is reading one element beyond the end of the array.  It's possible that
> both conditions can't be true but static analysis tools get annoyed when
> we have impossible conditions.
> 
>    548                          }
>    549  
> 
> regards,
> dan carpenter
