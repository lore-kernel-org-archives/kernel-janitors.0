From: David Sterba <dsterba@suse.cz>
Date: Fri, 10 Jan 2020 17:06:34 +0000
Subject: Re: [PATCH] btrfs: Fix error code in btrfs_sysfs_add_mounted()
Message-Id: <20200110170634.GR3929@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110055126.4rhhfsotll6puma7@kili.mountain>
In-Reply-To: <20200110055126.4rhhfsotll6puma7@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Dennis Zhou <dennis@kernel.org>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Anand Jain <anand.jain@oracle.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 10, 2020 at 08:51:27AM +0300, Dan Carpenter wrote:
> The error code wasn't set on this error path.
> 
> Fixes: e12ebce8a4a8 ("btrfs: sysfs: make UUID/debug have its own kobject")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, folded to the original patch.
