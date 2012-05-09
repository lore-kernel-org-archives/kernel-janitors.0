From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 May 2012 06:51:02 +0000
Subject: Re: [PATCH] crc32.c: cleanup unused variables warning
Message-Id: <20120509064605.GQ22134@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1336527414-18413-1-git-send-email-trbecker@trbecker.org>
In-Reply-To: <1336527414-18413-1-git-send-email-trbecker@trbecker.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 08, 2012 at 10:36:54PM -0300, Thiago Rafael Becker wrote:
> Variables t4, t5, t6 and t7 are only used when CRC_LE_BITS != 32.


Looks ok.

1) This silences a gcc warning yes?  Put the warning into the commit
   message.
2) It needs a Signed-off-by line.
3) Resend it to the people from scripts/get_maintainer.pl.  CC lkml.
   The stuff in lib/ is so important and the more review it gets
   the better.  Even trivial patches benifit from the extra review.

regards,
dan carpenter


