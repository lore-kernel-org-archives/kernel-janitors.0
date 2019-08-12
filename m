From: "Theodore Y. Ts'o" <tytso@mit.edu>
Date: Mon, 12 Aug 2019 20:36:05 +0000
Subject: Re: [PATCH] ext4: set error return correctly when ext4_htree_store_dirent fails
Message-Id: <20190812203605.GC28705@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190805224419.24639-1-colin.king@canonical.com>
In-Reply-To: <20190805224419.24639-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Aug 05, 2019 at 11:44:19PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the call to ext4_htree_store_dirent fails the error return
> variable 'ret' is is not being set to the error code and variable count is
> instead, hence the error code is not being returned.  Fix this by assigning
> ret to the error return code.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: 8af0f0822797 ("ext4: fix readdir error in the case of inline_data+dir_index")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.

					- Ted
