From: Theodore Ts'o <tytso@mit.edu>
Date: Mon, 26 May 2014 16:34:50 +0000
Subject: Re: [PATCH] ext4: remove unused local variable "stored" from ext4_readdir(...)
Message-Id: <20140526163450.GK22284@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140521153226.GD8826@vaio>
In-Reply-To: <20140521153226.GD8826@vaio>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giedrius Rekasius <giedrius.rekasius@gmail.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org

On Wed, May 21, 2014 at 04:32:26PM +0100, Giedrius Rekasius wrote:
> From: Giedrius Rekasius <giedrius.rekasius@gmail.com>
> 
> Remove local variable "stored" from ext4_readdir(...). This variable 
> gets initialized but is never used inside the function.
> 
> Signed-off-by: Giedrius Rekasius <giedrius.rekasius@gmail.com>

Applied, thanks.

					- Ted
