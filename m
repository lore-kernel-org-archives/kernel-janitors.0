From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2016 07:31:13 +0000
Subject: Re: [bug report] staging: New driver: Xillybus generic interface for FPGA
Message-Id: <20161018072929.GB4418@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012082834.GA23170@mwanda>
In-Reply-To: <20161012082834.GA23170@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Ah...  Great.  Thanks.  That was my mistake.  I misread the code.

I seem to have introduced a flow analysis bug in my devel version of
Smatch.  Hopefully, I didn't push it...  I just had a harddrive fail
recently so everything is a bit of a mess for me right now but I will
investigate why this false positive happened.

regards,
dan carpenter

