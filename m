From: Theodore Tso <tytso@mit.edu>
Date: Sun, 15 Nov 2009 01:53:52 +0000
Subject: Re: [PATCH] fs/ext4: test the i_flags field of the right structure
Message-Id: <20091115015352.GA4323@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911022158190.4930@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911022158190.4930@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: sandeen@redhat.com, cmm@us.ibm.com, Andreas Dilger <adilger@sun.com>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Nov 02, 2009 at 09:58:47PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Elsewhere, EXT4_EXTENTS_FL is combined with EXT4_I(inode)->i_flags, rather
> than inode->i_flags.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied to the ext4 patch queue, thanks.

							- Ted
