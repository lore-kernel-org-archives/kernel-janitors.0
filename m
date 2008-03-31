From: Steven Whitehouse <swhiteho@redhat.com>
Date: Mon, 31 Mar 2008 10:35:43 +0000
Subject: Re: [PATCH 1/5] fs/gfs2: test for IS_ERR rather than 0
Message-Id: <1206959743.3635.123.camel@quoit>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0803241908210.32740@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0803241908210.32740@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, akpm@linux-foundation.org

Hi,

On Mon, 2008-03-24 at 19:08 +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The function gfs2_inode_lookup always returns either a valid pointer or a
> value made with ERR_PTR, so its result should be tested with IS_ERR, not
> with a test for 0.
> 
Sorry for the delay - I've just got back from holiday. Its now in the
GFS2 -nmw git tree. Also I updated the tree to the latest Linus git tree
at the same time. Thanks,

Steve.


