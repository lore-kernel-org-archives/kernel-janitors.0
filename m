From: "J . Bruce Fields" <bfields@fieldses.org>
Date: Tue, 25 Apr 2017 20:56:33 +0000
Subject: Re: [PATCH] lockd: remove redundant check on block
Message-Id: <20170425205633.GC15279@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170408170959.19805-1-colin.king@canonical.com>
In-Reply-To: <20170408170959.19805-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Trond Myklebust <trond.myklebust@primarydata.com>, Anna Schumaker <anna.schumaker@netapp.com>, Jeff Layton <jlayton@poochiereds.net>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 08, 2017 at 06:09:59PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> A null check followed by a return is being performed already, so block
> is always non-null at the second check on block, hence we can remove
> this redundant null-check (Detected by PVS-Studio).  Also re-work
> comment to clean up a check-patch warning.

Thanks, applying for 4.12.--b.
