From: "Ted Ts'o" <tytso@mit.edu>
Date: Wed, 17 Nov 2010 19:01:25 +0000
Subject: Re: [patch] ext4: missing unlock in ext4_clear_request_list()
Message-Id: <20101117190125.GJ3290@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101117050732.GB31724@bicker>
In-Reply-To: <20101117050732.GB31724@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Lukas Czerner <lczerner@redhat.com>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-ja

On Wed, Nov 17, 2010 at 08:07:32AM +0300, Dan Carpenter wrote:
> If the the li_request_list was empty then it returned with the lock
> held.  Instead of adding a "goto unlock" I just removed that special
> case and let it go past the empty list_for_each_safe().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Nice catch.  Thanks, I've grabbed this and put it into the ext4 patch
queue and will be pushing it to Linus ASAP.

					- Ted
