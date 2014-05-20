From: Mark Einon <mark.einon@gmail.com>
Date: Tue, 20 May 2014 11:08:46 +0000
Subject: Re: [PATCH 5/8] staging: et131x: Remove useless return variables
Message-Id: <20140520110845.GA4672@leicester.auvation.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400582028-24990-5-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1400582028-24990-5-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Tue, May 20, 2014 at 12:33:45PM +0200, Peter Senna Tschudin wrote:
> This patch remove variables that are initialized with a constant,
> are never updated, and are only used as parameter of return.
> Return the constant instead of using a variable.
> 
> Verified by compilation only.
> 
> The coccinelle script that find and fixes this issue is:
> // <smpl>
> @@
> type T;
> constant C;
> identifier ret;
> @@
> - T ret = C;
> ... when != ret
> - return ret;
> + return C;
> // </smpl>
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

Acked-by: Mark Einon <mark.einon@gmail.com>

