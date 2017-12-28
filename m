From: Theodore Ts'o <tytso@mit.edu>
Date: Thu, 28 Dec 2017 04:30:42 +0000
Subject: Re: [PATCH 04/12] ext2: drop unneeded newline
Message-Id: <20171228043042.GB30269@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
 <1514386305-7402-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jan Kara <jack@suse.com>, kernel-janitors@vger.kernel.org, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 27, 2017 at 03:51:37PM +0100, Julia Lawall wrote:
> ext2_msg prints a newline at the end of the message string, so the message
> string does not need to include a newline explicitly.  Done using
> Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

					- Ted
