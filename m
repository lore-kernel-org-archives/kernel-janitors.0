From: David Miller <davem@redhat.com>
Date: Sun, 03 Feb 2019 04:15:04 +0000
Subject: Re: [PATCH] atl1c: fix indentation issue on an if statement
Message-Id: <20190202.201504.696180725335612120.davem@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190202114129.18275-1-colin.king@canonical.com>
In-Reply-To: <20190202114129.18275-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jcliburn@gmail.com, chris.snook@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sat,  2 Feb 2019 11:41:29 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> An if statement is indented one level too deep, fix this by removing
> the extra tabs. Also add some spaces to the dev_warn arguments to clean
> up checkpatch warnings.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
