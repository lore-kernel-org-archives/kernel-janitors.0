From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Date: Fri, 16 Jan 2015 11:38:33 +0000
Subject: Re: [patch 2/6] usb: gadget: uvc: cleanup __uvcg_fill_strm()
Message-Id: <54B8F839.4070502@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150114210107.GB23203@mwanda>
In-Reply-To: <20150114210107.GB23203@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

W dniu 14.01.2015 o 22:01, Dan Carpenter pisze:
> Static checkers complain about this API:
>
> 	drivers/usb/gadget/function/uvc_configfs.c:2139
> 		uvcg_streaming_class_allow_link()
> 	warn: did you really mean to pass the address of 'data'?
>
> Indeed, the code is cleaner when we just pass the pointer instead of the
> pointer to the pointer.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I'm sorry but this patch breaks the code.

You should look at the broader context in which the __uvcg_fill_strm()
is called: it is used as a callback from __uvcg_iter_strm_cls().
The purpose of the latter is to iterate over a hierarchy of streaming
descriptors' config items built by the user with configfs.
This function is generic, because it needs to be called twice:
the first time to calculate the actual amount of memory needed for
an array of descriptors which is to be created, and the second time
to actually fill the said array - this is the purpose of __uvcg_fill_strm().

__uvcg_iter_strm_cls() flow of control is more or less like this:
"process" the header, then for each format that follows the header
"process" the format itself and then for each frame inside
a format "process" the frame.

__uvcg_fill_stream(), which is used to "process", during its execution
uses priv2 as a pointer to a pointer, because it advances the current
position by the amount of data taken by each processed descriptor
and the advanced position should be visible outside this function,
so that the next time it is called, the current position corresponds
to the place where it was the last time rather than again at
the beginning of some block of data. In other words priv2
is an "out" parameter.

> ---
> Looks obvious enough to me, but I've only compiled this code and haven't
> tested it.
>

What I suggest is to revert this patch and then I will post another
patch which adds comments to __uvcg_iterm_strm_cls(), __uvcg_cnt_strm()
and __uvcg_fill_strm() so that their purpose and meaning of parameters
is clear.

AP
