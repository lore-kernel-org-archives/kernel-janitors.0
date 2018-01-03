From: Stanislaw Gruszka <sgruszka@redhat.com>
Date: Wed, 03 Jan 2018 12:26:29 +0000
Subject: Re: [PATCH] rt2x00: Delete an error message for a failed memory allocation in rt2x00queue_allocate()
Message-Id: <20180103122628.GA11965@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cdeaa8a2-06bb-10e9-05d7-f531c00eef5d@users.sourceforge.net>
In-Reply-To: <cdeaa8a2-06bb-10e9-05d7-f531c00eef5d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Helmut Schaa <helmut.schaa@googlemail.com>, Kalle Valo <kvalo@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Dec 29, 2017 at 10:18:14PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 29 Dec 2017 22:11:42 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Stanislaw Gruszka <sgruszka@redhat.com>
