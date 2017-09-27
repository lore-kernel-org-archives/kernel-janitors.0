From: Nick Terrell <terrelln@fb.com>
Date: Wed, 27 Sep 2017 23:54:50 +0000
Subject: Re: [bug report] lib: Add zstd modules
Message-Id: <20170927235450.379490-1-terrelln@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170926200519.uqc5uvwic4ez7mp7@mwanda>
In-Reply-To: <20170926200519.uqc5uvwic4ez7mp7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 9/26/17, 1:06 PM, "Dan Carpenter" <dan.carpenter@oracle.com> wrote:
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

I've looked into the code. It is impossible for both `mlen = 1' and
`opt[cur].off = ZSTD_REP_MOVE_OPT' to be true.

`mlen = 1' means that the previous byte will be encoded as a literal.
`opt[cur].off = ZSTD_REP_MOVE_OPT' is only used when the current position
is directly after a match, meaning that the previous byte is encoded as
match, not a literal.

The second part of the condition `mlen != 1' will always be true and can be
deleted. I deleted it in upstream zstd [1]. Since it is functionally
equivalent, I'm not sure if it is worthwhile to immediately port the change
to the kernel, but I can if you like.

[1] https://github.com/facebook/zstd/pull/871

>
>    548                          }
>    549
>
> regards,
> dan carpenter

Best,
Nick Terrell
