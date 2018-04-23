From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Mon, 23 Apr 2018 08:42:50 +0000
Subject: Re: [PATCH] regulator: wm8350: fix missing increment of loop index i
Message-Id: <20180423084250.aqsk7lo7oju76z6t@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180420092623.1327-1-colin.king@canonical.com>
In-Reply-To: <20180420092623.1327-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 20, 2018 at 10:26:23AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> It seems that the loop index i is not being incremented and hence
> potentially the while loop could spin forever. Fortunately with the
> data being used this does not appear to happen at the moment.
> 
> Fixes: da09155ac8d3 ("regulator: Add WM8350 regulator support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
