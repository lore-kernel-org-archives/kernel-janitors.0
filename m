From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sat, 29 May 2010 19:26:39 +0000
Subject: Re: [patch 5/11] btrfs: remove unneeded null check in btrfs_rename()
Message-Id: <20100529192639.GP31073@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100529094508.GF5483@bicker>
 <AANLkTikLkpTgkOGi8M8VL_rZRLyzbJKoKW9RiNMJenMi@mail.gmail.com>
In-Reply-To: <AANLkTikLkpTgkOGi8M8VL_rZRLyzbJKoKW9RiNMJenMi@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Fedyk <mfedyk@mikefedyk.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-btrfs@vger.kernel.org, Yan Zheng <zheng.yan@oracle.com>, Josef Bacik <josef@redhat.com>, Chris Mason <chris.mason@oracle.com>, kernel-janitors@vger.kernel.org

On Sat, May 29, 2010 at 11:01:56AM -0700, Mike Fedyk wrote:

> I think code like this is here because there are still a lot of
> features that are being added to btrfs and it's easier to have the
> additional checks than continually adding and removing them as the
> code changes.

_What_ features?  Check for ->rename() argument not being negative is
done outside of btrfs.
