From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 May 2012 13:19:32 +0000
Subject: Re: [PATCH 3/3] Staging: Comedi adv_pci1710: Cleaned up function check_channel_list
Message-Id: <20120504131932.GB22134@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1336056543-4625-1-git-send-email-tomas.melin@iki.fi>
In-Reply-To: <1336056543-4625-1-git-send-email-tomas.melin@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 03, 2012 at 05:49:03PM +0300, Tomas Melin wrote:
> Removed one additional level of if() by combining two if() statements into one.
> 

The patch looks good obviously.

All three redone patches have the same subject.  It would be better
if it were:

[patch 1/4] Staging: Comedi adv_pci1710: move a check forward
[patch 2/4] Staging: Comedi adv_pci1710: fix some line breaks
[patch 3/4] Staging: Comedi adv_pci1710: clarify some comments
[patch 4/4] Staging: Comedi adv_pci1710: combine two conditions

I kind of feel bad for being nit-picky like this...  It's just that
it's your first few patches so you may as well learn what we look
for.

regards,
dan carpenter

