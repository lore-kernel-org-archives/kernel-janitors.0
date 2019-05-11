From: "Theodore Ts'o" <tytso@mit.edu>
Date: Sat, 11 May 2019 02:09:30 +0000
Subject: Re: [PATCH][next] ext4: fix two cases where a u32 is being checked for a less than zero error return
Message-Id: <20190511020930.GG2534@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190426220908.12790-1-colin.king@canonical.com>
In-Reply-To: <20190426220908.12790-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 26, 2019 at 11:09:08PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are two cases where u32 variables n and err are being checked
> for less than zero error values, the checks is always false because
> the variables are not signed. Fix this by making the variables ints.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 345c0dbf3a30 ("ext4: protect journal inode's blocks using block_validity")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.

					- Ted
