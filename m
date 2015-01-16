From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Jan 2015 12:12:13 +0000
Subject: Re: [patch 2/6] usb: gadget: uvc: cleanup __uvcg_fill_strm()
Message-Id: <20150116121213.GJ5520@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150114210107.GB23203@mwanda>
In-Reply-To: <20150114210107.GB23203@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Oh, yeah.  You're right.  I should have been more careful and I should
have seen that.  Sorry.  But the problem is the original code is still a
bit buggy.

We call:

	data = kzalloc();

Inside __uvcg_fill_strm() we do "data += something;"

	kfree(data);

We should save the orignal data pointer so that we can free it
correctly at the end in uvcg_streaming_class_allow_link().

regards,
dan carpenter

