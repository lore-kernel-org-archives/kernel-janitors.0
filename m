From: "Theodore Y. Ts'o" <tytso@mit.edu>
Date: Thu, 03 Dec 2020 14:18:59 +0000
Subject: Re: [PATCH][next] ext4: remove redundant assignment of variable ex
Message-Id: <20201203141859.GH441757@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201021132326.148052-1-colin.king@canonical.com>
In-Reply-To: <20201021132326.148052-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 21, 2020 at 02:23:26PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable ex is assigned a variable that is not being read, the assignment
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.

					- Ted
