From: Theodore Tso <tytso@MIT.EDU>
Date: Sun, 17 Feb 2008 20:33:49 +0000
Subject: Re: [PATCH 2/7] fs/ext{2,3,4}: Use BUG_ON
Message-Id: <20080217203349.GH8905@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802171854270.28055@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0802171854270.28055@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: sct@redhat.com, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Feb 17, 2008 at 06:55:06PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> if (...) BUG(); should be replaced with BUG_ON(...) when the test has no
> side-effects to allow a definition of BUG_ON that drops the code completely.

Hi, in the future, please separate ext4 changes from ext2/3.  Thanks!!

       	   	   	  	   - Ted
