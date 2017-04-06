From: Jiri Kosina <jikos@kernel.org>
Date: Thu, 06 Apr 2017 18:34:44 +0000
Subject: Re: [PATCH] HID: sony: remove redundant check for -ve err
Message-Id: <alpine.LSU.2.20.1704061447230.28004@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170327175118.28322-1-colin.king@canonical.com>
In-Reply-To: <20170327175118.28322-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 27 Mar 2017, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> err is being checked for failure each time it is being updated
> so this err check is totally redundant and can be removed
> 
> Detected with CoverityScan, CID#1420665 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to for-4.12/sony.

-- 
Jiri Kosina
SUSE Labs

