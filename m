From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Jan 2019 12:01:13 +0000
Subject: Re: [PATCH][next] drivers: base: swnode: check if swnode is null before dereferencing it
Message-Id: <20190102120113.GN3781@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181222124333.13561-1-colin.king@canonical.com>
In-Reply-To: <20181222124333.13561-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Dec 22, 2018 at 12:43:33PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The macro to_software_mode can potentially return NULL, so also add
> a null check on the swnode before dereferencing it to avoid any null
> pointer dereferences.
> 
> Detected by CoverityScan, CID#1476052 ("Explicit null dereferenced")
> 
> Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the firmware node framework")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

to_software_mode() can't return NULL though...

We shouldn't change the code just to make the static checker happy.

Sometimes if we just silence every static checker warning maybe we will
fix some bugs in the middle of silencing all the false positive, but
Smatch is almost at the stage of being able to parse this code
correctly.  Maybe by the end of the year.  So let's hold off and then
think about taking the fix everything approach next year.

regards,
dan carpenter
