From: "Theodore Ts'o" <tytso@mit.edu>
Date: Thu, 20 Jun 2019 04:12:05 +0000
Subject: Re: [PATCH] ext4: remove redundant assignment to node
Message-Id: <20190620041204.GC15783@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190619090007.26962-1-colin.king@canonical.com>
In-Reply-To: <20190619090007.26962-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 19, 2019 at 10:00:06AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer 'node' is assigned a value that is never read, node is
> later overwritten when it re-assigned a different value inside
> the while-loop.  The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.

						- Ted
