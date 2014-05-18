From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 18 May 2014 20:33:27 +0000
Subject: Re: [PATCH 0/5] staging: lustre: lnet: klnds: Fix coding style in socklnd.c
Message-Id: <20140518203327.GN15585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400433557-24985-1-git-send-email-massa.nomura@gmail.com>
In-Reply-To: <1400433557-24985-1-git-send-email-massa.nomura@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masaru Nomura <massa.nomura@gmail.com>
Cc: gregkh@linuxfoundation.org, andreas.dilger@intel.com, oleg.drokin@intel.com, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, May 18, 2014 at 06:19:12PM +0100, Masaru Nomura wrote:
> These patches fix warnings below in socklnd.c to meet coding style.
> Also fix some indenting due to changes to keep readability.
> 
> WARNING: space prohibited between function name and open parenthesis '('
> WARNING: line over 80 characters
> 

All five of these do the same thing.  It should just be one patch.

regards,
dan carpenter

