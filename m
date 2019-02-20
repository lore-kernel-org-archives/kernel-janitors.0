From: Anand Jain <anand.jain@oracle.com>
Date: Wed, 20 Feb 2019 01:20:51 +0000
Subject: Re: [PATCH] btrfs: drop the lock on error in btrfs_dev_replace_cancel()
Message-Id: <f53fc8af-ad77-116c-5d4a-cbb1e28cb974@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190211183209.GA13934@kadam>
 <20190219190451.GU9874@twin.jikos.cz>
In-Reply-To: <20190219190451.GU9874@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dsterba@suse.cz, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2/20/19 3:04 AM, David Sterba wrote:
> On Mon, Feb 11, 2019 at 09:32:10PM +0300, Dan Carpenter wrote:
>> We should drop the lock on this error path.  This is from static
>> analysis and I don't know if it's possible to hit this error path in
>> real life.
> 
> Yes the lock needs to be released, it's there to protect access to the
> dev_replace members and is not supposed to be left locked. The value of
> state that's being switched would need to be artifically changed to an
> invalid value so the default: branch is taken.
> 
> It's been introduced by d189dd70e25561817325 in 5.0-rc1 so it counts as
> a regression but I don't think it's urgent enough to be sent to a late
> rc. It'll go through the stable tree channel. Thanks.
> 

oops I missed this email. Thanks Dan and David.

Reviewed-by: Anand Jain <anand.jain@oracle.com>
