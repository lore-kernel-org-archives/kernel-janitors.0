From: David Dillow <dave@thedillows.org>
Date: Tue, 26 Oct 2010 11:52:12 +0000
Subject: Re: [PATCH 7/14] drivers/net/typhoon.c: delete double assignment
Message-Id: <1288093932.14943.1.camel@lap75545.ornl.gov>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
 <1288088743-3725-8-git-send-email-julia@diku.dk>
In-Reply-To: <1288088743-3725-8-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2010-10-26 at 12:25 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Delete successive assignments to the same location.  The current definition
> does not initialize the respRing structure, which has the same type as the
> cmdRing structure, so initialize that one instead.

> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: David Dillow <dave@thedillows.org>

> ---
> This changes the semantics and has not been tested.

tp->respRing.lastWrite is only an artifact of using a common struct for
the rings and is not otherwise used, so no change to semantics.
