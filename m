From: tytso@mit.edu
Date: Thu, 06 Aug 2020 04:09:36 +0000
Subject: Re: [PATCH] ext4: Delete unnecessary checks before brelse()
Message-Id: <20200806040936.GA7657@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0d713702-072f-a89c-20ec-ca70aa83a432@web.de>
In-Reply-To: <0d713702-072f-a89c-20ec-ca70aa83a432@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-ext4@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, kernel-janitors@vger.kernel.org

On Sat, Jun 13, 2020 at 08:07:56PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 13 Jun 2020 19:12:24 +0200
> 
> The brelse() function tests whether its argument is NULL
> and then returns immediately.
> Thus remove the tests which are not needed around the shown calls.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.

						- Ted
