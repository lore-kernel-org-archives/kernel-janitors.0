From: Kent Overstreet <koverstreet@google.com>
Date: Thu, 09 May 2013 20:57:01 +0000
Subject: Re: [PATCH] bcache: Fix incompatible pointer type warning
Message-Id: <20130509205701.GC15040@moria.home.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1368131966-17512-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1368131966-17512-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Goode <emilgoode@gmail.com>
Cc: neilb@suse.de, linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 09, 2013 at 10:39:26PM +0200, Emil Goode wrote:
> The function pointer release in struct block_device_operations
> should point to functions declared as void.

Looks like .release just changed to returning void in the merge window -
thanks, applied
